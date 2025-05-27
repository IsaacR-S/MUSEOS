------------------------------------------------------------------ISAAC---------------------------------------------------------

INSERT INTO lugar (id_lugar, nombre_lugar, tipo, id_jerarquia) VALUES
('canada', 'pais', NULL),
('mexico', 'pais', NULL),
('china', 'pais', NULL),
('australia', 'pais', NULL),
('vancouver', 'ciudad', 1),
('montreal', 'ciudad', 1),
('ciudad de mexico', 'ciudad', 2),
('monterrey', 'ciudad', 2),
('nanjing', 'ciudad', 3),
('guangzhou', 'ciudad', 3),
('canberra', 'ciudad', 4),
('melbourne', 'ciudad', 4);

INSERT INTO obra (id_obra, nombre_obra, fecha_periodo, tipo_obra, dimensiones, estilo_descripcion, descripcion_materiales_tecnicas) VALUES
('david', '1501-1503 renacimiento', 'escultura', '517cm', 'clasico renacentista con anatomía idealizada', 'marmol de carrara y talla directa'),
('el pensador', '1880-1904 modernismo', 'escultura', '70cm x 58cm x 40cm', 'expresivo y realista', 'bronce, fundicion'),
('venus de milo', '130-100 a.c helenismo', 'escultura', '211cm', 'clasico griego con proporciones armoniosas', 'marmol, talla directa'),
('discobolo', '455 a.c grecia', 'escultura', '155cm', 'clasico con enfasis en el moviminto', 'marmol, talla directa'),
('monalisa', '1503-1519', 'pintura', '77cm x 53cm', 'retrato renacentista con sfumato', 'oleo sobre tabla de alamo'),
('las meninas', '1656 barroco', 'pintura', '318cm x 276xcm', 'retrato cortesano con perspectica compleja', 'oleao sobre lienzo'),
('la pertenecia de la memoria', '1931 surrealismo', 'pintura', '24cm x 33cm', 'surrealista con elementos oniricos', 'oleo sobre lienzo'),
('el grito', '1893 expresionismo', 'pintura', '91cm x 73cm', 'expresionista con colores vibrantes', 'oleo, temple y pastel sobre carton'),
('guernica', '1937 cubismo', 'pintura', '349cm x 776cm', 'cubista con mensajes politicos', 'oleo sobre lienzo');

INSERT INTO artista (id_artista, nombre_artista, apellido_artista, fecha_nacimiento, apodo_artista, fecha_muerte, descripcion_estilo_tecnicas) VALUES
('michelangelo', 'buonarroti', '1475-03-06', 'miguel angel', '1564-02-18', 'renacimiento, escultura, pintura, arquitectura'),
('françois auguste rene', 'rodin', '1840-11-12', 'auguste rodin', '1917-11-17', 'escultura moderna, simbolismo'),
(NULL, NULL, NULL, 'alejandro de antioquia', NULL, 'escultura helenística'),
(NULL, NULL, NULL, 'miron de eleuteras', NULL, 'escultura clásica, bronce'),
('leonardo', 'di ser piero da vinci', '1452-04-15', NULL, '1519-05-02', 'renacimiento, pintura, ingeniería, anatomía'),
('diego', 'rodrigo de silva y velazques', '1599-06-06', 'diego velazquez', '1660-08-06', 'barroco, pintura'),
('salvador', 'domingo felipe jacinto dali i domenech', '1904-05-11', 'salvador dali', '1989-01-23', 'surrealismo,pintura,escultura'),
('edvard', 'munch', '1863-12-12', NULL, '1944-01-23', 'expresionismo, simbolismo'),
('pablo', 'ruiz', '1881-10-25', 'pablo picasso', '1973-04-08', 'cubismo, surrealismo, pintura, escultura');

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
('Museo de Arte de Vancouvert', 'Fomentar el arte de la costa oeste de Canada', '1931-01-01', 5),
('Museo de Arte de Montreal', 'Preservar y compartir arte de todas las epocas', '1860-04-23', 6),
('Museo de la Ciudad de México', 'Narrar la historia de la ciudad', '1964-10-31', 7),
('Museo De Arte Contemporáneo De Monterrey', 'Promover el arte contemporáneo', '1991-06-28', 8),
('Jiangsu Art Museum', 'Exhibir arte contemporáneo chino', '1936-01-01', 9),
('Museo de Guangdong', 'Difundir la cultura y arte de Guangdong', '1959-01-01', 10),
('Museo Nacional de Australia', 'Explorar la historia australiana', '2001-03-11', 11),
('Galería Nacional de Victoria', 'Ser un epicentro de la creatividad y la innovación artística', '1861-01-01', 12);
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

