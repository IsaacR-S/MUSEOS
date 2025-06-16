------------------------------------------------------------------------------------TIGGERS---------------------------------------------------------------------------------------

-- Función para actualizar orden_recorrido antes de insertar un nuevo registro
CREATE OR REPLACE FUNCTION actualizar_orden_recorrido()
RETURNS TRIGGER AS $$
BEGIN
    -- Verificar si existe algún registro con el mismo id_museo y orden_recorrido mayor o igual
    IF EXISTS (
        SELECT 1
        FROM coleccion_permanente
        WHERE id_museo = NEW.id_museo
          AND orden_recorrido >= NEW.orden_recorrido
    ) THEN
        -- Incrementar orden_recorrido en 1 para todos esos registros para hacer espacio
        UPDATE coleccion_permanente
        SET orden_recorrido = orden_recorrido + 1
        WHERE id_museo = NEW.id_museo
          AND orden_recorrido >= NEW.orden_recorrido;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear trigger que llama a la función antes de insertar en coleccion_permanente
DROP TRIGGER IF EXISTS before_insert_coleccion ON coleccion_permanente;

CREATE TRIGGER before_insert_coleccion
BEFORE INSERT ON coleccion_permanente
FOR EACH ROW
EXECUTE FUNCTION actualizar_orden_recorrido();

-- Valida la insercion de la estructura organizacional
CREATE OR REPLACE FUNCTION validar_jerarquia_organizacional()
RETURNS trigger AS $$
DECLARE
    nivel_padre TEXT;
BEGIN
    -- No puede apuntar a sí misma
    IF NEW.id_estructura_org = NEW.id_jerarquia_estructura AND NEW.id_museo = NEW.id_jerarquia_museo THEN
        RAISE EXCEPTION 'Una estructura organizacional no puede apuntar a sí misma';
    END IF;

    -- Verificar que el nivel sea 'Nivel 1' para permitir id_jerarquia_estructura vacío
    IF NEW.nivel <> 'Nivel 1' AND NEW.id_jerarquia_estructura IS NULL THEN
        RAISE EXCEPTION 'El campo id_jerarquia_estructura debe ser proporcionado para niveles distintos de Nivel 1';
    END IF;

    -- Verificar que el nivel del padre sea mayor
    IF NEW.id_jerarquia_estructura IS NOT NULL THEN
        SELECT nivel INTO nivel_padre
        FROM estructura_organizacional
        WHERE id_museo = NEW.id_jerarquia_museo AND id_estructura_org = NEW.id_jerarquia_estructura;

        IF nivel_padre IS NULL THEN
            RAISE EXCEPTION 'La estructura jerárquica padre no existe';
        END IF;

        -- Verificar que el nivel del hijo sea un nivel menor que el del padre
        IF (CASE 
                WHEN nivel_padre = 'Nivel 1' THEN NEW.nivel <> 'Nivel 2'
                WHEN nivel_padre = 'Nivel 2' THEN NEW.nivel <> 'Nivel 3'
                WHEN nivel_padre = 'Nivel 3' THEN NEW.nivel <> 'Nivel 4'
                WHEN nivel_padre = 'Nivel 4' THEN NEW.nivel IS NOT NULL
                ELSE TRUE
            END) THEN
            RAISE EXCEPTION 'El nivel de la estructura hija debe ser un nivel menor que el de su padre';
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_jerarquia_organizacional
BEFORE INSERT OR UPDATE ON estructura_organizacional
FOR EACH ROW EXECUTE FUNCTION validar_jerarquia_organizacional();

--Valida jerarquia fisica

CREATE OR REPLACE FUNCTION validar_jerarquia_fisica()
RETURNS trigger AS $$
DECLARE
    tipo_padre TEXT;
