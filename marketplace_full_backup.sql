-- MySQL dump 10.13  Distrib 9.4.0, for Linux (x86_64)
--
-- Host: localhost    Database: marketplace_lg
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `marketplace_lg`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `marketplace_lg` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `marketplace_lg`;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Automotriz','Equipos y accesorios informáticos.','2022-06-11'),(2,'Muebles','Prendas de vestir y accesorios de moda para todas las edades.','2021-07-23'),(3,'Juguetes','Artículos y alimentos para el cuidado de mascotas.','2020-05-25'),(4,'Belleza y Cuidado Personal','Teléfonos móviles y accesorios más vendidos en Colombia.','2023-06-26'),(5,'Libros','Muebles para el hogar y la oficina.','2020-09-24'),(6,'Belleza y Cuidado Personal','Juguetes y juegos educativos para niños de todas las edades.','2023-11-10'),(7,'Ropa y Accesorios','Accesorios, repuestos y herramientas para automóviles y motos.','2023-11-08'),(8,'Juguetes','Productos de belleza, maquillaje y cuidado personal.','2022-01-07'),(9,'Belleza y Cuidado Personal','Juguetes y juegos educativos para niños de todas las edades.','2021-01-05'),(10,'Juguetes','Productos de belleza, maquillaje y cuidado personal.','2020-02-24'),(11,'Automotriz','Productos tecnológicos y gadgets populares en Colombia.','2024-12-05'),(12,'Deportes','Juguetes y juegos educativos para niños de todas las edades.','2025-05-28'),(13,'Electrónica','Equipos y ropa deportiva para uso profesional y recreativo.','2021-05-24'),(14,'Automotriz','Juguetes y juegos educativos para niños de todas las edades.','2022-02-03'),(15,'Automotriz','Artículos para el hogar, cocina y decoración.','2024-09-07'),(16,'Belleza y Cuidado Personal','Productos tecnológicos y gadgets populares en Colombia.','2022-03-31'),(17,'Hogar y Cocina','Libros de autores nacionales e internacionales.','2024-03-16'),(18,'Hogar y Cocina','Equipos y ropa deportiva para uso profesional y recreativo.','2022-08-03'),(19,'Computadores','Muebles para el hogar y la oficina.','2020-11-26'),(20,'Juguetes','Equipos y ropa deportiva para uso profesional y recreativo.','2021-06-04'),(21,'Ropa y Accesorios','Productos tecnológicos y gadgets populares en Colombia.','2023-10-11'),(22,'Electrónica','Juguetes y juegos educativos para niños de todas las edades.','2025-07-01'),(23,'Ropa y Accesorios','Teléfonos móviles y accesorios más vendidos en Colombia.','2025-05-26'),(24,'Mascotas','Equipos y accesorios informáticos.','2022-04-14'),(25,'Belleza y Cuidado Personal','Prendas de vestir y accesorios de moda para todas las edades.','2023-05-02'),(26,'Celulares','Libros de autores nacionales e internacionales.','2023-03-07'),(27,'Ropa y Accesorios','Muebles para el hogar y la oficina.','2023-10-10'),(28,'Belleza y Cuidado Personal','Productos de belleza, maquillaje y cuidado personal.','2020-09-20'),(29,'Automotriz','Teléfonos móviles y accesorios más vendidos en Colombia.','2025-05-13'),(30,'Mascotas','Teléfonos móviles y accesorios más vendidos en Colombia.','2020-01-18'),(31,'Mascotas','Artículos y alimentos para el cuidado de mascotas.','2024-08-06'),(32,'Automotriz','Artículos para el hogar, cocina y decoración.','2021-08-02'),(33,'Computadores','Equipos y ropa deportiva para uso profesional y recreativo.','2020-09-26'),(34,'Ropa y Accesorios','Teléfonos móviles y accesorios más vendidos en Colombia.','2021-10-24'),(35,'Electrónica','Productos de belleza, maquillaje y cuidado personal.','2022-03-07'),(36,'Deportes','Equipos y accesorios informáticos.','2025-01-16'),(37,'Libros','Accesorios, repuestos y herramientas para automóviles y motos.','2021-05-02'),(38,'Hogar y Cocina','Teléfonos móviles y accesorios más vendidos en Colombia.','2021-06-20'),(39,'Hogar y Cocina','Accesorios, repuestos y herramientas para automóviles y motos.','2023-12-26'),(40,'Juguetes','Equipos y ropa deportiva para uso profesional y recreativo.','2020-07-27'),(41,'Belleza y Cuidado Personal','Artículos para el hogar, cocina y decoración.','2020-09-23'),(42,'Belleza y Cuidado Personal','Equipos y accesorios informáticos.','2025-01-08'),(43,'Deportes','Productos tecnológicos y gadgets populares en Colombia.','2021-03-18'),(44,'Juguetes','Teléfonos móviles y accesorios más vendidos en Colombia.','2024-01-14'),(45,'Celulares','Artículos para el hogar, cocina y decoración.','2024-04-21'),(46,'Deportes','Productos tecnológicos y gadgets populares en Colombia.','2022-03-27'),(47,'Electrónica','Libros de autores nacionales e internacionales.','2022-02-19'),(48,'Belleza y Cuidado Personal','Productos tecnológicos y gadgets populares en Colombia.','2021-06-13'),(49,'Ropa y Accesorios','Equipos y accesorios informáticos.','2022-01-03'),(50,'Deportes','Accesorios, repuestos y herramientas para automóviles y motos.','2022-03-24'),(51,'Hogar y Cocina','Accesorios, repuestos y herramientas para automóviles y motos.','2021-10-03'),(52,'Deportes','Libros de autores nacionales e internacionales.','2023-06-05'),(53,'Mascotas','Equipos y ropa deportiva para uso profesional y recreativo.','2020-11-02'),(54,'Celulares','Juguetes y juegos educativos para niños de todas las edades.','2022-04-05'),(55,'Computadores','Productos tecnológicos y gadgets populares en Colombia.','2023-04-22'),(56,'Mascotas','Accesorios, repuestos y herramientas para automóviles y motos.','2024-08-16'),(57,'Electrónica','Equipos y accesorios informáticos.','2024-11-12'),(58,'Ropa y Accesorios','Juguetes y juegos educativos para niños de todas las edades.','2021-01-06'),(59,'Automotriz','Productos de belleza, maquillaje y cuidado personal.','2022-10-25'),(60,'Automotriz','Productos tecnológicos y gadgets populares en Colombia.','2023-03-05'),(61,'Belleza y Cuidado Personal','Prendas de vestir y accesorios de moda para todas las edades.','2022-11-11'),(62,'Libros','Libros de autores nacionales e internacionales.','2021-06-28'),(63,'Juguetes','Prendas de vestir y accesorios de moda para todas las edades.','2025-02-13'),(64,'Automotriz','Equipos y ropa deportiva para uso profesional y recreativo.','2024-05-26'),(65,'Juguetes','Equipos y accesorios informáticos.','2025-07-19'),(66,'Belleza y Cuidado Personal','Accesorios, repuestos y herramientas para automóviles y motos.','2024-08-22'),(67,'Automotriz','Artículos y alimentos para el cuidado de mascotas.','2020-04-01'),(68,'Mascotas','Prendas de vestir y accesorios de moda para todas las edades.','2025-06-04'),(69,'Computadores','Equipos y accesorios informáticos.','2023-08-20'),(70,'Belleza y Cuidado Personal','Libros de autores nacionales e internacionales.','2020-02-21'),(71,'Computadores','Equipos y accesorios informáticos.','2020-01-08'),(72,'Belleza y Cuidado Personal','Equipos y accesorios informáticos.','2025-03-27'),(73,'Juguetes','Artículos y alimentos para el cuidado de mascotas.','2023-02-10'),(74,'Deportes','Productos de belleza, maquillaje y cuidado personal.','2025-04-05'),(75,'Computadores','Prendas de vestir y accesorios de moda para todas las edades.','2022-05-13'),(76,'Juguetes','Equipos y accesorios informáticos.','2020-08-30'),(77,'Deportes','Muebles para el hogar y la oficina.','2021-01-14'),(78,'Muebles','Muebles para el hogar y la oficina.','2021-10-07'),(79,'Ropa y Accesorios','Muebles para el hogar y la oficina.','2020-07-03'),(80,'Ropa y Accesorios','Libros de autores nacionales e internacionales.','2020-09-03'),(81,'Mascotas','Equipos y accesorios informáticos.','2024-12-30'),(82,'Electrónica','Productos tecnológicos y gadgets populares en Colombia.','2022-10-06'),(83,'Deportes','Productos tecnológicos y gadgets populares en Colombia.','2022-06-19'),(84,'Computadores','Productos tecnológicos y gadgets populares en Colombia.','2024-02-25'),(85,'Deportes','Juguetes y juegos educativos para niños de todas las edades.','2024-12-05'),(86,'Automotriz','Productos de belleza, maquillaje y cuidado personal.','2021-11-15'),(87,'Mascotas','Equipos y ropa deportiva para uso profesional y recreativo.','2022-06-16'),(88,'Computadores','Juguetes y juegos educativos para niños de todas las edades.','2023-03-10'),(89,'Deportes','Productos de belleza, maquillaje y cuidado personal.','2022-07-23'),(90,'Hogar y Cocina','Productos tecnológicos y gadgets populares en Colombia.','2024-05-08'),(91,'Ropa y Accesorios','Equipos y ropa deportiva para uso profesional y recreativo.','2020-01-29'),(92,'Celulares','Teléfonos móviles y accesorios más vendidos en Colombia.','2022-06-24'),(93,'Belleza y Cuidado Personal','Juguetes y juegos educativos para niños de todas las edades.','2024-12-23'),(94,'Mascotas','Productos tecnológicos y gadgets populares en Colombia.','2024-06-01'),(95,'Computadores','Equipos y ropa deportiva para uso profesional y recreativo.','2023-05-07'),(96,'Electrónica','Juguetes y juegos educativos para niños de todas las edades.','2023-04-03'),(97,'Deportes','Libros de autores nacionales e internacionales.','2023-11-09'),(98,'Muebles','Teléfonos móviles y accesorios más vendidos en Colombia.','2025-09-20'),(99,'Hogar y Cocina','Prendas de vestir y accesorios de moda para todas las edades.','2020-01-06'),(100,'Deportes','Teléfonos móviles y accesorios más vendidos en Colombia.','2024-11-05');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'juana','juanaglen@gmail.com','+57 3126909292','calle 54 50 105 , La guajira','Gonzalez','2021-05-16'),(2,'Pedro','pedro.vila@outlook.com','+57 2653637766','Cañada Ignacio Camacho #380, Pereira','Vila','2020-05-01'),(3,'Sebastian','sebastian.villanueva@gmail.com','+57 8749346907','Via de Francisco Jose Luz #7, Barranquilla','Villanueva','2024-04-30'),(4,'Chus','chus.sáenz@outlook.com','+57 5233075166','Plaza de Araceli Fernandez #72, Bogotá','Sáenz','2021-06-08'),(5,'Maura','maura.castilla@yahoo.com','+57 4285719143','Vial de Cándida Hernandez #74, Bogotá','Castilla','2025-07-10'),(6,'Serafina','serafina.santamaría@hotmail.com','+57 7898887110','Cuesta de Julia Sureda #4, Bogotá','Santamaría','2024-11-09'),(7,'Toribio','toribio.merino@hotmail.com','+57 3515967037','C. Manola Conesa #3, Bucaramanga','Merino','2025-08-24'),(8,'Brígida','brígida.naranjo@outlook.com','+57 6106924445','Ronda Anabel Santos #16, Cali','Naranjo','2025-05-23'),(9,'Iris','iris.serra@gmail.com','+57 1797535324','Rambla de Victor Aliaga #72, Bucaramanga','Serra','2020-11-25'),(10,'Nicolás','nicolás.peralta@gmail.com','+57 1787391698','Glorieta de Berto Aguirre #90, Manizales','Peralta','2025-07-01'),(11,'Lucio','lucio.cortes@yahoo.com','+57 2184478271','Urbanización de Apolonia Carlos #14, Bogotá','Cortes','2020-04-29'),(12,'Lorenzo','lorenzo.serrano@hotmail.com','+57 5828589306','C. Georgina Palmer #2, Manizales','Serrano','2024-04-15'),(13,'Ariel','ariel.romeu@outlook.com','+57 8274355026','Plaza Gema Mínguez #364, Cali','Romeu','2022-11-18'),(14,'Daniel','daniel.iglesia@yahoo.com','+57 2405406612','Acceso Ángeles Castells #54, Cartagena','Iglesia','2020-03-29'),(15,'Ale','ale.roldan@outlook.com','+57 1062072746','Ronda de Alejo Rojas #45, Cali','Roldan','2022-03-29'),(16,'Alejo','alejo.alemany@gmail.com','+57 4189416402','Via Bautista Millán #1, Medellín','Alemany','2021-01-07'),(17,'José Ángel','joséángel.bermejo@outlook.com','+57 7294667748','Rambla Ramona Becerra #576, Bogotá','Bermejo','2022-07-04'),(18,'Ascensión','ascensión.gual@outlook.com','+57 6546763319','Cañada Emilia Olivera #5, Cartagena','Gual','2024-09-13'),(19,'Elvira','elvira.royo@hotmail.com','+57 8352641495','Avenida de Humberto Villena #40, Bogotá','Royo','2023-08-27'),(20,'Rosalía','rosalía.lopez@yahoo.com','+57 9278765396','Calle Severino Garcés #53, Manizales','Lopez','2023-01-21'),(21,'Ariel','ariel.izaguirre@gmail.com','+57 8256247351','Paseo de Selena Abril #27, Pereira','Izaguirre','2020-06-09'),(22,'Sandalio','sandalio.márquez@outlook.com','+57 9058528635','Pasadizo de Bárbara Riba #46, Bucaramanga','Márquez','2024-05-09'),(23,'Amarilis','amarilis.diéguez@outlook.com','+57 1779088378','Callejón de Manuela Haro #6, Cali','Diéguez','2024-05-03'),(24,'Luna','luna.perales@gmail.com','+57 6477140925','Ronda Iris Carvajal #64, Medellín','Perales','2025-04-02'),(25,'Brígida','brígida.bertrán@outlook.com','+57 9741262814','Avenida Rogelio Salazar #54, Manizales','Bertrán','2021-07-16'),(26,'Elpidio','elpidio.río@outlook.com','+57 6887489792','Cañada de Edu Juan #9, Medellín','Río','2021-07-03'),(27,'María Dolores','maríadolores.céspedes@outlook.com','+57 4293805027','Avenida de Alicia Peñalver #399, Barranquilla','Céspedes','2020-12-23'),(28,'Remigio','remigio.luís@hotmail.com','+57 5571490655','Vial Marco Cornejo #62, Medellín','Luís','2020-06-04'),(29,'Fidel','fidel.izaguirre@hotmail.com','+57 0408163506','Paseo Cesar Roca #13, Bucaramanga','Izaguirre','2024-04-03'),(30,'Fermín','fermín.durán@yahoo.com','+57 4485811959','Avenida Rufino Quesada #25, Barranquilla','Durán','2023-02-15'),(31,'Modesta','modesta.palomares@outlook.com','+57 6777055268','Paseo Maura Bauzà #1, Bogotá','Palomares','2020-06-24'),(32,'María Teresa','maríateresa.salas@yahoo.com','+57 7118558994','Calle Trinidad Arenas #28, Cartagena','Salas','2024-04-04'),(33,'José Mari','josémari.carbonell@gmail.com','+57 1238344733','C. Amparo Iniesta #591, Barranquilla','Carbonell','2025-10-01'),(34,'David','david.sanchez@outlook.com','+57 8861244049','Rambla Luisina Espejo #331, Medellín','Sanchez','2021-07-02'),(35,'Ruperto','ruperto.alemany@outlook.com','+57 9500791852','Acceso de Begoña Vives #768, Bucaramanga','Alemany','2024-10-20'),(36,'Paula','paula.priego@gmail.com','+57 4306238251','Cuesta Tomasa Dávila #85, Cali','Priego','2022-07-31'),(37,'Luciana','luciana.carrera@gmail.com','+57 0391115449','Cuesta de Fernanda Casares #458, Barranquilla','Carrera','2020-05-11'),(38,'Marisa','marisa.mora@hotmail.com','+57 8588793012','Ronda Rosalva Cámara #17, Bogotá','Mora','2024-07-10'),(39,'Tristán','tristán.boada@hotmail.com','+57 4267292334','Urbanización Bartolomé Tovar #90, Cali','Boada','2024-11-23'),(40,'Calisto','calisto.serna@gmail.com','+57 5358072092','Vial de Elías Salazar #370, Bogotá','Serna','2022-08-18'),(41,'Eva','eva.aramburu@hotmail.com','+57 9930318438','C. Buenaventura Cañete #60, Cartagena','Aramburu','2021-06-25'),(42,'Reyna','reyna.cabello@yahoo.com','+57 6002681638','Paseo de Marco Cañellas #71, Barranquilla','Cabello','2024-04-09'),(43,'Cristian','cristian.millán@hotmail.com','+57 1135881750','Calle Juan Antonio Cornejo #55, Barranquilla','Millán','2022-10-14'),(44,'Marita','marita.carbó@outlook.com','+57 0220326107','Calle Josefina Girona #47, Cali','Carbó','2025-05-24'),(45,'Wilfredo','wilfredo.jover@outlook.com','+57 6549145437','Acceso Angelino Carranza #1, Cali','Jover','2023-09-10'),(46,'Sabina','sabina.azcona@gmail.com','+57 6616745001','Rambla de Raúl Ribas #54, Bogotá','Azcona','2020-01-23'),(47,'Máximo','máximo.amigó@yahoo.com','+57 9491548512','Calle Eva María Trillo #60, Pereira','Amigó','2024-08-01'),(48,'Milagros','milagros.banos@gmail.com','+57 6497461114','Rambla Amador Reina #358, Manizales','Baños','2025-07-04'),(49,'Chuy','chuy.casares@gmail.com','+57 9149770544','Camino de Lucho Palma #9, Bucaramanga','Casares','2021-02-23'),(50,'Jafet','jafet.bravo@yahoo.com','+57 4570255053','Vial Débora Vigil #36, Bucaramanga','Bravo','2023-02-14'),(51,'Álvaro','álvaro.villegas@yahoo.com','+57 2041690497','Glorieta Jose Luis Yuste #95, Bogotá','Villegas','2022-08-08'),(52,'Macaria','macaria.aguilera@outlook.com','+57 4409708393','Avenida de Cebrián Márquez #1, Cartagena','Aguilera','2022-11-28'),(53,'Caridad','caridad.perez@gmail.com','+57 9342734959','Avenida de Rocío Pacheco #87, Manizales','Perez','2025-05-21'),(54,'Micaela','micaela.gárate@outlook.com','+57 0364549000','Alameda de Miguel Ángel Diaz #66, Medellín','Gárate','2022-01-18'),(55,'Felipe','felipe.gimenez@outlook.com','+57 3030424158','Camino de Jose Francisco Angulo #292, Barranquilla','Gimenez','2022-05-09'),(56,'Rita','rita.palma@hotmail.com','+57 7054383054','Pasadizo Héctor Huerta #12, Medellín','Palma','2021-05-19'),(57,'Zaira','zaira.bolanos@outlook.com','+57 7069931237','Acceso Florentina Perera #31, Cartagena','Bolaños','2025-08-26'),(58,'Marta','marta.iniesta@yahoo.com','+57 1954796930','Alameda de Gabriela Abella #8, Medellín','Iniesta','2025-02-11'),(59,'Modesto','modesto.santos@gmail.com','+57 5514287064','Plaza de Atilio Ponce #81, Bogotá','Santos','2025-07-30'),(60,'Soledad','soledad.bustos@gmail.com','+57 8606764111','Glorieta Amaya Daza #8, Medellín','Bustos','2023-11-01'),(61,'Roldán','roldán.barrio@yahoo.com','+57 8256488689','Ronda de Roberto Chaparro #3, Cali','Barrio','2020-05-18'),(62,'Severiano','severiano.marcos@gmail.com','+57 2218660175','Glorieta de Che Huguet #87, Bogotá','Marcos','2021-02-28'),(63,'Fabricio','fabricio.fajardo@gmail.com','+57 3358762747','C. de Luna Bravo #830, Bogotá','Fajardo','2025-08-18'),(64,'Melchor','melchor.acero@gmail.com','+57 7669424516','Plaza Cleto Izaguirre #85, Bucaramanga','Acero','2025-01-04'),(65,'Otilia','otilia.lladó@hotmail.com','+57 2728707213','Glorieta de Rocío Peinado #92, Medellín','Lladó','2023-10-16'),(66,'Maxi','maxi.aguilera@yahoo.com','+57 5986801703','Pasaje Américo Amaya #93, Cali','Aguilera','2022-04-23'),(67,'Esperanza','esperanza.bernad@gmail.com','+57 1025286166','Paseo de Benigna Conesa #7, Pereira','Bernad','2023-05-04'),(68,'Eladio','eladio.cases@outlook.com','+57 6066900890','Camino Renata Palomar #31, Barranquilla','Cases','2022-08-30'),(69,'Brígida','brígida.montenegro@outlook.com','+57 4741146052','Vial de Clementina Olivé #21, Medellín','Montenegro','2024-04-27'),(70,'Ramona','ramona.sáez@hotmail.com','+57 7081375391','Rambla Armando Casals #92, Cartagena','Sáez','2024-02-16'),(71,'Isidro','isidro.cortés@gmail.com','+57 3799408156','Camino Camila Torrecilla #42, Manizales','Cortés','2020-07-29'),(72,'Concha','concha.bernal@outlook.com','+57 2883730354','Avenida Isaac Arias #81, Bogotá','Bernal','2025-03-20'),(73,'Micaela','micaela.jiménez@hotmail.com','+57 8312406726','Paseo Horacio Araujo #1, Pereira','Jiménez','2024-01-28'),(74,'Teófila','teófila.pelayo@outlook.com','+57 8167634836','Via de Severino Quintana #7, Cali','Pelayo','2025-06-03'),(75,'Jessica','jessica.godoy@hotmail.com','+57 3618636989','Cuesta de Paloma Vilalta #72, Medellín','Godoy','2025-07-04'),(76,'Bernardino','bernardino.porcel@hotmail.com','+57 3986942878','Cuesta de Mariana Almansa #9, Barranquilla','Porcel','2021-08-12'),(77,'Isa','isa.larrea@gmail.com','+57 8199148311','Acceso Ascensión Medina #18, Medellín','Larrea','2024-06-07'),(78,'Corona','corona.sans@hotmail.com','+57 2520261391','Vial Nicodemo Ariza #16, Cali','Sans','2023-02-06'),(79,'Héctor','héctor.torrent@yahoo.com','+57 3276581536','Acceso de Aránzazu Solera #75, Medellín','Torrent','2024-05-16'),(80,'Sandra','sandra.marco@gmail.com','+57 9674683655','Pasaje de Clara Mur #84, Bucaramanga','Marco','2023-04-04'),(81,'Fernando','fernando.herrera@yahoo.com','+57 3363907187','Cañada Manolo Hernández #7, Manizales','Herrera','2022-04-01'),(82,'Ruperto','ruperto.alonso@hotmail.com','+57 6193953154','Cañada de Jorge Codina #90, Barranquilla','Alonso','2021-04-11'),(83,'Eli','eli.leiva@outlook.com','+57 2058360220','Pasadizo de Maxi Lillo #97, Barranquilla','Leiva','2022-05-17'),(84,'Ligia','ligia.talavera@yahoo.com','+57 2973468200','Calle Julia Mendizábal #16, Pereira','Talavera','2021-01-04'),(85,'Isidoro','isidoro.gálvez@yahoo.com','+57 8739765572','Urbanización Lorenza Chamorro #24, Cali','Gálvez','2024-09-02'),(86,'Paola','paola.carbó@hotmail.com','+57 0783887502','Ronda Alexandra Rodriguez #268, Medellín','Carbó','2022-11-02'),(87,'Marcos','marcos.rincón@yahoo.com','+57 6987756837','Rambla de Chucho Miralles #52, Bucaramanga','Rincón','2024-08-05'),(88,'Benigno','benigno.quesada@outlook.com','+57 7426710116','Ronda Sosimo Mate #192, Cali','Quesada','2024-12-07'),(89,'Patricio','patricio.manuel@gmail.com','+57 8721884513','Glorieta de Jose Francisco Angulo #34, Barranquilla','Manuel','2025-02-16'),(90,'Marisa','marisa.mora@outlook.com','+57 9773531161','Calle de Rosendo Garcés #6, Bucaramanga','Mora','2025-08-14'),(91,'Carla','carla.nogueira@hotmail.com','+57 8946133633','Rambla de Alejo Heredia #346, Medellín','Nogueira','2023-03-11'),(92,'Tito','tito.carreras@yahoo.com','+57 8007807972','Calle Berto Tejero #94, Barranquilla','Carreras','2022-10-04'),(93,'Chus','chus.perea@outlook.com','+57 6588382715','Vial de Antonio Montoya #26, Medellín','Perea','2020-06-02'),(94,'Hernán','hernán.badía@gmail.com','+57 7206492742','Rambla Teodosio Benavides #55, Bogotá','Badía','2020-03-08'),(95,'Maura','maura.peláez@yahoo.com','+57 7911300967','Ronda de Juan Antonio Uriarte #16, Bucaramanga','Peláez','2023-09-19'),(96,'Dan','dan.campo@hotmail.com','+57 8474610406','Pasaje de Bárbara Durán #632, Cali','Campo','2024-08-17'),(97,'Desiderio','desiderio.otero@yahoo.com','+57 5784542653','Avenida de Paula Quero #79, Manizales','Otero','2020-08-31'),(98,'Anunciación','anunciación.perales@gmail.com','+57 5789019182','Camino de Lucho Santos #88, Pereira','Perales','2023-08-31'),(99,'Glauco','glauco.valverde@hotmail.com','+57 9140099201','Avenida de Antonia Lobo #257, Manizales','Valverde','2020-04-11'),(100,'Remigio','remigio.agullo@hotmail.com','+57 0951972755','Pasadizo de Cosme Linares #4, Medellín','Agullo','2023-03-19'),(101,'LORELEY','loreley@gmail.com','0303303993','calle 30 - 80','GONZALEZ','2025-10-08 16:21:22');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,2,20,400000.00),(1,35,3,264727.09),(4,28,2,301564.04),(4,63,3,297781.60),(5,39,1,201098.80),(6,4,3,183292.22),(6,60,2,313405.37),(7,41,3,357990.82),(9,61,3,391708.84),(10,6,3,370051.79),(11,8,5,115507.43),(13,48,4,443876.47),(13,63,2,297781.60),(15,4,3,183292.22),(15,10,2,251423.52),(16,57,5,54839.90),(16,71,2,411794.05),(17,24,5,479340.75),(18,73,3,91732.79),(19,84,3,40120.05),(20,35,2,264727.09),(23,25,5,444754.74),(23,56,5,466694.88),(24,48,1,443876.47),(25,75,1,117519.28),(25,76,4,204773.04),(25,90,5,416171.17),(27,8,2,115507.43),(27,92,1,483106.93),(29,8,2,115507.43),(29,51,3,471794.76),(31,3,2,395769.94),(31,45,3,284709.45),(32,13,2,53587.04),(33,78,3,498796.86),(33,81,3,225220.11),(34,46,5,355685.61),(36,18,1,72937.80),(37,6,1,370051.79),(37,69,2,141424.67),(38,19,1,142037.97),(39,55,1,369152.41),(39,56,1,466694.88),(40,11,4,167191.36),(40,28,2,301564.04),(40,45,1,284709.45),(45,5,1,74081.46),(47,64,1,473940.57),(49,16,2,373922.07),(51,86,4,189967.18),(53,76,4,204773.04),(54,93,3,97331.07),(58,57,3,54839.90),(59,50,5,23787.00),(60,2,3,168012.82),(60,4,5,183292.22),(60,82,1,93466.17),(62,68,2,44556.69),(62,90,4,416171.17),(63,48,4,443876.47),(64,61,3,391708.84),(64,87,2,330209.67),(65,68,4,44556.69),(66,79,2,22582.72),(67,75,5,117519.28),(68,10,4,251423.52),(69,7,2,208529.24),(69,21,3,266095.47),(70,61,5,391708.84),(70,90,5,416171.17),(71,22,2,310673.00),(71,49,2,26575.55),(73,35,2,264727.09),(73,69,1,141424.67),(74,76,4,204773.04),(75,75,1,117519.28),(76,9,2,466669.53),(78,1,1,75633.22),(78,43,4,82609.15),(79,4,2,183292.22),(79,77,1,442005.81),(80,67,1,215565.15),(81,60,1,313405.37),(82,64,4,473940.57),(82,75,5,117519.28),(83,79,4,22582.72),(85,44,1,159643.98),(86,57,1,54839.90),(87,18,3,72937.80),(88,64,1,473940.57),(89,98,2,157681.79),(90,33,3,95623.95),(90,70,3,486097.11),(91,29,2,390609.30),(92,71,4,411794.05),(94,35,2,264727.09),(94,79,2,22582.72),(94,96,2,316389.19),(95,98,1,157681.79),(98,42,1,94529.03),(99,79,4,22582.72);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ai_order_details_audit` AFTER INSERT ON `order_details` FOR EACH ROW BEGIN
  SET @from_order_details_trigger = 1;
  INSERT INTO order_details_audit (order_detail_id, actionSale, before_data, after_data)
  VALUES (NEW.order_id, 'INSERT', NULL, JSON_OBJECT(
    'order_id', NEW.order_id, 'product_id', NEW.product_id, 
    'quantity', NEW.quantity, 'price', NEW.price
  ));
  SET @from_order_details_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `au_order_details_audit` AFTER UPDATE ON `order_details` FOR EACH ROW BEGIN
  SET @from_order_details_trigger = 1;
  INSERT INTO order_details_audit (order_detail_id, actionSale, before_data, after_data)
  VALUES (NEW.order_id, 'UPDATE',
    JSON_OBJECT(
      'order_id', OLD.order_id, 'product_id', OLD.product_id,
      'quantity', OLD.quantity, 'price', OLD.price
    ),
    JSON_OBJECT(
      'order_id', NEW.order_id, 'product_id', NEW.product_id,
      'quantity', NEW.quantity, 'price', NEW.price
    )
  );
  SET @from_order_details_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ad_order_details_audit` AFTER DELETE ON `order_details` FOR EACH ROW BEGIN
  SET @from_order_details_trigger = 1;
  INSERT INTO order_details_audit (order_detail_id, actionSale, before_data, after_data)
  VALUES (OLD.order_id, 'DELETE',
    JSON_OBJECT(
      'order_id', OLD.order_id, 'product_id', OLD.product_id,
      'quantity', OLD.quantity, 'price', OLD.price
    ), NULL
  );
  SET @from_order_details_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_details_audit`
