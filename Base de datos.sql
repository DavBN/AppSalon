-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: appsalon_mvc
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuarioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (59,'2024-04-30','10:15:00',9),(61,'2024-04-29','10:34:00',8),(62,'2024-04-26','10:30:00',8),(63,'2024-05-17','13:48:00',9),(64,'2024-05-29','12:12:00',9),(65,'2024-05-30','16:20:00',9),(66,'2024-05-30','10:22:00',9),(67,'2024-05-31','10:23:00',9),(68,'2024-06-12','12:44:00',9),(69,'2024-07-12','10:15:00',115),(70,'2024-07-08','10:20:00',117),(71,'2024-07-09','11:00:00',117),(72,'2024-07-10','14:32:00',117);
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citasservicios`
--

DROP TABLE IF EXISTS `citasservicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citasservicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citaId` int DEFAULT NULL,
  `servicioId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citaId` (`citaId`),
  KEY `servicioId` (`servicioId`),
  CONSTRAINT `citasservicios_ibfk_3` FOREIGN KEY (`citaId`) REFERENCES `citas` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `citasservicios_ibfk_4` FOREIGN KEY (`servicioId`) REFERENCES `servicios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citasservicios`
--

LOCK TABLES `citasservicios` WRITE;
/*!40000 ALTER TABLE `citasservicios` DISABLE KEYS */;
INSERT INTO `citasservicios` VALUES (26,59,1),(27,59,3),(28,59,4),(29,59,2),(30,NULL,3),(31,NULL,5),(32,NULL,6),(33,61,1),(34,61,2),(35,61,4),(36,62,2),(37,63,1),(38,63,2),(39,64,1),(40,64,2),(41,64,4),(42,65,1),(43,65,2),(44,65,4),(45,66,1),(46,66,2),(47,66,4),(48,67,1),(49,67,2),(50,67,4),(51,68,1),(52,68,2),(53,68,4),(54,69,1),(55,70,1),(56,70,6),(57,70,9),(58,71,1),(59,71,2),(60,71,4),(61,71,3),(62,71,5),(63,71,6),(64,72,11),(65,72,12);
/*!40000 ALTER TABLE `citasservicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `precio` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Corte de Cabello Mujer ',15.000),(2,'Corte de Cabello Hombre',12.000),(3,'Corte de Cabello Niño',10.000),(4,'Peinado Mujer',50.000),(5,'Peinado Hombre',5.000),(6,'Peinado Niño',5.000),(7,'Corte de Barba',8.000),(8,'Tinte Mujer',70.000),(9,'Uñas',20.000),(10,'Lavado de Cabello',13.000),(11,'Tratamiento Capilar',45.000),(12,'Tinte para pelo',20.000);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Oscar','Gallego','correo@correo.com',NULL,'3196168502',NULL,1,NULL),(2,' David','García','hola@hola','$2y$10$ccIUFEOFTSkLeCFngFK2EuOKxl4XjhgimS2uiGsJaqJyz1Ny/9deu','3226552',0,1,'66896e7d84754'),(3,' Ana','María','correo2@correo.com','$2y$10$2LQ/IhZMermQZBuxU2kJcuAdGPp/Dv/osw6fJz9NCGE2RPZdVgIya','123456789',0,0,'662286f42f485 '),(4,' Jorge','Nano','hola2@hola','$2y$10$Rep26JTqVsmWH9lP4ATnLebNX9rY/NgkjAKVvgiE1EwaXBIybNeLq','123456789',0,1,'662288d9be704 '),(5,' Luis','JU','hola3@hola.com','$2y$10$u9Lqr33OBD8W6D3TfTnfOeBJCS3fVtIarKJtEcAktX7gEY8vPk8Z.','123456789',0,0,'66228a0943aea '),(6,' Alberto','Fernandez','hola4@hola.com','$2y$10$Rz0jqwo9mnN9g9Jmo9W77e0bHDKJ1aZahCLkJzDOgrR41Ng7z9Aii','123456789',0,0,'66228f0e4bfcd '),(7,'María','Fernandez','hola5@hola.com','$2y$10$nfIKEpjEn1tIMCo0qSk64.sO.Vi8kJiqmRYZfMeqoukjR4dmL/ZcK','123456789',0,1,''),(8,'Oscar','Gallego','admin@admin.com','$2y$10$myfHcayjxeZBCLCmUegI.eeSxhd1C1vTwHm2cJl9P/ufnOXytxfzG','313323',1,1,'6626b4e32a1f4'),(9,'admin','admin','admin1@admin.com','$2y$10$EHvDPbP92fluYzXx0SiELOFFPuUwvr57aYQP4qKMYi96jRhg42r/y','322311',0,1,''),(10,'david','ala','ju@ju.com','$2y$10$ZZtB/zV.I0.TTpE2fG10bue9TD2EIs2y5zgSI8AMenbKqVeYbPfna','4545452',0,1,''),(11,'AURA','ala','correo1@correo.com','$2y$10$5j7qRAC.bH4TxSlbC/GKK.uiTb1Ocz95m/iHfEWOCX4qw2biUxCOS','322311',0,1,''),(12,'ana','haha','op@op.com',NULL,'23121',NULL,1,NULL),(115,'David','García','david@correo.com','$2y$10$w2KRVoCDWhNj0.lhT.dzPuiriGNh11iPCRzG9IWeT5BgyXXqKGy1u','322311',0,1,'66896eba1e287'),(116,'Sergio','Esteban','sergio@sergio.com','$2y$10$r6ndzre6s5UeY1Tr4LOoGe/U.Cjy.oBhSPPtYDBXJOT6xpLKMjWdO','222222',0,1,''),(117,'David','Garcia','garcia@garcia.com','$2y$10$AjOKmlNFTFjmYVejSIA6QOf0cbDBEFpnQtc6D35gMtxRgnGyp099K','3196168502',0,1,'');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-30 12:00:31
