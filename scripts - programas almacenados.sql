-- *** FUNCIONES DE ASISTENCIA PARA LA SELECCIÓN DE MUSEO TICKET***

-- 1. Función para listar todos los museos disponibles
-- Permite al usuario seleccionar el museo para el cual generará un ticket.
CREATE OR REPLACE FUNCTION fn_listar_museos()
RETURNS TABLE (
    id_museo_ret NUMERIC,
    nombre_museo_ret VARCHAR(50),
    ciudad_museo_ret VARCHAR(50),
    pais_museo_ret VARCHAR(50)
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        m.id_museo,
        m.nombre,
        l_ciudad.nombre_lugar::VARCHAR(50) AS ciudad,
        l_pais.nombre_lugar::VARCHAR(50) AS pais
    FROM
        museo m,
        lugar l_ciudad, 
        lugar l_pais
    WHERE
        m.id_lugar = l_ciudad.id_lugar
        AND l_ciudad.id_jerarquia = l_pais.id_lugar
        AND l_pais.tipo = 'pais'
    ORDER BY
        m.id_museo ASC; -- Ordenado por ID del museo en orden ascendente
END;
$$ LANGUAGE plpgsql;

-- *** PROGRAMA ALMACENADO PRINCIPAL PARA GENERACIÓN DE TICKETS ***
--   p_id_museo: El ID del museo al que pertenece el ticket.
--   p_precio: El precio del ticket.
--   p_tipo_ticket: El tipo de ticket ('niño', 'adulto', 'tercera edad').
CREATE OR REPLACE FUNCTION sp_generar_ticket(
    p_id_museo NUMERIC,
    p_precio NUMERIC,
    p_tipo_ticket VARCHAR(20)
)
RETURNS TEXT AS $$
DECLARE
    v_museo_existe BOOLEAN;
    v_ticket_generado_id NUMERIC;
    v_nombre_museo VARCHAR(50);
    v_fecha_actual DATE := CURRENT_DATE; -- Se define la fecha actual aquí
BEGIN
    -- 1. Validar que el ID del museo exista
    SELECT TRUE, nombre INTO v_museo_existe, v_nombre_museo FROM museo WHERE id_museo = p_id_museo;

    IF NOT FOUND THEN
        RETURN 'Error: El ID de museo ' || p_id_museo || ' no existe.';
    END IF;

    -- 2. Validar el tipo de ticket (se basa en el CHECK constraint de la tabla, pero se puede añadir validación explícita)
    IF p_tipo_ticket NOT IN ('niño', 'adulto', 'tercera edad') THEN
        RETURN 'Error: El tipo de ticket "' || p_tipo_ticket || '" no es válido. Debe ser "niño", "adulto" o "tercera edad".';
    END IF;

    -- 3. Validar que el precio sea positivo
    IF p_precio <= 0 THEN
        RETURN 'Error: El precio del ticket debe ser un valor positivo.';
    END IF;

    -- 4. Insertar el nuevo ticket en la tabla 'ticket'
    INSERT INTO ticket (
        id_museo,
        precio,
        tipo_ticket,
        fecha_hora_ticket
    ) VALUES (
        p_id_museo,
        p_precio,
        p_tipo_ticket,
        v_fecha_actual -- Se usa la fecha actual aquí
    ) RETURNING id_ticket INTO v_ticket_generado_id; -- Captura el ID del ticket recién generado

    RETURN 'Éxito: Ticket #' || v_ticket_generado_id || ' de tipo "' || p_tipo_ticket || '" generado para el museo "' || v_nombre_museo || '" con precio ' || p_precio || ' en la fecha ' || v_fecha_actual || '.';

EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error inesperado al generar el ticket: ' || SQLERRM;
END;
$$ LANGUAGE plpgsql;

-- Vista para visualizar los tickets de admisión con información relevante del museo.
CREATE OR REPLACE VIEW vista_tickets_generados AS
SELECT
    t.id_ticket,
    t.fecha_hora_ticket,
    t.tipo_ticket,
    t.precio,
    m.nombre AS nombre_museo,
    l_ciudad.nombre_lugar AS ciudad_museo,
    l_pais.nombre_lugar AS pais_museo
FROM
    ticket t, 
    museo m,
    lugar l_ciudad,
    lugar l_pais 
WHERE
    t.id_museo = m.id_museo
    AND m.id_lugar = l_ciudad.id_lugar
    AND l_ciudad.id_jerarquia = l_pais.id_lugar
ORDER BY
    t.fecha_hora_ticket DESC, m.nombre;

-- Función para calcular el ranking mundial de museos
CREATE OR REPLACE FUNCTION ranking_mundial_museos()
RETURNS TABLE (
    ranking_posicion NUMERIC,
    -- id_museo NUMERIC, -- Eliminado según la solicitud
    nombre_museo VARCHAR(50),
    pais VARCHAR(50),
    promedio_permanencia NUMERIC,
    rotacion_puntaje NUMERIC,
    visitas_anuales NUMERIC,
    puntaje_total NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    WITH permanencia_empleados AS (
        SELECT
            he.id_museo,
            ROUND(AVG( -- Se añade ROUND para limitar a 2 decimales
                CASE
                    WHEN he.fecha_fin IS NULL THEN EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM he.fecha_inicio)
                    ELSE EXTRACT(YEAR FROM he.fecha_fin) - EXTRACT(YEAR FROM he.fecha_inicio)
                END
            ), 2) AS promedio_permanencia
        FROM
            historico_empleado he
        GROUP BY
            he.id_museo
    ),
    visitas_anuales AS (
        SELECT
            t.id_museo,
            EXTRACT(YEAR FROM t.fecha_hora_ticket) AS ano,
            COUNT(*) AS cantidad_visitas
        FROM
            ticket t
        GROUP BY
            t.id_museo, EXTRACT(YEAR FROM t.fecha_hora_ticket)
    ),
    promedio_visitas AS (
        SELECT
            va.id_museo,
            ROUND(AVG(va.cantidad_visitas), 2) AS visitas_promedio -- Se añadió ROUND para limitar a 2 decimales
        FROM
            visitas_anuales va
        GROUP BY
            va.id_museo
    ),
    datos_completos AS (
        SELECT
            m.id_museo,
            m.nombre::VARCHAR(50) AS nombre, -- Casteado a VARCHAR(50)
            UPPER(lp.nombre_lugar)::VARCHAR(50) AS pais, -- País en mayúsculas completas y casteado a VARCHAR(50)
            COALESCE(pe.promedio_permanencia, 0) AS promedio_permanencia,
            (CASE
                WHEN COALESCE(pe.promedio_permanencia, 0) >= 10 THEN 1
                WHEN COALESCE(pe.promedio_permanencia, 0) >= 5 THEN 2
                ELSE 3
            END)::NUMERIC AS rotacion_puntaje,
            COALESCE(pv.visitas_promedio, 0) AS visitas_anuales
        FROM
            museo m,
            lugar lc,
            lugar lp,
            permanencia_empleados pe,
            promedio_visitas pv
        WHERE
            m.id_lugar = lc.id_lugar
            AND lc.id_jerarquia = lp.id_lugar
            AND lp.tipo = 'pais'
            AND m.id_museo = pe.id_museo
            AND m.id_museo = pv.id_museo
    ),
    datos_con_puntaje AS (
        SELECT
            dc.*,
            ROUND((dc.rotacion_puntaje * 0.6 + (1 - (RANK() OVER (ORDER BY dc.visitas_anuales DESC)::NUMERIC / (SELECT COUNT(*)::NUMERIC FROM datos_completos))) * 0.4 * 100))::NUMERIC AS puntaje_total
        FROM
            datos_completos dc
    )
    SELECT
        RANK() OVER (ORDER BY dcp.puntaje_total DESC)::NUMERIC AS ranking_posicion,
        -- dcp.id_museo, -- Eliminado según la solicitud
        dcp.nombre AS nombre_museo,
        dcp.pais,
        dcp.promedio_permanencia,
        dcp.rotacion_puntaje,
        dcp.visitas_anuales,
        dcp.puntaje_total
    FROM
        datos_con_puntaje dcp
    ORDER BY
        ranking_posicion;
END;
$$ LANGUAGE plpgsql;

-- Función para calcular el ranking de museos por país
CREATE OR REPLACE FUNCTION ranking_pais_museos(p_nombre_pais VARCHAR)
RETURNS TABLE (
    ranking_posicion NUMERIC,
    nombre_museo VARCHAR(50),
    ciudad VARCHAR(50),
    promedio_permanencia NUMERIC,
    rotacion_puntaje NUMERIC,
    visitas_anuales NUMERIC,
    puntaje_total NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    WITH permanencia_empleados AS (
        SELECT
            he.id_museo,
            ROUND(AVG( -- Se añade ROUND para limitar a 2 decimales
                CASE
                    WHEN he.fecha_fin IS NULL THEN EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM he.fecha_inicio)
                    ELSE EXTRACT(YEAR FROM he.fecha_fin) - EXTRACT(YEAR FROM he.fecha_inicio)
                END
            ), 2) AS promedio_permanencia
        FROM
            historico_empleado he
        GROUP BY
            he.id_museo
    ),
    visitas_anuales AS (
        SELECT
            t.id_museo,
            EXTRACT(YEAR FROM t.fecha_hora_ticket) AS ano,
            COUNT(*) AS cantidad_visitas
        FROM
            ticket t
        GROUP BY
            t.id_museo, EXTRACT(YEAR FROM t.fecha_hora_ticket)
    ),
    promedio_visitas AS (
        SELECT
            va.id_museo,
            ROUND(AVG(va.cantidad_visitas), 2) AS visitas_promedio 
        FROM
            visitas_anuales va
        GROUP BY
            va.id_museo
    ),
    museos_pais AS (
        SELECT
            m.id_museo,
            m.nombre::VARCHAR(50) AS nombre,
            UPPER(lc.nombre_lugar)::VARCHAR(50) AS ciudad, 
            UPPER(lp.nombre_lugar)::VARCHAR(50) AS pais, 
            COALESCE(pe.promedio_permanencia, 0) AS promedio_permanencia,
            (CASE
                WHEN COALESCE(pe.promedio_permanencia, 0) >= 10 THEN 1
                WHEN COALESCE(pe.promedio_permanencia, 0) >= 5 THEN 2
                ELSE 3
            END)::NUMERIC AS rotacion_puntaje,
            COALESCE(pv.visitas_promedio, 0) AS visitas_anuales
        FROM
            museo m,
            lugar lc,
            lugar lp,
            permanencia_empleados pe,
            promedio_visitas pv
        WHERE
            m.id_lugar = lc.id_lugar
            AND lc.id_jerarquia = lp.id_lugar
            AND lp.tipo = 'pais'
            AND LOWER(lp.nombre_lugar) = LOWER(p_nombre_pais) 
            AND m.id_museo = pe.id_museo
            AND m.id_museo = pv.id_museo
    ),
    datos_con_puntaje AS (
        SELECT
            mp.*,
            ROUND((mp.rotacion_puntaje * 0.6 + (1 - (RANK() OVER (ORDER BY mp.visitas_anuales DESC)::NUMERIC / (SELECT COUNT(*)::NUMERIC FROM museos_pais))) * 0.4 * 100))::NUMERIC AS puntaje_total
        FROM
            museos_pais mp
    )
    SELECT
        RANK() OVER (ORDER BY dcp.puntaje_total DESC)::NUMERIC AS ranking_posicion,
        dcp.nombre AS nombre_museo,
        dcp.ciudad,
        dcp.promedio_permanencia,
        dcp.rotacion_puntaje,
        dcp.visitas_anuales,
        dcp.puntaje_total
    FROM
        datos_con_puntaje dcp
    ORDER BY
        ranking_posicion;
END;
$$ LANGUAGE plpgsql;

-- Función para calcular la ganancia generada por tickets de un museo
CREATE OR REPLACE FUNCTION fn_ganancia_tickets_museo(p_id_museo NUMERIC)
RETURNS TABLE (
    "Nombre del Museo" VARCHAR(50), -- Renombrado
    "Total generado" TEXT         -- Cambiado a TEXT para concatenar el símbolo '$'
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        m.nombre::VARCHAR(50) AS "Nombre del Museo",
        '$' || COALESCE(SUM(t.precio), 0)::NUMERIC::TEXT AS "Total generado" -- Concatenado con '$'
    FROM
        museo m, 
        ticket t 
    WHERE
        m.id_museo = t.id_museo
        AND m.id_museo = p_id_museo
    GROUP BY
        m.nombre;
END;
$$ LANGUAGE plpgsql;

-- Función para calcular la ganancia generada por eventos de un museo
CREATE OR REPLACE FUNCTION fn_ganancia_eventos_museo(p_id_museo NUMERIC)
RETURNS TABLE (
    "Nombre del Museo" VARCHAR(50), -- Renombrado
    "Total generado" TEXT         -- Cambiado a TEXT para concatenar el símbolo '$'
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        m.nombre::VARCHAR(50) AS "Nombre del Museo",
        '$' || COALESCE(SUM(e.cantidad_asistentes * e.costo_persona), 0)::NUMERIC::TEXT AS "Total generado" -- Concatenado con '$'
    FROM
        museo m, 
        evento e 
    WHERE
        m.id_museo = e.id_museo
        AND m.id_museo = p_id_museo
    GROUP BY
        m.nombre;
END;
$$ LANGUAGE plpgsql;

-- Función para calcular la ganancia total (tickets + eventos) de un museo
CREATE OR REPLACE FUNCTION fn_ganancia_total_museo(p_id_museo NUMERIC)
RETURNS TABLE (
    "Nombre del Museo" VARCHAR(50), -- Renombrado
    "Total generado" TEXT         -- Cambiado a TEXT para concatenar el símbolo '$'
) AS $$
DECLARE
    v_ganancia_tickets NUMERIC := 0;
    v_ganancia_eventos NUMERIC := 0;
    v_nombre_museo VARCHAR(50);
BEGIN
    -- Obtener el nombre del museo
    SELECT nombre INTO v_nombre_museo FROM museo WHERE id_museo = p_id_museo;

    IF v_nombre_museo IS NULL THEN
        -- Si el museo no existe, retornar una fila vacía o un error
        RETURN QUERY SELECT NULL::VARCHAR(50), NULL::TEXT WHERE FALSE;
        RETURN;
    END IF;

    -- Calcular la ganancia por tickets
    -- Aquí se sigue obteniendo el valor numérico, luego se formateará al final
    SELECT "Total generado"::NUMERIC INTO v_ganancia_tickets
    FROM fn_ganancia_tickets_museo(p_id_museo);

    -- Calcular la ganancia por eventos
    -- Aquí se sigue obteniendo el valor numérico, luego se formateará al final
    SELECT "Total generado"::NUMERIC INTO v_ganancia_eventos
    FROM fn_ganancia_eventos_museo(p_id_museo);

    -- Retornar la suma total. COALESCE asegura que si una de las ganancias es NULL (no hay registros), se considere 0.
    RETURN QUERY
    SELECT
        v_nombre_museo AS "Nombre del Museo",
        '$' || (COALESCE(v_ganancia_tickets, 0) + COALESCE(v_ganancia_eventos, 0))::TEXT AS "Total generado"; -- Concatenado con '$'
END;
$$ LANGUAGE plpgsql;


-- Función para calcular la ganancia generada por tickets de un museo
CREATE OR REPLACE FUNCTION fn_ganancia_tickets_museo(p_id_museo NUMERIC)
RETURNS TABLE (
    "Nombre del Museo" VARCHAR(50), -- Renombrado
    "Total generado" TEXT         -- Cambiado a TEXT para concatenar el símbolo '$'
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        m.nombre::VARCHAR(50) AS "Nombre del Museo",
        '$' || COALESCE(SUM(t.precio), 0)::NUMERIC::TEXT AS "Total generado" -- Concatenado con '$'
    FROM
        museo m, 
        ticket t 
    WHERE
        m.id_museo = t.id_museo
        AND m.id_museo = p_id_museo
    GROUP BY
        m.nombre;
END;
$$ LANGUAGE plpgsql;

-- Función para calcular la ganancia generada por eventos de un museo
CREATE OR REPLACE FUNCTION fn_ganancia_eventos_museo(p_id_museo NUMERIC)
RETURNS TABLE (
    "Nombre del Museo" VARCHAR(50), -- Renombrado
    "Total generado" TEXT         -- Cambiado a TEXT para concatenar el símbolo '$'
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        m.nombre::VARCHAR(50) AS "Nombre del Museo",
        '$' || COALESCE(SUM(e.cantidad_asistentes * e.costo_persona), 0)::NUMERIC::TEXT AS "Total generado" -- Concatenado con '$'
    FROM
        museo m, 
        evento e 
    WHERE
        m.id_museo = e.id_museo
        AND m.id_museo = p_id_museo
    GROUP BY
        m.nombre;
END;
$$ LANGUAGE plpgsql;

-- Función para calcular la ganancia total (tickets + eventos) de un museo
CREATE OR REPLACE FUNCTION fn_ganancia_total_museo(p_id_museo NUMERIC)
RETURNS TABLE (
    "Nombre del Museo" VARCHAR(50), -- Renombrado
    "Total generado" TEXT         -- Cambiado a TEXT para concatenar el símbolo '$'
) AS $$
DECLARE
    v_ganancia_tickets NUMERIC := 0;
    v_ganancia_eventos NUMERIC := 0;
    v_nombre_museo VARCHAR(50);
BEGIN
    -- Obtener el nombre del museo
    SELECT nombre INTO v_nombre_museo FROM museo WHERE id_museo = p_id_museo;

    IF v_nombre_museo IS NULL THEN
        -- Si el museo no existe, retornar una fila vacía o un error
        RETURN QUERY SELECT NULL::VARCHAR(50), NULL::TEXT WHERE FALSE;
        RETURN;
    END IF;

    -- Calcular la ganancia por tickets
    -- Aquí se sigue obteniendo el valor numérico, luego se formateará al final
    SELECT "Total generado"::NUMERIC INTO v_ganancia_tickets
    FROM fn_ganancia_tickets_museo(p_id_museo);

    -- Calcular la ganancia por eventos
    -- Aquí se sigue obteniendo el valor numérico, luego se formateará al final
    SELECT "Total generado"::NUMERIC INTO v_ganancia_eventos
    FROM fn_ganancia_eventos_museo(p_id_museo);

    -- Retornar la suma total. COALESCE asegura que si una de las ganancias es NULL (no hay registros), se considere 0.
    RETURN QUERY
    SELECT
        v_nombre_museo AS "Nombre del Museo",
        '$' || (COALESCE(v_ganancia_tickets, 0) + COALESCE(v_ganancia_eventos, 0))::TEXT AS "Total generado"; -- Concatenado con '$'
END;
$$ LANGUAGE plpgsql;

-- Función para calcular la ganancia generada por tickets de un museo en un rango de fechas
CREATE OR REPLACE FUNCTION fn_ganancia_tickets_museo(
    p_id_museo NUMERIC,
    p_fecha_inicio DATE,
    p_fecha_fin DATE
)
RETURNS TABLE (
    "Nombre del Museo" VARCHAR(50),
    "Total generado" TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        m.nombre::VARCHAR(50) AS "Nombre del Museo",
        '$' || COALESCE(SUM(t.precio), 0)::NUMERIC::TEXT AS "Total generado"
    FROM
        museo m, -- JOIN implícito
        ticket t -- JOIN implícito
    WHERE
        m.id_museo = t.id_museo
        AND m.id_museo = p_id_museo
        AND t.fecha_hora_ticket >= p_fecha_inicio -- Filtro por fecha de inicio
        AND t.fecha_hora_ticket <= p_fecha_fin   -- Filtro por fecha de fin
    GROUP BY
        m.nombre;
END;
$$ LANGUAGE plpgsql;

-- Función para calcular la ganancia generada por eventos de un museo en un rango de fechas
CREATE OR REPLACE FUNCTION fn_ganancia_eventos_museo(
    p_id_museo NUMERIC,
    p_fecha_inicio DATE,
    p_fecha_fin DATE
)
RETURNS TABLE (
    "Nombre del Museo" VARCHAR(50),
    "Total generado" TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        m.nombre::VARCHAR(50) AS "Nombre del Museo",
        '$' || COALESCE(SUM(e.cantidad_asistentes * e.costo_persona), 0)::NUMERIC::TEXT AS "Total generado"
    FROM
        museo m, -- JOIN implícito
        evento e -- JOIN implícito
    WHERE
        m.id_museo = e.id_museo
        AND m.id_museo = p_id_museo
        AND e.fecha_inicio_evento >= p_fecha_inicio -- Filtro por fecha de inicio del evento
        AND e.fecha_fin_evento <= p_fecha_fin     -- Filtro por fecha de fin del evento
    GROUP BY
        m.nombre;
END;
$$ LANGUAGE plpgsql;

-- Función para calcular la ganancia total (tickets + eventos) de un museo en un rango de fechas
CREATE OR REPLACE FUNCTION fn_ganancia_total_museo(
    p_id_museo NUMERIC,
    p_fecha_inicio DATE,
    p_fecha_fin DATE
)
RETURNS TABLE (
    "Nombre del Museo" VARCHAR(50),
    "Total generado" TEXT
) AS $$
DECLARE
    v_ganancia_tickets NUMERIC := 0;
    v_ganancia_eventos NUMERIC := 0;
    v_nombre_museo VARCHAR(50);
BEGIN
    -- Obtener el nombre del museo
    SELECT nombre INTO v_nombre_museo FROM museo WHERE id_museo = p_id_museo;

    IF v_nombre_museo IS NULL THEN
        -- Si el museo no existe, retornar una fila vacía o un error
        RETURN QUERY SELECT NULL::VARCHAR(50), NULL::TEXT WHERE FALSE;
        RETURN;
    END IF;

    -- Calcular la ganancia por tickets en el rango de fechas
    SELECT "Total generado"::NUMERIC INTO v_ganancia_tickets
    FROM fn_ganancia_tickets_museo(p_id_museo, p_fecha_inicio, p_fecha_fin);

    -- Calcular la ganancia por eventos en el rango de fechas
    SELECT "Total generado"::NUMERIC INTO v_ganancia_eventos
    FROM fn_ganancia_eventos_museo(p_id_museo, p_fecha_inicio, p_fecha_fin);

    -- Retornar la suma total. COALESCE asegura que si una de las ganancias es NULL (no hay registros), se considere 0.
    RETURN QUERY
    SELECT
        v_nombre_museo AS "Nombre del Museo",
        '$' || (COALESCE(v_ganancia_tickets, 0) + COALESCE(v_ganancia_eventos, 0))::TEXT AS "Total generado";
END;
$$ LANGUAGE plpgsql;

