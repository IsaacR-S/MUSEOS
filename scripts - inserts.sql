------------------------------------------------------------------ISAAC---------------------------------------------------------

INSERT INTO lugar (nombre_lugar, tipo, id_jerarquia) VALUES
('canada', 'pais', NULL),
('mexico', 'pais', NULL),
('china', 'pais', NULL),
('australia', 'pais', NULL);

INSERT INTO lugar (nombre_lugar, tipo, id_jerarquia) VALUES
('vancouver', 'ciudad', 1),
('montreal', 'ciudad', 1),
('ciudad de mexico', 'ciudad', 2),
('monterrey', 'ciudad', 2),
('nanjing', 'ciudad', 3),
('guangzhou', 'ciudad', 3),
('canberra', 'ciudad', 4),
('melbourne', 'ciudad', 4);

INSERT INTO obra (nombre_obra, fecha_periodo, tipo_obra, dimensiones, estilo_descripcion, descripcion_materiales_tecnicas) VALUES
('david', '1501-1503 renacimiento', 'escultura', '517cm', 'clasico renacentista con anatomía idealizada', 'marmol de carrara y talla directa'),
('el pensador', '1880-1904 modernismo', 'escultura', '70cm x 58cm x 40cm', 'expresivo y realista', 'bronce, fundicion'),
('venus de milo', '130-100 a.c helenismo', 'escultura', '211cm', 'clasico griego con proporciones armoniosas', 'marmol, talla directa'),
('discobolo', '455 a.c grecia', 'escultura', '155cm', 'clasico con enfasis en el moviminto', 'marmol, talla directa'),
('monalisa', '1503-1519', 'pintura', '77cm x 53cm', 'retrato renacentista con sfumato', 'oleo sobre tabla de alamo'),
('las meninas', '1656 barroco', 'pintura', '318cm x 276xcm', 'retrato cortesano con perspectica compleja', 'oleao sobre lienzo'),
('la pertenecia de la memoria', '1931 surrealismo', 'pintura', '24cm x 33cm', 'surrealista con elementos oniricos', 'oleo sobre lienzo'),
('el grito', '1893 expresionismo', 'pintura', '91cm x 73cm', 'expresionista con colores vibrantes', 'oleo, temple y pastel sobre carton'),
('guernica', '1937 cubismo', 'pintura', '349cm x 776cm', 'cubista con mensajes politicos', 'oleo sobre lienzo');

INSERT INTO artista (nombre_artista, apellido_artista, fecha_nacimiento, apodo_artista, fecha_muerte, descripcion_estilo_tecnicas) VALUES
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

INSERT INTO museo (nombre, mision, fecha_fundacion, id_lugar) VALUES
('Museo de Arte de Vancouvert', 'Fomentar el arte de la costa oeste de Canada', '1931-01-01', 5),
('Museo de Arte de Montreal', 'Preservar y compartir arte de todas las epocas', '1860-04-23', 6),
('Museo de la Ciudad de México', 'Narrar la historia de la ciudad', '1964-10-31', 7),
('Museo De Arte Contemporáneo De Monterrey', 'Promover el arte contemporáneo', '1991-06-28', 8),
('Jiangsu Art Museum', 'Exhibir arte contemporáneo chino', '1936-01-01', 9),
('Museo de Guangdong', 'Difundir la cultura y arte de Guangdong', '1959-01-01', 10),
('Museo Nacional de Australia', 'Explorar la historia australiana', '2001-03-11', 11),
('Galería Nacional de Victoria', 'Ser un epicentro de la creatividad y la innovación artística', '1861-01-01', 12);


INSERT INTO HORARIO (id_museo, dia, hora_apertura, hora_cierre) VALUES
(1,1,'09:00','18:00'),
(1,2,'09:00','18:00'),
(1,3,'09:00','18:00'),
(1,4,'09:00','18:00'),
(1,5,'09:00','20:00'),
(1,6,'10:00','20:00'),
(1,7,'10:00','18:00');





-----------------------------------------------------JAC------------------------------------------------------------

INSERT INTO IDIOMA (nombre) VALUES
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

INSERT INTO EMPLEADO_PROFESIONAL (primer_nombre, primer_apellido, segundo_nombre, segundo_apellido, fecha_nacimiento, doc_identidad, dato_contacto) VALUES
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

insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Mira', 'Folder', 51174186, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Auberta', 'Fuchs', 26953561, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Linc', 'Kennet', 1179298, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Farleigh', 'Claydon', 54780476, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Aubrie', 'Dearth', 88501895, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Pascale', 'Ferschke', 62468660, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Tansy', 'Vernay', 83107391, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Edik', 'Hopewell', 3718806, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Alyse', 'Bannerman', 71772853, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Donica', 'McGlew', 20744975, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Nara', 'Point', 76042964, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Duke', 'Sapwell', 23213194, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Nike', 'Fedynski', 45663684, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Rudyard', 'Butson', 67886612, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Sigfried', 'Manneville', 60756094, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Adolf', 'Pautot', 18379753, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Travers', 'Motto', 9123269, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Marley', 'Jeandin', 57427347, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Alastair', 'Rubinfajn', 59739477, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Nan', 'Attarge', 60146158, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Ola', 'Skoyles', 10676993, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Karmen', 'Piddock', 87772909, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Sonni', 'Daleman', 77434190, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Shandeigh', 'Bone', 27240577, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Karalee', 'Vyvyan', 54961264, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Augustine', 'Savell', 80828674, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Kiley', 'Zimmer', 15288606, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Zita', 'Corwood', 22974337, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Gran', 'Bullan', 84710816, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Pail', 'Odd', 33865961, 'vigilancia');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Sabine', 'Venediktov', 2643931, 'mantenimiento');
insert into EMPLEADO_MANTENIMIENTO_VIGILANCIA (nombre_empleado_mv, apellido_empleado_mv, doc_identidad, tipo) values ('Darrick', 'Sommerville', 64394613, 'mantenimiento');

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


insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (1, 'Conservación de Obras de Arte', '12/12/2020', 'Especialización en técnicas de conservación y restauración de pinturas al óleo en museos de arte clásico');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (2, 'Gestión de Colecciones Museísticas', '11/02/2013', 'Catalogación y gestión digital de colecciones en museos de historia natural');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (3, 'Curaduría de Arte Contemporáneo', '11/08/2016', 'Desarrollo de exposiciones temporales y gestión de artistas emergentes para museos de arte moderno');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (4, 'Museografía Interactiva', '02/09/2019', 'Diseño de experiencias interactivas y tecnología aplicada a exposiciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (5, 'Arqueología Museística', '05/04/2015', 'Conservación y exhibición de artefactos arqueológicos en museos nacionales');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (6, 'Educación en Museos', '08/22/2013', 'Desarrollo de programas educativos para públicos escolares en museos de ciencia');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (7, 'Restauración de Esculturas', '12/29/2013', 'Técnicas avanzadas de restauración de esculturas en mármol y bronce para museos de bellas artes');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (8, 'Diseño de Exposiciones', '09/14/2013', 'Planificación y diseño de espacios expositivos para museos de arte e historia');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (9, 'Conservación Preventiva', '03/08/2016', 'Control de condiciones ambientales para la preservación de colecciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (10, 'Documentación de Arte', '01/16/2022', 'Catalogación y documentación de obras de arte para archivos museísticos digitales');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (11, 'Gestión de Museos Comunitarios', '05/17/2020', 'Desarrollo de estrategias para la participación comunitaria en museos locales');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (12, 'Paleontología Museística', '04/12/2012', 'Preparación y exhibición de fósiles para museos de historia natural');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (13, 'Iluminación en Espacios Museísticos', '08/18/2018', 'Diseño de sistemas de iluminación para la exhibición de obras de arte');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (14, 'Conservación de Textiles Históricos', '05/31/2017', 'Técnicas de preservación y restauración de textiles en museos de indumentaria');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (15, 'Digitalización de Colecciones', '11/15/2023', 'Técnicas de fotografía y escaneo 3D para la digitalización de patrimonio museístico');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (16, 'Gestión de Riesgos en Museos', '02/15/2020', 'Planificación de protocolos de emergencia para la protección de colecciones');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (17, 'Curaduría de Fotografía', '05/25/2020', 'Selección y organización de exposiciones fotográficas para museos especializados');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (18, 'Interpretación del Patrimonio', '06/24/2024', 'Desarrollo de contenidos narrativos para exposiciones en museos históricos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (19, 'Restauración de Cerámica Arqueológica', '03/03/2023', 'Técnicas de reconstrucción y conservación de cerámica precolombina');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (20, 'Diseño de Museos Virtuales', '12/21/2020', 'Creación de experiencias museísticas en entornos digitales y realidad aumentada');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (21, 'Gestión de Préstamos Museísticos', '10/17/2021', 'Coordinación de préstamos internacionales de obras de arte entre instituciones');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (22, 'Conservación de Papel y Grabados', '09/28/2021', 'Técnicas de preservación de obras gráficas y documentos históricos en papel');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (23, 'Museología Crítica', '02/05/2010', 'Estudio de teorías contemporáneas sobre la función social de los museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (24, 'Exhibiciones Itinerantes', '09/07/2017', 'Logística y planificación de exposiciones itinerantes para museos regionales');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (25, 'Restauración de Mobiliario Histórico', '12/22/2010', 'Conservación y restauración de muebles antiguos para museos de artes decorativas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (26, 'Gestión de Públicos en Museos', '11/06/2015', 'Estrategias para la diversificación y fidelización de audiencias museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (27, 'Curaduría de Arte Digital', '12/03/2013', 'Selección y exhibición de obras de arte generativo y nuevas tecnologías');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (28, 'Conservación de Metales', '10/16/2011', 'Técnicas para prevenir la corrosión en objetos metálicos de colecciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (29, 'Diseño de Museos para Niños', '08/05/2012', 'Creación de espacios interactivos y educativos para museos infantiles');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (30, 'Gestión de Fondos Museísticos', '03/03/2016', 'Administración de recursos económicos y financieros para instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (31, 'Restauración de Pintura Mural', '08/19/2017', 'Técnicas especializadas para la conservación de murales en museos al aire libre');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (32, 'Realidad Virtual en Museos', '02/08/2021', 'Desarrollo de experiencias inmersivas para la interpretación del patrimonio');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (33, 'Curaduría de Arte Precolombino', '06/11/2010', 'Estudio y exhibición de colecciones de arte indígena americano');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (34, 'Conservación de Materiales Orgánicos', '07/22/2010', 'Técnicas para la preservación de objetos en madera, cuero y fibras naturales');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (35, 'Diseño de Señalética Museística', '12/18/2018', 'Creación de sistemas de orientación y comunicación visual para museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (36, 'Gestión de Voluntariado Cultural', '07/31/2014', 'Coordinación de programas de voluntariado en instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (37, 'Restauración de Vidrieras Históricas', '08/14/2024', 'Técnicas de conservación de vitrales para museos y edificios patrimoniales');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (38, 'Curaduría de Arte Africano', '12/19/2018', 'Estudio y exhibición de colecciones de arte tradicional africano');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (39, 'Conservación de Fotografía Antigua', '05/30/2016', 'Técnicas para la preservación de daguerrotipos y primeros procesos fotográficos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (40, 'Museos y Accesibilidad', '09/17/2018', 'Diseño de programas y espacios inclusivos para públicos con discapacidad');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (41, 'Gestión de Exposiciones Temporales', '05/29/2020', 'Planificación y ejecución de muestras temporales en museos de arte');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (42, 'Restauración de Instrumentos Musicales', '05/08/2013', 'Conservación de instrumentos históricos para museos de música');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (43, 'Curaduría de Arte Asiático', '04/09/2011', 'Estudio y exhibición de colecciones de arte oriental en museos especializados');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (44, 'Diseño de Almacenes Museísticos', '02/20/2024', 'Planificación de espacios de reserva para colecciones no exhibidas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (45, 'Conservación de Materiales Contemporáneos', '09/01/2021', 'Desafíos en la preservación de obras con materiales no tradicionales');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (46, 'Gestión de Patrocinios Culturales', '09/15/2014', 'Desarrollo de alianzas con empresas para financiamiento de proyectos museísticos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (47, 'Restauración de Pergaminos', '11/11/2024', 'Técnicas especializadas para la conservación de documentos medievales');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (48, 'Curaduría de Arte Latinoamericano', '05/02/2016', 'Estudio y puesta en valor de colecciones de arte latinoamericano');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (49, 'Museos y Redes Sociales', '06/11/2014', 'Estrategias de comunicación digital para la promoción de museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (50, 'Conservación de Arte Rupestre', '07/11/2011', 'Técnicas de documentación y preservación de pinturas rupestres in situ');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (51, 'Gestión de Colecciones Museísticas', '06/04/2019', 'Especialización en catalogación, conservación y gestión de colecciones en instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (52, 'Museografía y Diseño de Exposiciones', '03/19/2010', 'Diseño y planificación de espacios expositivos y montaje de exhibiciones museográficas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (53, 'Conservación Preventiva en Museos', '04/10/2019', 'Técnicas de conservación preventiva para bienes culturales en entornos museísticos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (54, 'Educación y Mediación Cultural en Museos', '02/17/2018', 'Desarrollo de programas educativos y estrategias de mediación cultural para públicos diversos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (55, 'Administración de Instituciones Museísticas', '01/07/2011', 'Gestión administrativa y financiera de museos y centros culturales');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (56, 'Documentación de Bienes Culturales', '10/20/2022', 'Sistemas de registro y documentación de colecciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (57, 'Curaduría de Arte Contemporáneo', '07/29/2016', 'Investigación y desarrollo de proyectos curatoriales para arte contemporáneo');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (58, 'Museología Digital', '10/01/2022', 'Aplicación de tecnologías digitales en la gestión y difusión de colecciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (59, 'Patrimonio Cultural y Museos', '03/17/2022', 'Gestión del patrimonio cultural en el contexto de instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (60, 'Seguridad en Museos', '07/05/2015', 'Protocolos de seguridad y prevención de riesgos para bienes culturales en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (61, 'Diseño de Iluminación para Espacios Museísticos', '08/12/2024', 'Técnicas de iluminación para la exhibición y conservación de obras en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (62, 'Gestión de Públicos en Museos', '10/07/2018', 'Estrategias para el estudio y desarrollo de públicos en instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (63, 'Restauración de Bienes Muebles', '10/08/2015', 'Técnicas de restauración aplicadas a bienes culturales en colecciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (64, 'Comunicación y Marketing para Museos', '06/13/2019', 'Estrategias de comunicación y marketing para instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (65, 'Gestión de Proyectos Culturales en Museos', '01/02/2016', 'Planificación y ejecución de proyectos culturales en el ámbito museístico');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (66, 'Conservación de Materiales Arqueológicos', '08/07/2024', 'Técnicas especializadas en conservación de materiales arqueológicos para museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (67, 'Derecho y Legislación para Museos', '10/19/2010', 'Marco legal y normativa aplicable a la gestión de instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (68, 'Interpretación del Patrimonio en Museos', '07/03/2018', 'Estrategias de interpretación del patrimonio cultural para exposiciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (69, 'Gestión de Riesgos en Colecciones Museísticas', '06/27/2023', 'Identificación y gestión de riesgos para la preservación de colecciones');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (70, 'Museos y Tecnologías Interactivas', '11/10/2015', 'Implementación de tecnologías interactivas en experiencias museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (71, 'Catalogación de Obras de Arte', '01/26/2014', 'Sistemas y metodologías para la catalogación de obras artísticas en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (72, 'Diseño de Espacios Educativos en Museos', '05/31/2013', 'Planificación y diseño de áreas educativas dentro de instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (73, 'Gestión de Exposiciones Itinerantes', '10/22/2016', 'Organización y coordinación de exposiciones itinerantes entre instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (74, 'Conservación de Pintura de Caballete', '05/29/2019', 'Técnicas especializadas en conservación y restauración de pintura en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (75, 'Museos y Accesibilidad Universal', '01/30/2022', 'Diseño de programas y espacios accesibles en instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (76, 'Gestión de Depósitos Museísticos', '06/03/2010', 'Organización y administración de áreas de reserva y depósitos en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (77, 'Curaduría de Arte Precolombino', '03/11/2019', 'Especialización en investigación y exposición de arte precolombino en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (78, 'Museos y Comunidades Locales', '11/29/2013', 'Estrategias de vinculación entre museos y comunidades locales');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (79, 'Conservación de Fotografía Histórica', '11/25/2021', 'Técnicas de conservación y preservación de colecciones fotográficas en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (80, 'Gestión de Calidad en Museos', '03/12/2015', 'Implementación de sistemas de calidad en la gestión museística');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (81, 'Museos y Redes Sociales', '01/28/2017', 'Estrategias de comunicación digital y redes sociales para museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (82, 'Diseño de Señalética Museográfica', '07/11/2017', 'Planificación y diseño de sistemas de señalética para espacios museísticos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (83, 'Gestión de Préstamos Internacionales', '01/07/2014', 'Coordinación y logística de préstamos internacionales entre instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (84, 'Conservación de Textiles Históricos', '01/31/2014', 'Técnicas especializadas en conservación de colecciones textiles en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (85, 'Museos y Turismo Cultural', '01/16/2017', 'Estrategias para la vinculación entre museos y el turismo cultural');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (86, 'Diseño de Experiencias Inmersivas', '08/25/2012', 'Creación de experiencias inmersivas y multimedia para exposiciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (87, 'Gestión de Colecciones Científicas', '10/18/2023', 'Administración y conservación de colecciones científicas en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (88, 'Museología Crítica', '03/19/2021', 'Enfoques teóricos y críticos contemporáneos sobre la museología');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (89, 'Conservación de Metales Arqueológicos', '08/05/2020', 'Técnicas especializadas en conservación de objetos metálicos en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (90, 'Museos y Realidad Aumentada', '10/01/2019', 'Aplicación de realidad aumentada en experiencias museísticas y exposiciones');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (91, 'Gestión de Archivos Museísticos', '08/02/2011', 'Organización y administración de archivos históricos en instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (92, 'Diseño de Catálogos de Exposiciones', '09/05/2018', 'Planificación y diseño de publicaciones y catálogos para exposiciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (93, 'Museos y Educación No Formal', '05/17/2019', 'Desarrollo de programas educativos no formales en contextos museísticos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (94, 'Conservación de Cerámica Arqueológica', '10/20/2023', 'Técnicas especializadas en conservación de cerámica histórica en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (95, 'Museos y Políticas Culturales', '01/18/2024', 'Análisis del rol de los museos en el marco de las políticas culturales');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (96, 'Gestión de Espacios Públicos en Museos', '07/21/2021', 'Administración y programación de espacios públicos dentro de museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (97, 'Curaduría de Arte Moderno', '11/06/2018', 'Investigación y desarrollo de proyectos expositivos sobre arte moderno');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (98, 'Museos y Sostenibilidad', '04/08/2023', 'Estrategias de sostenibilidad ambiental y económica para instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (99, 'Conservación de Documentos Históricos', '02/21/2020', 'Técnicas de preservación y conservación de fondos documentales en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (100, 'Museos Virtuales y Digitalización', '12/01/2021', 'Creación y gestión de museos virtuales y procesos de digitalización de colecciones');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (100, 'Digitalización de Colecciones Museísticas', '12/01/2021', 'Técnicas y procesos para la digitalización de acervos en instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (101, 'Gestión de Exposiciones Temporales', '03/10/2021', 'Planificación y coordinación de exposiciones temporales en museos e instituciones culturales');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (102, 'Conservación de Esculturas en Museos', '03/28/2015', 'Técnicas especializadas en conservación y restauración de esculturas en colecciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (103, 'Museos y Educación Inclusiva', '04/15/2011', 'Diseño de programas educativos inclusivos para diversos públicos en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (104, 'Gestión de Riesgos en Museos', '05/19/2019', 'Identificación y prevención de riesgos para colecciones en entornos museísticos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (105, 'Curaduría de Arte Digital', '06/24/2019', 'Investigación y exposición de obras de arte digital en contextos museísticos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (106, 'Museología Participativa', '10/14/2019', 'Enfoques participativos y comunitarios en la gestión y programación de museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (107, 'Conservación de Materiales Contemporáneos', '01/17/2010', 'Técnicas de conservación para obras de arte con materiales no tradicionales');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (108, 'Gestión de Fondos Museísticos', '01/20/2018', 'Administración y control de fondos económicos en instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (109, 'Diseño de Itinerarios Museográficos', '09/21/2011', 'Planificación de recorridos y narrativas expositivas en espacios museísticos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (110, 'Museos y Realidad Virtual', '04/08/2013', 'Aplicación de tecnologías de realidad virtual en experiencias museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (111, 'Catalogación de Arte Moderno', '04/23/2015', 'Sistemas y metodologías para la catalogación de obras de arte moderno');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (112, 'Gestión de Voluntariado en Museos', '09/13/2022', 'Coordinación y formación de programas de voluntariado en instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (113, 'Conservación Preventiva de Pintura', '09/26/2023', 'Protocolos de conservación preventiva aplicados a colecciones pictóricas en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (114, 'Museos y Comunidades Indígenas', '02/14/2013', 'Estrategias de colaboración entre museos y comunidades indígenas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (115, 'Diseño de Almacenes Museísticos', '12/16/2015', 'Planificación y organización de espacios de almacenamiento para colecciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (116, 'Gestión de Derechos de Autor en Museos', '10/09/2013', 'Aspectos legales sobre derechos de autor y reproducción de obras en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (117, 'Conservación de Fotografía Contemporánea', '04/30/2024', 'Técnicas especializadas en conservación de obras fotográficas contemporáneas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (118, 'Museos y Neuroeducación', '12/05/2019', 'Aplicación de principios de neuroeducación en experiencias museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (119, 'Gestión de Espacios Multifuncionales', '03/09/2020', 'Administración de espacios multifuncionales en instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (120, 'Curaduría de Arte Sonoro', '07/20/2019', 'Investigación y exposición de obras de arte sonoro en contextos museísticos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (121, 'Museos y Economía Creativa', '03/25/2016', 'Modelos de economía creativa aplicados a la gestión museística');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (122, 'Conservación de Arte Efímero', '06/30/2014', 'Técnicas de documentación y conservación de obras de arte efímero en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (123, 'Gestión de Colecciones Etnográficas', '09/23/2018', 'Administración y conservación de colecciones etnográficas en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (124, 'Museos y Perspectiva de Género', '05/31/2012', 'Enfoques de género en la interpretación y gestión de colecciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (125, 'Diseño de Experiencias Táctiles', '03/28/2017', 'Creación de experiencias táctiles y multisensoriales en exposiciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (126, 'Gestión de Proyectos Internacionales', '02/24/2016', 'Coordinación de proyectos de cooperación internacional entre instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (127, 'Conservación de Arte Contemporáneo', '05/29/2021', 'Técnicas especializadas en conservación de obras de arte contemporáneo');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (128, 'Museos y Cambio Climático', '10/28/2012', 'Estrategias de sostenibilidad y concienciación ambiental en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (129, 'Gestión de Archivos Fotográficos', '02/08/2010', 'Organización y conservación de archivos fotográficos en instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (130, 'Curaduría de Arte Latinoamericano', '09/16/2013', 'Investigación y exposición de arte latinoamericano en contextos museísticos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (131, 'Museos y Tecnologías Emergentes', '01/07/2012', 'Implementación de tecnologías emergentes en experiencias museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (132, 'Conservación de Arte en Papel', '01/08/2012', 'Técnicas especializadas en conservación de obras sobre papel en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (133, 'Gestión de Audiencias Digitales', '04/25/2022', 'Estrategias para el desarrollo y fidelización de audiencias digitales en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (134, 'Museos y Arte Público', '03/29/2020', 'Gestión de proyectos de arte público vinculados a instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (135, 'Diseño de Aplicaciones Museísticas', '01/18/2018', 'Desarrollo de aplicaciones móviles para la mediación cultural en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (136, 'Conservación de Arte Cinético', '10/31/2023', 'Técnicas especializadas en conservación de obras de arte cinético');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (137, 'Gestión de Espacios Expositivos', '02/23/2012', 'Planificación y administración de espacios expositivos en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (138, 'Museos y Memoria Histórica', '03/27/2020', 'Gestión de colecciones y narrativas sobre memoria histórica en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (139, 'Curaduría de Arte Asiático', '03/20/2024', 'Investigación y exposición de arte asiático en contextos museísticos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (140, 'Conservación de Arte Conceptual', '01/21/2022', 'Técnicas de documentación y conservación de obras de arte conceptual');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (141, 'Gestión de Colecciones Científico-Técnicas', '05/24/2021', 'Administración de colecciones científico-técnicas en museos especializados');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (142, 'Museos y Gamificación', '07/20/2022', 'Aplicación de estrategias de gamificación en experiencias museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (143, 'Diseño de Exposiciones Itinerantes', '01/18/2023', 'Planificación y montaje de exposiciones diseñadas para itinerancia');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (144, 'Conservación de Arte Digital', '10/09/2015', 'Protocolos de preservación y conservación de obras de arte digital');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (145, 'Gestión de Programas Públicos', '05/12/2012', 'Coordinación de programas públicos y actividades culturales en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (146, 'Museos y Arte Relacional', '07/14/2015', 'Gestión de proyectos de arte relacional en contextos museísticos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (147, 'Curaduría de Arte Africano', '09/08/2014', 'Investigación y exposición de arte africano en contextos museísticos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (148, 'Conservación de Arte Textil Contemporáneo', '02/06/2024', 'Técnicas especializadas en conservación de obras textiles contemporáneas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (149, 'Gestión de Colecciones de Historia Natural', '11/27/2015', 'Administración de colecciones de historia natural en museos científicos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (150, 'Museos y Arte de Nuevos Medios', '05/22/2024', 'Exhibición y conservación de obras de nuevos medios en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (151, 'Diseño de Espacios Sensoriales', '04/05/2022', 'Creación de espacios expositivos sensoriales para públicos diversos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (152, 'Gestión de Colecciones de Diseño', '03/07/2020', 'Administración y conservación de colecciones de diseño en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (153, 'Conservación de Arte Callejero', '03/12/2012', 'Técnicas de documentación y conservación de arte urbano para museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (154, 'Museos y Arte Participativo', '02/27/2014', 'Gestión de proyectos de arte participativo en instituciones museísticas');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (155, 'Curaduría de Arte Oceánico', '09/05/2023', 'Investigación y exposición de arte oceánico en contextos museísticos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (156, 'Gestión de Colecciones de Moda', '02/14/2012', 'Administración y conservación de colecciones de indumentaria y moda');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (157, 'Museos y Arte Biotecnológico', '09/19/2010', 'Exhibición y conservación de obras que incorporan elementos biotecnológicos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (158, 'Conservación de Arte Sonoro', '07/10/2017', 'Técnicas de preservación y documentación de obras de arte sonoro');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (159, 'Gestión de Colecciones de Cine', '07/09/2013', 'Administración de colecciones cinematográficas y audiovisuales en museos');
insert into FORMACION_PROFESIONAL (id_empleado_prof, nombre_titulo, ano, descripcion_especialidad) values (160, 'Museos y Arte de Inteligencia Artificial', '01/31/2021', 'Exhibición y conservación de obras creadas con inteligencia artificial');


INSERT INTO estructura_organizacional (id_museo, nombre, nivel, tipo, id_jerarquia_estructura, id_jerarquia_museo) VALUES
(1, 'Dirección General del Museo de Arte Moderno', 'Nivel 1', 'direccion', NULL, NULL),
(2, 'Dirección General del Museo Nacional de Bellas Artes', 'Nivel 1', 'direccion', NULL, NULL),
(3, 'Dirección de la Galería de Arte Contemporáneo', 'Nivel 1', 'direccion', NULL, NULL),
(4, 'Dirección Ejecutiva del Centro de Arte Digital', 'Nivel 1', 'direccion', NULL, NULL),
(5, 'Dirección del Museo de Arte Clásico', 'Nivel 1', 'direccion', NULL, NULL),
(6, 'Dirección General del Museo de Arte Latinoamericano', 'Nivel 1', 'direccion', NULL, NULL),
(7, 'Dirección del Museo de Arte Abstracto', 'Nivel 1', 'direccion', NULL, NULL),
(8, 'Dirección del Museo de Arte Oriental', 'Nivel 1', 'direccion', NULL, NULL);


INSERT INTO estructura_organizacional (id_museo, nombre, nivel, tipo, id_jerarquia_estructura, id_jerarquia_museo)
SELECT
    departamento_data.id_museo,
    departamento_data.nombre_departamento,
    'Nivel 2',
    'departamento',
    direccion.id_estructura_org, -- Aquí obtenemos el id_estructura_org real de la dirección
    direccion.id_museo
FROM (VALUES
    (1, 'Departamento de Curaduría', 'Dirección General del Museo de Arte Moderno'),
    (1, 'Departamento de Educación y Programas', 'Dirección General del Museo de Arte Moderno'),
    (1, 'Departamento de Conservación y Restauración', 'Dirección General del Museo de Arte Moderno'),
    (2, 'Departamento de Colecciones', 'Dirección General del Museo Nacional de Bellas Artes'),
    (2, 'Departamento de Investigación y Publicaciones', 'Dirección General del Museo Nacional de Bellas Artes'),
    (2, 'Departamento de Marketing y Comunicación', 'Dirección General del Museo Nacional de Bellas Artes'),
    (3, 'Departamento de Exposiciones', 'Dirección de la Galería de Arte Contemporáneo'),
    (3, 'Departamento de Desarrollo y Patrocinios', 'Dirección de la Galería de Arte Contemporáneo'),
    (4, 'Departamento de Innovación Tecnológica', 'Dirección Ejecutiva del Centro de Arte Digital'),
    (4, 'Departamento de Experiencias Interactivas', 'Dirección Ejecutiva del Centro de Arte Digital'),
    (5, 'Departamento de Antigüedades', 'Dirección del Museo de Arte Clásico'),
    (5, 'Departamento de Arte Romano', 'Dirección del Museo de Arte Clásico'),
    (6, 'Departamento de Arte Moderno Latinoamericano', 'Dirección General del Museo de Arte Latinoamericano'),
    (6, 'Departamento de Arte Colonial', 'Dirección General del Museo de Arte Latinoamericano'),
    (6, 'Departamento de Programas Comunitarios', 'Dirección General del Museo de Arte Latinoamericano'),
    (7, 'Departamento de Geometría Abstracta', 'Dirección del Museo de Arte Abstracto'),
    (7, 'Departamento de Expresionismo Abstracto', 'Dirección del Museo de Arte Abstracto'),
    (8, 'Departamento de Arte Japonés', 'Dirección del Museo de Arte Oriental'),
    (8, 'Departamento de Arte Chino', 'Dirección del Museo de Arte Oriental')
) AS departamento_data(id_museo, nombre_departamento, nombre_direccion_padre)
JOIN estructura_organizacional AS direccion ON departamento_data.id_museo = direccion.id_museo
                                          AND departamento_data.nombre_direccion_padre = direccion.nombre
                                          AND direccion.tipo = 'direccion';

INSERT INTO estructura_organizacional (id_museo, nombre, nivel, tipo, id_jerarquia_estructura, id_jerarquia_museo)
SELECT
    sub_data.id_museo,
    sub_data.nombre_sub_unit,
    'Nivel 3',
    sub_data.tipo_sub_unit,
    departamento.id_estructura_org, -- Aquí obtenemos el id_estructura_org real del departamento
    departamento.id_museo
FROM (VALUES
    (1, 'Sección de Arte Contemporáneo', 'seccion', 'Departamento de Curaduría'),
    (1, 'Subdepartamento de Talleres Infantiles', 'subdepartamento', 'Departamento de Educación y Programas'),
    (2, 'Sección de Pintura Europea', 'seccion', 'Departamento de Colecciones'),
    (2, 'Subdepartamento de Biblioteca y Archivo', 'subdepartamento', 'Departamento de Investigación y Publicaciones'),
    (3, 'Sección de Nuevos Medios', 'seccion', 'Departamento de Exposiciones'),
    (3, 'Subdepartamento de Eventos Especiales', 'subdepartamento', 'Departamento de Desarrollo y Patrocinios'),
    (4, 'Sección de Realidad Virtual', 'seccion', 'Departamento de Innovación Tecnológica'),
    (4, 'Subdepartamento de Diseño de Interfaces', 'subdepartamento', 'Departamento de Experiencias Interactivas'),
    (5, 'Sección de Escultura Griega', 'seccion', 'Departamento de Antigüedades'),
    (5, 'Subdepartamento de Numismática', 'subdepartamento', 'Departamento de Antigüedades'),
    (6, 'Sección de Muralismo', 'seccion', 'Departamento de Arte Moderno Latinoamericano'),
    (6, 'Subdepartamento de Proyectos Educativos Rurales', 'subdepartamento', 'Departamento de Programas Comunitarios'),
    (7, 'Sección de Arte Minimalista', 'seccion', 'Departamento de Geometría Abstracta'),
    (7, 'Subdepartamento de Arte Óptico', 'subdepartamento', 'Departamento de Geometría Abstracta'),
    (8, 'Sección de Cerámica y Porcelana', 'seccion', 'Departamento de Arte Japonés'),
    (8, 'Subdepartamento de Caligrafía y Pintura', 'subdepartamento', 'Departamento de Arte Chino')
) AS sub_data(id_museo, nombre_sub_unit, tipo_sub_unit, nombre_departamento_padre)
JOIN estructura_organizacional AS departamento ON sub_data.id_museo = departamento.id_museo
                                              AND sub_data.nombre_departamento_padre = departamento.nombre
                                              AND departamento.tipo = 'departamento';



INSERT INTO estructura_organizacional (id_museo, nombre, nivel, tipo, id_jerarquia_estructura, id_jerarquia_museo)
SELECT
    subseccion_data.id_museo,
    subseccion_data.nombre_subseccion,
    'Nivel 4',
    'subseccion',
    padre.id_estructura_org, -- Aquí obtenemos el id_estructura_org real de la sección/subdepartamento padre
    padre.id_museo
FROM (VALUES
    (1, 'Subsección de Exposiciones Itinerantes', 'Sección de Arte Contemporáneo'),
    (2, 'Subsección de Manuscritos Antiguos', 'Subdepartamento de Biblioteca y Archivo'),
    (3, 'Subsección de Proyectos Digitales', 'Sección de Nuevos Medios'),
    (4, 'Subsección de Desarrollo de Contenido VR', 'Sección de Realidad Virtual'),
    (5, 'Subsección de Cerámica Clásica', 'Sección de Escultura Griega'),
    (6, 'Subsección de Arte Indígena Contemporáneo', 'Sección de Muralismo'),
    (7, 'Subsección de Instalaciones Luminosas', 'Sección de Arte Minimalista'),
    (8, 'Subsección de Textiles Antiguos', 'Sección de Cerámica y Porcelana')
) AS subseccion_data(id_museo, nombre_subseccion, nombre_padre_nivel3)
JOIN estructura_organizacional AS padre ON subseccion_data.id_museo = padre.id_museo
                                       AND subseccion_data.nombre_padre_nivel3 = padre.nombre
                                       AND (padre.tipo = 'seccion' OR padre.tipo = 'subdepartamento');

SELECT CURRENT_DATE AS fecha_actual;


SELECT CURRENT_DATE - INTERVAL '1 month' AS fecha_hace_un_mes;



INSERT INTO historico_empleado (id_empleado, id_museo, id_estructura_org, fecha_inicio, rol_empleado, fecha_fin) VALUES
(1, 1, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 1 AND tipo = 'direccion' LIMIT 1), '2023-01-15', 'director', NULL), 
(2, 1, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 1 AND nombre LIKE 'Departamento de Curaduría%' LIMIT 1), '2023-03-01', 'curador', NULL),
(3, 1, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 1 AND nombre LIKE 'Departamento de Educación%' LIMIT 1), '2023-05-10', 'administrativo', NULL),
(4, 1, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 1 AND nombre LIKE 'Departamento de Conservación%' LIMIT 1), '2022-02-20', 'restaurador', '2024-02-28'); 



INSERT INTO historico_empleado (id_empleado, id_museo, id_estructura_org, fecha_inicio, rol_empleado, fecha_fin) VALUES
(5, 2, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 2 AND tipo = 'direccion' LIMIT 1), '2023-02-01', 'director', NULL),
(6, 2, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 2 AND nombre LIKE 'Departamento de Colecciones%' LIMIT 1), '2023-04-10', 'curador', NULL),
(7, 2, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 2 AND nombre LIKE 'Departamento de Marketing%' LIMIT 1), '2023-06-20', 'administrativo', NULL),
(8, 2, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 2 AND nombre LIKE 'Departamento de Investigación%' LIMIT 1), '2022-03-05', 'curador', '2023-04-15');



INSERT INTO historico_empleado (id_empleado, id_museo, id_estructura_org, fecha_inicio, rol_empleado, fecha_fin) VALUES
(9, 3, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 3 AND tipo = 'direccion' LIMIT 1), '2023-03-10', 'director', NULL),
(10, 3, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 3 AND nombre LIKE 'Departamento de Exposiciones%' LIMIT 1), '2023-05-01', 'curador', NULL),
(11, 3, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 3 AND nombre LIKE 'Departamento de Desarrollo%' LIMIT 1), '2023-07-01', 'administrativo', NULL),
(12, 3, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 3 AND nombre LIKE 'Sección de Nuevos Medios%' LIMIT 1), '2022-04-15', 'curador', '2023-07-30');



INSERT INTO historico_empleado (id_empleado, id_museo, id_estructura_org, fecha_inicio, rol_empleado, fecha_fin) VALUES
(13, 4, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 4 AND tipo = 'direccion' LIMIT 1), '2023-04-01', 'director', NULL),
(14, 4, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 4 AND nombre LIKE 'Departamento de Innovación%' LIMIT 1), '2023-06-05', 'curador', NULL),
(15, 4, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 4 AND nombre LIKE 'Departamento de Experiencias%' LIMIT 1), '2023-08-15', 'administrativo', NULL),
(16, 4, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 4 AND nombre LIKE 'Sección de Realidad Virtual%' LIMIT 1), '2022-05-20', 'curador', '2023-06-30');



INSERT INTO historico_empleado (id_empleado, id_museo, id_estructura_org, fecha_inicio, rol_empleado, fecha_fin) VALUES
(17, 5, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 5 AND tipo = 'direccion' LIMIT 1), '2023-05-01', 'director', NULL),
(18, 5, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 5 AND nombre LIKE 'Departamento de Antigüedades%' LIMIT 1), '2023-07-10', 'restaurador', NULL),
(19, 5, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 5 AND nombre LIKE 'Departamento de Arte Romano%' LIMIT 1), '2023-09-01', 'administrativo', NULL),
(20, 5, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 5 AND nombre LIKE 'Sección de Escultura Griega%' LIMIT 1), '2022-06-01', 'curador', '2023-09-15');



INSERT INTO historico_empleado (id_empleado, id_museo, id_estructura_org, fecha_inicio, rol_empleado, fecha_fin) VALUES
(21, 6, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 6 AND tipo = 'direccion' LIMIT 1), '2023-06-01', 'director', NULL),
(22, 6, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 6 AND nombre LIKE 'Departamento de Arte Moderno Latinoamericano%' LIMIT 1), '2023-08-05', 'curador', NULL),
(23, 6, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 6 AND nombre LIKE 'Departamento de Programas Comunitarios%' LIMIT 1), '2023-10-10', 'administrativo', NULL),
(24, 6, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 6 AND nombre LIKE 'Departamento de Arte Colonial%' LIMIT 1), '2022-07-20', 'curador', '2023-12-31');


INSERT INTO historico_empleado (id_empleado, id_museo, id_estructura_org, fecha_inicio, rol_empleado, fecha_fin) VALUES
(25, 7, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 7 AND tipo = 'direccion' LIMIT 1), '2023-07-01', 'director', NULL),
(26, 7, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 7 AND nombre LIKE 'Departamento de Geometría Abstracta%' LIMIT 1), '2023-09-01', 'curador', NULL),
(27, 7, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 7 AND nombre LIKE 'Departamento de Expresionismo Abstracto%' LIMIT 1), '2023-11-05', 'administrativo', NULL),
(28, 7, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 7 AND nombre LIKE 'Sección de Arte Minimalista%' LIMIT 1), '2022-08-10', 'curador', '2023-11-25');



INSERT INTO historico_empleado (id_empleado, id_museo, id_estructura_org, fecha_inicio, rol_empleado, fecha_fin) VALUES
(29, 8, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 8 AND tipo = 'direccion' LIMIT 1), '2023-08-01', 'director', NULL),
(30, 8, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 8 AND nombre LIKE 'Departamento de Arte Japonés%' LIMIT 1), '2023-10-15', 'restaurador', NULL),
(31, 8, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 8 AND nombre LIKE 'Departamento de Arte Chino%' LIMIT 1), '2023-12-01', 'administrativo', NULL),
(32, 8, (SELECT id_estructura_org FROM estructura_organizacional WHERE id_museo = 8 AND nombre LIKE 'Sección de Cerámica y Porcelana%' LIMIT 1), '2022-09-01', 'curador', '2023-10-30');

INSERT INTO estructura_fisica (id_museo, nombre, tipo_estructura, descripcion, direccion, id_jerarquia_estructura, id_jerarquia_museo) VALUES
(1, 'Edificio Principal', 'edificio', 'Edificio principal del Museo de Arte de Vancouver.', '750 Hornby St, Vancouver, BC V6Z 2H7, Canadá', NULL, NULL),
(2, 'Edificio Central', 'edificio', 'Edificio principal del Museo de Arte de Montreal.', '1380 Sherbrooke St W, Montreal, QC H3G 1J5, Canadá', NULL, NULL),
(3, 'Edificio Histórico', 'edificio', 'Edificio principal del Museo de la Ciudad de México.', 'José María Pino Suárez 30, Centro Histórico, CDMX, México', NULL, NULL),
(4, 'Edificio Principal', 'edificio', 'Edificio principal del Museo de Arte Contemporáneo de Monterrey.', 'Av. Constitución 445, Centro, Monterrey, N.L., México', NULL, NULL),
(5, 'Edificio Principal', 'edificio', 'Edificio principal del Jiangsu Art Museum.', '135 Changjiang Rd, Xuanwu District, Nanjing, Jiangsu, China', NULL, NULL),
(6, 'Edificio Principal', 'edificio', 'Edificio principal del Museo de Guangdong.', '2 Zhujiang E Rd, Tianhe District, Guangzhou, Guangdong, China', NULL, NULL),
(7, 'Edificio Principal', 'edificio', 'Edificio principal del Museo Nacional de Australia.', 'Lawson Cres, Acton ACT 2601, Australia', NULL, NULL),
(8, 'Edificio Histórico', 'edificio', 'Edificio principal de la Galería Nacional de Victoria.', '180 St Kilda Rd, Melbourne VIC 3006, Australia', NULL, NULL);

---

INSERT INTO estructura_fisica (id_museo, nombre, tipo_estructura, descripcion, direccion, id_jerarquia_estructura, id_jerarquia_museo)
SELECT
    piso_data.id_museo,
    piso_data.nombre_piso,
    'piso',
    piso_data.descripcion_piso,
    NULL, -- Direccion es NULL para pisos
    edificio.id_estructura_fisica,
    edificio.id_museo
FROM (VALUES
    (1, 'Planta Baja', 'Piso principal con exposiciones temporales.', 'Edificio Principal'),
    (1, 'Primer Piso', 'Piso dedicado a colecciones permanentes.', 'Edificio Principal'),
    (1, 'Segundo Piso', 'Piso con oficinas administrativas y salas de eventos.', 'Edificio Principal'),
    (2, 'Planta Baja', 'Piso de entrada y exposiciones principales.', 'Edificio Central'),
    (2, 'Primer Piso', 'Piso con galerías de arte europeo.', 'Edificio Central'),
    (2, 'Segundo Piso', 'Piso con galerías de arte canadiense.', 'Edificio Central'),
    (2, 'Tercer Piso', 'Piso de arte contemporáneo y oficinas.', 'Edificio Central'),
    (3, 'Planta Baja', 'Piso de exposiciones históricas y tienda.', 'Edificio Histórico'),
    (3, 'Primer Piso', 'Piso con colecciones de arte colonial.', 'Edificio Histórico'),
    (4, 'Planta Baja', 'Piso de entrada y galerías de arte contemporáneo.', 'Edificio Principal'),
    (4, 'Primer Piso', 'Piso con exposiciones temporales y auditorio.', 'Edificio Principal'),
    (5, 'Planta Baja', 'Piso de exposiciones de arte tradicional chino.', 'Edificio Principal'),
    (5, 'Primer Piso', 'Piso de arte contemporáneo y galerías internacionales.', 'Edificio Principal'),
    (5, 'Segundo Piso', 'Piso de investigación y biblioteca.', 'Edificio Principal'),
    (6, 'Planta Baja', 'Piso de arte local y exposiciones temporales.', 'Edificio Principal'),
    (6, 'Primer Piso', 'Piso de colecciones históricas y culturales.', 'Edificio Principal'),
    (7, 'Planta Baja', 'Piso de exposiciones aborígenes y tienda.', 'Edificio Principal'),
    (7, 'Primer Piso', 'Piso de historia colonial y moderna.', 'Edificio Principal'),
    (7, 'Segundo Piso', 'Piso de investigación y archivos.', 'Edificio Principal'),
    (8, 'Planta Baja', 'Piso de entrada y galerías de arte australiano.', 'Edificio Histórico'),
    (8, 'Primer Piso', 'Piso de arte internacional y exposiciones especiales.', 'Edificio Histórico'),
    (8, 'Segundo Piso', 'Piso de arte contemporáneo y diseño.', 'Edificio Histórico'),
    (8, 'Tercer Piso', 'Piso de oficinas administrativas y conservación.', 'Edificio Histórico')
) AS piso_data(id_museo, nombre_piso, descripcion_piso, nombre_edificio_padre)
JOIN estructura_fisica AS edificio ON piso_data.id_museo = edificio.id_museo
                                   AND piso_data.nombre_edificio_padre = edificio.nombre
                                   AND edificio.tipo_estructura = 'edificio';

---

INSERT INTO estructura_fisica (id_museo, nombre, tipo_estructura, descripcion, direccion, id_jerarquia_estructura, id_jerarquia_museo)
SELECT
    area_data.id_museo,
    area_data.nombre_area,
    'area seccion',
    area_data.descripcion_area,
    NULL, -- Direccion es NULL para areas de seccion
    piso.id_estructura_fisica,
    piso.id_museo
FROM (VALUES
    (1, 'Galería Principal', 'Área de exhibición de obras destacadas.', 'Planta Baja'),
    (1, 'Sala de Esculturas', 'Espacio dedicado a esculturas modernas.', 'Primer Piso'),
    (1, 'Oficinas Curaduría', 'Oficinas del equipo de curaduría.', 'Segundo Piso'),
    (2, 'Sala Renacimiento', 'Galería de arte del Renacimiento.', 'Primer Piso'),
    (2, 'Sala Impresionista', 'Galería de obras impresionistas.', 'Primer Piso'),
    (2, 'Sala Contemporánea', 'Espacio para arte actual.', 'Tercer Piso'),
    (3, 'Sala de Orígenes', 'Exhibición de la fundación de la ciudad.', 'Planta Baja'),
    (3, 'Sala Virreinal', 'Colección de arte del virreinato.', 'Primer Piso'),
    (3, 'Auditorio Principal', 'Espacio para conferencias y eventos.', 'Planta Baja'),
    (4, 'Galería Norte', 'Galería de arte contemporáneo.', 'Planta Baja'),
    (4, 'Galería Sur', 'Galería de exposiciones temporales.', 'Primer Piso'),
    (5, 'Sala de Caligrafía', 'Exhibición de caligrafía y pintura tradicional.', 'Planta Baja'),
    (5, 'Sala de Cerámica', 'Colección de cerámica histórica.', 'Planta Baja'),
    (5, 'Sala de Arte Moderno', 'Galería de arte moderno chino.', 'Primer Piso'),
    (6, 'Sala de Arte Cantonés', 'Exhibición de arte de la región de Cantón.', 'Planta Baja'),
    (6, 'Sala de Cultura Ancestral', 'Colección de artefactos antiguos.', 'Primer Piso'),
    (6, 'Sala de Exposiciones Temporales', 'Espacio para muestras rotativas.', 'Planta Baja'),
    (7, 'Galería Aborigen', 'Exhibición de arte y cultura aborigen.', 'Planta Baja'),
    (7, 'Sala de la Federación', 'Exhibición de la historia de la federación australiana.', 'Primer Piso'),
    (7, 'Centro de Investigación', 'Área de estudio y consulta de archivos.', 'Segundo Piso'),
    (8, 'Gran Salón', 'Espacio principal de exhibición.', 'Planta Baja'),
    (8, 'Galería Europea', 'Colección de arte europeo.', 'Primer Piso'),
    (8, 'Sala de Fotografía', 'Galería dedicada a la fotografía.', 'Segundo Piso')
) AS area_data(id_museo, nombre_area, descripcion_area, nombre_piso_padre)
JOIN estructura_fisica AS piso ON area_data.id_museo = piso.id_museo
                               AND area_data.nombre_piso_padre = piso.nombre
                               AND piso.tipo_estructura = 'piso';

INSERT INTO asignacion_mensual (id_museo, id_estructura_fisica, id_empleado_mantenimiento_vigilancia, mes_ano, turno) VALUES
-- Museo 1: Museo de Arte de Vancouver
(1, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 1 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 1, '2025-06-01', 'matutino'),
(1, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 1 AND nombre = 'Planta Baja' AND tipo_estructura = 'piso' LIMIT 1), 2, '2025-06-01', 'vesperino'),
(1, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 1 AND nombre = 'Galería Principal' AND tipo_estructura = 'area seccion' LIMIT 1), 3, '2025-06-01', 'nocturno'),
(1, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 1 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 4, '2025-05-01', 'matutino'),
(1, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 1 AND nombre = 'Primer Piso' AND tipo_estructura = 'piso' LIMIT 1), 1, '2025-05-01', 'vesperino'),
(1, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 1 AND nombre = 'Sala de Esculturas' AND tipo_estructura = 'area seccion' LIMIT 1), 2, '2025-05-01', 'nocturno'),
(1, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 1 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 3, '2025-04-01', 'matutino'),
(1, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 1 AND nombre = 'Segundo Piso' AND tipo_estructura = 'piso' LIMIT 1), 4, '2025-04-01', 'vesperino'),

-- Museo 2: Museo de Arte de Montreal
(2, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 2 AND nombre = 'Edificio Central' AND tipo_estructura = 'edificio' LIMIT 1), 5, '2025-06-01', 'matutino'),
(2, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 2 AND nombre = 'Planta Baja' AND tipo_estructura = 'piso' LIMIT 1), 6, '2025-06-01', 'vesperino'),
(2, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 2 AND nombre = 'Sala Renacimiento' AND tipo_estructura = 'area seccion' LIMIT 1), 7, '2025-06-01', 'nocturno'),
(2, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 2 AND nombre = 'Edificio Central' AND tipo_estructura = 'edificio' LIMIT 1), 8, '2025-05-01', 'matutino'),
(2, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 2 AND nombre = 'Primer Piso' AND tipo_estructura = 'piso' LIMIT 1), 5, '2025-05-01', 'vesperino'),
(2, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 2 AND nombre = 'Sala Impresionista' AND tipo_estructura = 'area seccion' LIMIT 1), 6, '2025-05-01', 'nocturno'),
(2, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 2 AND nombre = 'Edificio Central' AND tipo_estructura = 'edificio' LIMIT 1), 7, '2025-04-01', 'matutino'),
(2, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 2 AND nombre = 'Segundo Piso' AND tipo_estructura = 'piso' LIMIT 1), 8, '2025-04-01', 'vesperino'),

-- Museo 3: Museo de la Ciudad de México
(3, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 3 AND nombre = 'Edificio Histórico' AND tipo_estructura = 'edificio' LIMIT 1), 9, '2025-06-01', 'matutino'),
(3, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 3 AND nombre = 'Planta Baja' AND tipo_estructura = 'piso' LIMIT 1), 10, '2025-06-01', 'vesperino'),
(3, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 3 AND nombre = 'Sala de Orígenes' AND tipo_estructura = 'area seccion' LIMIT 1), 11, '2025-06-01', 'nocturno'),
(3, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 3 AND nombre = 'Edificio Histórico' AND tipo_estructura = 'edificio' LIMIT 1), 12, '2025-05-01', 'matutino'),
(3, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 3 AND nombre = 'Primer Piso' AND tipo_estructura = 'piso' LIMIT 1), 9, '2025-05-01', 'vesperino'),
(3, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 3 AND nombre = 'Sala Virreinal' AND tipo_estructura = 'area seccion' LIMIT 1), 10, '2025-05-01', 'nocturno'),
(3, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 3 AND nombre = 'Edificio Histórico' AND tipo_estructura = 'edificio' LIMIT 1), 11, '2025-04-01', 'matutino'),
(3, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 3 AND nombre = 'Auditorio Principal' AND tipo_estructura = 'area seccion' LIMIT 1), 12, '2025-04-01', 'vesperino'),