BEGIN
    -- 1. No puede apuntarse a sí misma
    IF NEW.id_estructura_fisica = NEW.id_jerarquia_estructura AND NEW.id_museo = NEW.id_jerarquia_museo THEN
        RAISE EXCEPTION 'Una estructura física no puede apuntar a sí misma';
    END IF;

    -- 2. Si hay padre, debe ser del mismo museo
    IF NEW.id_jerarquia_estructura IS NOT NULL AND NEW.id_jerarquia_museo <> NEW.id_museo THEN
        RAISE EXCEPTION 'La jerarquía debe pertenecer al mismo museo';
    END IF;

    -- 3. Si no es de tipo 'edificio', debe tener padre
    IF NEW.tipo_estructura <> 'edificio' AND NEW.id_jerarquia_estructura IS NULL THEN
        RAISE EXCEPTION 'Solo estructuras de tipo "edificio" pueden no tener jerarquía padre';
    END IF;

    -- 4. Validar que solo las estructuras de tipo 'edificio' pueden tener dirección
    IF NEW.tipo_estructura <> 'edificio' AND NEW.direccion IS NOT NULL THEN
        RAISE EXCEPTION 'Solo las estructuras de tipo "edificio" pueden tener una dirección';
    END IF;

    -- 5. Si tiene padre, debe ser consistente con la jerarquía
    IF NEW.id_jerarquia_estructura IS NOT NULL THEN
        SELECT tipo_estructura INTO tipo_padre
        FROM estructura_fisica
        WHERE id_museo = NEW.id_jerarquia_museo AND id_estructura_fisica = NEW.id_jerarquia_estructura;

        IF tipo_padre IS NULL THEN
            RAISE EXCEPTION 'La estructura física padre no existe';
        END IF;

        -- Reglas jerárquicas entre tipos con restricción estricta
        IF tipo_padre = 'edificio' AND NEW.tipo_estructura <> 'piso' THEN
            RAISE EXCEPTION 'Un edificio solo puede tener pisos como hijos';
        ELSIF tipo_padre = 'piso' AND NEW.tipo_estructura <> 'area seccion' THEN
            RAISE EXCEPTION 'Un piso solo puede tener áreas o secciones como hijos';
        ELSIF tipo_padre = 'area seccion' THEN
            RAISE EXCEPTION 'Un área no puede ser padre de ninguna estructura';
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_jerarquia_fisica
BEFORE INSERT OR UPDATE ON estructura_fisica
FOR EACH ROW EXECUTE FUNCTION validar_jerarquia_fisica();

--Validar movimiento obra --- ---------------------------------------------------funciona---------------------------------------------------------------------

CREATE OR REPLACE FUNCTION trg_validar_actualizar_fecha_fin()
RETURNS trigger AS $$
DECLARE
    fecha_inicio_existente DATE;
    last_record_id NUMERIC;
BEGIN
    -- Verificar si el id_historico_obra_movimiento ya existe
    IF EXISTS (SELECT 1 FROM historico_obra_movimiento WHERE id_historico_obra_movimiento = NEW.id_historico_obra_movimiento) THEN
        -- Obtener la fecha_inicio del registro existente
        SELECT fecha_inicio INTO fecha_inicio_existente
        FROM historico_obra_movimiento
        WHERE id_historico_obra_movimiento = NEW.id_historico_obra_movimiento;

        -- Validar que la nueva fecha_inicio sea mayor que la existente
        IF NEW.fecha_inicio <= fecha_inicio_existente THEN
            RAISE EXCEPTION 'La nueva fecha de inicio (%), debe ser mayor que la fecha de inicio existente (%) para el mismo id_historico_obra_movimiento', NEW.fecha_inicio, fecha_inicio_existente;
        END IF;
    END IF;

    -- Buscar el registro con mayor fecha_inicio menor que la nueva fecha_inicio para la misma obra
    SELECT id_historico_obra_movimiento INTO last_record_id
    FROM historico_obra_movimiento
    WHERE id_obra = NEW.id_obra
      AND fecha_inicio < NEW.fecha_inicio
    ORDER BY fecha_inicio DESC, id_historico_obra_movimiento DESC
    LIMIT 1;

    IF last_record_id IS NOT NULL THEN
        -- Actualizar la fecha_fin del registro encontrado
        UPDATE historico_obra_movimiento
        SET fecha_fin = NEW.fecha_inicio
        WHERE id_obra = NEW.id_obra
          AND id_historico_obra_movimiento = last_record_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_actualizar_fecha_fin
BEFORE INSERT ON historico_obra_movimiento
FOR EACH ROW EXECUTE FUNCTION trg_validar_actualizar_fecha_fin();
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Validar obra duplicada

CREATE OR REPLACE FUNCTION validar_obra_duplicada()
RETURNS trigger AS $$
DECLARE
    cantidad INT;
BEGIN
    SELECT COUNT(*) INTO cantidad
    FROM obra
    WHERE nombre = NEW.nombre;

    IF cantidad > 0 THEN
        RAISE EXCEPTION 'Ya existe una obra con ese nombre y artista';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_obra_duplicada
BEFORE INSERT ON obra
FOR EACH ROW EXECUTE FUNCTION validar_obra_duplicada();

--Validar Evento

