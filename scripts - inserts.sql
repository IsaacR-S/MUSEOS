INSERT INTO lugar (nombre_lugar, tipo, id_jerarquia) VALUES
('canada','pais', NULL)
('mexico', 'pais', NULL)
('china', 'pais', NULL)
('australia','pais', NULL)
('vancouver','ciudad','1')
('montreal','ciudad','1')
('ciudad de mexico','ciudad','2')
('monterrey','ciudad','2')
('nanjing','ciudad','3')
('guangzhou','ciudad','3')
('canberra','ciudad','4')
('melbourne','ciudad','4')

INSERT INTO museo (nombre, mision, fecha_fundacion, id_lugar) VALUES
('Museo de Arte de Vancouvert','Fomentar el arte de la costa oeste de Canada','1931','1')
('Museo de Arte de Montreal','Preservar y compartir arte de todas las epocas','04-23-1860','1')
('Museo de la Ciudad de México','Narrar la historia de la ciudad','10-31-1964','2')
('Museo De Arte Contemporáneo De Monterrey','Promover el arte contemporáneo','06-28-1991','2')
('Jiangsu Art Museum','Exhibir arte contemporáneo chino','1936','3')
('Museo de Guangdong','Difundir la cultura y arte de Guangdong','1959','3')
('Museo Nacional de Australia','Explorar la historia australiana'.'03-11-2001','4')
('Galería Nacional de Victoria','Ser un epicentro de la creatividad y la innovación artística','1861','4')