-- Museo 4: Museo De Arte Contemporáneo De Monterrey
(4, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 4 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 13, '2025-06-01', 'matutino'),
(4, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 4 AND nombre = 'Planta Baja' AND tipo_estructura = 'piso' LIMIT 1), 14, '2025-06-01', 'vesperino'),
(4, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 4 AND nombre = 'Galería Norte' AND tipo_estructura = 'area seccion' LIMIT 1), 15, '2025-06-01', 'nocturno'),
(4, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 4 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 16, '2025-05-01', 'matutino'),
(4, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 4 AND nombre = 'Primer Piso' AND tipo_estructura = 'piso' LIMIT 1), 13, '2025-05-01', 'vesperino'),
(4, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 4 AND nombre = 'Galería Sur' AND tipo_estructura = 'area seccion' LIMIT 1), 14, '2025-05-01', 'nocturno'),
(4, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 4 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 15, '2025-04-01', 'matutino'),
(4, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 4 AND nombre = 'Planta Baja' AND tipo_estructura = 'piso' LIMIT 1), 16, '2025-04-01', 'vesperino'),

-- Museo 5: Jiangsu Art Museum
(5, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 5 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 17, '2025-06-01', 'matutino'),
(5, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 5 AND nombre = 'Planta Baja' AND tipo_estructura = 'piso' LIMIT 1), 18, '2025-06-01', 'vesperino'),
(5, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 5 AND nombre = 'Sala de Caligrafía' AND tipo_estructura = 'area seccion' LIMIT 1), 19, '2025-06-01', 'nocturno'),
(5, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 5 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 20, '2025-05-01', 'matutino'),
(5, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 5 AND nombre = 'Primer Piso' AND tipo_estructura = 'piso' LIMIT 1), 17, '2025-05-01', 'vesperino'),
(5, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 5 AND nombre = 'Sala de Cerámica' AND tipo_estructura = 'area seccion' LIMIT 1), 18, '2025-05-01', 'nocturno'),
(5, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 5 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 19, '2025-04-01', 'matutino'),
(5, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 5 AND nombre = 'Segundo Piso' AND tipo_estructura = 'piso' LIMIT 1), 20, '2025-04-01', 'vesperino'),