CREATE OR REPLACE FUNCTION validar_evento()
RETURNS trigger AS $$
BEGIN
    -- Validar duración mínima
    IF NEW.fecha_fin_evento IS NOT NULL AND NEW.fecha_inicio_evento >= NEW.fecha_fin_evento THEN
        RAISE EXCEPTION 'La fecha de fin debe ser posterior a la de inicio (mínimo 1 día de duración)';
    END IF;

    -- Verificar traslape de eventos en el mismo museo
    IF EXISTS (
        SELECT 1
        FROM evento
        WHERE id_museo = NEW.id_museo
          AND (
              (NEW.fecha_inicio_evento BETWEEN fecha_inicio_evento AND fecha_fin_evento)
              OR
              (NEW.fecha_fin_evento BETWEEN fecha_inicio_evento AND fecha_fin_evento)
              OR
              (fecha_inicio_evento BETWEEN NEW.fecha_inicio_evento AND NEW.fecha_fin_evento)
          )
    ) THEN
        RAISE EXCEPTION 'Ya existe un evento en ese museo que coincide con las fechas ingresadas';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_evento
BEFORE INSERT OR UPDATE ON evento
FOR EACH ROW EXECUTE FUNCTION validar_evento();

-- Trigger function para hacer cumplir el pedido de fecha_inicio y actualizar fecha_fin del registro anterior
CREATE OR REPLACE FUNCTION validar_hist_empleado()
RETURNS TRIGGER AS $$
DECLARE
    latest_fecha_inicio DATE;
    latest_id_museo NUMERIC;
    latest_id_estructura_org NUMERIC;
BEGIN
    --Encuentra la última fecha_inicio del empleado
    SELECT id_museo, id_estructura_org, fecha_inicio
    INTO latest_id_museo, latest_id_estructura_org, latest_fecha_inicio
    FROM historico_empleado
    WHERE id_empleado = NEW.id_empleado
    ORDER BY fecha_inicio DESC
    LIMIT 1;

    IF latest_fecha_inicio IS NOT NULL THEN
        -- Comprueba si la nueva fecha_inicio es mayor que la última fecha_inicio
        IF NEW.fecha_inicio <= latest_fecha_inicio THEN
            RAISE EXCEPTION 'New fecha_inicio (%) debe ser mayor que la última existente fecha_inicio (%) para empleado %',
                            NEW.fecha_inicio, latest_fecha_inicio, NEW.id_empleado;
        END IF;

        -- Actualizar la fecha_fin del último registro existente a la nueva fecha_inicio
        UPDATE historico_empleado
        SET fecha_fin = NEW.fecha_inicio
        WHERE id_empleado = NEW.id_empleado
          AND id_museo = latest_id_museo
          AND id_estructura_org = latest_id_estructura_org
          AND fecha_inicio = latest_fecha_inicio;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_hist_empleado
BEFORE INSERT ON historico_empleado
FOR EACH ROW
EXECUTE FUNCTION validar_hist_empleado();

--Validar si ya exite una obra destacada

CREATE OR REPLACE FUNCTION validar_obra_destacada()
RETURNS trigger AS $$
BEGIN
    IF NEW.destacada = 'si' THEN
        IF EXISTS (
            SELECT 1
            FROM historico_obra_movimiento
            WHERE id_museo_sala = NEW.id_museo_sala
              AND id_estructura_fisica = NEW.id_estructura_fisica
              AND id_sala = NEW.id_sala
              AND destacada = 'si'
              AND fecha_fin IS NULL
        ) THEN
            RAISE EXCEPTION 'Ya existe una obra destacada en esta sala actualmente';
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_obra_destacada
BEFORE INSERT ON historico_obra_movimiento
FOR EACH ROW
EXECUTE FUNCTION validar_obra_destacada();

-----------------------------------------------------------------------------------------------------------FUNCIONES------------------------------------------------------------------------------------------------------------
--Calcular rotacion

CREATE OR REPLACE FUNCTION calcular_promedio_anios_empleados(museo_id NUMERIC)
RETURNS INTEGER AS $$
DECLARE
    promedio_anios NUMERIC;
    resultado INTEGER;
BEGIN
    WITH ultimos_registros AS (
        SELECT id_empleado, fecha_inicio, fecha_fin
        FROM (
            SELECT 
                id_empleado,
                fecha_inicio,
                fecha_fin,
                ROW_NUMBER() OVER (PARTITION BY id_empleado ORDER BY fecha_inicio DESC) AS rn
            FROM historico_empleado
            WHERE id_museo = museo_id
              AND fecha_fin IS NOT NULL
        ) sub
        WHERE rn = 1
    )
    SELECT AVG(EXTRACT(YEAR FROM AGE(fecha_fin, fecha_inicio))) INTO promedio_anios
    FROM ultimos_registros;

    IF promedio_anios IS NULL THEN
        RETURN NULL;
    ELSIF promedio_anios > 10 THEN
        resultado := 1;
    ELSIF promedio_anios >= 5 AND promedio_anios <= 10 THEN
        resultado := 2;
    ELSE
        resultado := 3;
    END IF;

    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- select calcular_promedio_anios_empleados(1)

