INSERT INTO artista (nombre_artista, apellido_artista, fecha_nacimiento, apodo_artista, fecha_muerte, descripcion_estilo_tecnicas) VALUES
('Frida', 'Kahlo', '1907-07-06', NULL, '1954-07-13', 'Surrealismo, Realismo Mágico, Simbolismo, autorretratos');

INSERT INTO obra (nombre_obra, fecha_periodo, tipo_obra, dimensiones, estilo_descripcion, descripcion_materiales_tecnicas) VALUES
('Las dos Fridas', '1939 Surrealismo', 'pintura', '173.5cm x 173cm', 'Autorretrato doble que explora la dualidad y el dolor.', 'Óleo sobre lienzo');

INSERT INTO art_obra (id_artista, id_obra) VALUES
(10, 10); -- Asumiendo que Frida es el id 10 y su obra también es la 10.

-------------------------------------------------------------------------------------------------
-- INSERTS PARA HISTORICO_OBRA_MOVIMIENTO
-------------------------------------------------------------------------------------------------

-- Escenario 1: Obra que ESTUVO en un museo y fue destacada, pero ya no está (registro histórico).
-- Obra: "El Pensador" (ID 2)
-- Museo: Museo de la Ciudad de México
INSERT INTO historico_obra_movimiento (
    id_obra, id_historico_obra_movimiento, fecha_inicio, tipo_obtencion, destacada,
    id_museo_sala, id_estructura_fisica, id_sala,
    id_museo_coleccion, id_estructura_org_coleccion, id_coleccion,
    id_museo_empleado, id_estructura_org_empleado, id_empleado, fecha_inicio_empleado,
    fecha_fin, valor_obra, orden_recomendado
) VALUES (
    2, nextval('seq_mantenimiento_obra'), '2021-02-10', 'comprado a otro museo', 'si',
    3, 39, 7,  -- Sala Virreinal en Museo de la Ciudad de México
    6, 39, 12, -- Colección Muralismo Mexicano
    3, 33, 12, '2022-04-15', -- Empleado curador que estuvo activo en esa fecha
    '2023-01-15', 750000.00, 6
);

-- Escenario 2: Obra que está ACTUALMENTE en un museo, pero NO es destacada.
-- Obra: "Las Meninas" (ID 6)
-- Museo: Museo de Arte Contemporáneo de Monterrey
INSERT INTO historico_obra_movimiento (
    id_obra, id_historico_obra_movimiento, fecha_inicio, tipo_obtencion, destacada,
    id_museo_sala, id_estructura_fisica, id_sala,
    id_museo_coleccion, id_estructura_org_coleccion, id_coleccion,
    id_museo_empleado, id_estructura_org_empleado, id_empleado, fecha_inicio_empleado,
    fecha_fin, valor_obra, orden_recomendado
) VALUES (
    6, nextval('seq_mantenimiento_obra'), '2023-02-20', 'donado', 'no',
    4, 41, 8, -- Galería Norte en MARCO
    2, 14, 3, -- Colección Maestros Europeos (ejemplo de préstamo)
    4, 18, 14, '2023-06-05', -- Curador actual
    NULL, 900000.00, 7
);

-- Escenario 3: Obra que está ACTUALMENTE en un museo y SÍ es destacada.
-- Obra: "El Grito" (ID 8)
-- Museo: Museo de Arte de Vancouver
INSERT INTO historico_obra_movimiento (
    id_obra, id_historico_obra_movimiento, fecha_inicio, tipo_obtencion, destacada,
    id_museo_sala, id_estructura_fisica, id_sala,
    id_museo_coleccion, id_estructura_org_coleccion, id_coleccion,
    id_museo_empleado, id_estructura_org_empleado, id_empleado, fecha_inicio_empleado,
    fecha_fin, valor_obra, orden_recomendado
) VALUES (
    8, nextval('seq_mantenimiento_obra'), '2024-01-10', 'comprado', 'si',
    1, 32, 1, -- Galería Principal en Museo de Arte de Vancouver
    1, 29, 2, -- Colección Arte del Siglo XX
    1, 11, 2, '2023-03-01', -- Curador actual
    NULL, 4500000.00, 8
);

-- Escenario 4: Obra nueva que está ACTUALMENTE en un museo y SÍ es destacada.
-- Obra: "Las dos Fridas" (ID 10)
-- Museo: Museo de Arte Latinoamericano
INSERT INTO historico_obra_movimiento (
    id_obra, id_historico_obra_movimiento, fecha_inicio, tipo_obtencion, destacada,
    id_museo_sala, id_estructura_fisica, id_sala,
    id_museo_coleccion, id_estructura_org_coleccion, id_coleccion,
    id_museo_empleado, id_estructura_org_empleado, id_empleado, fecha_inicio_empleado,
    fecha_fin, valor_obra, orden_recomendado
) VALUES (
    10, nextval('seq_mantenimiento_obra'), '2023-09-01', 'donado de otro museo', 'si',
    6, 46, 13, -- Sala de Arte Cantonés (usado para exhibición especial latinoamericana)
    6, 23, 11, -- Colección Arte Moderno Latinoamericano
    6, 23, 22, '2023-08-05', -- Curador actual
    NULL, 6000000.00, 9
);