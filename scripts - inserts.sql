INSERT INTO lugar (nombre_lugar, tipo, id_jerarquia) VALUES
('canada','pais', NULL),
('mexico', 'pais', NULL),
('china', 'pais', NULL),
('australia','pais', NULL),
('vancouver','ciudad','1'),
('montreal','ciudad','1'),
('ciudad de mexico','ciudad','2'),
('monterrey','ciudad','2'),
('nanjing','ciudad','3'),
('guangzhou','ciudad','3'),
('canberra','ciudad','4'),
('melbourne','ciudad','4');

INSERT INTO obra (nombre_obra, fecha_periodo, tipo_obra, dimensiones, estilo_descripcion, descripcion_materiales_tecnicas) VALUES
('david','1501-1503 renacimiento','escultura','517cm','clasico renacentista con anatomía idealizada','marmol de carrara y talla directa'),
('el pensador','1880-1904 modernismo','escultura','70cm x 58cm x 40cm','expresivo y realista','bronce, fundicion'),
('venus de milo','130-100 a.c helenismo','escultura','211cm', 'clasico griego con proporciones armoniosas','marmol, talla directa'),
('discobolo','455 a.c grecia','escultura','155cm','clasico con enfasis en el moviminto','marmol, talla directa'),
('monalisa','1503-1519','pintura','77cm x 53cm','retrato renacentista con sfumato','oleo sobre tabla de alamo'),
('las meninas','1656 barroco','pintura','318cm x 276xcm','retrato cortesano con perspectica compleja','oleao sobre lienzo'),
('la pertenecia de la memoria','1931 surrealismo','pintura','24cm x 33cm','surrealista con elementos oniricos','oleo sobre lienzo'),
('el grito','1893 expresionismo','pintura','91cm x 73cm','expresionista con colores vibrantes','oleo, temple y pastel sobre carton'),
('guernica','1937 cubismo','pintura','349cm x 776cm','cubista con mensajes politicos','oleo sobre lienzo');


INSERT INTO artista (nombre_artista, apellido_artista, fecha_nacimiento, apodo_artista, fecha_muerte, descripcion_estilo_tecnicas) VALUES
('michelangelo','buonarroti','fecha','miguel angel'), --david
('françois auguste rene','rodin','fecha','auguste rodin'), --el pensador
(NULL,NULL,'fecha','alejandro de antioquia'), --venus de milo
(NULL,NULL,'fecha','miron de eleuteras'),--discobolo
('Leonardo di ser Piero da Vinci'),--mona lisa
('diego','rodrigo de silva y velazques','fecha','diego velazquez'),--las meninas
('salvador','domingo','fecha','salvador dali'),--la pertenecia de la memoria
('edvard','munch','fecha',NULL),--el grito
('pablo','ruiz','fecha','pablo picasso');--guernica
  
INSERT INTO museo (nombre, mision, fecha_fundacion, id_lugar) VALUES
('Museo de Arte de Vancouvert','Fomentar el arte de la costa oeste de Canada','1931','1'),
('Museo de Arte de Montreal','Preservar y compartir arte de todas las epocas','04-23-1860','1'),
('Museo de la Ciudad de México','Narrar la historia de la ciudad','10-31-1964','2'),
('Museo De Arte Contemporáneo De Monterrey','Promover el arte contemporáneo','06-28-1991','2'),
('Jiangsu Art Museum','Exhibir arte contemporáneo chino','1936','3'),
('Museo de Guangdong','Difundir la cultura y arte de Guangdong','1959','3'),
('Museo Nacional de Australia','Explorar la historia australiana'.'03-11-2001','4'),
('Galería Nacional de Victoria','Ser un epicentro de la creatividad y la innovación artística','1861','4');