-- Museo 6: Museo de Guangdong
(6, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 6 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 21, '2025-06-01', 'matutino'),
(6, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 6 AND nombre = 'Planta Baja' AND tipo_estructura = 'piso' LIMIT 1), 22, '2025-06-01', 'vesperino'),
(6, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 6 AND nombre = 'Sala de Arte Cantonés' AND tipo_estructura = 'area seccion' LIMIT 1), 23, '2025-06-01', 'nocturno'),
(6, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 6 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 24, '2025-05-01', 'matutino'),
(6, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 6 AND nombre = 'Primer Piso' AND tipo_estructura = 'piso' LIMIT 1), 21, '2025-05-01', 'vesperino'),
(6, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 6 AND nombre = 'Sala de Cultura Ancestral' AND tipo_estructura = 'area seccion' LIMIT 1), 22, '2025-05-01', 'nocturno'),
(6, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 6 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 23, '2025-04-01', 'matutino'),
(6, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 6 AND nombre = 'Planta Baja' AND tipo_estructura = 'piso' LIMIT 1), 24, '2025-04-01', 'vesperino'),

-- Museo 7: Museo Nacional de Australia
(7, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 7 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 25, '2025-06-01', 'matutino'),
(7, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 7 AND nombre = 'Planta Baja' AND tipo_estructura = 'piso' LIMIT 1), 26, '2025-06-01', 'vesperino'),
(7, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 7 AND nombre = 'Galería Aborigen' AND tipo_estructura = 'area seccion' LIMIT 1), 27, '2025-06-01', 'nocturno'),
(7, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 7 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 28, '2025-05-01', 'matutino'),
(7, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 7 AND nombre = 'Primer Piso' AND tipo_estructura = 'piso' LIMIT 1), 25, '2025-05-01', 'vesperino'),
(7, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 7 AND nombre = 'Sala de la Federación' AND tipo_estructura = 'area seccion' LIMIT 1), 26, '2025-05-01', 'nocturno'),
(7, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 7 AND nombre = 'Edificio Principal' AND tipo_estructura = 'edificio' LIMIT 1), 27, '2025-04-01', 'matutino'),
(7, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 7 AND nombre = 'Segundo Piso' AND tipo_estructura = 'piso' LIMIT 1), 28, '2025-04-01', 'vesperino'),