--Calcular visitas anuales

CREATE OR REPLACE FUNCTION calcular_total_visitas_anuales(id_museo_input NUMERIC, anio_input INT)
RETURNS INT AS $$
DECLARE
    total_tickets INT;
    total_eventos INT;
BEGIN
    SELECT COUNT(*) INTO total_tickets
    FROM ticket
    WHERE id_museo = id_museo_input AND EXTRACT(YEAR FROM fecha_hora_ticket) = anio_input;

    SELECT COALESCE(SUM(cantidad_asistentes), 0) INTO total_eventos
    FROM evento
    WHERE id_museo = id_museo_input AND EXTRACT(YEAR FROM fecha_inicio_evento) = anio_input;

    RETURN COALESCE(total_tickets, 0) + total_eventos;
END;
$$ LANGUAGE plpgsql;

--
-------------------------------------------------------------------------------------------------No funciona---------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION ficha_obra(_id_obra NUMERIC)
RETURNS TABLE (
    nombre_obra VARCHAR,
    tecnica VARCHAR,
    ano_creacion INT,
    valor NUMERIC,
    artista VARCHAR,
    museo VARCHAR,
    sala VARCHAR,
    ubicacion_fisica VARCHAR,
    coleccion VARCHAR,
    destacada VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        o.nombre,
        o.tecnica,
        o.ano_creacion,
        h.valor_obra,
        CONCAT(a.p_nombre, ' ', a.s_nombre, ' ', a.p_apellido, ' ', a.s_apellido),
        m.nombre,
        s.nombre,
        ef.nombre,
        c.nombre,
        h.destacada
    FROM obra o
    JOIN artista a ON o.id_artista = a.id_artista
    LEFT JOIN historico_obra_movimiento h ON o.id_obra = h.id_obra AND h.fecha_fin IS NULL
    LEFT JOIN museo m ON h.id_museo_sala = m.id
    LEFT JOIN sala s ON h.id_sala = s.id_sala
    LEFT JOIN estructura_fisica ef ON h.id_estructura_fisica = ef.id_estructura_fisica
    LEFT JOIN coleccion c ON h.id_coleccion = c.id_coleccion
    WHERE o.id_obra = _id_obra;
END;
$$ LANGUAGE plpgsql;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION orden_recorrido(_id_museo NUMERIC, _id_sala NUMERIC)
RETURNS TABLE (
    orden NUMERIC,
    nombre_obra VARCHAR,
    artista VARCHAR,
    destacada VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        h.orden_recomendado,
        o.nombre,
        CONCAT(a.p_nombre, ' ', a.s_nombre, ' ', a.p_apellido, ' ', a.s_apellido) AS artista,
        h.destacada
    FROM historico_obra_movimiento h
    JOIN obra o ON h.id_obra = o.id_obra
    JOIN artista a ON o.id_artista = a.id_artista
    WHERE h.id_museo_sala = _id_museo
      AND h.id_sala = _id_sala
      AND h.fecha_fin IS NULL
    ORDER BY h.orden_recomendado;
END;
$$ LANGUAGE plpgsql;

--

CREATE OR REPLACE FUNCTION obras_destacadas_actuales()
RETURNS TABLE (
    nombre_obra VARCHAR,
    artista VARCHAR,
    museo VARCHAR,
    estructura_fisica VARCHAR,
    sala VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        o.nombre,
        CONCAT(a.p_nombre, ' ', a.s_nombre, ' ', a.p_apellido, ' ', a.s_apellido) AS artista,
        m.nombre AS museo,
        ef.nombre AS estructura_fisica,
        s.nombre AS sala
    FROM historico_obra_movimiento h
    JOIN obra o ON h.id_obra = o.id_obra
    JOIN artista a ON o.id_artista = a.id_artista
    JOIN museo m ON h.id_museo_sala = m.id
    JOIN estructura_fisica ef ON h.id_estructura_fisica = ef.id_estructura_fisica AND h.id_museo_sala = ef.id_museo
    JOIN sala_exposicion s ON h.id_sala = s.id_sala AND h.id_museo_sala = s.id_museo
    WHERE h.destacada = 'si'
        AND h.fecha_fin IS NULL;
END;
$$ LANGUAGE plpgsql;

------------------------------------------------------------------------------------------------------------------PROCEDIMIENTOS----------------------------------------------------------------------------------------------------------------

-- Procedimiento para registrar la estructura organizacional

CREATE OR REPLACE PROCEDURE registrar_estructura_organizacional(
    _id_museo NUMERIC,
    _nombre VARCHAR,
    _nivel VARCHAR,
    _tipo VARCHAR,
    _id_jerarquia_estructura NUMERIC DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO estructura_organizacional (
        id_museo, nombre, nivel, tipo,
        id_jerarquia_museo, id_jerarquia_estructura
    )
    VALUES (
        _id_museo, _nombre, _nivel, _tipo,
        _id_museo, _id_jerarquia_estructura
    );
END;
$$;

-- 'direccion', 'departamento', 'seccion', 'subdepartamento', 'subseccion'
-- CALL registrar_estructura_organizacional(_id_museo, _nombre, _nivel, _tipo, _id_jerarquia_estructura)

-- Procedimiento para registrar la estructura fisica

CREATE OR REPLACE PROCEDURE registrar_estructura_fisica(
    _id_museo NUMERIC,
    _nombre VARCHAR,
    _tipo_estructura VARCHAR,
    _direccion VARCHAR,
    _descripcion VARCHAR,
    _id_jerarquia_estructura NUMERIC DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO estructura_fisica (
        id_museo, nombre, tipo_estructura, direccion, descripcion,
        id_jerarquia_museo, id_jerarquia_estructura
    )
    VALUES (
        _id_museo, _nombre, _tipo_estructura, _direccion, _descripcion,
        _id_museo, _id_jerarquia_estructura
    );
END;
$$;

--CALL registrar_estructura_fisica(1, 'Edificio Principal', 'edificio', 'Av. Bolívar con calle 4', 'Edificio de 3 plantas');

--Procedimiento regitrar movimiento obra

CREATE OR REPLACE PROCEDURE registrar_movimiento_obra(
    _id_obra NUMERIC,
    _fecha_inicio DATE,
    _tipo_obtencion VARCHAR,
    _destacada VARCHAR,
    _id_museo_sala NUMERIC,
    _id_estructura_fisica NUMERIC,
    _id_sala NUMERIC,
    _id_museo_coleccion NUMERIC,
    _id_estructura_org_coleccion NUMERIC,
    _id_coleccion NUMERIC,
    _id_museo_empleado NUMERIC,
    _id_estructura_org_empleado NUMERIC,
    _id_empleado NUMERIC,
    _fecha_inicio_empleado DATE,
    _valor_obra NUMERIC,
    _orden_recomendado NUMERIC,
    _fecha_fin DATE DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
DECLARE
    id_movimiento_anterior NUMERIC;
BEGIN
    -- Si ya hay un movimiento activo de esa obra, ciérralo
    SELECT id_historico_obra_movimiento
    INTO id_movimiento_anterior
    FROM historico_obra_movimiento
    WHERE id_obra = _id_obra AND fecha_fin IS NULL
    LIMIT 1;

    IF FOUND THEN
        UPDATE historico_obra_movimiento
        SET fecha_fin = _fecha_inicio - INTERVAL '1 day'
        WHERE id_obra = _id_obra
          AND id_historico_obra_movimiento = id_movimiento_anterior;
    END IF;

    -- Insertar nuevo movimiento
    INSERT INTO historico_obra_movimiento (
        id_obra,
        fecha_inicio,
        tipo_obtencion,
        destacada,
        id_museo_sala,
        id_estructura_fisica,
        id_sala,
        id_museo_coleccion,
        id_estructura_org_coleccion,
        id_coleccion,
        id_museo_empleado,
        id_estructura_org_empleado,
        id_empleado,
        fecha_inicio_empleado,
        fecha_fin,
        valor_obra,
        orden_recomendado
    )
    VALUES (
        _id_obra,
        _fecha_inicio,
        _tipo_obtencion,
        _destacada,
        _id_museo_sala,
        _id_estructura_fisica,
        _id_sala,
        _id_museo_coleccion,
        _id_estructura_org_coleccion,
        _id_coleccion,
        _id_museo_empleado,
        _id_estructura_org_empleado,
        _id_empleado,
        _fecha_inicio_empleado,
        _fecha_fin,
        _valor_obra,
        _orden_recomendado
    );
END;
$$;

--Procedimiento Registrar evento

CREATE OR REPLACE PROCEDURE registrar_evento(
    _id_museo NUMERIC,
    _nombre_evento VARCHAR,
    _tipo_evento VARCHAR,
    _fecha_inicio_evento DATE,
    _fecha_fin_evento DATE,
    _cantidad_asistentes INT,
    _costo_persona NUMERIC,
    _institucion_educativa VARCHAR DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
DECLARE
    evento_solapado INT;
BEGIN
    -- Validar que la fecha de inicio no sea posterior a la fecha de fin
    IF _fecha_inicio_evento > _fecha_fin_evento THEN
        RAISE EXCEPTION 'La fecha de inicio no puede ser posterior a la fecha de fin.';
    END IF;

    -- Validar que no exista un evento solapado en el mismo museo
    SELECT COUNT(*) INTO evento_solapado
    FROM evento
    WHERE id_museo = _id_museo
      AND (
            (_fecha_inicio_evento BETWEEN fecha_inicio_evento AND fecha_fin_evento)
         OR (_fecha_fin_evento BETWEEN fecha_inicio_evento AND fecha_fin_evento)
         OR (fecha_inicio_evento BETWEEN _fecha_inicio_evento AND _fecha_fin_evento)
         OR (fecha_fin_evento BETWEEN _fecha_inicio_evento AND _fecha_fin_evento)
      );

    IF evento_solapado > 0 THEN
        RAISE EXCEPTION 'Ya existe un evento en el museo en el rango de fechas indicado.';
    END IF;

    -- Insertar evento si pasa las validaciones
    INSERT INTO evento (
        id_museo,
        nombre_evento,
        tipo_evento,
        fecha_inicio_evento,
        fecha_fin_evento,
        cantidad_asistentes,
        institucion_educativa,
        costo_persona
    )
    VALUES (
        _id_museo,
        _nombre_evento,
        _tipo_evento,
        _fecha_inicio_evento,
        _fecha_fin_evento,
        _cantidad_asistentes,
        _institucion_educativa,
        _costo_persona
    );
END;
$$;

--CALL registrar_evento( 1, 'Visita Educativa: Renacimiento', '2025-07-01', '2025-07-01', 30, 1.5, 'Colegio San Martín' );

--Procedimiento Generar ticket

CREATE OR REPLACE PROCEDURE generar_ticket(
    _id_museo NUMERIC,
    _tipo_ticket VARCHAR,
    _fecha_hora_ticket TIMESTAMP
)
LANGUAGE plpgsql
AS $$
DECLARE
    _dia INT;
    _hora TIME;
    _hora_apertura TIME;
    _hora_cierre TIME;
    _precio NUMERIC;
BEGIN
    -- Día de la semana (1 = lunes, 7 = domingo)
    _dia := EXTRACT(ISODOW FROM _fecha_hora_ticket);
    _hora := CAST(_fecha_hora_ticket AS TIME);

    -- Validar horario del museo
    SELECT hora_apertura, hora_cierre
    INTO _hora_apertura, _hora_cierre
    FROM horario
    WHERE id_museo = _id_museo AND dia = _dia;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'El museo no tiene horario definido para el día %', _dia;
    END IF;

    IF _hora < _hora_apertura OR _hora > _hora_cierre THEN
        RAISE EXCEPTION 'El museo no está abierto a esa hora';
    END IF;

    -- Validar que no esté cerrado
    IF EXISTS (
        SELECT 1
        FROM hist_cierre
        WHERE id_museo = _id_museo
        AND fecha_ini <= CAST(_fecha_hora_ticket AS DATE)
        AND (fecha_fin IS NULL OR fecha_fin >= CAST(_fecha_hora_ticket AS DATE))
    ) THEN
        RAISE EXCEPTION 'El museo está cerrado en esa fecha';
    END IF;

    -- Obtener precio válido para el tipo y fecha
    SELECT precio
    INTO _precio
    FROM tipo_ticket_historico
    WHERE id_museo = _id_museo
    AND tipo_ticket = _tipo_ticket
    AND fecha_inicio <= CAST(_fecha_hora_ticket AS DATE)
    AND (fecha_fin IS NULL OR fecha_fin >= CAST(_fecha_hora_ticket AS DATE))
    ORDER BY fecha_inicio DESC
    LIMIT 1;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'No hay precio definido para el tipo de ticket y fecha dada';
    END IF;

    -- Insertar ticket
    INSERT INTO ticket (
        id_museo,
        precio,
        tipo_ticket,
        fecha_hora_ticket
    ) VALUES (
        _id_museo,
        _precio,
        _tipo_ticket,
        CAST(_fecha_hora_ticket AS DATE)
    );
END;
$$;

-- CALL generar_ticket(1, 'adulto', '2025-07-01 10:00:00');

--Procedimineto Ingresos de museos

CREATE OR REPLACE PROCEDURE resumen_ingresos_museo(
    _id_museo NUMERIC,
    _modo VARCHAR,          -- 'dia', 'mes' o 'año'
    _anio INT,
    _mes INT DEFAULT NULL,
    _dia INT DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF _modo = 'dia' THEN
        -- Ingresos por día específico
        RAISE NOTICE 'Ingresos por día:';
        CALL mostrar_ingresos_query(_id_museo, 'dia', _anio, _mes, _dia);

    ELSIF _modo = 'mes' THEN
        -- Ingresos por mes (agrupados por día)
        RAISE NOTICE 'Ingresos por mes (agrupados por día):';
        CALL mostrar_ingresos_query(_id_museo, 'mes', _anio, _mes, NULL);

    ELSIF _modo = 'año' THEN
        -- Ingresos por año (agrupados por mes)
        RAISE NOTICE 'Ingresos por año (agrupados por mes):';
        CALL mostrar_ingresos_query(_id_museo, 'año', _anio, NULL, NULL);

    ELSE
        RAISE EXCEPTION 'Modo inválido: use "dia", "mes" o "año"';
    END IF;
END;
$$;

--Procedimientos Mostrar ingresos

CREATE OR REPLACE PROCEDURE mostrar_ingresos_query(
    _id_museo NUMERIC,
    _modo VARCHAR,
    _anio INT,
    _mes INT,
    _dia INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT
            CASE
                WHEN _modo = 'dia' THEN fecha_hora_ticket
                WHEN _modo = 'mes' THEN DATE_TRUNC('day', fecha_hora_ticket)
                WHEN _modo = 'año' THEN DATE_TRUNC('month', fecha_hora_ticket)
            END AS periodo,
            SUM(precio) AS total_ingresos
        FROM ticket
        WHERE id_museo = _id_museo
          AND EXTRACT(YEAR FROM fecha_hora_ticket) = _anio
          AND (_mes IS NULL OR EXTRACT(MONTH FROM fecha_hora_ticket) = _mes)
          AND (_dia IS NULL OR EXTRACT(DAY FROM fecha_hora_ticket) = _dia)
        GROUP BY 1
        ORDER BY 1
    LOOP
        RAISE NOTICE 'Fecha: %, Ingresos: %', r.periodo::DATE, r.total_ingresos;
    END LOOP;
END;
$$;

-- CALL resumen_ingresos_museo(1, 'dia', 2025, 7, 1);

-- CALL resumen_ingresos_museo(1, 'mes', 2025, 7);

-- CALL resumen_ingresos_museo(1, 'año', 2025);

--Procedimiento Registrar empleado profesional

CREATE OR REPLACE PROCEDURE registrar_empleado_profesional(
    _primer_nombre VARCHAR,
    _segundo_nombre VARCHAR DEFAULT NULL,
    _primer_apellido VARCHAR DEFAULT NULL,
    _segundo_apellido VARCHAR DEFAULT NULL,
    _fecha_nacimiento DATE DEFAULT NULL,
    _doc_identidad NUMERIC DEFAULT NULL,
    _dato_contacto VARCHAR DEFAULT NULL,
    _idiomas NUMERIC[] DEFAULT NULL,
    _formaciones JSON DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
DECLARE
    _id_empleado NUMERIC;
    formacion JSON;
    i INT := 0;
    _ano DATE;
BEGIN
    -- Validar duplicado de documento
    IF EXISTS (
        SELECT 1 FROM empleado_profesional
        WHERE doc_identidad = _doc_identidad
    ) THEN
        RAISE EXCEPTION 'Ya existe un empleado con el documento de identidad %', _doc_identidad;
    END IF;

    -- Insertar empleado
    INSERT INTO empleado_profesional (
        primer_nombre, segundo_nombre, primer_apellido,
        segundo_apellido, fecha_nacimiento, doc_identidad, dato_contacto
    ) VALUES (
        _primer_nombre, _segundo_nombre, _primer_apellido,
        _segundo_apellido, _fecha_nacimiento, _doc_identidad, _dato_contacto
    ) RETURNING id_empleado_prof INTO _id_empleado;

    -- Asignar idiomas
    IF _idiomas IS NOT NULL THEN
        FOREACH i IN ARRAY _idiomas LOOP
            INSERT INTO emp_idi(id_idioma, id_empleado_prof) VALUES (i, _id_empleado);
        END LOOP;
    END IF;

    -- Insertar formación
    IF _formaciones IS NOT NULL THEN
        FOR i IN 0..json_array_length(_formaciones) - 1 LOOP
            formacion := _formaciones -> i;
            _ano := TO_DATE(formacion->>'ano', 'YYYY-MM-DD');

            -- Validar que no sea en el futuro
            IF _ano > CURRENT_DATE THEN
                RAISE EXCEPTION 'La fecha de formación % es inválida. No puede estar en el futuro.', _ano;
            END IF;

            INSERT INTO formacion_profesional (
                id_empleado_prof, nombre_titulo, ano, descripcion_especialidad
            ) VALUES (
                _id_empleado,
                formacion->>'titulo',
                _ano,
                formacion->>'especialidad'
            );
        END LOOP;
    END IF;
END;
$$;



--CALL registrar_empleado_profesional(
--    'Luis',                   -- _primer_nombre
--    'Andrés',                -- _segundo_nombre
--    'Pérez',                 -- _primer_apellido
--    'Gómez',                 -- _segundo_apellido
--    '1985-06-15',            -- _fecha_nacimiento
--    12345678,                -- _doc_identidad
--    'luis.perez@correo.com',-- _dato_contacto
--    ARRAY[1, 2],             -- _idiomas (Español, Inglés)
--    '[                       -- _formaciones JSON
--        {
--            "titulo": "Licenciado en Historia del Arte",
--            "ano": "2008-09-01",
--            "especialidad": "Arte Contemporáneo"
--        },
--        {
--            "titulo": "Maestría en Gestión Cultural",
--            "ano": "2012-07-01",
--            "especialidad": "Curaduría de Museos"
--        }
--    ]'
--);

--Procedimiento registrar mantenimiento obra

CREATE OR REPLACE PROCEDURE registrar_mantenimiento_obra(
    _id_obra NUMERIC,
    _id_historico_obra_movimiento NUMERIC,
    _id_mantenimiento_obra NUMERIC,
    _fecha_inicio DATE,
    _observaciones VARCHAR,
    _id_empleado NUMERIC,
    _id_museo NUMERIC,
    _id_estructura_org NUMERIC,
    _fecha_fin DATE DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
DECLARE
    _fecha_inicio_hist DATE;
BEGIN
    -- Validar que exista la actividad de mantenimiento
    IF NOT EXISTS (
        SELECT 1 FROM mantenimiento_obra
        WHERE id_obra = _id_obra
        AND id_historico_obra_movimiento = _id_historico_obra_movimiento
        AND id_mantenimiento_obra = _id_mantenimiento_obra
    ) THEN
        RAISE EXCEPTION 'No existe el mantenimiento programado para la obra';
    END IF;

    -- Buscar fecha de inicio del historial del empleado en esa estructura
    SELECT fecha_inicio
    INTO _fecha_inicio_hist
    FROM historico_empleado
    WHERE id_empleado = _id_empleado
      AND id_museo = _id_museo
      AND id_estructura_org = _id_estructura_org
      AND fecha_inicio <= _fecha_inicio
      AND (fecha_fin IS NULL OR fecha_fin >= _fecha_inicio)
    LIMIT 1;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'El empleado no estaba activo en esa estructura en la fecha del mantenimiento';
    END IF;

    -- Validar rango de fechas
    IF _fecha_fin IS NOT NULL AND _fecha_fin < _fecha_inicio THEN
        RAISE EXCEPTION 'La fecha de fin no puede ser anterior a la de inicio';
    END IF;

    -- Insertar el mantenimiento
    INSERT INTO historico_mantenimiento_realizado (
        id_obra,
        id_historico_obra_movimiento,
        id_mantenimiento_obra,
        fecha_inicio,
        observaciones,
        id_empleado,
        id_museo,
        id_estructura_org,
        fecha_inicio_hist_empleado,
        fecha_fin
    ) VALUES (
        _id_obra,
        _id_historico_obra_movimiento,
        _id_mantenimiento_obra,
        _fecha_inicio,
        _observaciones,
        _id_empleado,
        _id_museo,
        _id_estructura_org,
        _fecha_inicio_hist,
        _fecha_fin
    );
END;
$$;

--CALL registrar_mantenimiento_obra(
--    1,                    -- id_obra
--    1,                    -- id_historico_obra_movimiento
--    1,                    -- id_mantenimiento_obra
--    '2025-07-05',         -- fecha_inicio del mantenimiento
--    'Mantenimiento completado sin inconvenientes',  -- observaciones
--    1,                    -- id_empleado
--    1,                    -- id_museo
--    1,                    -- id_estructura_org
--    '2025-07-05'          -- fecha_fin (opcional, puede omitirse si es NULL)
--);


