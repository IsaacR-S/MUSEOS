------------------------------------------------------------------ISAAC---------------------------------------------------------

INSERT INTO lugar (id_lugar, nombre_lugar, tipo, id_jerarquia) VALUES
(nextval('seq_lugar'), 'canada', 'pais', NULL),
(nextval('seq_lugar'), 'mexico', 'pais', NULL),
(nextval('seq_lugar'), 'china', 'pais', NULL),
(nextval('seq_lugar'), 'australia', 'pais', NULL),
(nextval('seq_lugar'), 'vancouver', 'ciudad', 1),
(nextval('seq_lugar'), 'montreal', 'ciudad', 1),
(nextval('seq_lugar'), 'ciudad de mexico', 'ciudad', 2),
(nextval('seq_lugar'), 'monterrey', 'ciudad', 2),
(nextval('seq_lugar'), 'nanjing', 'ciudad', 3),
(nextval('seq_lugar'), 'guangzhou', 'ciudad', 3),
(nextval('seq_lugar'), 'canberra', 'ciudad', 4),
(nextval('seq_lugar'), 'melbourne', 'ciudad', 4);

INSERT INTO obra (id_obra, nombre_obra, fecha_periodo, tipo_obra, dimensiones, estilo_descripcion, descripcion_materiales_tecnicas) VALUES
(nextval('seq_obra'), 'david', '1501-1503 renacimiento', 'escultura', '517cm', 'clasico renacentista con anatomía idealizada', 'marmol de carrara y talla directa'),
(nextval('seq_obra'), 'el pensador', '1880-1904 modernismo', 'escultura', '70cm x 58cm x 40cm', 'expresivo y realista', 'bronce, fundicion'),
(nextval('seq_obra'), 'venus de milo', '130-100 a.c helenismo', 'escultura', '211cm', 'clasico griego con proporciones armoniosas', 'marmol, talla directa'),
(nextval('seq_obra'), 'discobolo', '455 a.c grecia', 'escultura', '155cm', 'clasico con enfasis en el moviminto', 'marmol, talla directa'),
(nextval('seq_obra'), 'monalisa', '1503-1519', 'pintura', '77cm x 53cm', 'retrato renacentista con sfumato', 'oleo sobre tabla de alamo'),
(nextval('seq_obra'), 'las meninas', '1656 barroco', 'pintura', '318cm x 276xcm', 'retrato cortesano con perspectica compleja', 'oleao sobre lienzo'),
(nextval('seq_obra'), 'la pertenecia de la memoria', '1931 surrealismo', 'pintura', '24cm x 33cm', 'surrealista con elementos oniricos', 'oleo sobre lienzo'),
(nextval('seq_obra'), 'el grito', '1893 expresionismo', 'pintura', '91cm x 73cm', 'expresionista con colores vibrantes', 'oleo, temple y pastel sobre carton'),
(nextval('seq_obra'), 'guernica', '1937 cubismo', 'pintura', '349cm x 776cm', 'cubista con mensajes politicos', 'oleo sobre lienzo');

INSERT INTO artista (id_artista, nombre_artista, apellido_artista, fecha_nacimiento, apodo_artista, fecha_muerte, descripcion_estilo_tecnicas) VALUES
(nextval('seq_artista'), 'michelangelo', 'buonarroti', '1475-03-06', 'miguel angel', '1564-02-18', 'renacimiento, escultura, pintura, arquitectura'),
(nextval('seq_artista'), 'françois auguste rene', 'rodin', '1840-11-12', 'auguste rodin', '1917-11-17', 'escultura moderna, simbolismo'),
(nextval('seq_artista'), NULL, NULL, NULL, 'alejandro de antioquia', NULL, 'escultura helenística'),
(nextval('seq_artista'), NULL, NULL, NULL, 'miron de eleuteras', NULL, 'escultura clásica, bronce'),
(nextval('seq_artista'), 'leonardo', 'di ser piero da vinci', '1452-04-15', NULL, '1519-05-02', 'renacimiento, pintura, ingeniería, anatomía'),
(nextval('seq_artista'), 'diego', 'rodrigo de silva y velazques', '1599-06-06', 'diego velazquez', '1660-08-06', 'barroco, pintura'),
(nextval('seq_artista'), 'salvador', 'domingo felipe jacinto dali i domenech', '1904-05-11', 'salvador dali', '1989-01-23', 'surrealismo,pintura,escultura'),
(nextval('seq_artista'), 'edvard', 'munch', '1863-12-12', NULL, '1944-01-23', 'expresionismo, simbolismo'),
(nextval('seq_artista'), 'pablo', 'ruiz', '1881-10-25', 'pablo picasso', '1973-04-08', 'cubismo, surrealismo, pintura, escultura');

INSERT INTO art_obra (id_artista, id_obra) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9);

--REVISAR LOS ID DE LUGAR, PUSE LOS DE PAIS, SUPONGO QUE SON LOS DE CIUDAD PERO NO ESTOY SEGURO
INSERT INTO museo (id_museo, nombre, mision, fecha_fundacion, id_lugar) VALUES
(nextval('seq_museo'), 'Museo de Arte de Vancouvert', 'Fomentar el arte de la costa oeste de Canada', '1931-01-01', 5),
(nextval('seq_museo'), 'Museo de Arte de Montreal', 'Preservar y compartir arte de todas las epocas', '1860-04-23', 6),
(nextval('seq_museo'), 'Museo de la Ciudad de México', 'Narrar la historia de la ciudad', '1964-10-31', 7),
(nextval('seq_museo'), 'Museo De Arte Contemporáneo De Monterrey', 'Promover el arte contemporáneo', '1991-06-28', 8),
(nextval('seq_museo'), 'Jiangsu Art Museum', 'Exhibir arte contemporáneo chino', '1936-01-01', 9),
(nextval('seq_museo'), 'Museo de Guangdong', 'Difundir la cultura y arte de Guangdong', '1959-01-01', 10),
(nextval('seq_museo'), 'Museo Nacional de Australia', 'Explorar la historia australiana', '2001-03-11', 11),
(nextval('seq_museo'), 'Galería Nacional de Victoria', 'Ser un epicentro de la creatividad y la innovación artística', '1861-01-01', 12);
INSERT INTO resumen_hist (ano, hechos_hist, id_museo) VALUES
();

INSERT INTO HORARIO (id_museo, dia, hora_apertura, hora_cierre) VALUES
(1,1,'09:00','18:00'),
(1,2,'09:00','18:00'),
(1,3,'09:00','18:00'),
(1,4,'09:00','18:00'),
(1,5,'09:00','20:00'),
(1,6,'10:00','20:00'),
(1,7,'10:00','18:00');

INSERT INTO EVENTO (id_museo, fecha_inicio, fecha_fin, nombre evento, institucion_educativa, cantidad_asistentes, lugar_exposicion, costo_persona, )


-----------------------------------------------------JAC------------------------------------------------------------