--

DROP TABLE IF EXISTS `order_details_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details_audit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_detail_id` bigint NOT NULL,
  `actionSale` enum('UPDATE','DELETE','INSERT') NOT NULL DEFAULT 'INSERT',
  `changed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` varchar(255) NOT NULL DEFAULT 'Admin',
  `before_data` json DEFAULT NULL,
  `after_data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details_audit`
--

LOCK TABLES `order_details_audit` WRITE;
/*!40000 ALTER TABLE `order_details_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bii_order_details_audit_guard_insert` BEFORE INSERT ON `order_details_audit` FOR EACH ROW BEGIN IF COALESCE(@from_order_details_trigger, 0) <> 1 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT en order_details_audit solo permitido desde triggers de order_details.';
END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `biu_order_details_audit_block_update` BEFORE UPDATE ON `order_details_audit` FOR EACH ROW BEGIN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'order_details_audit es inmutable: UPDATE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bid_order_details_audit_block_delete` BEFORE DELETE ON `order_details_audit` FOR EACH ROW BEGIN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'order_details_audit es inmutable: DELETE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,57,'2022-07-24',NULL,NULL),(2,49,'2023-06-22',NULL,5000000),(3,13,'2025-02-08',NULL,2708797.29),(4,86,'2024-01-13',NULL,3767002.03),(5,31,'2020-10-10',NULL,962219.36),(6,91,'2023-03-19',NULL,1092940.44),(7,20,'2022-03-12',NULL,3574410.06),(8,81,'2020-02-08',NULL,874698.29),(9,85,'2022-03-14',NULL,3023088.37),(10,55,'2022-12-16',NULL,2003638.81),(11,98,'2020-01-10',NULL,1339834.45),(12,60,'2024-02-04',NULL,3126301.41),(13,60,'2020-03-02',NULL,4270793.27),(14,11,'2020-08-24',NULL,4797400.51),(15,56,'2020-04-16',NULL,912272.29),(16,36,'2020-01-04',NULL,4622896.47),(17,77,'2022-12-17',NULL,3162055.4),(18,30,'2024-04-20',NULL,1158386.5),(19,37,'2023-06-03',NULL,929021.86),(20,59,'2023-10-20',NULL,4347880.61),(21,73,'2023-12-12',NULL,3117133.21),(22,54,'2023-05-07',NULL,3003676.7),(23,79,'2020-11-09',NULL,1814863.08),(24,76,'2021-01-02',NULL,2749013.4),(25,19,'2022-10-06',NULL,943053.7),(26,89,'2021-01-07',NULL,1531272.6),(27,38,'2024-09-16',NULL,1830241.22),(28,59,'2025-08-19',NULL,4425486.77),(29,52,'2020-11-29',NULL,4129327.63),(30,72,'2022-07-01',NULL,2205121.05),(31,45,'2024-01-16',NULL,1447635.1),(32,85,'2020-10-13',NULL,3343420.65),(33,13,'2024-04-29',NULL,2291814.95),(34,33,'2022-10-07',NULL,2995917.64),(35,65,'2020-03-07',NULL,1513543.3),(36,80,'2020-02-19',NULL,985698.39),(37,89,'2023-10-03',NULL,3792347.67),(38,61,'2023-09-08',NULL,3129876.41),(39,35,'2021-01-10',NULL,2698796.31),(40,25,'2024-06-24',NULL,2193227.22),(41,87,'2021-07-13',NULL,3475734.46),(42,49,'2020-11-25',NULL,4826349.61),(43,98,'2023-01-27',NULL,591833.55),(44,76,'2021-12-03',NULL,2213073.74),(45,79,'2022-09-29',NULL,1766474.32),(46,50,'2025-01-29',NULL,2252571.48),(47,55,'2021-07-07',NULL,2448385.4),(48,29,'2024-01-28',NULL,2414534.58),(49,13,'2025-06-08',NULL,3937305.78),(50,54,'2020-06-16',NULL,540947.55),(51,10,'2023-08-07',NULL,506682.37),(52,82,'2022-02-08',NULL,4387325.15),(53,69,'2020-09-05',NULL,4204306.63),(54,52,'2023-05-02',NULL,1320733.62),(55,55,'2021-06-14',NULL,4298167.78),(56,44,'2020-11-27',NULL,2774103.98),(57,1,'2024-02-26',NULL,4962531.47),(58,77,'2022-07-02',NULL,3579243.88),(59,17,'2024-06-06',NULL,4935896.7),(60,65,'2022-05-02',NULL,3042249.36),(61,57,'2020-11-10',NULL,2233371.76),(62,32,'2020-05-18',NULL,1497339.45),(63,60,'2025-03-14',NULL,3405224.38),(64,45,'2020-09-08',NULL,2130594.74),(65,62,'2022-02-18',NULL,95534.69),(66,28,'2025-02-01',NULL,930858.23),(67,89,'2020-10-07',NULL,3529587.71),(68,81,'2022-10-02',NULL,4534942.46),(69,59,'2021-10-28',NULL,3890475.12),(70,86,'2025-08-14',NULL,4329461.48),(71,39,'2025-06-08',NULL,3530671.64),(72,5,'2020-11-02',NULL,2005376.56),(73,62,'2022-10-01',NULL,724516.12),(74,40,'2022-01-25',NULL,2422723.63),(75,61,'2022-04-15',NULL,3000418.04),(76,12,'2021-11-16',NULL,2867593.18),(77,17,'2024-04-14',NULL,365256.09),(78,43,'2021-09-25',NULL,1750569.62),(79,16,'2021-10-04',NULL,1630053.04),(80,27,'2025-04-16',NULL,3370955.79),(81,58,'2024-12-27',NULL,4372371.16),(82,70,'2023-12-03',NULL,4551002.17),(83,31,'2025-03-07',NULL,2741668.39),(84,28,'2023-10-23',NULL,3420830.61),(85,24,'2022-11-29',NULL,3230178.2),(86,21,'2021-02-22',NULL,1230839.68),(87,13,'2020-02-15',NULL,2858749.49),(88,40,'2020-01-27',NULL,1780894.23),(89,66,'2022-12-14',NULL,2988512.32),(90,54,'2025-04-29',NULL,268539.84),(91,69,'2022-08-10',NULL,2376426.98),(92,90,'2021-05-03',NULL,1743374.68),(93,66,'2025-06-10',NULL,1234496.9),(94,8,'2023-10-29',NULL,3489188.93),(95,36,'2024-04-05',NULL,4413657.78),(96,32,'2020-01-25',NULL,4898312.56),(97,32,'2020-03-26',NULL,2492970.32),(98,95,'2021-02-01',NULL,2155189.15),(99,23,'2022-09-15',NULL,2504636.49),(100,35,'2023-08-25',NULL,2230325.22),(101,1,'2025-10-08',50000.00,50000),(102,2,'2025-10-08',105000.00,105000);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ai_orders_audit` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
  SET @from_orders_trigger = 1;

  INSERT INTO orders_audit (order_id, action_type, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    JSON_OBJECT('id', NEW.id, 'customer_id', NEW.customer_id, 'total', NEW.total, 'order_date', NEW.order_date)
  );

  SET @from_orders_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `au_orders_audit` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
  SET @from_orders_trigger = 1;

  INSERT INTO orders_audit (order_id, action_type, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    JSON_OBJECT('id', OLD.id, 'total', OLD.total, 'order_date', OLD.order_date),
    JSON_OBJECT('id', NEW.id, 'total', NEW.total, 'order_date', NEW.order_date)
  );

  SET @from_orders_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ad_orders_audit` AFTER DELETE ON `orders` FOR EACH ROW BEGIN
  SET @from_orders_trigger = 1;

  INSERT INTO orders_audit (order_id, action_type, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    JSON_OBJECT('id', OLD.id, 'customer_id', OLD.customer_id, 'total', OLD.total),
    NULL
  );

  SET @from_orders_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders_audit`
--

DROP TABLE IF EXISTS `orders_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_audit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `action_type` enum('INSERT','UPDATE','DELETE') NOT NULL DEFAULT 'INSERT',
  `changed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` varchar(255) NOT NULL DEFAULT 'Admin',
  `before_data` json DEFAULT NULL,
  `after_data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_audit`
--

LOCK TABLES `orders_audit` WRITE;
/*!40000 ALTER TABLE `orders_audit` DISABLE KEYS */;
INSERT INTO `orders_audit` VALUES (1,1,'UPDATE','2025-10-12 21:42:29','Admin','{\"id\": 1, \"total\": null, \"order_date\": \"2022-07-24\"}','{\"id\": 1, \"total\": 60.00, \"order_date\": \"2022-07-24\"}'),(2,1,'UPDATE','2025-10-12 21:43:09','Admin','{\"id\": 1, \"total\": 60.00, \"order_date\": \"2022-07-24\"}','{\"id\": 1, \"total\": null, \"order_date\": \"2022-07-24\"}'),(3,1,'UPDATE','2025-10-12 21:43:21','Admin','{\"id\": 1, \"total\": null, \"order_date\": \"2022-07-24\"}','{\"id\": 1, \"total\": null, \"order_date\": \"2022-07-24\"}'),(4,2,'UPDATE','2025-10-14 16:51:37','Admin','{\"id\": 2, \"total\": null, \"order_date\": \"2023-06-22\"}','{\"id\": 2, \"total\": null, \"order_date\": \"2023-06-22\"}');
/*!40000 ALTER TABLE `orders_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bii_orders_audit_guard_insert` BEFORE INSERT ON `orders_audit` FOR EACH ROW BEGIN
  IF COALESCE(@from_orders_trigger, 0) <> 1 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT en orders_audit solo permitido desde triggers de orders.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `biu_orders_audit_block_update` BEFORE UPDATE ON `orders_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'orders_audit es inmutable: UPDATE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bid_orders_audit_block_delete` BEFORE DELETE ON `orders_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'orders_audit es inmutable: DELETE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,61,'2021-02-22',2233371.76,NULL,'Contraentrega'),(2,48,'2024-09-29',2414534.58,NULL,'Efectivo'),(3,13,'2020-12-22',4270793.27,NULL,'PSE'),(4,73,'2020-05-27',724516.12,NULL,'Tarjeta débito'),(5,78,'2025-02-05',1750569.62,NULL,'Daviplata'),(6,92,'2020-12-27',1743374.68,NULL,'PSE'),(7,86,'2025-06-20',1230839.68,NULL,'Efectivo'),(8,24,'2021-12-17',2749013.40,NULL,'Tarjeta de crédito'),(9,95,'2020-11-22',4413657.78,NULL,'Tarjeta de crédito'),(10,46,'2023-12-01',2252571.48,NULL,'Tarjeta de crédito'),(11,10,'2020-05-06',2003638.81,NULL,'Tarjeta de crédito'),(12,30,'2021-11-11',2205121.05,NULL,'PSE'),(13,60,'2020-03-18',3042249.36,NULL,'Tarjeta débito'),(15,85,'2024-10-17',3230178.20,NULL,'Daviplata'),(16,17,'2021-06-18',3162055.40,NULL,'Efectivo'),(17,54,'2021-04-26',1320733.62,NULL,'Contraentrega'),(18,11,'2022-10-31',1339834.45,NULL,'Tarjeta de crédito'),(19,59,'2025-06-05',4935896.70,NULL,'PSE'),(20,27,'2022-11-12',1830241.22,NULL,'Daviplata'),(21,45,'2022-11-04',1766474.32,NULL,'Contraentrega'),(22,93,'2023-04-06',1234496.90,NULL,'Daviplata'),(23,64,'2025-01-18',2130594.74,NULL,'Daviplata'),(25,75,'2025-09-23',3000418.04,NULL,'Tarjeta débito'),(27,53,'2024-05-01',4204306.63,NULL,'Tarjeta de crédito'),(29,68,'2025-08-11',4534942.46,NULL,'Tarjeta débito'),(30,35,'2020-03-20',1513543.30,NULL,'Daviplata'),(33,50,'2025-06-16',540947.55,NULL,'Nequi'),(34,87,'2021-04-10',2858749.49,NULL,'Contraentrega'),(36,34,'2024-01-19',2995917.64,NULL,'Efectivo'),(37,65,'2021-11-27',95534.69,NULL,'Tarjeta de crédito'),(40,20,'2023-10-30',4347880.61,NULL,'Efectivo'),(42,57,'2023-02-27',4962531.47,NULL,'Daviplata'),(44,38,'2025-01-04',3129876.41,NULL,'Tarjeta de crédito'),(45,52,'2020-09-25',4387325.15,NULL,'Nequi'),(47,3,'2020-03-12',2708797.29,NULL,'PSE'),(50,88,'2024-12-15',1780894.23,NULL,'Tarjeta de crédito'),(51,89,'2022-09-30',2988512.32,NULL,'Tarjeta de crédito'),(52,81,'2021-04-05',4372371.16,NULL,'Efectivo'),(57,22,'2025-05-16',3003676.70,NULL,'Tarjeta de crédito'),(58,99,'2021-08-27',2504636.49,NULL,'Contraentrega'),(59,77,'2023-04-02',365256.09,NULL,'Nequi'),(60,43,'2023-06-11',591833.55,NULL,'Contraentrega'),(62,56,'2021-04-22',2774103.98,NULL,'PSE'),(63,51,'2020-05-16',506682.37,NULL,'Daviplata'),(64,62,'2020-05-29',1497339.45,NULL,'Contraentrega'),(65,14,'2021-03-12',4797400.51,NULL,'Tarjeta débito'),(68,26,'2025-01-20',1531272.60,NULL,'Efectivo'),(70,80,'2020-12-29',3370955.79,NULL,'Daviplata'),(71,33,'2021-10-06',2291814.95,NULL,'Tarjeta débito'),(72,83,'2025-09-20',2741668.39,NULL,'Efectivo'),(73,4,'2024-07-24',3767002.03,NULL,'Efectivo'),(74,82,'2020-11-08',4551002.17,NULL,'Daviplata'),(77,23,'2024-06-03',1814863.08,NULL,'Daviplata'),(78,90,'2024-09-27',268539.84,NULL,'Efectivo'),(81,72,'2024-03-31',2005376.56,NULL,'Nequi'),(82,19,'2023-11-13',929021.86,NULL,'Nequi'),(83,49,'2020-07-15',3937305.78,NULL,'Tarjeta débito'),(84,12,'2024-09-21',3126301.41,NULL,'Contraentrega'),(88,18,'2023-11-12',1158386.50,NULL,'Tarjeta de crédito'),(89,98,'2024-09-23',2155189.15,NULL,'Tarjeta de crédito'),(100,44,'2022-09-30',2213073.74,NULL,'Nequi');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ai_payments_audit` AFTER INSERT ON `payments` FOR EACH ROW BEGIN
  SET @from_payments_trigger = 1;
  INSERT INTO payments_audit (payment_id, actionSale, before_data, after_data)
  VALUES (NEW.id, 'INSERT', NULL, JSON_OBJECT(
    'id', NEW.id, 'order_id', NEW.order_id, 'payment_date', NEW.payment_date,
    'amount', NEW.amount, 'payment_method', NEW.payment_method
  ));
  SET @from_payments_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `au_payments_audit` AFTER UPDATE ON `payments` FOR EACH ROW BEGIN
  SET @from_payments_trigger = 1;
  INSERT INTO payments_audit (payment_id, actionSale, before_data, after_data)
  VALUES (NEW.id, 'UPDATE',
    JSON_OBJECT(
      'id', OLD.id, 'order_id', OLD.order_id, 'payment_date', OLD.payment_date,
      'amount', OLD.amount, 'payment_method', OLD.payment_method
    ),
    JSON_OBJECT(
      'id', NEW.id, 'order_id', NEW.order_id, 'payment_date', NEW.payment_date,
      'amount', NEW.amount, 'payment_method', NEW.payment_method
    )
  );
  SET @from_payments_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `d_payments_audit` AFTER DELETE ON `payments` FOR EACH ROW BEGIN
  SET @from_payments_trigger = 1;
  INSERT INTO payments_audit (payment_id, actionSale, before_data, after_data)
  VALUES (OLD.id, 'DELETE',
    JSON_OBJECT(
      'id', OLD.id, 'order_id', OLD.order_id, 'payment_date', OLD.payment_date,
      'amount', OLD.amount, 'payment_method', OLD.payment_method
    ), NULL
  );
  SET @from_payments_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments_audit`
--

DROP TABLE IF EXISTS `payments_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_audit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` bigint NOT NULL,
  `actionSale` enum('UPDATE','DELETE','INSERT') NOT NULL DEFAULT 'INSERT',
  `changed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` varchar(255) NOT NULL DEFAULT 'Admin',
  `before_data` json DEFAULT NULL,
  `after_data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_audit`
--

LOCK TABLES `payments_audit` WRITE;
/*!40000 ALTER TABLE `payments_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bii_payments_audit_guard_insert` AFTER INSERT ON `payments_audit` FOR EACH ROW BEGIN 
    IF COALESCE(@from_payments_trigger, 0) <> 1 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT en payments_audit solo permitido desde triggers de payments.'; 
    END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `biu_payments_audit_block_update` BEFORE UPDATE ON `payments_audit` FOR EACH ROW BEGIN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'payments_audit es inmutable: UPDATE prohibido.'; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bid_payments_audit_block_delete` BEFORE DELETE ON `payments_audit` FOR EACH ROW BEGIN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'payments_audit es inmutable: DELETE prohibido.'; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product_tags`
--

DROP TABLE IF EXISTS `product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tags` (
  `product_id` int NOT NULL,
  `tag_id` int NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `tag_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `product_tags_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tags`
--

LOCK TABLES `product_tags` WRITE;
/*!40000 ALTER TABLE `product_tags` DISABLE KEYS */;
INSERT INTO `product_tags` VALUES (1,2,'Televisor LED 50 pulgadas','Ropa'),(1,79,'Televisor LED 50 pulgadas','Instrumentos'),(1,96,'Televisor LED 50 pulgadas','Videojuegos'),(2,2,'Camiseta deportiva hombre','Ropa'),(2,38,'Camiseta deportiva hombre','Viajes'),(5,82,'Sofá de 3 puestos','Ropa'),(6,37,'Collar artesanal','Ofertas'),(7,92,'Perfume mujer 100ml','Mascotas'),(9,26,'Balón de fútbol oficial','Accesorios'),(9,45,'Balón de fútbol oficial','Hogar'),(9,48,'Balón de fútbol oficial','Juguetes'),(9,82,'Balón de fútbol oficial','Ropa'),(11,53,'Kit de vitaminas','Muebles'),(11,80,'Kit de vitaminas','Servicios'),(12,99,'Alimento para perro 10kg','Instrumentos'),(14,98,'Cuaderno universitario','Viajes'),(15,20,'Taladro eléctrico','Servicios'),(15,79,'Taladro eléctrico','Instrumentos'),(17,72,'Paquete de ofertas','Mascotas'),(19,14,'Guitarra acústica','Papelería'),(19,49,'Guitarra acústica','Deportes'),(20,39,'Servicio de instalación','Instrumentos'),(20,61,'Servicio de instalación','Electrodomésticos'),(20,81,'Servicio de instalación','Electrodomésticos'),(23,39,'Zapatos de cuero','Instrumentos'),(25,19,'Sofá de 3 puestos','Instrumentos'),(26,5,'Collar artesanal','Hogar'),(26,22,'Collar artesanal','Ropa'),(27,35,'Perfume mujer 100ml','Herramientas'),(28,34,'Muñeca de colección','Papelería'),(29,19,'Balón de fútbol oficial','Instrumentos'),(29,44,'Balón de fútbol oficial','Tecnología'),(30,93,'Arroz premium 5kg','Muebles'),(32,48,'Alimento para perro 10kg','Juguetes'),(32,55,'Alimento para perro 10kg','Herramientas'),(32,60,'Alimento para perro 10kg','Servicios'),(33,16,'Escritorio de oficina','Videojuegos'),(33,49,'Escritorio de oficina','Deportes'),(35,58,'Taladro eléctrico','Viajes'),(37,53,'Paquete de ofertas','Muebles'),(39,62,'Guitarra acústica','Ropa'),(40,26,'Servicio de instalación','Accesorios'),(42,86,'Camiseta deportiva hombre','Accesorios'),(45,60,'Sofá de 3 puestos','Servicios'),(47,18,'Perfume mujer 100ml','Viajes'),(47,76,'Perfume mujer 100ml','Videojuegos'),(49,2,'Balón de fútbol oficial','Ropa'),(50,23,'Arroz premium 5kg','Zapatos'),(50,78,'Arroz premium 5kg','Viajes'),(50,81,'Arroz premium 5kg','Electrodomésticos'),(50,95,'Arroz premium 5kg','Herramientas'),(51,97,'Kit de vitaminas','Ofertas'),(52,98,'Alimento para perro 10kg','Viajes'),(55,15,'Taladro eléctrico','Herramientas'),(55,81,'Taladro eléctrico','Electrodomésticos'),(57,88,'Paquete de ofertas','Juguetes'),(58,72,'Tiquetes de viaje','Mascotas'),(59,5,'Guitarra acústica','Hogar'),(61,75,'Televisor LED 50 pulgadas','Herramientas'),(64,32,'Celular Android última generación','Mascotas'),(64,89,'Celular Android última generación','Deportes'),(65,54,'Sofá de 3 puestos','Papelería'),(66,99,'Collar artesanal','Instrumentos'),(67,3,'Perfume mujer 100ml','Zapatos'),(67,5,'Perfume mujer 100ml','Hogar'),(70,58,'Arroz premium 5kg','Viajes'),(71,39,'Kit de vitaminas','Instrumentos'),(72,2,'Alimento para perro 10kg','Ropa'),(72,46,'Alimento para perro 10kg','Accesorios'),(72,58,'Alimento para perro 10kg','Viajes'),(73,16,'Escritorio de oficina','Videojuegos'),(74,46,'Cuaderno universitario','Accesorios'),(75,1,'Taladro eléctrico','Electrodomésticos'),(75,18,'Taladro eléctrico','Viajes'),(80,72,'Servicio de instalación','Mascotas'),(80,96,'Servicio de instalación','Videojuegos'),(81,85,'Televisor LED 50 pulgadas','Hogar'),(82,81,'Camiseta deportiva hombre','Electrodomésticos'),(83,8,'Zapatos de cuero','Juguetes'),(84,84,'Celular Android última generación','Tecnología'),(87,75,'Perfume mujer 100ml','Herramientas'),(88,6,'Muñeca de colección','Accesorios'),(89,29,'Balón de fútbol oficial','Deportes'),(89,92,'Balón de fútbol oficial','Mascotas'),(89,98,'Balón de fútbol oficial','Viajes'),(91,20,'Kit de vitaminas','Servicios'),(91,74,'Kit de vitaminas','Papelería'),(91,90,'Kit de vitaminas','Supermercado'),(93,17,'Escritorio de oficina','Ofertas'),(93,26,'Escritorio de oficina','Accesorios'),(93,84,'Escritorio de oficina','Tecnología'),(94,43,'Cuaderno universitario','Zapatos'),(95,20,'Taladro eléctrico','Servicios'),(95,21,'Taladro eléctrico','Electrodomésticos'),(95,70,'Taladro eléctrico','Supermercado'),(98,4,'Tiquetes de viaje','Tecnología'),(98,18,'Tiquetes de viaje','Viajes'),(98,88,'Tiquetes de viaje','Juguetes'),(99,35,'Guitarra acústica','Herramientas'),(100,33,'Servicio de instalación','Muebles');
/*!40000 ALTER TABLE `product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seller_id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_id` (`seller_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,42,52,'Televisor LED 60 pulgadas',1000000.00,397,NULL,'electrodomesticos para el hogar','2024-03-25'),(2,45,62,'sueter femenino',1500000.00,175,NULL,'Con envío gratis a todo el país ','2025-04-02'),(3,68,74,'Zapatos de cuero',395769.94,149,NULL,'Materiales resistentes pensados para la familia colombiana.','2024-04-21'),(4,75,99,'Celular Android última generación',183292.22,284,NULL,'Producto de alta calidad con garantía incluida.','2024-11-23'),(5,68,65,'Sofá de 3 puestos',74081.46,188,NULL,'Fácil de usar, práctico y con excelentes acabados.','2023-01-27'),(6,55,71,'Collar artesanal',370051.79,196,NULL,'Materiales resistentes pensados para la familia colombiana.','2022-06-01'),(7,84,22,'Perfume mujer 100ml',208529.24,500,NULL,'Disponible en varias tallas y colores según preferencia.','2023-04-01'),(8,65,15,'Muñeca de colección',115507.43,449,NULL,'Materiales resistentes pensados para la familia colombiana.','2020-05-08'),(9,51,43,'Balón de fútbol oficial',466669.53,105,NULL,'Diseño moderno y cómodo, perfecto para cualquier ocasión.','2021-01-24'),(10,37,9,'Arroz premium 5kg',251423.52,230,NULL,'Hecho con insumos locales, apoyando la industria nacional.','2025-02-07'),(11,29,48,'Kit de vitaminas',167191.36,341,NULL,'Ideal para el uso diario, resistente y duradero.','2021-10-29'),(12,84,17,'Alimento para perro 10kg',374903.52,358,NULL,'Edición especial con precio promocional por tiempo limitado.','2023-04-10'),(13,33,5,'Escritorio de oficina',53587.04,366,NULL,'Diseño moderno y cómodo, perfecto para cualquier ocasión.','2024-05-10'),(14,24,3,'Cuaderno universitario',156935.08,325,NULL,'Producto de alta calidad con garantía incluida.','2024-05-20'),(15,23,51,'Taladro eléctrico',312818.16,372,NULL,'Edición especial con precio promocional por tiempo limitado.','2020-12-05'),(16,8,61,'Consola de videojuegos',373922.07,373,NULL,'Edición especial con precio promocional por tiempo limitado.','2024-10-28'),(17,89,39,'Paquete de ofertas',455914.60,373,NULL,'Producto recomendado por cientos de clientes satisfechos.','2020-04-11'),(18,55,40,'Tiquetes de viaje',72937.80,447,NULL,'Materiales resistentes pensados para la familia colombiana.','2025-08-20'),(19,99,36,'Guitarra acústica',142037.97,190,NULL,'Producto de alta calidad con garantía incluida.','2021-01-02'),(20,33,95,'Servicio de instalación',463618.18,472,NULL,'Diseño moderno y cómodo, perfecto para cualquier ocasión.','2021-05-07'),(21,10,5,'Televisor LED 50 pulgadas',266095.47,401,NULL,'Disponible en varias tallas y colores según preferencia.','2021-12-30'),(22,31,32,'Camiseta deportiva hombre',310673.00,70,NULL,'Edición especial con precio promocional por tiempo limitado.','2024-11-21'),(23,7,26,'Zapatos de cuero',388092.52,228,NULL,'Ideal para el uso diario, resistente y duradero.','2021-07-26'),(24,9,6,'Celular Android última generación',479340.75,376,NULL,'Fácil de usar, práctico y con excelentes acabados.','2022-09-08'),(25,76,53,'Sofá de 3 puestos',444754.74,161,NULL,'Diseño moderno y cómodo, perfecto para cualquier ocasión.','2022-10-16'),(26,49,22,'Collar artesanal',271716.19,69,NULL,'Con envío gratis a todo el país y garantía de satisfacción.','2020-06-18'),(27,64,17,'Perfume mujer 100ml',114749.22,475,NULL,'Producto de alta calidad con garantía incluida.','2024-11-24'),(28,46,9,'Muñeca de colección',301564.04,121,NULL,'Disponible en varias tallas y colores según preferencia.','2022-01-27'),(29,40,100,'Balón de fútbol oficial',390609.30,131,NULL,'Hecho con insumos locales, apoyando la industria nacional.','2025-04-09'),(30,63,18,'Arroz premium 5kg',269362.78,334,NULL,'Materiales resistentes pensados para la familia colombiana.','2021-04-24'),(31,55,7,'Kit de vitaminas',230791.98,340,NULL,'Producto de alta calidad con garantía incluida.','2025-06-09'),(32,73,68,'Alimento para perro 10kg',159714.45,59,NULL,'Con envío gratis a todo el país y garantía de satisfacción.','2021-01-17'),(33,42,6,'Escritorio de oficina',95623.95,158,NULL,'Producto recomendado por cientos de clientes satisfechos.','2020-01-29'),(34,54,54,'Cuaderno universitario',141443.70,342,NULL,'Fácil de usar, práctico y con excelentes acabados.','2024-01-25'),(35,84,17,'Taladro eléctrico',264727.09,493,NULL,'Edición especial con precio promocional por tiempo limitado.','2021-12-23'),(36,50,4,'Consola de videojuegos',388690.59,413,NULL,'Con envío gratis a todo el país y garantía de satisfacción.','2021-10-27'),(37,3,27,'Paquete de ofertas',381683.09,327,NULL,'Producto de alta calidad con garantía incluida.','2024-09-10'),(38,68,82,'Tiquetes de viaje',181437.52,124,NULL,'Hecho con insumos locales, apoyando la industria nacional.','2023-05-17'),(39,84,87,'Guitarra acústica',201098.80,221,NULL,'Materiales resistentes pensados para la familia colombiana.','2022-01-02'),(40,18,60,'Servicio de instalación',193479.15,301,NULL,'Materiales resistentes pensados para la familia colombiana.','2024-12-22'),(41,15,10,'Televisor LED 50 pulgadas',357990.82,54,NULL,'Hecho con insumos locales, apoyando la industria nacional.','2023-08-30'),(42,19,63,'Camiseta deportiva hombre',94529.03,102,NULL,'Diseño moderno y cómodo, perfecto para cualquier ocasión.','2025-01-13'),(43,35,42,'Zapatos de cuero',82609.15,171,NULL,'Fácil de usar, práctico y con excelentes acabados.','2021-07-04'),(44,12,56,'Celular Android última generación',159643.98,235,NULL,'Con envío gratis a todo el país y garantía de satisfacción.','2022-02-21'),(45,17,11,'Sofá de 3 puestos',284709.45,283,NULL,'Ideal para el uso diario, resistente y duradero.','2023-09-23'),(46,12,66,'Collar artesanal',355685.61,427,NULL,'Edición especial con precio promocional por tiempo limitado.','2020-08-10'),(47,32,22,'Perfume mujer 100ml',498497.38,49,NULL,'Producto de alta calidad con garantía incluida.','2025-06-30'),(48,87,62,'Muñeca de colección',443876.47,47,NULL,'Con envío gratis a todo el país y garantía de satisfacción.','2020-03-07'),(49,71,46,'Balón de fútbol oficial',26575.55,287,NULL,'Diseño moderno y cómodo, perfecto para cualquier ocasión.','2020-02-19'),(50,13,56,'Arroz premium 5kg',23787.00,339,NULL,'Fácil de usar, práctico y con excelentes acabados.','2023-07-09'),(51,6,11,'Kit de vitaminas',471794.76,8,NULL,'Disponible en varias tallas y colores según preferencia.','2025-06-14'),(52,85,60,'Alimento para perro 10kg',475692.79,369,NULL,'Edición especial con precio promocional por tiempo limitado.','2023-11-15'),(53,56,50,'Escritorio de oficina',68083.28,185,NULL,'Materiales resistentes pensados para la familia colombiana.','2022-09-27'),(54,84,8,'Cuaderno universitario',317601.02,271,NULL,'Diseño moderno y cómodo, perfecto para cualquier ocasión.','2022-01-10'),(55,71,53,'Taladro eléctrico',369152.41,337,NULL,'Ideal para el uso diario, resistente y duradero.','2024-06-20'),(56,66,53,'Consola de videojuegos',466694.88,247,NULL,'Producto recomendado por cientos de clientes satisfechos.','2023-08-02'),(57,61,76,'Paquete de ofertas',54839.90,129,NULL,'Producto de alta calidad con garantía incluida.','2024-05-28'),(58,15,82,'Tiquetes de viaje',454399.18,288,NULL,'Producto de alta calidad con garantía incluida.','2020-12-03'),(59,1,89,'Guitarra acústica',13225.33,187,NULL,'Producto de alta calidad con garantía incluida.','2025-07-12'),(60,23,88,'Servicio de instalación',313405.37,25,NULL,'Con envío gratis a todo el país y garantía de satisfacción.','2023-01-06'),(61,92,26,'Televisor LED 50 pulgadas',391708.84,371,NULL,'Materiales resistentes pensados para la familia colombiana.','2022-09-16'),(62,24,58,'Camiseta deportiva hombre',461293.29,233,NULL,'Hecho con insumos locales, apoyando la industria nacional.','2022-10-11'),(63,90,87,'Zapatos de cuero',297781.60,313,NULL,'Ideal para el uso diario, resistente y duradero.','2024-04-18'),(64,73,10,'Celular Android última generación',473940.57,387,NULL,'Producto recomendado por cientos de clientes satisfechos.','2021-10-02'),(65,19,72,'Sofá de 3 puestos',294691.72,39,NULL,'Materiales resistentes pensados para la familia colombiana.','2023-11-06'),(66,83,94,'Collar artesanal',380119.62,143,NULL,'Ideal para el uso diario, resistente y duradero.','2022-12-23'),(67,60,100,'Perfume mujer 100ml',215565.15,16,NULL,'Producto recomendado por cientos de clientes satisfechos.','2024-03-25'),(68,14,39,'Muñeca de colección',44556.69,219,NULL,'Disponible en varias tallas y colores según preferencia.','2023-09-05'),(69,61,73,'Balón de fútbol oficial',141424.67,386,NULL,'Con envío gratis a todo el país y garantía de satisfacción.','2023-03-16'),(70,6,64,'Arroz premium 5kg',486097.11,357,NULL,'Diseño moderno y cómodo, perfecto para cualquier ocasión.','2022-08-15'),(71,29,83,'Kit de vitaminas',411794.05,346,NULL,'Producto recomendado por cientos de clientes satisfechos.','2023-11-28'),(72,79,31,'Alimento para perro 10kg',359850.00,176,NULL,'Ideal para el uso diario, resistente y duradero.','2020-06-28'),(73,47,19,'Escritorio de oficina',91732.79,404,NULL,'Con envío gratis a todo el país y garantía de satisfacción.','2024-06-10'),(74,72,40,'Cuaderno universitario',474501.26,475,NULL,'Edición especial con precio promocional por tiempo limitado.','2020-12-22'),(75,71,69,'Taladro eléctrico',117519.28,42,NULL,'Diseño moderno y cómodo, perfecto para cualquier ocasión.','2024-12-24'),(76,52,48,'Consola de videojuegos',204773.04,159,NULL,'Producto recomendado por cientos de clientes satisfechos.','2020-07-30'),(77,33,71,'Paquete de ofertas',442005.81,196,NULL,'Ideal para el uso diario, resistente y duradero.','2025-05-09'),(78,49,90,'Tiquetes de viaje',498796.86,28,NULL,'Producto de alta calidad con garantía incluida.','2025-06-08'),(79,15,39,'Guitarra acústica',22582.72,309,NULL,'Hecho con insumos locales, apoyando la industria nacional.','2022-06-19'),(80,41,99,'Servicio de instalación',285522.98,282,NULL,'Edición especial con precio promocional por tiempo limitado.','2022-05-11'),(81,91,25,'Televisor LED 50 pulgadas',225220.11,11,NULL,'Hecho con insumos locales, apoyando la industria nacional.','2024-02-21'),(82,24,8,'Camiseta deportiva hombre',93466.17,436,NULL,'Producto recomendado por cientos de clientes satisfechos.','2025-05-10'),(83,59,32,'Zapatos de cuero',405048.02,282,NULL,'Con envío gratis a todo el país y garantía de satisfacción.','2022-03-11'),(84,97,62,'Celular Android última generación',40120.05,48,NULL,'Hecho con insumos locales, apoyando la industria nacional.','2020-12-20'),(85,15,46,'Sofá de 3 puestos',233611.04,480,NULL,'Producto de alta calidad con garantía incluida.','2023-06-04'),(86,35,53,'Collar artesanal',189967.18,404,NULL,'Con envío gratis a todo el país y garantía de satisfacción.','2023-11-16'),(87,66,37,'Perfume mujer 100ml',330209.67,274,NULL,'Disponible en varias tallas y colores según preferencia.','2023-07-11'),(88,84,96,'Muñeca de colección',144131.66,401,NULL,'Edición especial con precio promocional por tiempo limitado.','2024-02-18'),(89,14,92,'Balón de fútbol oficial',315738.47,478,NULL,'Ideal para el uso diario, resistente y duradero.','2025-05-29'),(90,70,31,'Arroz premium 5kg',416171.17,303,NULL,'Edición especial con precio promocional por tiempo limitado.','2022-02-09'),(91,92,84,'Kit de vitaminas',229039.54,486,NULL,'Producto de alta calidad con garantía incluida.','2021-06-07'),(92,33,10,'Alimento para perro 10kg',483106.93,33,NULL,'Ideal para el uso diario, resistente y duradero.','2020-03-30'),(93,47,27,'Escritorio de oficina',97331.07,351,NULL,'Edición especial con precio promocional por tiempo limitado.','2022-05-21'),(94,17,64,'Cuaderno universitario',253953.52,75,NULL,'Ideal para el uso diario, resistente y duradero.','2025-09-06'),(95,23,31,'Taladro eléctrico',325246.65,173,NULL,'Producto de alta calidad con garantía incluida.','2023-09-06'),(96,31,59,'Consola de videojuegos',316389.19,244,NULL,'Ideal para el uso diario, resistente y duradero.','2024-12-05'),(97,29,81,'Paquete de ofertas',259951.04,195,NULL,'Disponible en varias tallas y colores según preferencia.','2021-11-30'),(98,92,17,'Tiquetes de viaje',157681.79,156,NULL,'Hecho con insumos locales, apoyando la industria nacional.','2020-06-22'),(99,84,32,'Guitarra acústica',34566.59,23,NULL,'Hecho con insumos locales, apoyando la industria nacional.','2020-04-12'),(100,46,54,'Servicio de instalación',191187.72,492,NULL,'Disponible en varias tallas y colores según preferencia.','2021-08-13'),(101,1,13,'pc portatil hp ryzen 7',3000000.00,5,'disponible','color gris','2025-10-08 16:28:10');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ai_products_audit` AFTER INSERT ON `products` FOR EACH ROW BEGIN
  SET @from_products_trigger = 1;

  INSERT INTO products_audit (product_id, action_type, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    JSON_OBJECT(
      'id', NEW.id,
      'name', NEW.name,
      'price', NEW.price,
      'stock', NEW.stock,
      'status', NEW.status,
      'seller_id', NEW.seller_id,
      'category_id', NEW.category_id
    )
  );

  SET @from_products_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `au_products_audit` AFTER UPDATE ON `products` FOR EACH ROW BEGIN
  SET @from_products_trigger = 1;

  INSERT INTO products_audit (product_id, action_type, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    JSON_OBJECT(
      'id', OLD.id,
      'name', OLD.name,
      'price', OLD.price,
      'stock', OLD.stock,
      'status', OLD.status
    ),
    JSON_OBJECT(
      'id', NEW.id,
      'name', NEW.name,
      'price', NEW.price,
      'stock', NEW.stock,
      'status', NEW.status
    )
  );

  SET @from_products_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ad_products_audit` AFTER DELETE ON `products` FOR EACH ROW BEGIN
  SET @from_products_trigger = 1;

  INSERT INTO products_audit (product_id, action_type, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    JSON_OBJECT(
      'id', OLD.id,
      'name', OLD.name,
      'price', OLD.price,
      'stock', OLD.stock,
      'status', OLD.status
    ),
    NULL
  );

  SET @from_products_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `products_audit`
--

DROP TABLE IF EXISTS `products_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_audit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `action_type` enum('INSERT','UPDATE','DELETE') NOT NULL DEFAULT 'INSERT',
  `changed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` varchar(255) NOT NULL DEFAULT 'Admin',
  `before_data` json DEFAULT NULL,
  `after_data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_audit`
--

LOCK TABLES `products_audit` WRITE;
/*!40000 ALTER TABLE `products_audit` DISABLE KEYS */;
INSERT INTO `products_audit` VALUES (1,1,'UPDATE','2025-10-12 20:26:03','Admin','{\"id\": 1, \"name\": \"Televisor LED 50 pulgadas\", \"price\": 75633.22, \"stock\": 397, \"status\": null}','{\"id\": 1, \"name\": \"Televisor LED 60 pulgadas\", \"price\": 1000000.00, \"stock\": 397, \"status\": null}'),(2,2,'UPDATE','2025-10-14 17:05:56','Admin','{\"id\": 2, \"name\": \"Camiseta deportiva hombre\", \"price\": 168012.82, \"stock\": 175, \"status\": null}','{\"id\": 2, \"name\": \"sueter femenino\", \"price\": 1500000.00, \"stock\": 175, \"status\": null}');
/*!40000 ALTER TABLE `products_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bii_products_audit_guard_insert` BEFORE INSERT ON `products_audit` FOR EACH ROW BEGIN
  IF COALESCE(@from_products_trigger, 0) <> 1 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT en products_audit solo permitido desde triggers de products.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `biu_products_audit_block_update` BEFORE UPDATE ON `products_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'products_audit es inmutable: UPDATE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bid_products_audit_block_delete` BEFORE DELETE ON `products_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'products_audit es inmutable: DELETE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  `comment` text,
  `review_comment` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `reviews_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,67,4,'productos colombianos','Producto de buena calidad, aunque esperaba un mejor acabado.'),(2,90,2,NULL,'El color y la talla coinciden perfectamente, satisfecho.'),(3,73,3,NULL,'Excelente relación calidad-precio, lo recomiendo.'),(4,20,5,'exclente servicio','El servicio al cliente fue excelente, resolvieron mis dudas rápido.'),(5,60,5,NULL,'Muy buena calidad, llegó a tiempo.'),(6,47,4,'super economica','Excelente relación calidad-precio, lo recomiendo.'),(7,35,1,NULL,'No estoy satisfecho, el producto se dañó al poco tiempo de uso.'),(8,80,1,NULL,'Producto de buena calidad, aunque esperaba un mejor acabado.'),(9,75,5,NULL,'El color y la talla coinciden perfectamente, satisfecho.'),(10,100,5,NULL,'Muy buena calidad, llegó a tiempo.'),(11,54,1,NULL,'No estoy satisfecho, el producto se dañó al poco tiempo de uso.'),(12,2,1,NULL,'No estoy satisfecho, el producto se dañó al poco tiempo de uso.'),(13,86,3,NULL,'Demoró un poco en el envío, pero valió la pena.'),(14,84,4,NULL,'No era lo que esperaba, la descripción debe ser más clara.'),(15,94,1,NULL,'El color y la talla coinciden perfectamente, satisfecho.'),(16,52,4,NULL,'Excelente relación calidad-precio, lo recomiendo.'),(17,85,5,NULL,'Excelente relación calidad-precio, lo recomiendo.'),(18,96,5,NULL,'El servicio al cliente fue excelente, resolvieron mis dudas rápido.'),(19,39,3,NULL,'Demoró un poco en el envío, pero valió la pena.'),(20,63,2,NULL,'No era lo que esperaba, la descripción debe ser más clara.'),(21,52,4,NULL,'El color y la talla coinciden perfectamente, satisfecho.'),(22,65,1,NULL,'Muy buena calidad, llegó a tiempo.'),(23,1,3,NULL,'Muy buena calidad, llegó a tiempo.'),(24,49,2,NULL,'Excelente relación calidad-precio, lo recomiendo.'),(25,40,4,NULL,'Excelente relación calidad-precio, lo recomiendo.'),(26,36,5,NULL,'El servicio al cliente fue excelente, resolvieron mis dudas rápido.'),(27,58,5,NULL,'El empaque estaba un poco dañado, pero el producto funciona bien.'),(28,13,5,NULL,'No era lo que esperaba, la descripción debe ser más clara.'),(29,100,2,NULL,'Llegó antes de lo previsto, muy contento con la compra.'),(30,60,5,NULL,'Producto de buena calidad, aunque esperaba un mejor acabado.'),(31,52,2,NULL,'El servicio al cliente fue excelente, resolvieron mis dudas rápido.'),(32,76,4,NULL,'El empaque estaba un poco dañado, pero el producto funciona bien.'),(33,26,3,NULL,'Llegó antes de lo previsto, muy contento con la compra.'),(34,11,2,NULL,'El color y la talla coinciden perfectamente, satisfecho.'),(35,25,3,NULL,'Excelente relación calidad-precio, lo recomiendo.'),(36,97,5,NULL,'No estoy satisfecho, el producto se dañó al poco tiempo de uso.'),(37,63,1,NULL,'Muy buena calidad, llegó a tiempo.'),(38,78,3,NULL,'Muy buena calidad, llegó a tiempo.'),(39,18,5,NULL,'El color y la talla coinciden perfectamente, satisfecho.'),(40,9,3,NULL,'No era lo que esperaba, la descripción debe ser más clara.'),(41,33,2,NULL,'El color y la talla coinciden perfectamente, satisfecho.'),(42,83,4,NULL,'No estoy satisfecho, el producto se dañó al poco tiempo de uso.'),(43,98,4,NULL,'Producto de buena calidad, aunque esperaba un mejor acabado.'),(44,3,4,NULL,'No era lo que esperaba, la descripción debe ser más clara.'),(45,77,1,NULL,'Muy buena calidad, llegó a tiempo.'),(46,38,5,NULL,'Producto de buena calidad, aunque esperaba un mejor acabado.'),(47,18,5,NULL,'Producto de buena calidad, aunque esperaba un mejor acabado.'),(48,32,4,NULL,'Excelente relación calidad-precio, lo recomiendo.'),(49,27,1,NULL,'Muy buena calidad, llegó a tiempo.'),(50,99,1,NULL,'El empaque estaba un poco dañado, pero el producto funciona bien.'),(51,46,5,NULL,'No estoy satisfecho, el producto se dañó al poco tiempo de uso.'),(52,38,3,NULL,'Llegó antes de lo previsto, muy contento con la compra.'),(53,59,3,NULL,'Llegó antes de lo previsto, muy contento con la compra.'),(54,16,3,NULL,'Llegó antes de lo previsto, muy contento con la compra.'),(55,40,5,NULL,'El servicio al cliente fue excelente, resolvieron mis dudas rápido.'),(56,79,3,NULL,'Muy buena calidad, llegó a tiempo.'),(57,30,5,NULL,'El servicio al cliente fue excelente, resolvieron mis dudas rápido.'),(58,68,5,NULL,'No era lo que esperaba, la descripción debe ser más clara.'),(59,17,2,NULL,'El color y la talla coinciden perfectamente, satisfecho.'),(60,91,3,NULL,'El servicio al cliente fue excelente, resolvieron mis dudas rápido.'),(61,99,2,NULL,'Producto de buena calidad, aunque esperaba un mejor acabado.'),(62,29,3,NULL,'Llegó antes de lo previsto, muy contento con la compra.'),(63,58,3,NULL,'Excelente relación calidad-precio, lo recomiendo.'),(64,87,1,NULL,'El servicio al cliente fue excelente, resolvieron mis dudas rápido.'),(65,12,5,NULL,'Producto de buena calidad, aunque esperaba un mejor acabado.'),(66,7,1,NULL,'Llegó antes de lo previsto, muy contento con la compra.'),(67,37,4,NULL,'El empaque estaba un poco dañado, pero el producto funciona bien.'),(68,23,1,NULL,'Demoró un poco en el envío, pero valió la pena.'),(69,19,5,NULL,'No era lo que esperaba, la descripción debe ser más clara.'),(70,89,4,NULL,'Llegó antes de lo previsto, muy contento con la compra.'),(71,61,1,NULL,'Producto de buena calidad, aunque esperaba un mejor acabado.'),(72,16,5,NULL,'No estoy satisfecho, el producto se dañó al poco tiempo de uso.'),(73,55,4,NULL,'Muy buena calidad, llegó a tiempo.'),(74,91,1,NULL,'El servicio al cliente fue excelente, resolvieron mis dudas rápido.'),(75,23,2,NULL,'Llegó antes de lo previsto, muy contento con la compra.'),(76,62,4,NULL,'Producto de buena calidad, aunque esperaba un mejor acabado.'),(77,96,5,NULL,'Muy buena calidad, llegó a tiempo.'),(78,48,2,NULL,'Muy buena calidad, llegó a tiempo.'),(79,94,5,NULL,'Muy buena calidad, llegó a tiempo.'),(80,25,5,NULL,'Excelente relación calidad-precio, lo recomiendo.'),(81,6,1,NULL,'No estoy satisfecho, el producto se dañó al poco tiempo de uso.'),(82,18,5,NULL,'Muy buena calidad, llegó a tiempo.'),(83,66,3,NULL,'Muy buena calidad, llegó a tiempo.'),(84,15,4,NULL,'El color y la talla coinciden perfectamente, satisfecho.'),(85,67,1,NULL,'No era lo que esperaba, la descripción debe ser más clara.'),(86,22,4,NULL,'Producto de buena calidad, aunque esperaba un mejor acabado.'),(87,60,1,NULL,'El color y la talla coinciden perfectamente, satisfecho.'),(88,85,5,NULL,'No era lo que esperaba, la descripción debe ser más clara.'),(89,80,4,NULL,'El color y la talla coinciden perfectamente, satisfecho.'),(90,53,4,NULL,'Demoró un poco en el envío, pero valió la pena.'),(91,75,1,NULL,'No estoy satisfecho, el producto se dañó al poco tiempo de uso.'),(92,97,1,NULL,'No era lo que esperaba, la descripción debe ser más clara.'),(93,83,1,NULL,'El empaque estaba un poco dañado, pero el producto funciona bien.'),(94,42,1,NULL,'Producto de buena calidad, aunque esperaba un mejor acabado.'),(95,9,3,NULL,'Excelente relación calidad-precio, lo recomiendo.'),(96,97,4,NULL,'El color y la talla coinciden perfectamente, satisfecho.'),(97,2,5,NULL,'Producto de buena calidad, aunque esperaba un mejor acabado.'),(98,73,5,NULL,'Demoró un poco en el envío, pero valió la pena.'),(99,33,2,NULL,'Demoró un poco en el envío, pero valió la pena.'),(100,3,1,NULL,'El empaque estaba un poco dañado, pero el producto funciona bien.');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ai_reviews_audit` AFTER INSERT ON `reviews` FOR EACH ROW BEGIN
  SET @from_reviews_trigger = 1;
  INSERT INTO reviews_audit (review_id, actionSale, before_data, after_data)
  VALUES (NEW.id, 'INSERT', NULL, JSON_OBJECT(
    'id', NEW.id, 'product_id', NEW.product_id, 'rating', NEW.rating,
    'comment', NEW.comment, 'review_comment', NEW.review_comment
  ));
  SET @from_reviews_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `au_reviews_audit` AFTER UPDATE ON `reviews` FOR EACH ROW BEGIN
  SET @from_reviews_trigger = 1;
  INSERT INTO reviews_audit (review_id, actionSale, before_data, after_data)
  VALUES (NEW.id, 'UPDATE',
    JSON_OBJECT(
      'id', OLD.id, 'product_id', OLD.product_id, 'rating', OLD.rating,
      'comment', OLD.comment, 'review_comment', OLD.review_comment
    ),
    JSON_OBJECT(
      'id', NEW.id, 'product_id', NEW.product_id, 'rating', NEW.rating,
      'comment', NEW.comment, 'review_comment', NEW.review_comment
    )
  );
  SET @from_reviews_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `ad_reviews_audit` AFTER DELETE ON `reviews` FOR EACH ROW BEGIN
  SET @from_reviews_trigger = 1;
  INSERT INTO reviews_audit (review_id, actionSale, before_data, after_data)
  VALUES (OLD.id, 'DELETE',
    JSON_OBJECT(
      'id', OLD.id, 'product_id', OLD.product_id, 'rating', OLD.rating,
      'comment', OLD.comment, 'review_comment', OLD.review_comment
    ), NULL
  );
  SET @from_reviews_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reviews_audit`
--

DROP TABLE IF EXISTS `reviews_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_audit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_id` bigint NOT NULL,
  `actionSale` enum('UPDATE','DELETE','INSERT') NOT NULL DEFAULT 'INSERT',
  `changed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` varchar(255) NOT NULL DEFAULT 'Admin',
  `before_data` json DEFAULT NULL,
  `after_data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_audit`
--

LOCK TABLES `reviews_audit` WRITE;
/*!40000 ALTER TABLE `reviews_audit` DISABLE KEYS */;
INSERT INTO `reviews_audit` VALUES (1,1,'UPDATE','2025-10-14 17:40:39','Admin','{\"id\": 1, \"rating\": 4, \"comment\": null, \"product_id\": 67, \"review_comment\": \"Producto de buena calidad, aunque esperaba un mejor acabado.\"}','{\"id\": 1, \"rating\": 4, \"comment\": \"productos colombianos\", \"product_id\": 67, \"review_comment\": \"Producto de buena calidad, aunque esperaba un mejor acabado.\"}'),(2,4,'UPDATE','2025-10-14 17:52:04','Admin','{\"id\": 4, \"rating\": 5, \"comment\": null, \"product_id\": 20, \"review_comment\": \"El servicio al cliente fue excelente, resolvieron mis dudas rápido.\"}','{\"id\": 4, \"rating\": 5, \"comment\": \"exclente servicio\", \"product_id\": 20, \"review_comment\": \"El servicio al cliente fue excelente, resolvieron mis dudas rápido.\"}'),(3,6,'UPDATE','2025-10-14 17:58:49','Admin','{\"id\": 6, \"rating\": 4, \"comment\": null, \"product_id\": 47, \"review_comment\": \"Excelente relación calidad-precio, lo recomiendo.\"}','{\"id\": 6, \"rating\": 4, \"comment\": \"super economica\", \"product_id\": 47, \"review_comment\": \"Excelente relación calidad-precio, lo recomiendo.\"}');
/*!40000 ALTER TABLE `reviews_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bii_reviews_audit_guard_insert` BEFORE INSERT ON `reviews_audit` FOR EACH ROW BEGIN 
    IF COALESCE(@from_reviews_trigger, 0) <> 1 THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT en reviews_audit solo permitido desde triggers de reviews.'; 
    END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `biu_reviews_audit_block_update` BEFORE UPDATE ON `reviews_audit` FOR EACH ROW BEGIN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'reviews_audit es inmutable: UPDATE prohibido.'; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `bid_reviews_audit_block_delete` BEFORE DELETE ON `reviews_audit` FOR EACH ROW BEGIN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'reviews_audit es inmutable: DELETE prohibido.'; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'Daniela Díaz','daniela.díaz22@outlook.com','+34733524732',NULL,'2023-08-13'),(2,'Juan López','juan.lópez65@yahoo.com','+34 719871252',NULL,'2020-10-14'),(3,'Laura Moreno','laura.moreno53@yahoo.com','+34733 975 835',NULL,'2023-01-17'),(4,'Natalia Díaz','natalia.díaz37@gmail.com','+34 661 47 59 25',NULL,'2021-12-01'),(5,'Natalia Hernández','natalia.hernández83@gmail.com','+34955 558 004',NULL,'2022-05-31'),(6,'Natalia López','natalia.lópez75@hotmail.com','+34737 18 21 78',NULL,'2024-02-13'),(7,'Felipe Moreno','felipe.moreno89@hotmail.com','+34 942747852',NULL,'2020-11-13'),(8,'Camilo López','camilo.lópez35@yahoo.com','+34725 09 11 88',NULL,'2024-09-17'),(9,'Valentina Castro','valentina.castro6@gmail.com','+34725 21 00 03',NULL,'2023-09-15'),(10,'María Martínez','maría.martínez55@hotmail.com','+34 744 095 660',NULL,'2024-03-20'),(11,'Santiago Torres','santiago.torres34@yahoo.com','+34 715942309',NULL,'2025-05-24'),(12,'Carlos Díaz','carlos.díaz33@outlook.com','+34 935776558',NULL,'2022-05-18'),(13,'María Martínez','maría.martínez94@yahoo.com','+34749 506 871',NULL,'2024-10-02'),(14,'Felipe Martínez','felipe.martínez67@hotmail.com','+34 729 168 505',NULL,'2024-06-12'),(15,'Laura Moreno','laura.moreno9@yahoo.com','+34691571008',NULL,'2020-07-31'),(16,'Juliana Díaz','juliana.díaz28@outlook.com','+34 722 558 893',NULL,'2020-04-19'),(17,'Juan Hernández','juan.hernández23@gmail.com','+34 954 75 79 90',NULL,'2021-08-23'),(18,'Carlos Moreno','carlos.moreno93@gmail.com','+34 606 14 75 13',NULL,'2020-10-25'),(19,'Juliana Moreno','juliana.moreno35@yahoo.com','+34 709 38 65 96',NULL,'2024-03-20'),(20,'Daniela Torres','daniela.torres70@outlook.com','+34 948626388',NULL,'2020-01-09'),(21,'Valentina Torres','valentina.torres92@outlook.com','+34721 69 77 47',NULL,'2023-08-31'),(22,'Juan Martínez','juan.martínez29@hotmail.com','+34715 476 270',NULL,'2024-02-08'),(23,'Laura Ramírez','laura.ramírez53@outlook.com','+34655417218',NULL,'2021-04-25'),(24,'Juan Martínez','juan.martínez88@outlook.com','+34925 66 81 33',NULL,'2021-09-13'),(25,'Andrés Hernández','andrés.hernández21@gmail.com','+34685 48 66 76',NULL,'2020-10-16'),(26,'Felipe Pérez','felipe.pérez32@hotmail.com','+34 722 09 13 73',NULL,'2024-06-07'),(27,'Andrés Torres','andrés.torres6@gmail.com','+34 667388775',NULL,'2023-10-30'),(28,'Andrés Díaz','andrés.díaz91@outlook.com','+34722995100',NULL,'2021-04-11'),(29,'Santiago Martínez','santiago.martínez31@gmail.com','+34616 59 73 07',NULL,'2024-07-19'),(30,'Andrés Castro','andrés.castro19@hotmail.com','+34 636 002 688',NULL,'2020-12-04'),(31,'Valentina Gómez','valentina.gómez85@outlook.com','+34 708283968',NULL,'2020-08-13'),(32,'Daniela González','daniela.gonzález62@hotmail.com','+34739 47 18 18',NULL,'2021-07-25'),(33,'Juliana Hernández','juliana.hernández57@gmail.com','+34 903 87 30 74',NULL,'2021-06-07'),(34,'Laura Castro','laura.castro92@outlook.com','+34858 67 42 12',NULL,'2021-05-10'),(35,'Juan Martínez','juan.martínez51@hotmail.com','+34715 97 02 18',NULL,'2020-02-21'),(36,'Santiago Hernández','santiago.hernández38@yahoo.com','+34993 918 103',NULL,'2022-07-07'),(37,'María Castro','maría.castro82@yahoo.com','+34 738 69 25 84',NULL,'2021-09-27'),(38,'Daniela Gómez','daniela.gómez5@outlook.com','+34 701 194 235',NULL,'2022-09-02'),(39,'Laura Torres','laura.torres20@outlook.com','+34 708 995 189',NULL,'2020-01-29'),(40,'Juliana Martínez','juliana.martínez69@gmail.com','+34748597058',NULL,'2020-08-28'),(41,'Felipe Rodríguez','felipe.rodríguez96@yahoo.com','+34704 066 172',NULL,'2023-10-29'),(42,'Juliana Díaz','juliana.díaz78@hotmail.com','+34 704 695 465',NULL,'2020-02-15'),(43,'Andrés Martínez','andrés.martínez46@hotmail.com','+34 745601492',NULL,'2024-01-14'),(44,'Camilo Ramírez','camilo.ramírez22@yahoo.com','+34 892242970',NULL,'2023-03-30'),(45,'Juan Moreno','juan.moreno70@yahoo.com','+34735 09 27 51',NULL,'2022-04-06'),(46,'Camilo Hernández','camilo.hernández39@gmail.com','+34706620850',NULL,'2023-02-14'),(47,'Juliana Díaz','juliana.díaz27@hotmail.com','+34 733664964',NULL,'2023-01-23'),(48,'Camilo González','camilo.gonzález33@yahoo.com','+34 709 27 12 68',NULL,'2020-03-20'),(49,'Felipe Díaz','felipe.díaz69@hotmail.com','+34702 529 625',NULL,'2023-04-19'),(50,'Felipe Ramírez','felipe.ramírez93@gmail.com','+34 708291107',NULL,'2020-09-21'),(51,'Laura Martínez','laura.martínez87@gmail.com','+34736 01 82 41',NULL,'2024-01-27'),(52,'Andrés Hernández','andrés.hernández1@yahoo.com','+34960 586 727',NULL,'2022-11-18'),(53,'Daniela Pérez','daniela.pérez17@yahoo.com','+34 877739786',NULL,'2024-10-14'),(54,'Natalia Torres','natalia.torres31@gmail.com','+34626 94 73 54',NULL,'2025-03-20'),(55,'María Gómez','maría.gómez39@yahoo.com','+34984 74 63 92',NULL,'2021-07-01'),(56,'Felipe Gómez','felipe.gómez2@outlook.com','+34630 873 547',NULL,'2022-12-18'),(57,'Natalia Pérez','natalia.pérez16@gmail.com','+34 747819845',NULL,'2021-04-01'),(58,'Laura López','laura.lópez78@gmail.com','+34870 253 454',NULL,'2024-05-11'),(59,'Carlos Torres','carlos.torres6@gmail.com','+34976 94 28 53',NULL,'2023-08-17'),(60,'Valentina Castro','valentina.castro62@gmail.com','+34 733991884',NULL,'2025-07-14'),(61,'Santiago López','santiago.lópez1@hotmail.com','+34 703656046',NULL,'2022-08-03'),(62,'Carlos Torres','carlos.torres93@hotmail.com','+34 711945591',NULL,'2022-01-31'),(63,'Carlos Gómez','carlos.gómez34@hotmail.com','+34 730 835 590',NULL,'2022-02-13'),(64,'Santiago Pérez','santiago.pérez15@yahoo.com','+34 996590567',NULL,'2021-07-13'),(65,'María Moreno','maría.moreno82@outlook.com','+34704 49 17 06',NULL,'2024-09-17'),(66,'Juan Torres','juan.torres43@outlook.com','+34740778986',NULL,'2025-04-23'),(67,'Natalia Torres','natalia.torres46@outlook.com','+34 631 194 349',NULL,'2020-02-08'),(68,'Andrés Moreno','andrés.moreno21@outlook.com','+34840 14 63 32',NULL,'2025-01-20'),(69,'María Pérez','maría.pérez46@outlook.com','+34 671 119 340',NULL,'2023-12-15'),(70,'Santiago Hernández','santiago.hernández66@hotmail.com','+34717 275 447',NULL,'2021-04-29'),(71,'Santiago Pérez','santiago.pérez10@hotmail.com','+34704030849',NULL,'2021-10-27'),(72,'Valentina Castro','valentina.castro22@outlook.com','+34744496720',NULL,'2022-10-14'),(73,'María González','maría.gonzález36@gmail.com','+34 928939898',NULL,'2023-06-26'),(74,'Juliana López','juliana.lópez27@outlook.com','+34 723 147 896',NULL,'2022-01-26'),(75,'Laura Díaz','laura.díaz79@hotmail.com','+34737 129 348',NULL,'2024-01-10'),(76,'Santiago González','santiago.gonzález97@outlook.com','+34749964362',NULL,'2021-03-25'),(77,'Juliana Moreno','juliana.moreno83@hotmail.com','+34731 346 945',NULL,'2024-06-16'),(78,'Camilo Castro','camilo.castro62@gmail.com','+34711 723 655',NULL,'2023-02-03'),(79,'Natalia Rodríguez','natalia.rodríguez3@hotmail.com','+34719 286 562',NULL,'2023-03-03'),(80,'Valentina Moreno','valentina.moreno77@gmail.com','+34 945 212 604',NULL,'2023-01-28'),(81,'Carlos Pérez','carlos.pérez84@hotmail.com','+34669083488',NULL,'2022-07-28'),(82,'María Moreno','maría.moreno20@gmail.com','+34 703 85 56 45',NULL,'2024-05-03'),(83,'Daniela Moreno','daniela.moreno96@yahoo.com','+34 718 502 701',NULL,'2025-06-15'),(84,'Juliana Díaz','juliana.díaz54@gmail.com','+34 816 134 749',NULL,'2020-12-27'),(85,'Natalia Moreno','natalia.moreno91@hotmail.com','+34 717588532',NULL,'2023-01-06'),(86,'Carlos Moreno','carlos.moreno60@gmail.com','+34 741 986 332',NULL,'2023-04-08'),(87,'Daniela Díaz','daniela.díaz34@yahoo.com','+34 851 270 488',NULL,'2024-05-02'),(88,'Juliana Ramírez','juliana.ramírez89@hotmail.com','+34 632723987',NULL,'2023-06-24'),(89,'Laura Moreno','laura.moreno45@hotmail.com','+34 746 368 617',NULL,'2024-06-28'),(90,'Daniela Díaz','daniela.díaz89@gmail.com','+34 972 456 973',NULL,'2024-06-08'),(91,'Camilo González','camilo.gonzález49@hotmail.com','+34 715 78 82 79',NULL,'2025-10-04'),(92,'María Pérez','maría.pérez55@gmail.com','+34741 937 117',NULL,'2024-02-09'),(93,'Carlos Martínez','carlos.martínez87@gmail.com','+34 700788590',NULL,'2024-07-14'),(94,'Daniela López','daniela.lópez79@outlook.com','+34 906332799',NULL,'2023-09-12'),(95,'Valentina Martínez','valentina.martínez82@outlook.com','+34728427640',NULL,'2020-10-03'),(96,'Valentina Ramírez','valentina.ramírez29@gmail.com','+34941 11 55 88',NULL,'2025-07-15'),(97,'Santiago Díaz','santiago.díaz18@gmail.com','+34745364097',NULL,'2021-03-03'),(98,'Valentina Gómez','valentina.gómez36@outlook.com','+34709 99 81 49',NULL,'2022-09-21'),(99,'Daniela López','daniela.lópez11@hotmail.com','+34 740082508',NULL,'2024-03-16'),(100,'Santiago Castro','santiago.castro34@yahoo.com','+34 995 05 87 66',NULL,'2020-01-30');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippings`
--

DROP TABLE IF EXISTS `shippings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `tracking_code` varchar(50) DEFAULT NULL,
  `shipping_address` varchar(50) DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  CONSTRAINT `shippings_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippings`
--

LOCK TABLES `shippings` WRITE;
/*!40000 ALTER TABLE `shippings` DISABLE KEYS */;
INSERT INTO `shippings` VALUES (1,99,NULL,'2021-07-26',NULL,'Diagonal 12 #34-56, Pereira, Risaralda','COL8499277220'),(2,14,NULL,'2020-11-26',NULL,'Transversal 54 #89-12, Cali, Valle del Cauca','COL8932634034'),(3,31,NULL,'2024-12-22',NULL,'Diagonal 12 #34-56, Medellín, Antioquia','COL4089012555'),(4,49,NULL,'2024-03-25',NULL,'Carrera 10 #23-45, Cúcuta, Norte de Santander','COL3610564099'),(5,97,NULL,'2024-07-26',NULL,'Transversal 54 #89-12, Barranquilla, Atlántico','COL8224363552'),(6,40,NULL,'2022-10-13',NULL,'Diagonal 12 #34-56, Cali, Valle del Cauca','COL5825706303'),(7,66,NULL,'2024-05-27',NULL,'Avenida 68 #45-90, Cali, Valle del Cauca','COL7831158854'),(8,52,NULL,'2025-04-28',NULL,'Calle 45 #12-67, Medellín, Antioquia','COL1151733591'),(9,39,NULL,'2023-03-24',NULL,'Diagonal 12 #34-56, Santa Marta, Magdalena','COL3907877743'),(10,95,NULL,'2021-10-21',NULL,'Avenida 68 #45-90, Pereira, Risaralda','COL6879354147'),(11,76,NULL,'2024-12-26',NULL,'Avenida 68 #45-90, Cali, Valle del Cauca','COL4710377404'),(12,64,NULL,'2024-12-22',NULL,'Transversal 54 #89-12, Cartagena, Bolívar','COL2791925395'),(13,41,NULL,'2024-11-08',NULL,'Avenida 68 #45-90, Cali, Valle del Cauca','COL5170134718'),(14,23,NULL,'2023-11-15',NULL,'Avenida 68 #45-90, Manizales, Caldas','COL3350471414'),(15,62,NULL,'2023-01-25',NULL,'Transversal 54 #89-12, Santa Marta, Magdalena','COL8805718904'),(16,19,NULL,'2020-05-16',NULL,'Diagonal 12 #34-56, Pereira, Risaralda','COL1879779014'),(17,61,NULL,'2023-10-09',NULL,'Avenida 68 #45-90, Medellín, Antioquia','COL5683918596'),(18,21,NULL,'2023-05-03',NULL,'Diagonal 12 #34-56, Manizales, Caldas','COL5208303518'),(19,15,NULL,'2020-08-13',NULL,'Diagonal 12 #34-56, Cartagena, Bolívar','COL7638531094'),(20,72,NULL,'2022-11-13',NULL,'Transversal 54 #89-12, Bucaramanga, Santander','COL9009169612'),(21,82,NULL,'2024-05-06',NULL,'Transversal 54 #89-12, Santa Marta, Magdalena','COL6006492987'),(22,81,NULL,'2022-07-10',NULL,'Carrera 10 #23-45, Barranquilla, Atlántico','COL7753614446'),(23,43,NULL,'2020-02-12',NULL,'Transversal 54 #89-12, Pereira, Risaralda','COL2443474705'),(24,60,NULL,'2023-09-28',NULL,'Transversal 54 #89-12, Medellín, Antioquia','COL8563571019'),(26,30,NULL,'2024-10-06',NULL,'Carrera 10 #23-45, Cúcuta, Norte de Santander','COL6980029924'),(27,11,NULL,'2021-02-07',NULL,'Carrera 10 #23-45, Cúcuta, Norte de Santander','COL8470941993'),(28,7,NULL,'2020-07-08',NULL,'Carrera 10 #23-45, Manizales, Caldas','COL1997462516'),(29,77,NULL,'2024-07-06',NULL,'Diagonal 12 #34-56, Manizales, Caldas','COL5630524774'),(31,32,NULL,'2022-05-31',NULL,'Diagonal 12 #34-56, Cali, Valle del Cauca','COL5288562688'),(32,89,NULL,'2021-09-06',NULL,'Avenida 68 #45-90, Bogotá, Cundinamarca','COL7968555537'),(33,70,NULL,'2022-10-26',NULL,'Calle 45 #12-67, Medellín, Antioquia','COL1306513187'),(34,33,NULL,'2024-08-05',NULL,'Avenida 68 #45-90, Santa Marta, Magdalena','COL8019363025'),(35,92,NULL,'2020-09-08',NULL,'Calle 45 #12-67, Medellín, Antioquia','COL1565398988'),(36,68,NULL,'2020-07-24',NULL,'Transversal 54 #89-12, Bogotá, Cundinamarca','COL6676131702'),(37,88,NULL,'2022-02-05',NULL,'Avenida 68 #45-90, Santa Marta, Magdalena','COL7146844129'),(38,18,NULL,'2025-08-12',NULL,'Transversal 54 #89-12, Santa Marta, Magdalena','COL7056102611'),(40,5,NULL,'2022-03-28',NULL,'Transversal 54 #89-12, Manizales, Caldas','COL5521667133'),(41,55,NULL,'2022-10-29',NULL,'Carrera 10 #23-45, Cúcuta, Norte de Santander','COL7629593253'),(45,57,NULL,'2023-08-22',NULL,'Transversal 54 #89-12, Pereira, Risaralda','COL2593177854'),(46,74,NULL,'2023-07-15',NULL,'Transversal 54 #89-12, Cali, Valle del Cauca','COL7181384023'),(47,63,NULL,'2020-08-20',NULL,'Transversal 54 #89-12, Bucaramanga, Santander','COL9561872031'),(48,96,NULL,'2024-12-15',NULL,'Carrera 10 #23-45, Barranquilla, Atlántico','COL4221861231'),(49,71,NULL,'2021-07-26',NULL,'Avenida 68 #45-90, Bogotá, Cundinamarca','COL5314416701'),(50,46,NULL,'2024-04-06',NULL,'Avenida 68 #45-90, Bogotá, Cundinamarca','COL2029813793'),(52,51,NULL,'2024-05-06',NULL,'Calle 45 #12-67, Bogotá, Cundinamarca','COL2562911377'),(54,56,NULL,'2024-12-15',NULL,'Transversal 54 #89-12, Barranquilla, Atlántico','COL7574283885'),(55,50,NULL,'2020-01-24',NULL,'Transversal 54 #89-12, Barranquilla, Atlántico','COL1370761691'),(56,80,NULL,'2024-01-02',NULL,'Carrera 10 #23-45, Pereira, Risaralda','COL2986107354'),(58,36,NULL,'2020-05-19',NULL,'Carrera 10 #23-45, Manizales, Caldas','COL3212747164'),(59,44,NULL,'2022-06-02',NULL,'Diagonal 12 #34-56, Cartagena, Bolívar','COL5528088668'),(60,100,NULL,'2024-05-10',NULL,'Carrera 10 #23-45, Santa Marta, Magdalena','COL3728447201'),(61,12,NULL,'2025-04-16',NULL,'Avenida 68 #45-90, Medellín, Antioquia','COL3200001119'),(62,65,NULL,'2022-12-08',NULL,'Diagonal 12 #34-56, Manizales, Caldas','COL2506686253'),(64,16,NULL,'2022-06-30',NULL,'Carrera 10 #23-45, Medellín, Antioquia','COL2931740604'),(65,75,NULL,'2020-01-25',NULL,'Carrera 10 #23-45, Pereira, Risaralda','COL6972793031'),(68,28,NULL,'2025-08-17',NULL,'Avenida 68 #45-90, Bucaramanga, Santander','COL3201211140'),(70,59,NULL,'2023-07-23',NULL,'Avenida 68 #45-90, Manizales, Caldas','COL5177818577'),(73,47,NULL,'2021-01-11',NULL,'Carrera 10 #23-45, Santa Marta, Magdalena','COL8665432515'),(78,78,NULL,'2025-05-03',NULL,'Avenida 68 #45-90, Bucaramanga, Santander','COL8187576987'),(79,45,NULL,'2022-02-13',NULL,'Diagonal 12 #34-56, Medellín, Antioquia','COL1686618547'),(82,73,NULL,'2021-07-02',NULL,'Diagonal 12 #34-56, Cali, Valle del Cauca','COL2624662868'),(86,69,NULL,'2022-10-07',NULL,'Calle 45 #12-67, Pereira, Risaralda','COL6557191487'),(89,2,NULL,'2022-03-01',NULL,'Avenida 68 #45-90, Bucaramanga, Santander','COL3809368229'),(94,8,NULL,'2023-07-30',NULL,'Diagonal 12 #34-56, Bucaramanga, Santander','COL4334717551'),(98,4,NULL,'2024-05-16',NULL,'Calle 45 #12-67, Cúcuta, Norte de Santander','COL7385153084'),(100,84,NULL,'2025-08-23',NULL,'Avenida 68 #45-90, Medellín, Antioquia','COL7055826578');
/*!40000 ALTER TABLE `shippings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Electrodomésticos'),(2,'Ropa'),(3,'Zapatos'),(4,'Tecnología'),(5,'Hogar'),(6,'Accesorios'),(7,'Belleza'),(8,'Juguetes'),(9,'Deportes'),(10,'Supermercado'),(11,'Salud'),(12,'Mascotas'),(13,'Muebles'),(14,'Papelería'),(15,'Herramientas'),(16,'Videojuegos'),(17,'Ofertas'),(18,'Viajes'),(19,'Instrumentos'),(20,'Servicios'),(21,'Electrodomésticos'),(22,'Ropa'),(23,'Zapatos'),(24,'Tecnología'),(25,'Hogar'),(26,'Accesorios'),(27,'Belleza'),(28,'Juguetes'),(29,'Deportes'),(30,'Supermercado'),(31,'Salud'),(32,'Mascotas'),(33,'Muebles'),(34,'Papelería'),(35,'Herramientas'),(36,'Videojuegos'),(37,'Ofertas'),(38,'Viajes'),(39,'Instrumentos'),(40,'Servicios'),(41,'Electrodomésticos'),(42,'Ropa'),(43,'Zapatos'),(44,'Tecnología'),(45,'Hogar'),(46,'Accesorios'),(47,'Belleza'),(48,'Juguetes'),(49,'Deportes'),(50,'Supermercado'),(51,'Salud'),(52,'Mascotas'),(53,'Muebles'),(54,'Papelería'),(55,'Herramientas'),(56,'Videojuegos'),(57,'Ofertas'),(58,'Viajes'),(59,'Instrumentos'),(60,'Servicios'),(61,'Electrodomésticos'),(62,'Ropa'),(63,'Zapatos'),(64,'Tecnología'),(65,'Hogar'),(66,'Accesorios'),(67,'Belleza'),(68,'Juguetes'),(69,'Deportes'),(70,'Supermercado'),(71,'Salud'),(72,'Mascotas'),(73,'Muebles'),(74,'Papelería'),(75,'Herramientas'),(76,'Videojuegos'),(77,'Ofertas'),(78,'Viajes'),(79,'Instrumentos'),(80,'Servicios'),(81,'Electrodomésticos'),(82,'Ropa'),(83,'Zapatos'),(84,'Tecnología'),(85,'Hogar'),(86,'Accesorios'),(87,'Belleza'),(88,'Juguetes'),(89,'Deportes'),(90,'Supermercado'),(91,'Salud'),(92,'Mascotas'),(93,'Muebles'),(94,'Papelería'),(95,'Herramientas'),(96,'Videojuegos'),(97,'Ofertas'),(98,'Viajes'),(99,'Instrumentos'),(100,'Servicios');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'marketplace_lg'
--

--
-- Dumping routines for database 'marketplace_lg'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddCustomer`(
    IN p_name VARCHAR(100),
    IN p_last_name VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_phone VARCHAR(50),
    IN p_address VARCHAR(150)
)
BEGIN
    INSERT INTO customers (name, last_name, email, phone, address, created_at)
    VALUES (p_name, p_last_name, p_email, p_phone, p_address, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddOrderItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddOrderItem`(
    IN p_order_id INT,
    IN p_product_id INT,
    IN p_quantity INT,
    IN p_price DECIMAL(10,2)
)
BEGIN
    INSERT INTO order_details (order_id, product_id, quantity, price)
    VALUES (p_order_id, p_product_id, p_quantity, p_price);

    
    UPDATE products
    SET stock = stock - p_quantity
    WHERE id = p_product_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `AddProduct`(
    IN p_seller_id INT,
    IN p_category_id INT,
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_stock INT,
    IN p_status VARCHAR(20),
    IN p_description VARCHAR(64)
)
BEGIN
    INSERT INTO products (seller_id, category_id, name, price, stock, status, description, created_at)
    VALUES (p_seller_id, p_category_id, p_name, p_price, p_stock, p_status, p_description, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `CreateOrder`(
    IN p_customer_id INT,
    IN p_total DECIMAL(10,2),
    OUT new_order_id INT
)
BEGIN
    INSERT INTO orders (customer_id, order_date, total, total_amount)
    VALUES (p_customer_id, CURDATE(), p_total, p_total);

    SET new_order_id = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCustomerOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetCustomerOrders`(
    IN p_customer_id INT
)
BEGIN
    SELECT o.id AS order_id, o.order_date, o.total, 
           od.product_id, p.name AS product_name, od.quantity, od.price
    FROM orders o
    INNER JOIN order_details od ON o.id = od.order_id
    INNER JOIN products p ON od.product_id = p.id
    WHERE o.customer_id = p_customer_id
    ORDER BY o.order_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProductsByPriceRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetProductsByPriceRange`(
    IN p_min_price DECIMAL(10,2),
    IN p_max_price DECIMAL(10,2)
)
BEGIN
    SELECT id, name, price, stock
    FROM products
    WHERE price BETWEEN p_min_price AND p_max_price
    ORDER BY price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 15:07:50
