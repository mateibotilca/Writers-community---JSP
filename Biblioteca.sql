-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `autori`
--

DROP TABLE IF EXISTS `autori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autori` (
  `idautor` bigint NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) DEFAULT NULL,
  `prenume` varchar(45) DEFAULT NULL,
  `nrcarti` bigint DEFAULT NULL,
  `nationalitate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idautor`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autori`
--

LOCK TABLES `autori` WRITE;
/*!40000 ALTER TABLE `autori` DISABLE KEYS */;
INSERT INTO `autori` VALUES (1,'Richards','James',77,'SUA'),(2,'Smith','Olivia',22,'Marea Britanie'),(3,'Petrov','Ivan',30,'Rusia'),(4,'Dubois','Pierre',55,'Franta'),(5,'Andrews','William',42,'Marea Britanie'),(6,'Kuznetsov','Ivan',48,'Rusia'),(7,'Campbell','Connor',85,'Marea Britanie'),(8,'Matthews','Donald',17,'SUA'),(9,'Barnes','Hannah',14,'SUA'),(10,'Ionescu','Mircea',4,'Romania'),(11,'Gheroghe','Marin',23,'Romania'),(12,'Popescu','Gabriela',9,'Romania'),(13,'Durant','Paul',32,'Franta');
/*!40000 ALTER TABLE `autori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autori_carti`
--

DROP TABLE IF EXISTS `autori_carti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autori_carti` (
  `idscriere` bigint NOT NULL AUTO_INCREMENT,
  `idautor` bigint DEFAULT NULL,
  `idcarte` bigint DEFAULT NULL,
  `durata` bigint DEFAULT NULL,
  PRIMARY KEY (`idscriere`),
  KEY `idautor_idx` (`idautor`),
  KEY `idcarte_idx` (`idcarte`),
  CONSTRAINT `idautor` FOREIGN KEY (`idautor`) REFERENCES `autori` (`idautor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idcarte` FOREIGN KEY (`idcarte`) REFERENCES `carti` (`idcarte`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autori_carti`
--

LOCK TABLES `autori_carti` WRITE;
/*!40000 ALTER TABLE `autori_carti` DISABLE KEYS */;
INSERT INTO `autori_carti` VALUES (10,NULL,NULL,4),(11,NULL,NULL,4),(12,1,1,3),(27,1,5,3),(30,5,11,5),(32,1,11,1),(37,1,11,3),(41,1,5,10),(44,13,9,7),(63,1,1,10),(72,10,4,3),(75,6,9,40);
/*!40000 ALTER TABLE `autori_carti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carti`
--

DROP TABLE IF EXISTS `carti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carti` (
  `idcarte` bigint NOT NULL AUTO_INCREMENT,
  `titlu` varchar(45) DEFAULT NULL,
  `an` bigint DEFAULT NULL,
  `gen` varchar(45) DEFAULT NULL,
  `nrpagini` bigint DEFAULT NULL,
  `editura` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcarte`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carti`
--

LOCK TABLES `carti` WRITE;
/*!40000 ALTER TABLE `carti` DISABLE KEYS */;
INSERT INTO `carti` VALUES (1,'Galaxia Umbrelor',2023,'SF',324,'Litera'),(2,'Eclipsa Nexus',1997,'SF',223,'Nemira'),(3,'Portalul',1998,'SF',251,'Nemira'),(4,'Cronici ale Zephyr Prime',1999,'SF',317,'Nemira'),(5,'Nebula Vortex',2007,'SF',258,'Rao'),(6,'Detectivul din Noapte',2004,'Politist',384,'Rao'),(7,'Politia',2017,'Politist',342,'Rao'),(8,'Secretele Scrisorii',1999,'Politist',197,'Humanitas'),(9,'Strazi Impletite in Inima Florentei',2019,'Romantic',263,'Humanitas'),(10,'Aromele Inimii',2013,'Romantic',329,'Litera'),(11,'Aromele Inimii: Destin in Culori Pastel',2014,'Romantic',299,'Litera');
/*!40000 ALTER TABLE `carti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-08 18:22:46