INSERT INTO IDIOMA (id_idioma, nombre) VALUES
('Chino Mandarín'),
('Español'),
('Inglés'),
('Hindi'),
('Árabe'),
('Bengalí'),
('Portugués'),
('Ruso'),
('Japonés'),
('Lahnda (Punjabi)'),
('Javanés'),
('Alemán'),
('Coreano'),
('Francés'),
('Telugu'),
('Marathi'),
('Turco'),
('Tamil'),
('Urdu'),
('Vietnamita');

INSERT INTO EMPLEADO_PROFESIONAL (id_empleado_prof, primer_nombre, primer_apellido, segundo_nombre, segundo_apellido, fecha_nacimiento, doc_identidad, dato_contacto) VALUES
('Amby', 'Vasnev', 'Ethelin', 'Mannix', '7/26/1965', 37199014, 'emannix0@cdc.gov'),
('Phillida', 'Millward', 'Anissa', 'Boggas', '4/25/1988', 98720528, 'aboggas1@last.fm'),
('Audra', 'Anders', 'Howey', 'Dauby', '3/27/1992', 3577167, 'hdauby2@uiuc.edu'),
('Marcy', 'Lotte', 'Izzy', 'Upcott', '8/26/1965', 62756151, 'iupcott3@ted.com'),
('Kriste', 'Dowd', 'Valentina', 'Antonucci', '8/17/1986', 84191792, 'vantonucci4@creativecommons.org'),
('Illa', 'Maddy', 'Clim', 'Jilliss', '4/13/2003', 76188238, 'cjilliss5@cpanel.net'),
('Deny', 'Wandrack', 'Karlee', 'Tutill', '10/8/1977', 11723682, 'ktutill6@nasa.gov'),
('Alanson', 'Khosa', 'Ferne', 'Wolvey', '2/21/2003', 70089698, 'fwolvey7@bigcartel.com'),
('Antony', 'Kelwaybamber', 'Cassandra', 'Kempster', '11/4/1990', 14461178, 'ckempster8@bbc.co.uk'),
('Ame', 'Weatherall', 'Juanita', 'Tinman', '2/1/1967', 46210895, 'jtinman9@fastcompany.com'),
('Samaria', 'Ouldcott', 'Orville', 'Haw', '11/25/1972', 80969176, 'ohawa@seesaa.net'),
('Lonnie', 'Staniforth', 'Melisa', 'Kumar', '11/25/1973', 75595309, 'mkumarb@comcast.net'),
('Wadsworth', 'Brannigan', 'Sammie', 'Balasin', '2/27/1977', 24585802, 'sbalasinc@marketwatch.com'),
('Chere', 'Sorbie', 'Rozalin', 'McCahill', '11/15/1980', 16540658, 'rmccahilld@netvibes.com'),
('Binky', 'Sedman', 'Erny', 'Duffie', '1/31/1971', 25003704, 'eduffiee@gov.uk'),
('Luella', 'Dugmore', 'Audrye', 'Vescovini', '2/20/1971', 35887091, 'avescovinif@ow.ly'),
('Amalita', 'Sandyford', 'Vladamir', 'MacGray', '7/3/1985', 33916912, 'vmacgrayg@webnode.com'),
('Francklyn', 'Posthill', 'Carol', 'Roylance', '5/23/1981', 39481127, 'croylanceh@issuu.com'),
('Ephrayim', 'Loins', 'Gottfried', 'Perren', '12/25/1972', 68820889, 'gperreni@github.io'),
('Oliy', 'Leander', 'Ursulina', 'Langelay', '5/7/1986', 31800030, 'ulangelayj@tripadvisor.com'),
('Ingra', 'Snaddon', 'Cam', 'Raywood', '5/26/1978', 9485591, 'craywoodk@sourceforge.net'),
('Alecia', 'Kingcott', 'Karleen', 'Chatelot', '5/11/1994', 56219159, 'kchatelotl@4shared.com'),
('Connor', 'Fyfield', 'Kipp', 'Lurcock', '6/18/1986', 73216351, 'klurcockm@github.io'),
('Laney', 'Emanuelov', 'Chanda', 'McAllan', '10/12/1987', 61107397, 'cmcallann@dion.ne.jp'),
('Trevor', 'Iglesias', 'Sophia', 'Wadham', '6/30/2000', 4318989, 'swadhamo@uiuc.edu'),
('Inger', 'Laite', 'Rawley', 'Kempshall', '11/26/1964', 62349446, 'rkempshallp@who.int'),
('Daisi', 'Newborn', 'Tate', 'Dewer', '8/29/1996', 83959955, 'tdewerq@state.gov'),
('Marcille', 'Haborn', 'Tanya', 'Polley', '12/5/1984', 64120783, 'tpolleyr@yelp.com'),
('Dolf', 'Sandal', 'Ddene', 'Este', '9/20/1965', 36553430, 'destes@latimes.com'),
('Kaylyn', 'Blader', 'Dolf', 'Mulcock', '4/1/1965', 76810772, 'dmulcockt@photobucket.com'),
('Pooh', 'Parkey', 'Parry', 'Bikker', '4/22/1974', 9110987, 'pbikkeru@theglobeandmail.com'),
('Riane', 'Dodson', 'Mikey', 'Pace', '9/29/1990', 54248052, 'mpacev@mit.edu'),
('Harwell', 'Grigore', 'Allix', 'Couche', '8/2/1989', 67729855, 'acouchew@delicious.com'),
('Concettina', 'Deschlein', 'Alonzo', 'Ixer', '7/15/1983', 86901830, 'aixerx@php.net'),
('Olga', 'Dumphries', 'Elianora', 'Caris', '8/6/1972', 69560630, 'ecarisy@prnewswire.com'),
('Mindy', 'Pratten', 'Noach', 'Bairnsfather', '6/17/1992', 87951313, 'nbairnsfatherz@booking.com'),
('Edd', 'Anten', 'Zachariah', 'Snelle', '11/10/1979', 13958779, 'zsnelle10@ibm.com'),
('Oralee', 'Szabo', 'Joela', 'Top', '7/4/1985', 39712868, 'jtop11@lycos.com'),
('Ive', 'Sultan', 'Margalo', 'Late', '8/6/1968', 68001922, 'mlate12@chron.com'),
('Agosto', 'Shevlane', 'Vida', 'Selkirk', '6/9/1969', 86983568, 'vselkirk13@ucoz.ru'),
('Zerk', 'Perassi', 'Blanch', 'Creed', '7/30/1976', 99920354, 'bcreed14@wikipedia.org'),
('Joni', 'Habron', 'Netta', 'Baldry', '3/26/1979', 73689447, 'nbaldry15@un.org'),
('Cybill', 'Rimour', 'Janette', 'Monroe', '7/9/1992', 95766817, 'jmonroe16@archive.org'),
('Nicky', 'Kenen', 'Klement', 'O''Geneay', '8/19/1973', 94199855, 'kogeneay17@webmd.com'),
('Imelda', 'Gillard', 'Aleen', 'Mantrup', '12/12/1971', 19023592, 'amantrup18@posterous.com'),
('Margarita', 'Fishbourn', 'Lorena', 'Looney', '8/24/2001', 8057751, 'llooney19@state.tx.us'),
('Raymund', 'McLarty', 'Burgess', 'Reubel', '12/5/1983', 92672845, 'breubel1a@blogs.com'),
('Geno', 'McOnie', 'Dre', 'Jeandeau', '12/7/1996', 98416475, 'djeandeau1b@moonfruit.com'),
('Giovanna', 'Featherby', 'Jorgan', 'Philliskirk', '7/24/1971', 1588698, 'jphilliskirk1c@buzzfeed.com'),
('Gard', 'Scandred', 'Eliza', 'Towey', '2/13/1974', 87309340, 'etowey1d@bloglovin.com'),
('Phyllida', 'Biasioli', 'Rog', 'Cordel', '11/6/1994', 27435442, 'rcordel1e@imgur.com'),
('Sean', 'Aleksandrikin', 'Merrilee', 'Kochl', '7/27/1984', 14399168, 'mkochl1f@cbc.ca'),
('Sena', 'Tallon', 'Ashlie', 'Hedaux', '1/23/1980', 92188237, 'ahedaux1g@sfgate.com'),
('Haze', 'Haley', 'Patti', 'Newvill', '1/7/1976', 60924864, 'pnewvill1h@businessinsider.com'),
('Patin', 'Poznanski', 'Ashton', 'Ogan', '8/20/1990', 80438553, 'aogan1i@chicagotribune.com'),
('Sydney', 'Houlston', 'Cortie', 'Gofford', '4/7/1969', 34071060, 'cgofford1j@msn.com'),
('Pamelina', 'Ivashov', 'Gayle', 'Harbison', '10/14/1966', 64090908, 'gharbison1k@ca.gov'),
('Renault', 'Wildblood', 'Rozamond', 'Phin', '6/21/1999', 86487467, 'rphin1l@imageshack.us'),
('Cointon', 'Tommasuzzi', 'Aubrie', 'Beckett', '12/2/1988', 57368415, 'abeckett1m@usnews.com'),
('Menard', 'Degoe', 'Martynne', 'Redrup', '11/3/1975', 73630413, 'mredrup1n@google.co.uk'),
('Theresa', 'Ellison', 'Bryana', 'Pawel', '1/13/2002', 82852819, 'bpawel1o@imgur.com'),
('Urban', 'Shire', 'Ladonna', 'Sharer', '2/3/1966', 6032421, 'lsharer1p@mozilla.org'),
('Adrianne', 'Newland', 'Shirlene', 'Dart', '4/1/1987', 39355796, 'sdart1q@hp.com'),
('Early', 'Wackly', 'Mariellen', 'Cobello', '3/4/2005', 11970919, 'mcobello1r@shop-pro.jp'),
('Megan', 'MacCurley', 'Nev', 'Friday', '8/21/1993', 79991413, 'nfriday1s@bbc.co.uk'),
('Hana', 'Todarini', 'Philippa', 'Craufurd', '5/5/1993', 41040935, 'pcraufurd1t@friendfeed.com'),
('Rodrigo', 'Kenwyn', 'Lodovico', 'Cornelis', '2/3/1974', 29573757, 'lcornelis1u@nymag.com'),
('Trevor', 'Terbrug', 'Rebecka', 'Clampett', '6/30/1973', 30463135, 'rclampett1v@washingtonpost.com'),
('Kelsy', 'Geerdts', 'Raquela', 'Strutz', '2/26/1998', 14065028, 'rstrutz1w@chronoengine.com'),
('Tanner', 'Carsberg', 'Fonsie', 'Bruhnke', '1/24/1983', 75932398, 'fbruhnke1x@bloglines.com'),
('Charlotte', 'Alasdair', 'Jackqueline', 'Kelbie', '3/25/1968', 10756490, 'jkelbie1y@bandcamp.com'),
('Levin', 'Feragh', 'Bearnard', 'Wooff', '7/18/1983', 69904701, 'bwooff1z@facebook.com'),
('Wynn', 'Jean', 'Cassandra', 'Boutwell', '9/30/1967', 71620106, 'cboutwell20@macromedia.com'),
('Tonya', 'Gully', 'Erastus', 'Philpot', '6/7/1996', 14017075, 'ephilpot21@cnn.com'),
('Scott', 'Dinnage', 'Spenser', 'Trundle', '7/3/1964', 70042173, 'strundle22@icq.com'),
('Myrta', 'Benediktsson', 'Thacher', 'Demange', '8/3/2004', 10732182, 'tdemange23@bbb.org'),
('Mariellen', 'Gerrard', 'Janaye', 'Gilyatt', '6/26/2001', 83494777, 'jgilyatt24@about.me'),
('Gearard', 'Goodding', 'Nara', 'Stronack', '9/19/1973', 83728547, 'nstronack25@nytimes.com'),
('Case', 'Chesterfield', 'Wileen', 'Rodolf', '7/1/1987', 73883122, 'wrodolf26@loc.gov'),
('Webster', 'Coutthart', 'Perla', 'Wakes', '8/3/1982', 2840559, 'pwakes27@webeden.co.uk'),
('Leah', 'Yelyashev', 'Rhea', 'Mortel', '7/7/1975', 84133153, 'rmortel28@hexun.com'),
('Jamey', 'Shawley', 'Mozelle', 'Corradeschi', '3/18/1987', 87040195, 'mcorradeschi29@cbslocal.com'),
('Torie', 'Barcroft', 'Jeannine', 'Tanton', '12/7/1975', 88042923, 'jtanton2a@ifeng.com'),
('Babette', 'Tylor', 'Kandace', 'Letherbury', '5/10/1985', 54959418, 'kletherbury2b@istockphoto.com'),
('Sidnee', 'Hawtin', 'Candra', 'Van Brug', '11/22/1994', 73371005, 'cvanbrug2c@amazon.co.jp'),
('Anica', 'Watsam', 'Valentin', 'Slyde', '3/6/1985', 22335186, 'vslyde2d@skype.com'),
('Elroy', 'Booij', 'Lucille', 'McMackin', '2/28/1992', 26560145, 'lmcmackin2e@seesaa.net'),
('Erna', 'Coulthard', 'Rutter', 'Rabbitts', '7/20/1990', 33462118, 'rrabbitts2f@stumbleupon.com'),
('Lamar', 'Coult', 'Magdalene', 'Heine', '3/14/1971', 23593509, 'mheine2g@buzzfeed.com'),
('Gayla', 'Dailly', 'Cornall', 'Brisset', '3/4/1986', 79368846, 'cbrisset2h@sbwire.com'),
('Putnem', 'Cornforth', 'Agnese', 'Comiam', '3/4/1988', 97934565, 'acomiam2i@sakura.ne.jp'),
('Lynette', 'Pengilly', 'Johnnie', 'Munkley', '6/25/1995', 39277718, 'jmunkley2j@weather.com'),
('Harriet', 'Voisey', 'Mathilde', 'Colston', '9/1/1979', 98499867, 'mcolston2k@nyu.edu'),
('Elroy', 'Mauger', 'Abba', 'Nestoruk', '8/20/1977', 66392294, 'anestoruk2l@gnu.org'),
('Quill', 'Eastmond', 'Reube', 'Chantrell', '11/12/1995', 30244655, 'rchantrell2m@goo.gl'),
('Skyler', 'Fetherstonhaugh', 'Noam', 'Womack', '6/9/1966', 40847902, 'nwomack2n@un.org'),
('Shaine', 'Comley', 'Prinz', 'Van Haeften', '1/16/1999', 5100504, 'pvanhaeften2o@unicef.org'),
('Berti', 'Checklin', 'Leland', 'Frostdicke', '6/1/1983', 15978800, 'lfrostdicke2p@exblog.jp'),
('Ruttger', 'Wolpert', 'Paige', 'Jeynes', '7/19/1998', 87503451, 'pjeynes2q@so-net.ne.jp'),
('Hamel', 'Seeney', 'Fredek', 'Buske', '9/2/1990', 13541151, 'fbuske2r@patch.com'),
('Kelvin', 'Pieche', 'Esteban', 'Corden', '11/17/1986', 97862915, 'ecorden2s@skyrock.com'),
('May', 'Pyzer', 'Theodore', 'Danher', '7/15/1972', 43393188, 'tdanher2t@yolasite.com'),
('Karie', 'Maymand', 'Viola', 'Ivy', '10/17/1988', 75295006, 'vivy2u@bluehost.com'),
('See', 'Wintersgill', 'Fredericka', 'Zanetto', '12/21/1979', 20393814, 'fzanetto2v@hud.gov'),
('Casie', 'Toppin', 'Gizela', 'Cromb', '11/11/1975', 38009356, 'gcromb2w@arstechnica.com'),
('Ines', 'Tivers', 'Lock', 'O''Donnelly', '7/31/1977', 13774010, 'lodonnelly2x@icio.us'),
('Eddie', 'Brian', 'Rollo', 'Berney', '8/24/1981', 43162133, 'rberney2y@businessinsider.com'),
('Ryley', 'Barmadier', 'Morton', 'Antushev', '4/8/1986', 4847718, 'mantushev2z@bravesites.com'),
('Bronny', 'Logue', 'Rafaelita', 'Flag', '11/13/2000', 48349335, 'rflag30@europa.eu'),
('Layne', 'Meese', 'Eugen', 'Breward', '10/19/1972', 48574848, 'ebreward31@springer.com'),
('Susan', 'Worwood', 'Katerine', 'Simony', '1/1/1974', 21756369, 'ksimony32@vk.com'),
('Anson', 'Rosone', 'Hube', 'Spykings', '12/18/2000', 40994312, 'hspykings33@gizmodo.com'),
('Adora', 'Gerbi', 'Duffy', 'McMenamy', '7/17/1964', 20930410, 'dmcmenamy34@mozilla.org'),
('Danny', 'Scandwright', 'Deedee', 'Saunderson', '1/21/1971', 40469472, 'dsaunderson35@alibaba.com'),
('Ethyl', 'Havesides', 'Skippie', 'Ellingworth', '9/12/1982', 30187072, 'sellingworth36@shutterfly.com'),
('Berkeley', 'Siddle', 'Lorne', 'Fosberry', '2/11/1982', 92386958, 'lfosberry37@businessinsider.com'),
('Valentine', 'Priditt', 'Augustine', 'Chesters', '11/26/1966', 20769162, 'achesters38@webeden.co.uk'),
('Grover', 'Whelpton', 'Zedekiah', 'Bonanno', '6/11/2002', 65464708, 'zbonanno39@bigcartel.com'),
('Ola', 'Dinzey', 'Chrysler', 'Pigdon', '7/17/2001', 2163110, 'cpigdon3a@fda.gov'),
('Reggy', 'MacGaughy', 'Wallache', 'Ottam', '4/13/2004', 69593875, 'wottam3b@wsj.com'),
('Bernardo', 'Crusham', 'Lonna', 'Fawssett', '9/19/2002', 26438734, 'lfawssett3c@jimdo.com'),
('Alberta', 'Swinden', 'Brear', 'Lanfranconi', '4/16/2003', 26650659, 'blanfranconi3d@ucoz.ru'),
('Braden', 'Cheese', 'Monty', 'Pountain', '2/4/1980', 13177378, 'mpountain3e@admin.ch'),
('Davide', 'Wildsmith', 'Xylia', 'Stokoe', '1/3/1992', 93010574, 'xstokoe3f@epa.gov'),
('Bendite', 'Nasey', 'Janean', 'Horry', '5/14/1967', 26099952, 'jhorry3g@reference.com'),
('Keslie', 'Yokley', 'Nomi', 'Biaggiotti', '12/17/1976', 56420426, 'nbiaggiotti3h@forbes.com'),
('Thatch', 'Diboll', 'Eran', 'Keaves', '8/11/2003', 28499733, 'ekeaves3i@blogs.com'),
('Wilton', 'Baum', 'Rudie', 'Trevorrow', '8/14/1995', 74234661, 'rtrevorrow3j@drupal.org'),
('Bennie', 'Luetchford', 'Harlene', 'Patrie', '11/11/1992', 79569943, 'hpatrie3k@hud.gov'),
('Worthy', 'Obal', 'Shepherd', 'Pemberton', '4/28/1981', 91689680, 'spemberton3l@bloomberg.com'),
('Torr', 'Bentame', 'Blinny', 'Hender', '1/23/2000', 79847252, 'bhender3m@nature.com'),
('Maegan', 'Littlemore', 'Rickie', 'L''Episcopio', '2/13/1980', 74071679, 'rlepiscopio3n@github.io'),
('Elihu', 'Gurys', 'Doroteya', 'Stemp', '12/12/2003', 67329231, 'dstemp3o@google.co.jp'),
('Rana', 'Ashleigh', 'Lucas', 'Comber', '4/24/1969', 1804441, 'lcomber3p@weather.com'),
('Sarene', 'Pealing', 'Joachim', 'Thundercliffe', '2/27/2004', 31413758, 'jthundercliffe3q@jiathis.com'),
('Corrinne', 'Watkins', 'Meagan', 'Frowen', '12/3/1971', 92787151, 'mfrowen3r@prnewswire.com'),
('Glenine', 'Astle', 'Nollie', 'Enders', '7/11/1977', 57299985, 'nenders3s@wix.com'),
('Bertha', 'Mallam', 'Flinn', 'Chappell', '6/29/1980', 92275842, 'fchappell3t@microsoft.com'),
('Stewart', 'Steadman', 'Kenyon', 'Rampley', '2/23/2001', 96570502, 'krampley3u@nba.com'),
('Lucas', 'Robertet', 'Noell', 'Vasyutin', '3/31/2005', 6903042, 'nvasyutin3v@princeton.edu'),
('Emyle', 'Melsom', 'Johnathan', 'Tythacott', '9/13/1991', 38176865, 'jtythacott3w@uol.com.br'),
('Haskell', 'Penwarden', 'Shirleen', 'Jasiak', '8/22/1998', 70834184, 'sjasiak3x@zimbio.com'),
('Alaster', 'Weippert', 'Ephrem', 'Temprell', '10/20/1977', 9067699, 'etemprell3y@epa.gov'),
('Austin', 'MacVanamy', 'Homere', 'Cherry', '5/27/1968', 98183048, 'hcherry3z@cpanel.net'),
('Anatola', 'Baskerfield', 'Kingston', 'Haville', '1/14/1989', 20200442, 'khaville40@posterous.com'),
('Bear', 'Kristof', 'Kalvin', 'Kirkham', '5/30/1982', 87441231, 'kkirkham41@miitbeian.gov.cn'),
('Tudor', 'Hallex', 'Ody', 'Abrahami', '4/11/1966', 55047468, 'oabrahami42@simplemachines.org'),
('Milena', 'Padilla', 'Theodosia', 'Spadollini', '8/1/1997', 22527711, 'tspadollini43@nps.gov'),
('Eugene', 'Cowl', 'Carlo', 'Reeve', '9/15/1980', 60726574, 'creeve44@booking.com'),
('Kakalina', 'Eastup', 'Robinette', 'Peirson', '3/19/1985', 96013233, 'rpeirson45@europa.eu'),
('Sarajane', 'Seton', 'Laureen', 'Paolicchi', '10/19/2004', 57606503, 'lpaolicchi46@usa.gov'),
('Rube', 'Giddins', 'Gertie', 'Moberley', '6/22/1984', 89414948, 'gmoberley47@mediafire.com'),
('Rodd', 'Luddy', 'Cordy', 'Luxmoore', '1/21/1999', 31023335, 'cluxmoore48@meetup.com'),
('Dalt', 'Gateman', 'Tatiana', 'Perse', '6/30/1982', 14195540, 'tperse49@gov.uk'),
('Brandyn', 'Burde', 'Marcellina', 'Tattershaw', '8/31/2003', 4500411, 'mtattershaw4a@sbwire.com'),
('Mollie', 'Pilfold', 'Devora', 'Wayon', '5/2/1994', 68515666, 'dwayon4b@twitpic.com'),
('Dane', 'Vernazza', 'Ortensia', 'Berrisford', '2/10/1984', 34143310, 'oberrisford4c@google.co.jp'),
('Bastien', 'Hencke', 'Lexine', 'Arondel', '5/19/1979', 47248101, 'larondel4d@ebay.co.uk'),
('Peta', 'Rittmeyer', 'Wernher', 'Dibdall', '6/11/1973', 26565035, 'wdibdall4e@t.co'),
('Elwyn', 'Klosterman', 'Corrianne', 'Housegoe', '5/31/1969', 66099096, 'chousegoe4f@timesonline.co.uk');

insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 141);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 14);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 75);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 78);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 157);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 5);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (19, 30);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (11, 99);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 20);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 96);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 99);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (17, 54);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 33);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (19, 143);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 124);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 100);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (9, 103);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 149);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 29);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (12, 107);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 98);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 44);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 139);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 97);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (10, 110);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 62);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 138);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 50);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (17, 3);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (19, 129);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (11, 13);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 124);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (7, 80);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (15, 66);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 113);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 129);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (11, 44);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 60);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 140);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (4, 137);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 77);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 28);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 117);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 14);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 146);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 109);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 130);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 118);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 82);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 10);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 85);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 30);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 23);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 12);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 14);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 83);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 21);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (12, 80);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 25);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 88);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 91);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 97);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 51);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 70);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 26);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 153);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 91);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (7, 8);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (11, 38);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 112);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (10, 106);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 47);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (19, 27);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (12, 12);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (9, 93);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 89);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 84);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 109);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 79);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 107);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (12, 44);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (19, 38);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (11, 82);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 150);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (4, 82);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 24);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (17, 103);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 158);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 145);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 134);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (4, 12);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 68);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 96);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (11, 41);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (17, 70);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (11, 151);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (4, 84);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 157);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 48);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (9, 105);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (7, 159);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 95);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 42);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 119);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 85);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 108);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 14);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 23);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (12, 75);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (10, 21);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (19, 3);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 130);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (15, 139);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 92);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (4, 51);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (17, 94);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (15, 125);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 100);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (15, 34);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 11);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 74);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 142);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (12, 26);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 125);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 3);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 100);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (17, 132);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 78);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 153);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 147);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 147);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 85);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (10, 25);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (7, 71);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 12);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (10, 131);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (9, 26);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 116);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 112);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 81);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (9, 13);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (4, 44);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (7, 3);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 30);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 53);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 150);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 26);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 67);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (10, 76);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 20);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 141);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 62);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 35);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 28);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (4, 141);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 154);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 7);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (4, 77);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 110);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (9, 152);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 146);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 133);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (4, 36);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 89);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (9, 120);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 138);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 158);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 7);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (15, 43);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (7, 103);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 80);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (17, 15);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (10, 59);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 150);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (10, 38);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (7, 90);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 138);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 144);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 1);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 132);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (17, 156);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (12, 74);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 74);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (15, 94);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 90);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 1);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 61);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 158);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 83);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (15, 149);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 85);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (7, 27);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 15);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 24);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 61);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 77);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 113);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (15, 13);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 63);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 136);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (19, 51);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 75);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (7, 53);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (17, 157);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (19, 96);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 32);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 53);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 48);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 159);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (4, 140);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 35);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 131);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (9, 76);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 92);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 26);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (17, 114);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 67);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 132);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (10, 121);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 41);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (19, 125);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (11, 68);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (19, 135);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 10);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 49);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 81);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 69);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (10, 15);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (10, 133);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 136);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (4, 110);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 159);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 106);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 78);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (7, 36);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (15, 143);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 16);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (17, 151);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 11);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (4, 134);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 77);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 102);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (11, 6);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (9, 3);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 128);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 105);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (17, 9);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 65);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 140);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 44);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (12, 121);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (9, 122);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 75);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 43);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 126);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (10, 56);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 64);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 31);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (15, 144);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 45);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 73);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (12, 76);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (11, 121);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 12);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 2);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 122);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (12, 130);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 70);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 74);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (6, 73);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (9, 111);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 93);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 130);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (14, 115);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 149);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 27);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (19, 121);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 22);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 112);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (7, 2);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 60);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 33);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (12, 155);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 128);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (1, 29);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 156);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 53);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (19, 86);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 87);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (12, 112);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 139);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (7, 51);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (7, 29);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 19);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 62);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (17, 48);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 109);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (7, 73);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 143);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 61);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (8, 48);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 137);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 150);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (9, 133);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (16, 54);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 22);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (13, 146);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 77);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (17, 2);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (10, 138);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (3, 153);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (12, 149);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (18, 14);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (10, 42);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (5, 39);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (20, 136);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (11, 140);
insert into EMP_IDI (id_idioma, id_empleado_prof) values (2, 7);

insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Mira', 'Folder', 51174186, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Auberta', 'Fuchs', 26953561, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Linc', 'Kennet', 1179298, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Farleigh', 'Claydon', 54780476, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Aubrie', 'Dearth', 88501895, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Pascale', 'Ferschke', 62468660, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Tansy', 'Vernay', 83107391, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Edik', 'Hopewell', 3718806, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Alyse', 'Bannerman', 71772853, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Donica', 'McGlew', 20744975, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Nara', 'Point', 76042964, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Duke', 'Sapwell', 23213194, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Nike', 'Fedynski', 45663684, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Rudyard', 'Butson', 67886612, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Sigfried', 'Manneville', 60756094, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Adolf', 'Pautot', 18379753, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Travers', 'Motto', 9123269, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Marley', 'Jeandin', 57427347, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Alastair', 'Rubinfajn', 59739477, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Nan', 'Attarge', 60146158, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Ola', 'Skoyles', 10676993, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Karmen', 'Piddock', 87772909, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Sonni', 'Daleman', 77434190, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Shandeigh', 'Bone', 27240577, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Karalee', 'Vyvyan', 54961264, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Augustine', 'Savell', 80828674, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Kiley', 'Zimmer', 15288606, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Zita', 'Corwood', 22974337, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Gran', 'Bullan', 84710816, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Pail', 'Odd', 33865961, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Sabine', 'Venediktov', 2643931, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (id_empleado_mantenimiento_vigilancia, primer_nombre, primer_apellido, doc_identidad, tipo) values ('Darrick', 'Sommerville', 64394613, 'mantenimiento');

insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2007-02-19 09:15:00', 1);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2005-02-08 10:30:00', 2);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2012-01-23 11:45:00', 3);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2005-08-27 08:20:00', 4);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2010-09-17 13:10:00', 5);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2020-10-23 14:25:00', 6);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '1999-05-18 09:50:00', 7);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2016-08-07 12:40:00', 8);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2012-01-24 10:15:00', 1);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '1999-08-29 08:30:00', 2);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2009-02-21 13:20:00', 3);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2021-03-24 11:10:00', 4);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2009-09-30 14:45:00', 5);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2016-03-31 09:25:00', 6);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '1999-03-22 10:50:00', 7);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2019-12-27 12:15:00', 8);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2007-12-23 08:40:00', 1);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2000-09-24 13:30:00', 2);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2022-06-13 11:55:00', 3);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2025-03-16 14:10:00', 4);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2004-07-28 09:35:00', 5);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2002-05-06 10:00:00', 6);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2007-07-15 12:25:00', 7);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2008-04-19 13:50:00', 8);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2012-08-24 08:15:00', 1);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2012-01-16 10:40:00', 2);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2017-08-09 14:05:00', 3);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '1999-09-09 11:30:00', 4);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2024-01-13 09:55:00', 5);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2014-06-21 12:20:00', 6);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2013-11-03 13:45:00', 7);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2017-07-25 08:10:00', 8);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2015-08-14 10:35:00', 1);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2023-04-18 14:00:00', 2);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2019-03-18 11:25:00', 3);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2003-09-30 09:50:00', 4);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2024-11-17 12:15:00', 5);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2020-08-27 13:40:00', 6);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2022-09-22 08:05:00', 7);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2019-05-07 10:30:00', 8);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2009-08-18 14:55:00', 1);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2003-04-16 11:20:00', 2);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2003-01-20 09:45:00', 3);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2009-02-13 12:10:00', 4);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2011-08-14 13:35:00', 5);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2016-04-14 08:00:00', 6);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2011-04-19 10:25:00', 7);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2014-10-26 14:50:00', 8);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2004-02-03 11:15:00', 1);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2003-12-09 09:40:00', 2);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2005-06-06 12:05:00', 3);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2011-02-10 13:30:00', 4);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2011-08-15 08:55:00', 5);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2019-03-17 10:20:00', 6);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2024-03-12 14:45:00', 7);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2003-03-07 11:10:00', 8);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2008-06-16 09:35:00', 1);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '1999-01-11 12:00:00', 2);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '1999-03-03 13:25:00', 3);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2002-12-11 08:50:00', 4);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2003-09-01 10:15:00', 5);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2015-06-17 14:40:00', 6);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2021-03-05 11:05:00', 7);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2000-05-17 09:30:00', 8);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2001-08-09 12:55:00', 1);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2017-03-12 13:20:00', 2);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2012-06-13 08:45:00', 3);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2014-03-06 10:10:00', 4);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2011-01-17 14:35:00', 5);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (7, 'tercera edad', '2023-04-26 11:00:00', 6);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (15, 'adulto', '2012-03-03 09:25:00', 7);
insert into TICKET (precio, tipo_ticket, fecha_hora_ticket, id_museo) values (0, 'niño', '2020-02-10 12:50:00', 8);