-- Museo 8: Galería Nacional de Victoria
(8, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 8 AND nombre = 'Edificio Histórico' AND tipo_estructura = 'edificio' LIMIT 1), 29, '2025-06-01', 'matutino'),
(8, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 8 AND nombre = 'Planta Baja' AND tipo_estructura = 'piso' LIMIT 1), 30, '2025-06-01', 'vesperino'),
(8, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 8 AND nombre = 'Gran Salón' AND tipo_estructura = 'area seccion' LIMIT 1), 31, '2025-06-01', 'nocturno'),
(8, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 8 AND nombre = 'Edificio Histórico' AND tipo_estructura = 'edificio' LIMIT 1), 32, '2025-05-01', 'matutino'),
(8, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 8 AND nombre = 'Primer Piso' AND tipo_estructura = 'piso' LIMIT 1), 29, '2025-05-01', 'vesperino'),
(8, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 8 AND nombre = 'Galería Europea' AND tipo_estructura = 'area seccion' LIMIT 1), 30, '2025-05-01', 'nocturno'),
(8, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 8 AND nombre = 'Edificio Histórico' AND tipo_estructura = 'edificio' LIMIT 1), 31, '2025-04-01', 'matutino'),
(8, (SELECT id_estructura_fisica FROM estructura_fisica WHERE id_museo = 8 AND nombre = 'Segundo Piso' AND tipo_estructura = 'piso' LIMIT 1), 32, '2025-04-01', 'vesperino');

INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (1, 32, 'Galería Principal', 'Sala principal para obras destacadas.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (1, 33, 'Sala de Esculturas', 'Espacio dedicado a exhibir esculturas modernas.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (2, 35, 'Sala Renacimiento', 'Galería de arte del período Renacentista.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (2, 36, 'Sala Impresionista', 'Galería dedicada a obras impresionistas.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (2, 37, 'Sala de Arte Contemporáneo', 'Espacio para la exhibición de arte actual.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (3, 38, 'Sala de Orígenes', 'Exhibición sobre la fundación de la ciudad.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (3, 39, 'Sala Virreinal', 'Colección de arte del período virreinal.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (4, 41, 'Galería Norte', 'Galería de arte contemporáneo en la sección norte.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (4, 42, 'Galería Sur', 'Galería para exposiciones temporales en la sección sur.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (5, 43, 'Sala de Caligrafía', 'Exhibición de caligrafía y pintura tradicional china.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (5, 44, 'Sala de Cerámica', 'Colección de cerámica histórica de China.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (5, 45, 'Sala de Arte Moderno', 'Galería de arte moderno chino.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (6, 46, 'Sala de Arte Cantonés', 'Exhibición de arte de la región de Cantón.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (6, 47, 'Sala de Cultura Ancestral', 'Colección de artefactos antiguos y culturales.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (6, 48, 'Sala de Exposiciones Temporales', 'Espacio dedicado a muestras y exhibiciones rotativas.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (7, 49, 'Galería Aborigen', 'Exhibición de arte y cultura aborigen australiana.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (7, 50, 'Sala de la Federación', 'Exhibición sobre la historia de la federación australiana.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (8, 52, 'Gran Salón', 'Espacio principal de exhibición de la galería.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (8, 53, 'Galería Europea', 'Colección de arte europeo de diversas épocas.');
INSERT INTO sala_exposicion (id_museo, id_estructura_fisica, nombre_sala, descripcion) VALUES (8, 54, 'Sala de Fotografía', 'Galería dedicada a la exhibición de fotografía.');


INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (1, 32, 1, '2023-01-10', '2023-01-20');
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (1, 33, 2, '2024-05-01', NULL);
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (2, 35, 3, '2022-11-15', '2022-11-30'); 
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (2, 36, 4, '2023-09-01', '2023-09-10'); 
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (3, 38, 6, '2023-03-01', '2023-03-05');
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (3, 39, 7, '2024-01-15', NULL);
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (4, 41, 8, '2022-07-01', '2022-07-10');
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (4, 42, 9, '2023-04-20', '2023-04-25');
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (5, 43, 10, '2023-10-01', '2023-10-15'); 
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (5, 44, 11, '2024-03-10', NULL);
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (6, 46, 13, '2022-05-01', '2022-05-07'); 
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (6, 47, 14, '2023-08-01', '2023-08-05');
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (7, 49, 16, '2023-02-01', '2023-02-14');
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (7, 50, 17, '2024-01-01', '2024-01-07');
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (8, 52, 18, '2022-10-01', '2022-10-03');
INSERT INTO hist_cierre (id_museo, id_estructura_fisica, id_sala, fecha_ini, fecha_fin) VALUES (8, 53, 19, '2023-06-10', '2023-06-15');

-- Inserciones para la tabla coleccion_permanente

-- Museo de Arte Moderno (id_museo: 1)
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(1, 11, 'Colección de Arte Contemporáneo', 'Obras representativas del arte global desde 1960 hasta la actualidad.', 'contemporáneo', 1);
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(1, 29, 'Arte del Siglo XX', 'Pinturas y esculturas clave del siglo XX, incluyendo movimientos como el cubismo y el surrealismo.', 'siglo XX', 2);

-- Museo Nacional de Bellas Artes (id_museo: 2)
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(2, 14, 'Maestros Europeos', 'Colección de obras de grandes maestros de la pintura europea desde el Renacimiento hasta el siglo XIX.', 'europeo', 1);
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(2, 31, 'Pintura Latinoamericana', 'Panorama de la pintura latinoamericana, desde el periodo colonial hasta las vanguardias del siglo XX.', 'latinoamericano', 2);

-- Galería de Arte Contemporáneo (id_museo: 3)
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(3, 16, 'Nuevos Medios y Digital', 'Obras que exploran la intersección del arte con la tecnología, incluyendo videoarte e instalaciones digitales.', 'digital', 1);
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(3, 33, 'Arte Urbano y Grafitis', 'Colección dedicada al arte callejero y las expresiones urbanas contemporáneas.', 'urbano', 2);

-- Centro de Arte Digital (id_museo: 4)
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(4, 18, 'Realidad Virtual y Aumentada', 'Experiencias inmersivas y obras de arte creadas con tecnologías de realidad virtual y aumentada.', 'VR', 1);
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(4, 35, 'Net Art y Arte Generativo', 'Obras de arte digital que utilizan algoritmos y la web como medio principal.', 'net art', 2);

-- Museo de Arte Clásico (id_museo: 5)
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(5, 19, 'Escultura Romana', 'Colección de esculturas romanas, incluyendo retratos y relieves históricos.', 'romano', 1);
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(5, 36, 'Cerámica Griega', 'Vasijas y fragmentos de cerámica griega que ilustran la mitología y la vida cotidiana.', 'griego', 2);

-- Museo de Arte Latinoamericano (id_museo: 6)
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(6, 23, 'Arte Moderno Latinoamericano', 'Obras de artistas latinoamericanos que definieron los movimientos modernos del siglo XX.', 'moderno', 1);
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(6, 39, 'Muralismo Mexicano', 'Fragmentos y estudios de murales icónicos del movimiento muralista mexicano.', 'muralismo', 2);

-- Museo de Arte Abstracto (id_museo: 7)
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(7, 24, 'Expresionismo Abstracto', 'Pinturas de gran formato que representan la expresión emocional a través del color y la forma.', 'expresionismo', 1);
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(7, 40, 'Minimalismo y Arte Conceptual', 'Obras que exploran la reducción a lo esencial y la primacía de la idea sobre la forma.', 'minimalismo', 2);

-- Museo de Arte Oriental (id_museo: 8)
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(8, 26, 'Pintura y Caligrafía China', 'Rollos, álbumes y obras de caligrafía que muestran la rica tradición artística china.', 'chino', 1);
INSERT INTO coleccion_permanente (id_museo, id_estructura_org, nombre_coleccion, descripcion_caracteristica, palabra_clave, orden_recorrido) VALUES
(8, 43, 'Cerámica y Porcelana Japonesa', 'Ejemplos exquisitos de la cerámica y porcelana japonesa, desde periodos antiguos hasta modernos.', 'japonés', 2);

-- Inserciones para la tabla col_sal (Colecciones en Salas de Exposición)

-- Museo de Arte Moderno (id_museo: 1)
-- Sala: Galería Principal (1, 32, 1)
-- Colección: Colección de Arte Contemporáneo (1, 11, 1)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(1, 32, 1, 1, 11, 1, 1);

-- Sala: Sala de Esculturas (1, 33, 2)
-- Colección: Arte del Siglo XX (1, 29, 2)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(1, 33, 2, 1, 29, 2, 2);

-- Museo Nacional de Bellas Artes (id_museo: 2)
-- Sala: Sala Renacimiento (2, 35, 3)
-- Colección: Maestros Europeos (2, 14, 3)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(2, 35, 3, 2, 14, 3, 1);

-- Sala: Sala Impresionista (2, 36, 4)
-- Colección: Pintura Latinoamericana (2, 31, 4)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(2, 36, 4, 2, 31, 4, 2);

-- Galería de Arte Contemporáneo (id_museo: 3)
-- Sala: Sala de Orígenes (3, 38, 6)
-- Colección: Nuevos Medios y Digital (3, 16, 5)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(3, 38, 6, 3, 16, 5, 1);

-- Sala: Sala Virreinal (3, 39, 7)
-- Colección: Arte Urbano y Grafitis (3, 33, 6)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(3, 39, 7, 3, 33, 6, 2);

-- Centro de Arte Digital (id_museo: 4)
-- Sala: Galería Norte (4, 41, 8)
-- Colección: Realidad Virtual y Aumentada (4, 18, 7)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(4, 41, 8, 4, 18, 7, 1);

-- Sala: Galería Sur (4, 42, 9)
-- Colección: Net Art y Arte Generativo (4, 35, 8)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(4, 42, 9, 4, 35, 8, 2);

-- Museo de Arte Clásico (id_museo: 5)
-- Sala: Sala de Caligrafía (5, 43, 10)
-- Colección: Escultura Romana (5, 19, 9)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(5, 43, 10, 5, 19, 9, 1);

-- Sala: Sala de Cerámica (5, 44, 11)
-- Colección: Cerámica Griega (5, 36, 10)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(5, 44, 11, 5, 36, 10, 2);

-- Museo de Guangdong (id_museo: 6)
-- Sala: Sala de Arte Cantonés (6, 46, 13)
-- Colección: Arte Moderno Latinoamericano (6, 23, 11)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(6, 46, 13, 6, 23, 11, 1);

-- Sala: Sala de Cultura Ancestral (6, 47, 14)
-- Colección: Muralismo Mexicano (6, 39, 12)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(6, 47, 14, 6, 39, 12, 2);

-- Museo Nacional de Australia (id_museo: 7)
-- Sala: Galería Aborigen (7, 49, 16)
-- Colección: Expresionismo Abstracto (7, 24, 13)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(7, 49, 16, 7, 24, 13, 1);

-- Sala: Sala de la Federación (7, 50, 17)
-- Colección: Minimalismo y Arte Conceptual (7, 40, 14)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(7, 50, 17, 7, 40, 14, 2);

-- Galería Nacional de Victoria (id_museo: 8)
-- Sala: Gran Salón (8, 52, 18)
-- Colección: Pintura y Caligrafía China (8, 26, 15)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(8, 52, 18, 8, 26, 15, 1);

-- Sala: Galería Europea (8, 53, 19)
-- Colección: Cerámica y Porcelana Japonesa (8, 43, 16)
INSERT INTO col_sal (id_museo_sala, id_estructura_fisica, id_sala, id_museo_coleccion, id_estructura_org, id_coleccion, orden_recorrido) VALUES
(8, 53, 19, 8, 43, 16, 2);

-- Inserciones para la tabla historico_obra_movimiento

-- Movimiento de la obra "david" (id_obra: 1)
-- Ubicada en Sala Renacimiento (2, 35, 3)
-- Perteneciente a Colección Escultura Romana (5, 19, 9
-- A cargo del curador (2, 14, 6, '2023-04-10')
INSERT INTO historico_obra_movimiento (
    id_obra, id_historico_obra_movimiento, fecha_inicio, tipo_obtencion, destacada,
    id_museo_sala, id_estructura_fisica, id_sala,
    id_museo_coleccion, id_estructura_org_coleccion, id_coleccion,
    id_museo_empleado, id_estructura_org_empleado, id_empleado, fecha_inicio_empleado,
    fecha_fin, valor_obra, orden_recomendado
) VALUES (
    1, nextval('seq_mantenimiento_obra'), '2023-05-01', 'donado', 'si',
    2, 35, 3,
    5, 19, 9,
    2, 14, 6, '2023-04-10',
    NULL, 1500000.00, 1
);

-- Movimiento de la obra "monalisa" (id_obra: 5)
-- Ubicada en Galería Europea (8, 53, 19)
-- Perteneciente a Colección Maestros Europeos (2, 14, 3)
-- A cargo del curador (7, 25, 26, '2023-09-01')
INSERT INTO historico_obra_movimiento (
    id_obra, id_historico_obra_movimiento, fecha_inicio, tipo_obtencion, destacada,
    id_museo_sala, id_estructura_fisica, id_sala,
    id_museo_coleccion, id_estructura_org_coleccion, id_coleccion,
    id_museo_empleado, id_estructura_org_empleado, id_empleado, fecha_inicio_empleado,
    fecha_fin, valor_obra, orden_recomendado
) VALUES (
    5, nextval('seq_mantenimiento_obra'), '2024-01-20', 'comprado', 'si',
    8, 53, 19,
    2, 14, 3,
    7, 25, 26, '2023-09-01',
    NULL, 8000000.00, 2
);

-- Movimiento de la obra "guernica" (id_obra: 9)
-- Ubicada en Galería Principal (1, 32, 1)
-- Perteneciente a Colección Arte del Siglo XX (1, 29, 2)
-- A cargo del curador (1, 11, 2, '2023-03-01')
INSERT INTO historico_obra_movimiento (
    id_obra, id_historico_obra_movimiento, fecha_inicio, tipo_obtencion, destacada,
    id_museo_sala, id_estructura_fisica, id_sala,
    id_museo_coleccion, id_estructura_org_coleccion, id_coleccion,
    id_museo_empleado, id_estructura_org_empleado, id_empleado, fecha_inicio_empleado,
    fecha_fin, valor_obra, orden_recomendado
) VALUES (
    9, nextval('seq_mantenimiento_obra'), '2023-08-10', 'comprado a otro museo', 'si',
    1, 32, 1,
    1, 29, 2,
    1, 11, 2, '2023-03-01',
    NULL, 12000000.00, 3
);

-- Movimiento de la obra "venus de milo" (id_obra: 3)
-- Ubicada en Sala de Esculturas (1, 33, 2)
-- Perteneciente a Colección Escultura Romana (5, 19, 9)
-- A cargo del curador (7, 25, 26, '2023-09-01')
INSERT INTO historico_obra_movimiento (
    id_obra, id_historico_obra_movimiento, fecha_inicio, tipo_obtencion, destacada,
    id_museo_sala, id_estructura_fisica, id_sala,
    id_museo_coleccion, id_estructura_org_coleccion, id_coleccion,
    id_museo_empleado, id_estructura_org_empleado, id_empleado, fecha_inicio_empleado,
    fecha_fin, valor_obra, orden_recomendado
) VALUES (
    3, nextval('seq_mantenimiento_obra'), '2023-06-15', 'donado de otro museo', 'no',
    1, 33, 2,
    5, 19, 9,
    7, 25, 26, '2023-09-01',
    '2024-03-30', 2000000.00, 4
);

-- Movimiento de la obra "la pertenecia de la memoria" (id_obra: 7)
-- Ubicada en Sala de Arte Contemporáneo (2, 37, 5)
-- Perteneciente a Colección Arte del Siglo XX (1, 29, 2)
-- A cargo del curador (3, 16, 10, '2023-05-01')
INSERT INTO historico_obra_movimiento (
    id_obra, id_historico_obra_movimiento, fecha_inicio, tipo_obtencion, destacada,
    id_museo_sala, id_estructura_fisica, id_sala,
    id_museo_coleccion, id_estructura_org_coleccion, id_coleccion,
    id_museo_empleado, id_estructura_org_empleado, id_empleado, fecha_inicio_empleado,
    fecha_fin, valor_obra, orden_recomendado
) VALUES (
    7, nextval('seq_mantenimiento_obra'), '2024-02-01', 'comprado', 'no',
    2, 37, 5,
    1, 29, 2,
    3, 16, 10, '2023-05-01',
    NULL, 3000000.00, 5
);

-- Inserciones para la tabla mantenimiento_obra

-- Mantenimiento para la obra "david" (id_obra: 1, id_historico_obra_movimiento: 1)
INSERT INTO mantenimiento_obra (id_obra, id_historico_obra_movimiento, id_mantenimiento_obra, actividad, frecuencia, tipo_resposable) VALUES
(1, 1, 1, 'Limpieza superficial de la escultura', 12, 'restaurador');
INSERT INTO mantenimiento_obra (id_obra, id_historico_obra_movimiento, id_mantenimiento_obra, actividad, frecuencia, tipo_resposable) VALUES
(1, 1, 2, 'Revisión de anclajes y estabilidad', 6, 'otro');

-- Mantenimiento para la obra "monalisa" (id_obra: 5, id_historico_obra_movimiento: 2)
INSERT INTO mantenimiento_obra (id_obra, id_historico_obra_movimiento, id_mantenimiento_obra, actividad, frecuencia, tipo_resposable) VALUES
(5, 2, 1, 'Control de humedad y temperatura de la sala', 1, 'curador');
INSERT INTO mantenimiento_obra (id_obra, id_historico_obra_movimiento, id_mantenimiento_obra, actividad, frecuencia, tipo_resposable) VALUES
(5, 2, 2, 'Inspección detallada de pigmentos y barniz', 3, 'restaurador');

-- Mantenimiento para la obra "guernica" (id_obra: 9, id_historico_obra_movimiento: 3)
INSERT INTO mantenimiento_obra (id_obra, id_historico_obra_movimiento, id_mantenimiento_obra, actividad, frecuencia, tipo_resposable) VALUES
(9, 3, 1, 'Revisión del bastidor y tensión del lienzo', 6, 'restaurador');
INSERT INTO mantenimiento_obra (id_obra, id_historico_obra_movimiento, id_mantenimiento_obra, actividad, frecuencia, tipo_resposable) VALUES
(9, 3, 2, 'Limpieza profunda y consolidación de la pintura', 24, 'restaurador');

-- Mantenimiento para la obra "venus de milo" (id_obra: 3, id_historico_obra_movimiento: 4)
INSERT INTO mantenimiento_obra (id_obra, id_historico_obra_movimiento, id_mantenimiento_obra, actividad, frecuencia, tipo_resposable) VALUES
(3, 4, 1, 'Pulido y tratamiento de superficie de mármol', 12, 'restaurador');
INSERT INTO mantenimiento_obra (id_obra, id_historico_obra_movimiento, id_mantenimiento_obra, actividad, frecuencia, tipo_resposable) VALUES
(3, 4, 2, 'Evaluación de posibles fisuras o daños estructurales', 6, 'otro');

-- Mantenimiento para la obra "la pertenecia de la memoria" (id_obra: 7, id_historico_obra_movimiento: 5)
INSERT INTO mantenimiento_obra (id_obra, id_historico_obra_movimiento, id_mantenimiento_obra, actividad, frecuencia, tipo_resposable) VALUES
(7, 5, 1, 'Verificación del estado del marco y cristal', 3, 'curador');
INSERT INTO mantenimiento_obra (id_obra, id_historico_obra_movimiento, id_mantenimiento_obra, actividad, frecuencia, tipo_resposable) VALUES
(7, 5, 2, 'Análisis de conservación y retoques menores', 6, 'restaurador');


-- Sentencias INSERT para la tabla historico_mantenimiento_realizado
-- Cada entrada hace referencia a un empleado (restaurador o curador) según el tipo de mantenimiento.
-- Todas las entradas tienen una fecha de fin, indicando que el mantenimiento ha sido completado.

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
) VALUES
(
    1, -- id_obra
    1, -- id_historico_obra_movimiento
    1, -- id_mantenimiento_obra (Limpieza superficial de la escultura - restaurador)
    '2023-08-01', -- fecha_inicio del mantenimiento
    'Limpieza superficial de la escultura completada con éxito. Se utilizaron materiales no abrasivos.', -- observaciones
    18, -- id_empleado (restaurador)
    5, -- id_museo del empleado
    20, -- id_estructura_org del empleado
    '2023-07-10', -- fecha_inicio_hist_empleado
    '2023-08-05' -- fecha_fin del mantenimiento
),
(
    1, -- id_obra
    1, -- id_historico_obra_movimiento
    2, -- id_mantenimiento_obra (Revisión de anclajes y estabilidad - otro -> curador)
    '2023-04-01', -- fecha_inicio del mantenimiento
    'Anclajes revisados y estabilidad confirmada. No se detectaron problemas.', -- observaciones
    2, -- id_empleado (curador)
    1, -- id_museo del empleado
    11, -- id_estructura_org del empleado
    '2023-03-01', -- fecha_inicio_hist_empleado
    '2023-04-02' -- fecha_fin del mantenimiento
),
(
    3, -- id_obra
    4, -- id_historico_obra_movimiento
    1, -- id_mantenimiento_obra (Pulido y tratamiento de superficie de mármol - restaurador)
    '2023-11-01', -- fecha_inicio del mantenimiento
    'Superficie de mármol pulida y tratada. Se aplicó una capa protectora.', -- observaciones
    30, -- id_empleado (restaurador)
    8, -- id_museo del empleado
    27, -- id_estructura_org del empleado
    '2023-10-15', -- fecha_inicio_hist_empleado
    '2023-11-03' -- fecha_fin del mantenimiento
),
(
    3, -- id_obra
    4, -- id_historico_obra_movimiento
    2, -- id_mantenimiento_obra (Evaluación de posibles fisuras o daños estructurales - otro -> curador)
    '2023-05-01', -- fecha_inicio del mantenimiento
    'Evaluación completa. No se encontraron fisuras ni daños estructurales significativos.', -- observaciones
    6, -- id_empleado (curador)
    2, -- id_museo del empleado
    14, -- id_estructura_org del empleado
    '2023-04-10', -- fecha_inicio_hist_empleado
    '2023-05-02' -- fecha_fin del mantenimiento
),
(
    5, -- id_obra
    2, -- id_historico_obra_movimiento
    1, -- id_mantenimiento_obra (Control de humedad y temperatura de la sala - curador)
    '2023-06-01', -- fecha_inicio del mantenimiento
    'Control diario de humedad y temperatura. Parámetros dentro de los rangos óptimos.', -- observaciones
    10, -- id_empleado (curador)
    3, -- id_museo del empleado
    16, -- id_estructura_org del empleado
    '2023-05-01', -- fecha_inicio_hist_empleado
    '2023-06-01' -- fecha_fin del mantenimiento
),
(
    5, -- id_obra
    2, -- id_historico_obra_movimiento
    2, -- id_mantenimiento_obra (Inspección detallada de pigmentos y barniz - restaurador)
    '2023-08-10', -- fecha_inicio del mantenimiento
    'Inspección minuciosa de pigmentos y barniz. Se observó buen estado general.', -- observaciones
    18, -- id_empleado (restaurador)
    5, -- id_museo del empleado
    20, -- id_estructura_org del empleado
    '2023-07-10', -- fecha_inicio_hist_empleado
    '2023-08-12' -- fecha_fin del mantenimiento
),
(
    7, -- id_obra
    5, -- id_historico_obra_movimiento
    1, -- id_mantenimiento_obra (Verificación del estado del marco y cristal - curador)
    '2023-07-01', -- fecha_inicio del mantenimiento
    'Marco y cristal verificados. No se encontraron daños ni desajustes.', -- observaciones
    14, -- id_empleado (curador)
    4, -- id_museo del empleado
    18, -- id_estructura_org del empleado
    '2023-06-05', -- fecha_inicio_hist_empleado
    '2023-07-01' -- fecha_fin del mantenimiento
),
(
    7, -- id_obra
    5, -- id_historico_obra_movimiento
    2, -- id_mantenimiento_obra (Análisis de conservación y retoques menores - restaurador)
    '2023-11-10', -- fecha_inicio del mantenimiento
    'Análisis de conservación realizado. Se efectuaron retoques menores en áreas específicas.', -- observaciones
    30, -- id_empleado (restaurador)
    8, -- id_museo del empleado
    27, -- id_estructura_org del empleado
    '2023-10-15', -- fecha_inicio_hist_empleado
    '2023-11-15' -- fecha_fin del mantenimiento
),
(
    9, -- id_obra
    3, -- id_historico_obra_movimiento
    1, -- id_mantenimiento_obra (Revisión del bastidor y tensión del lienzo - restaurador)
    '2023-09-01', -- fecha_inicio del mantenimiento
    'Bastidor revisado y tensión del lienzo ajustada para una estabilidad óptima.', -- observaciones
    18, -- id_empleado (restaurador)
    5, -- id_museo del empleado
    20, -- id_estructura_org del empleado
    '2023-07-10', -- fecha_inicio_hist_empleado
    '2023-09-02' -- fecha_fin del mantenimiento
),
(
    9, -- id_obra
    3, -- id_historico_obra_movimiento
    2, -- id_mantenimiento_obra (Limpieza profunda y consolidación de la pintura - restaurador)
    '2023-12-01', -- fecha_inicio del mantenimiento
    'Limpieza profunda y consolidación de la pintura completadas. Mejora visible en la obra.', -- observaciones
    30, -- id_empleado (restaurador)
    8, -- id_museo del empleado
    27, -- id_estructura_org del empleado
    '2023-10-15', -- fecha_inicio_hist_empleado
    '2023-12-05' -- fecha_fin del mantenimiento
);

