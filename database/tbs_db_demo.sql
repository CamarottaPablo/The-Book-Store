-- MySQL dump 10.13  Distrib 8.0.24, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: tbs_db
-- ------------------------------------------------------
-- Server version	5.7.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `idaddress` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(32) NOT NULL,
  `street_number` int(11) NOT NULL,
  `floor_apartment` tinyint(10) DEFAULT NULL,
  `postal_code` int(11) NOT NULL,
  `town` varchar(20) DEFAULT NULL,
  `city` varchar(64) NOT NULL,
  `province` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`idaddress`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Mateo Luque',305,NULL,5014,NULL,'Córdoba','Córdoba','Argentina'),(2,'Buenos Aires',1500,NULL,5014,NULL,'Córdoba','Córdoba','Argentina'),(3,'Florida',340,NULL,1005,NULL,'CABA','Buenos Aires','Argentina'),(4,'Congreso de Tucumán',141,NULL,4000,NULL,'San Miguel de Tucumán','Tucumán','Argentina');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `idauthor` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `nationality` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`idauthor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Haruki','Murakami','Japón'),(2,'Joël','Dicker','Suiza'),(3,'Henning','Mankell','Suecia'),(4,'John','Katzenbach','Estados Unidos'),(5,'Gioconda','Belli','Nicaragua'),(6,'Agota','Kristof','Hungría');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `idcart` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`idcart`),
  KEY `user_id_idx` (`user_id`),
  KEY `invoice_id_idx` (`invoice_id`),
  KEY `payment_method_id_idx` (`payment_method_id`),
  KEY `address_id_idx` (`address_id`),
  CONSTRAINT `address_id` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`idaddress`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`idinvoice`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `paymentMethods` (`idpaymentMethod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,1,2,1,3),(2,2,4,3,2),(3,3,3,1,4),(4,4,1,2,1);
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartsProducts`
--

DROP TABLE IF EXISTS `cartsProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartsProducts` (
  `idcartProduct` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  PRIMARY KEY (`idcartProduct`),
  KEY `product_id_idx` (`product_id`),
  KEY `cart_id_idx` (`cart_id`),
  CONSTRAINT `cart_id` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`idcart`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartsProducts`
--

LOCK TABLES `cartsProducts` WRITE;
/*!40000 ALTER TABLE `cartsProducts` DISABLE KEYS */;
INSERT INTO `cartsProducts` VALUES (1,1,4),(2,1,1),(3,2,1),(4,3,2),(5,4,2),(6,2,3),(7,4,3);
/*!40000 ALTER TABLE `cartsProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorials`
--

DROP TABLE IF EXISTS `editorials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorials` (
  `ideditorial` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`ideditorial`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorials`
--

LOCK TABLES `editorials` WRITE;
/*!40000 ALTER TABLE `editorials` DISABLE KEYS */;
INSERT INTO `editorials` VALUES (1,'ALFAGUARA'),(2,'booket'),(3,'MAXITUSQUETS'),(4,'PAIDÓS'),(5,'Planeta'),(6,'TUSQUETS'),(7,'Siruela'),(8,'Ediciones B');
/*!40000 ALTER TABLE `editorials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `idgenre` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`idgenre`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Adm Empresas, Economía'),(2,'Arquitectura, Construcción'),(3,'Arte, Fotografía'),(4,'Ciencias Agropecuarias'),(5,'Ciencias Comunicación'),(6,'Ciencias Políticas'),(7,'Comics'),(8,'Crianza, Puericultura'),(9,'Deportes'),(10,'Desarrollo Personal'),(11,'Diccionarios, Idiomas'),(12,'Divulgación Científica'),(13,'Ecología'),(14,'Educación'),(15,'Ensayos'),(16,'Feminismo, Estudio De Género'),(17,'Física, Química, Matemáticas'),(18,'Gastronomía, Alimentos'),(19,'Historia'),(20,'Hobbies'),(21,'Humanidades'),(22,'Ilustrados Para Adultos'),(23,'Infantiles'),(24,'Infotmática'),(25,'Juveniles'),(26,'Literatura'),(27,'Mandalas, Libros Para Pintar'),(28,'Medicina'),(29,'Odontología'),(30,'Oficios'),(31,'Psicología'),(32,'Sociología'),(33,'Técnicos'),(34,'Veterinaria, Zoología'),(35,'Viajes');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `idinvoice` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`idinvoice`),
  UNIQUE KEY `idinvoice_UNIQUE` (`idinvoice`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,1500),(2,3000),(3,3100),(4,3350);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentMethods`
--

DROP TABLE IF EXISTS `paymentMethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentMethods` (
  `idpaymentMethod` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(20) NOT NULL,
  PRIMARY KEY (`idpaymentMethod`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentMethods`
--

LOCK TABLES `paymentMethods` WRITE;
/*!40000 ALTER TABLE `paymentMethods` DISABLE KEYS */;
INSERT INTO `paymentMethods` VALUES (1,'Efectivo'),(2,'Tranferencia'),(3,'Débito'),(4,'Crédito');
/*!40000 ALTER TABLE `paymentMethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `idproduct` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(64) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `synopsis` varchar(3000) NOT NULL,
  `format` char(1) NOT NULL,
  `isbn` int(50) NOT NULL,
  `pages` int(5) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproduct`),
  KEY `id_author_idx` (`author_id`),
  KEY `id_genres_idx` (`genre_id`),
  CONSTRAINT `id_author` FOREIGN KEY (`author_id`) REFERENCES `authors` (`idauthor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_genres` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`idgenre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Kafka en la orilla','kafka_orilla.jpg',1500.00,'Kafka Tamura se va de casa el día en que cumple quince años. Los motivos, si es que los hay, son las malas relaciones con su padre -un famoso escultor convencido de que su hijo repetirá el aciago sino del Edipo de la tragedia clásica- y la sensación de vacío producida por la ausencia de su madre y su hermana, que se marcharon también cuando él era muy pequeño.','p',1,NULL,NULL,1,26),(2,'El libro de los Baltimore','libro_baltimore.jpg',1500.00,'Hasta que tuvo lugar el Drama existían dos ramas de la familia Goldman: los Goldman de Baltimore y los Goldman de Montclair. Los Montclair, de los que forma parte Marcus Goldman, autor de La verdad sobre el caso Harry Quebert, es una familia de clase media que vive en una pequeña casa en el estado de Nueva Jersey. Los Baltimore, prósperos y a los que la suerte siempre ha sonreído, habitan una lujosa mansión en un barrio de la alta sociedad de Baltimore.','p',1,NULL,NULL,2,26),(3,'La Pirámide','la_piramide.jpg',1750.00,'Todo el mundo tiene un pasado. Wallander, como se nos explica en este libro de la serie, se remonta a veinte años atrás, cuando ni siquiera había entrado en Homicidios y era un joven agente despierto, lleno de ambiciones profesionales y con una vida privada que, ya entonces, hacía agua por todas partes. Los cinco relatos incluidos en La pirámide abarcan desde 1969 a 1989, justo antes del comienzo de la primera novela de la serie.','p',12,NULL,NULL,3,26),(4,'La historia del loco','la_historia_loco.png',1600.00,'Su familia lo recluyó en el psiquiátrico tras una conducta imprevisible. Ahora Francis lleva una vida solitaria, pero un reencuentro en los terrenos de la clausurada institución remueve algo profundo en su mente agitada: unos recuerdos sombríos sobre los truculentos hechos que condujeron al cierre del W. S. Hospital, y el asesinato sin resolver de una joven enfermera, cuyo cadáver mutilado fue encontrado una noche después del cierre de las luces. La policía sospechó de un paciente, pero sólo ahora, con la reaparición del asesino, se conocerá la respuesta.','p',123,NULL,NULL,4,26),(5,'La mujer habitada','mujer_habitada.jpg',1500.00,'Tras terminar sus estudios de arquitectura en Europa, Lavinia regresa a Latinoamérica para emprender su camino como mujer independiente. Pero sus planes cambian cuando conoce a Felipe, con quien establece una profunda relación sentimental. A su lado le llega la oportunidad de implicarse en las luchas populares y los movimientos de liberación de la dictadura de su país, conectando de ese modo con Itzá, una indígena que luchó contra los invasores españoles y que ahora despierta reencarnada en un naranjo para acompañar, apoyar e inspirar a Lavinia.','d',123421,400,'1996-02-28',5,26),(6,'El gran cuaderno','gran_cuaderno.jpg',1250.00,'En una sucesión de viñetas, a modo de breves sainetes de impasible horror, El Gran Cuaderno nos narra el triple aprendizaje —el de la vida, de la escritura y de la crueldad— por parte de dos hermanos gemelos que ascienden desde una infancia sombría a una adolescencia infernal, en un país en guerra. Encrucijada de mundos, entre Este y Oeste, y a la vez encrucijada del mecánico aniquilamiento totalitario, El Gran Cuaderno revela, en su hiriente poesía que linda con el humor negro y con lo superreal, el envés de la infancia, enfrentada a la crueldad y al lado oscuro del sexo y las relaciones de poder en un mundo que es un espejo deformante, pero paradójica y dolorosamente fiel, de más de un aspecto de la vida en la Europa de nuestro siglo.','p',97884322,192,'1986-04-04',6,26),(7,'Crónica del pájaro que da cuerda al mundo','cronica_pajaro.jpg',1700.00,'Tooru Okada, un joven japonés que acaba de dejar voluntariamente su trabajo en un bufete de abogados, recibe un buen día la llamada anónima de una mujer. A partir de ese momento la vida de Tooru, que había transcurrido por los cauces de la más absoluta normalidad, empieza a sufrir una extraña transformación. A su alrededor van apareciendo personajes cada vez más extraños, y la realidad, o lo real, va degradándose hasta convertirse en algo fantasmagórico. La percepción del mundo se vuelve mágica, los sueños son realidad y, poco a poco, Tooru Okada deberá resolver los conflictos que, sin sospecharlo siquiera, ha arrastrado a lo largo de toda su vida. Crónica del pájaro que da cuerda al mundo pinta una galería de personajes tan sorprendentes como profundamente reales. El mundo cotidiano del Japón moderno se nos aparece de pronto como algo extrañamente familiar.','p',983653892,912,'2008-01-01',1,26),(8,'Tokio blues (Norwegian wood)','tokio_blues.jpg',1500.00,'Toru Watanabe, un ejecutivo de 37 años, escucha casualmente mientras aterriza en un aeropuerto europeo una vieja canción de los Beatles, y la música le hace retroceder a su juventud, al turbulento Tokio de finales de los sesenta. Toru recuerda, con una mezcla de melancolía y desasosiego, a la inestable y misteriosa Naoko, la novia de su mejor –y único– amigo de la adolescencia, Kizuki. El suicidio de éste les distancia durante un año hasta que se reencuentran en la universidad. Inician allí una relación íntima; sin embargo, la frágil salud mental de Naoko se resiente y la internan en un centro de reposo. Al poco, Toru se enamora de Midori, una joven activa y resuelta. Indeciso, sumido en dudas y temores, experimenta el deslumbramiento y el desengaño allá donde todo parece cobrar sentido: el sexo, el amor y la muerte. La situación, para él, para los tres, se ha vuelto insostenible; ninguno parece capaz de alcanzar el delicado equilibrio entre las esperanzas juveniles y la necesidad de encontrar un lugar en el mundo.','p',978848383,384,'2007-05-01',1,26),(9,'Sputnik mi amor','sputnik_mi_amor.jpg',1300.00,'Perdidos en la inmensa metrópoli de Tokio, tres personas se buscan desesperadamente intentando romper el eterno viaje circular de la soledad; un viaje parecido al del satélite ruso Sputnik, donde la perra Laika giraba alrededor de la Tierra y dirigía su atónita mirada hacia el espacio infinito. El narrador, un joven profesor de primaria, está enamorado de Sumire, a quien conoció en la universidad. Pero Sumire tiene una única obsesión: ser novelista; además se considera la última rebelde, viste como un muchacho, fuma como un carretero y rechaza toda convención moral. Un buen día, Sumire conoce a Myû en una boda, una mujer casada de mediana edad tan hermosa como enigmática, y se enamora apasionadamente de ella. Myû contrata a Sumire como secretaria y juntas emprenden un viaje de negocios por Europa que tendrá un enigmático final.','p',978848383,256,'2008-03-01',1,26),(10,'El Fin del Mundo y un Despiadado País de las Maravillas','fin_mundo_despiadado_pais.jpg',1550.00,'Dos historias paralelas se desarrollan en escenarios de nombre evocador: una transcurre en el llamado «fin del mundo», una misteriosa ciudad amurallada; la otra, en un Tokio de un futuro quizá no muy lejano, un frío y despiadado país de las maravillas. En la primera, el narrador y protagonista, anónimo, se ve privado de su sombra, poco a poco también de sus recuerdos, e impelido a leer sueños entre unos habitantes de extrañas carencias anímicas y unicornios cuyo pelaje se torna dorado en invierno. En la segunda historia, el protagonista es un informático de gustos refinados que trabaja en una turbia institución gubernamental, enfrentada a otra organización no menos siniestra en una guerra por el control de la información; sus servicios son requeridos por un inquietante científico que juguetea con la manipulación de la conciencia y de la mente y vive aislado en la red de alcantarillado, una red poblada por los tinieblos, tenebrosas criaturas carnívoras.','d',978848383,624,'2011-03-01',1,26),(11,'La verdad sobre el caso Harry Quebert','harry_quebert.jpg',1750.00,'Quién mató a Nola Kellergan es la gran incógnita a desvelar en esta incomparable historia policíaca cuya experiencia de lectura escapa a cualquier tentativa de descripción. Intentémoslo: Una novela de suspense a tres tiempos -1975, 1998 y 2008- acerca del asesinato de una joven de quince años en la pequeña ciudad de Aurora, en New Hampshire. En 2008, Marcus Goldman, un joven escritor, visita a su mentor -Harry Quebert, autor de una aclamada novela- y descubre que éste tuvo una relación secreta con Nola Kellergan. Poco después, Harry es arrestado y acusado de asesinato al encontrarse el cadáver de Nola enterrado en su jardín. Marcus comienza a investigar y a escribir un libro sobre el caso. Mientras busca demostrar la inocencia de Harry, una trama de secretos sale a la luz. La verdad solo llega al final de un largo, intrincado y apasionante recorrido.','d',978987725,672,'2018-10-18',2,26),(12,'El enigma de la habitación 622','enigma_habitacion_622.jpg',1900.00,'Un cadáver yace en el suelo de la habitación 622 del Palace de Verbier, un hotel en los Alpes suizos. La investigación policial no llegará nunca a término y el paso del tiempo hará que muchos lo olviden. Años más tarde, el escritor Joël Dicker llega a ese mismo hotel para recuperarse de una ruptura sentimental, y termina investigando el viejo crimen con Scarlett, la bella huésped y aspirante a novelista de la habitación contigua, que lo acompañará en la búsqueda mientras intenta aprender también las claves para escribir un buen libro.','p',978842043,620,'2020-06-03',2,26),(13,'La desaparición de Stephanie Mailer','stephanie_mailer.jpg',2500.00,'La noche del 30 de julio de 1994, la apacible población de Orphea, en la región de los Hamptons, asiste a la gran apertura del festival de teatro. Pero el alcalde se retrasa... Mientras tanto, un hombre recorre las calles vacías buscando a su mujer, hasta hallar su cadáver ante la casa del alcalde. Dentro, toda la familia ha sido asesinada. Jesse Rosenberg y Derek Scott, dos jóvenes y brillantes policías de Nueva York, resuelven el caso. Pero veinte años más tarde, en la ceremonia de despedida de la policía a Rosenberg, la periodista Stephanie Mailer lo enfrenta: asegura que Derek y Jesse se equivocaron de asesino a pesar de que la prueba estaba delante de sus ojos, y afirma poseer información clave. Días después, desaparece. Así se inicia este colosal thriller, que avanza en el pasado y el presente a ritmo vertiginoso, sumando tramas, personajes, sorpresas y vueltas de tuerca, sacudiendo y precipitando al lector sin freno posible hacia el inesperado e inolvidable desenlace.','p',978987738,656,'2018-03-01',2,26),(14,'Los últimos días de nuestros padres','los_ultimos_dias_de_nuestros_padres.jpg',1999.00,'En 1940 Winston Churchill tiene una idea que cambiará el curso de la guerra: crear una nueva sección de los servicios secretos, el Special Operations Executive (SOE), para llevar a cabo acciones de sabotaje desde el interior de las líneas enemigas. Unos meses más tarde, el joven Paul-Émile deja París rumbo a Londres con la esperanza de unirse a la Resistencia. El SOE no tarda en llamarlo a sus filas, junto a un grupo de jóvenes compañeros. Tras un entrenamiento brutal, los pocos elegidos conocerán el amor, el miedo y la amistad, y serán enviados en misión a la Francia ocupada. Pero el contraespionaje alemán ya ha sido alertado.','p',97884204,408,'2014-11-05',2,26),(15,'Asesinos sin rostro','asesinos_sin_rostros.jpg',1500.00,'El extraño y cruel asesinato de un matrimonio de ancianos en la campiña sueca revela a Kurt Wallander la cara más oscura de la Suecia moderna. En este histórico primer encuentro con sus lectores, el inspector Wallander debe resolver un caso casi tan complicado como su vida personal. Mientras procura desenmascarar a los despiadados asesinos de una anciana que ha muerto con la palabra extranjero en la boca antes de que los prejuicios raciales latentes en la comunidad desaten una ola de violencia vengadora, Wallander debe enfrentar el abandono de su esposa, la hostilidad de su hija, la demencia senil de su padre y hasta su propio deterioro físico a causa del exceso de alcohol y comida barata y la falta de sueño. Wallander terminarán por hallar la inesperada solución del caso, pero sus problemas familiares no acabarán con este libro. Por no hablar de los de su país, arrojado a una nueva era en la que, como cree el inspector, -la inquietud aumentará bajo el cielo-','p',97884838,304,'2008-06-01',3,26),(16,'El hombre inquieto','el_hombre_inquieto.jpg',1999.00,'La vida del inspector Kurt Wallander ha cambiado ligeramente: no sólo ha hecho realidad su sueño de tener una casa en el campo, sino que, además, su hija Linda lo ha convertido en abuelo. Sin embargo, su tranquilidad se ve perturbada poco despues, un día de invierno de 2008, cuando el suegro de Linda, un oficial de alto rango de la Marina sueca llamado Håkan von Enke, desaparece en un bosque cerca de Estocolmo. Aunque la investigación la dirige la policía de Estocolmo, Wallander no puede evitar implicarse, sobre todo cuando una segunda persona desaparece en misteriosas circunstancias. Algunas pistas apuntan a grupos de extrema derecha en el seno de la Marina sueca y a la epoca de la Guerra Fría, en particular a la decada de los ochenta, cuando varios submarinos sovieticos fueron acusados de violar territorio sueco. Wallander comprende que está a punto de desvelar un gran secreto cuyo alcance abarcaría toda la historia de Suecia tras la segunda guerra mundial. Pero una nube aún más negra asoma por el horizonte.','d',97884838,592,'2011-05-01',3,26),(17,'La leona blanca','la_leona_blanca.jpg',1190.00,'La leona blanca: Una tarde de 1992, una mujer es brutalmente asesinada en una apartada granja de Escania. Todo parece indicar que vio algo que no debía ver. Una vez más, en Ystad, el inspector Kurt Wallander debe apartar sus problemas personales y tratar de resolver el misterio.Paralelamente, en Sudáfrica, una organización de extrema derecha planea asesinar a un importante dirigente político.Para ello contrata los servicios de un asesino a sueldo, quien empieza la preparación de un atentado en Suecia, muy cerca de Ystad','p',978987154,656,'2008-06-01',3,26),(18,'Rebeliones y Revelaciones','71C+aFXa95L.jpg',2500.00,'“La mujer que se rebela, se revela” proclamó José Coronel Urtecho de Gioconda Belli en su primer poemario. En esta nueva obra, a caballo entre la autobiografía, el ensayo y la antología, Belli le da la razón y se nos revela como la mujer que se enfrentó a todas las opresiones: se unió a la lucha del FSLN contra la dictadura somocista y se reveló, desde su cuerpo y su sensualidad, a través de la poesía, como mujer frente al machismo. Toda su trayectoria vital y literaria queda recogida en Rebeliones y revelaciones, porque, como afirma Laura Mintegi en el prefacio de esta edición, “nadie como ella ha analizado realmente quién es Gioconda Belli. Y lo ha hecho de la manera más femenina que se puede concebir: pensando a través de sus afectos y de sus intuiciones. Porque la literatura femenina es eso, escribir desde lo que se es, desde el hecho de ser mujer”. Una introspección profunda e inmisericorde de su ser mujer.','p',978841706,235,'2018-04-01',5,26),(19,'Pisando los talones','pisando_los_talones.jpg',1650.00,'Uno de los casos más complejos y llenos de suspense de la célebre serie policiaca protagonizda por el inspector Kurt Wallander. El inspector Wallander regresa de sus vacaciones de verano y, ya metido en la rutina, empieza a acusar un extraño agotamiento que está a punto de costarle la vida en un extraño accidente de tráfico. Cuando acude al médico, se lleva un buen susto al saber el diagnóstico. Para colmo, Svedverg, uno de sus colegas, no aparece a su vuelta de las vacaciones, y una madre presiona a los agentes para que la busquen a su hija ; hace ya más de un mes, la joven se marchó de viaje con unos amigos de manera imprevista, y todo indica que  las postales que han enviado son falsas. Svedberg, que sigue sin dar señales de vida, ¿no estaba investigando esas desapariciones? Wallander no puede imaginar las incógnitas que le presentará este caso... ni los sangrientos crímenes que deberá resolver, <>, como le pide el fiscal.','p',978848383,736,'2009-06-01',3,26),(20,'La Sombra','la_sombra.jpg',2650.00,'En el Berlín de 1943 pocos vieron su cara, y nadie supo su nombre. Entre susurros era conocido como Der Schattenmann, la Sombra, un despiadado delator judío que colaboraba con la Gestapo. Miami, finales del siglo XX. La vida del detective retirado Simón Winter da un giro repentino cuando recibe la visita de una aterrorizada vecina,una anciana cree haber visto a un fantasma del pasado. Cuando a la mañana siguiente aparece estrangulada, Winter es el único que sospecha la terrible verdad: un escurridizo asesino está exterminando a los supervivientes del Holocausto que viven en Miami.','d',978849872,456,'1995-03-24',4,26),(21,'El Psicoanalista','el_psicoanalista.png',2350.00,'Felíz aniversario, doctor. Bienvenido al primer día de su muerte.- Así comienza el anónimo que recibe el psicoanalista Frederick Starks, y que le obliga a emplear toda su astucia y rapidez para, en quince días, averiguar quién es el autor de esa amenazadora misiva que promete hacerle la vida imposible. De no conseguir su objetivo, deberá elegir entre suicidarse o ser testigo de cómo, uno tras otro, sus familiares y conocidos mueren por obra de un psicópata decidido a llevar hasta el final su sed de venganza. Dando un inesperado giro a la relación entre médico y paciente, John Katzenbach nos ofrece una novela emblemática del mejor suspense psicológico. La edición publicada en 2012 para conmemorar el décimo aniversario de la primera edición original de El psicoanalista, incluye un epílogo que John Katzenbach ha escrito especialmente para los lectores en lengua española.','p',978987627,400,'2002-01-29',4,26),(22,'Claus y Lucas','claus_lucas.jpg',2500.00,'En un país en guerra ocupado por un ejército extranjero, dos hermanos, Claus y Lucas, han sido abandonados por su familia y puestos al cuidado de su abuela, a la que sus vecinos llaman la Bruja. La barbarie del convulso mundo en el que viven les lleva a emular la crueldad que ven en él. De una inteligencia superior, serán capaces de utilizar cualquier recurso para sobrevivir, pero una vez asegurada su supervivencia intentarán poner remedio a muchas de las dramáticas situaciones que les rodean. Los distintos caminos que terminan eligiendo al final de la guerra marcarán sus vidas para siempre. Formado por las novelas El gran cuaderno, La prueba y La tercera mentira, el tríptico Claus y Lucas es un retrato poliédrico de la complejidad humana, un libro extraordinario sobre los horrores de la guerra y los totalitarismos.Basado en las vivencias infantiles de su autora, una exiliada húngara que lo escribió en francés, este libro que se publicó por primera vez a finales de los años ochenta es un auténtico clásico moderno.','p',978841700,472,'2019-02-25',6,26),(23,'Retrato en sangre','retrato_en_sangre.jpg',1950.00,'No era un viaje normal por carretera… Miami, Nueva Orleans, Kansas City, Omaha, Chicago, Cleveland. Un hombre, una mujer, un coche y una cámara fotográfica. Él secuestra, mata y después fotografía a sus víctimas. Ella escribe sobre lo ocurrido y se asegura de que ha plasmado correctamente la historia, porque sabe que él lo revisa todo. La detective Mercedes Barren tiene motivos para perseguirlo: su sobrina fue una víctima. Y también el psiquiatra Martin Jeffers, especialista en delitos sexuales. Una odisea. Una expedición. Una pesadilla que se adentra en el día siguiente… con Retrato en sangre. Otra de las grandes intrigas de John Katzenbach.','p',978849070,576,'1987-06-06',4,26),(24,'Un asunto pendiente','un_asunto_pendiente.jpg',2300.00,'Megan y Duncan Richards son gente normal. Él es banquero; ella, agente inmobiliaria. Tienen dos hijas adolescentes y un hijo. Viven en una casa preciosa. Todo indica que sus días de activistas políticos, allá por 1968, han quedado muy atrás. Después de todo, cualquiera que fuera joven en 1968 tiene un pasado activista. Pero Megan y Duncan son distintos. Ellos fueron un poco más lejos. Empujados por una hermosa mujer que se hacía llamar Tania y que dirigía un grupo radical llamado la Brigada de Phoenix, tomaron parte en un robo que, según Tania, sería sencillo y sin derramamiento de sangre, pero no fue así. Desde entonces han pasado 18 años. Y ahora, cuando los Richards disfrutan de su tranquilidad familiar, Tania está a punto de salir de la cárcel. Lleva 18 años planeando cómo vengarse de las dos personas a las que culpa de lo que ocurrió aquel día. Su venganza será dulce, será perversa. Empezará por su hijo.','p',978848365,512,'2000-05-06',4,26),(25,'Sofía de los presagios','sofia_de_los_presagios.jpg',1900.00,'A los siete años, la pequeña Sofía se pierde entre la gente en medio de una discusión de sus padres y del desplazamiento atropellado de los gitanos. El destino le brinda otros padres entrañables y un mundo nuevo, pero la enfrenta a muchas situaciones dolorosas y a un marido que la encierra y la priva de su libertad. Protegida por seres dotados de una sabiduría milenaria, la sangre y la rebeldía gitanas de Sofía se imponen a través de rituales y ceremonias antiguas, que la conducen finalmente hacia su verdadero origen y a dar, por fin, con el amor de su vida.','p',978843221,344,'2013-06-06',5,26),(26,'El País de las Mujeres','el_pais_de_las_mujeres.jpg',2300.00,'\'Ajena ya a su rol de protagonista, normalizado el flujo de adrenalina de su actuación pública, pudo reparar en un hombre con la cabeza cubierta por una gorra azul que se abría paso entre la multitud. Lo vio acercarse y alzar los brazos. Muy tarde reconoció su intención. No oyó el disparo pero un calor viscoso la golpeó fuertemente en el pecho y la frente y le hizo perder el equilibrio.\' En las elecciones de Paguas -país imaginario que aparece en las novelas de Gioconda Belli- ha triunfado el PIE (Partido de la Izquierda Erótica). Sus atrevidas integrantes tienen un propósito inclaudicable: cambiar el rumbo de su país, limpiarlo como si se tratara de una casa descuidada, barrerlo hasta sacarle brillo. Pero nada de esto resulta fácil para la presidenta Viviana Sansón y sus ministras, sometidas a constantes ataques por parte de sus enemigos. ¿Podrán sobrellevarlo y sobrevivir? ¿Será Paguas, al final de su administración, un país mejor? El país de las mujeres es una novela divertida y audaz, por la que la reconocida autora nicarag ¼ense obtuvo el Premio Hispanoamericano de Novela La Otra Orilla en 2010.','p',978950731,280,'2010-11-01',5,26),(27,'Ayer','ayer.jpg',2750.00,'Sándor Lester, exiliado en una fría ciudad europea, lleva una vida solitaria y monótona. Inmerso en una rutina alienante en la fábrica de relojes donde trabaja, pasa sus ratos libres escribiendo, frecuentando a gente en su misma situación o en compañía de Yolanda, una mujer a la que no ama. Un día conoce a Line, una nueva empleada de la fábrica que procede de su mismo país. Aunque está casada y tiene una hija de corta edad, Sándor se enamorará de la recién llegada y entre los dos surgirá un vínculo tan íntimo y esencial como doloroso y destructivo. Al igual que su famosa trilogía Claus y Lucas, esta novela contiene ecos de la propia biografía de Agota Kristof, escritora húngara refugiada en Suiza. En ella utiliza una prosa perfectamente depurada, precisa y despersonalizada con la que crea una penetrante y perturbadora atmósfera para retratar las miserias y crueldades del mundo contemporáneo. Lúcida e impactante, Ayer es sin duda una de las mejores obras de la autora.','d',978841797,112,'2021-09-20',6,26),(28,'El intenso calor de la luna','el_intenso_calor_de_la_luna.jpg',2500.00,'La nueva novela de Gioconda Belli sobre los secretos, experiencias y aventuras de una mujer que entra en la época del temido cambio que anuncia la madurez.Tras dedicarse por entero a formar una familia, dejando atrás proyectos profesionales,Emma llega a la madurez de sus 48 años. Sus dos hijos ya se han marchado de casa y la relación con su marido ha perdido el encanto de los primeros años. Cuando su cuerpo de mujer atractiva y sensual muestra los primeros signos de cambio, Emma se angustia y teme perder los atributos de su feminidad. En medio de una vorágine de pensamientos negativos, un hecho fortuito la lleva a entrar en contacto con una realidad ajena a la suya donde encuentra una inesperada pasión que cuestiona su apacible rutina y la lleva a descubrir el gozo, la sexualidad y las posibilidades de realización de esta nueva etapa de su vida.El intenso calor de la luna cuenta la historia de Emma, un personaje flaubertiano que se rebela contra el papel que le impone la sociedad a la mujer madura. Gioconda Belli explora la identidad femenina en la menopausia, cuando la mujer debe ir más allá de los mitos que centran su valor en la belleza juvenil y la fertilidad, para descubrir un nuevo erotismo y el poder de ser ella misma.','p',978843223,320,'2017-03-07',5,26),(29,'La Analfabeta: Relato autobiográfico','la_analfabeta.jpg',2750.00,'Once breves capítulos para once momentos de la intensa vida de Agota Kristof. Una obra autobiográfica que sintetiza en estos bellos fragmentos los once momentos fundamentales de una existencia apasionada. Estas páginas han sido definidas por la crítica como «un regalo para el intelecto»; un trayecto vital que describe primero a una joven que devora libros en húngaro para luego dar la palabra a una escritora mundialmente reconocida en otro idioma, el francés. De una infancia feliz a la pobreza después de la guerra, pasando por los años de soledad en el internado, la muerte de Stalin, la lengua materna y las lenguas enemigas como el alemán y el ruso, la huida de Austria y la llegada a Lausanne con su bebé. Las palabras de Agota Kristof nunca son tristes, son implacables, justas y precisas. Todo el mundo de Agota Kristof está aquí, en este libro caracterizado por frases breves, minimalistas, diminutas en las que se concentran en todo momento las grandes reflexiones y los poderosos pensamientos que las han provocado.','d',978849283,64,'2015-02-16',6,26),(30,'El Monstruo y otras obras','el_monstruo_y_otras_obras.jpg',1550.00,'El Monstruo (1974). Un monstruo ha caído en la trampa. Tras el temor y el pánico de los primeros instantes, los habitantes del pueblo, embriagados por el perfume de las flores que crecen sobre el lomo del Monstruo, se someten gustosos a su influencia. La carretera (1976). La Tierra está cubierta de carreteras. ¿A dónde llevan? ¿De qué sirven las direcciones? ¿Hay salida?La epidemia (1975). Un pueblo está en cuarentena por una extraña epidemia de suicidios. Un chico rescata a una joven que ha encontrado colgada en el bosque, pero la joven no quiere ser salvada. La expiación (1982). Un ciego toca la armónica. Un sordo se saca unas monedas como tragafuegos. Ambos comparten la misma cama caliente en casa de una vieja usurera. Sus vidas son miserables pero, ¿merecen compasión?','p',978841703,192,'2019-12-04',6,26);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsEditorials`
--

DROP TABLE IF EXISTS `productsEditorials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productsEditorials` (
  `idproductEditorial` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `editorial_id` int(11) NOT NULL,
  PRIMARY KEY (`idproductEditorial`),
  KEY `product_id_idx` (`product_id`),
  KEY `editorial_id_idx` (`editorial_id`),
  CONSTRAINT `editorial_id` FOREIGN KEY (`editorial_id`) REFERENCES `editorials` (`ideditorial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`idproduct`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsEditorials`
--

LOCK TABLES `productsEditorials` WRITE;
/*!40000 ALTER TABLE `productsEditorials` DISABLE KEYS */;
INSERT INTO `productsEditorials` VALUES (1,1,6),(2,2,1),(3,3,7),(4,4,8);
/*!40000 ALTER TABLE `productsEditorials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `admin` char(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `avatar` varchar(64) DEFAULT NULL,
  `user_name` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `birth_date` date NOT NULL,
  `phone_number` int(11) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'a','nico@tbs.com','soyNico',NULL,'Nico','Nicolás','Guiñazu','1991-06-05',1151234567),(2,'a','marque@tbs.com','soyMarque',NULL,'Marque','Marcos','Cardozo','1988-09-15',1157654123),(3,'a','pablito@tbs.com','soyPablito',NULL,'Pablito','Pablo','Camarotta','1984-09-06',1155674321),(4,'a','pia@tbs.com','soyPia',NULL,'Pía','María Pía','Trebucq','1987-03-24',1154352671),(5,'a','seba@tbs.com','soySeba',NULL,'Seba','Sebastián','Sultano','2000-03-11',1131234567);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-10  1:13:15
