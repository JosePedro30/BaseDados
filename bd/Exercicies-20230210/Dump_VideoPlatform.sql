CREATE DATABASE  IF NOT EXISTS `video_platform` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `video_platform`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: video_platform
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `ator`
--

DROP TABLE IF EXISTS `ator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ator` (
  `id_ator` int NOT NULL,
  `ator` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_ator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ator`
--

LOCK TABLES `ator` WRITE;
/*!40000 ALTER TABLE `ator` DISABLE KEYS */;
INSERT INTO `ator` VALUES (101,'Harrison Ford'),(102,'Leonardo DiCaprio'),(103,'Kate Winslet'),(104,'Shailene Woodley'),(105,'Emilia Clarke '),(106,'Arnold Schwarzenegger ');
/*!40000 ALTER TABLE `ator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ator_filme`
--

DROP TABLE IF EXISTS `ator_filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ator_filme` (
  `id_ator` int NOT NULL,
  `id_filme` int NOT NULL,
  PRIMARY KEY (`id_ator`,`id_filme`),
  KEY `id_filme_idx` (`id_filme`),
  CONSTRAINT `id_ator` FOREIGN KEY (`id_ator`) REFERENCES `ator` (`id_ator`),
  CONSTRAINT `id_filme` FOREIGN KEY (`id_filme`) REFERENCES `filme` (`id_filme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ator_filme`
--

LOCK TABLES `ator_filme` WRITE;
/*!40000 ALTER TABLE `ator_filme` DISABLE KEYS */;
INSERT INTO `ator_filme` VALUES (105,103),(106,103),(101,114),(101,116),(101,117),(106,118);
/*!40000 ALTER TABLE `ator_filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificacao`
--

DROP TABLE IF EXISTS `classificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificacao` (
  `id_classificacao` int NOT NULL,
  `desc_classificacao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_classificacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificacao`
--

LOCK TABLES `classificacao` WRITE;
/*!40000 ALTER TABLE `classificacao` DISABLE KEYS */;
INSERT INTO `classificacao` VALUES (1,'Todos'),(2,'M6'),(3,'M12'),(4,'M14'),(5,'M16'),(6,'M18');
/*!40000 ALTER TABLE `classificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filme` (
  `id_filme` int NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `resumo` varchar(100) DEFAULT NULL,
  `diretor` varchar(45) DEFAULT NULL,
  `duracao` int DEFAULT NULL,
  `data_limite` datetime DEFAULT NULL,
  `id_classificacao` int NOT NULL,
  PRIMARY KEY (`id_filme`),
  KEY `id_classificacao_idx` (`id_classificacao`),
  CONSTRAINT `id_classificacao` FOREIGN KEY (`id_classificacao`) REFERENCES `classificacao` (`id_classificacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (101,'À prova de Fogo',2014,'A A história de um arrogante empresário e exímio caçador da natureza','Jean-Baptiste Léonetti',87,'2020-12-31 00:00:00',3),(102,'Mínimos',2015,'Os Mínimos estão sem ninguém a quem servir e entram em depressão','Pierre Coffin',87,'2020-12-31 00:00:00',2),(103,'Exterminador: Genisys',2015,'','Alan Taylor',120,'2020-06-30 00:00:00',3),(104,'Steve Jobs',2015,'','Alex Gibney',123,'2020-12-31 00:00:00',3),(105,'O Segurança do Shopping: Las Vegas',2015,'','Andy Fickman',90,'2020-03-30 00:00:00',2),(106,'A Era dos Dragões',2011,NULL,'Ryan Little',95,'2020-12-31 00:00:00',3),(107,'Birdman',2014,NULL,'Alejandro González Iñárritu',119,'2020-02-28 00:00:00',5),(108,'A Rapariga que Roubava Livros ',2013,NULL,'Brian Percival',125,'2020-01-31 00:00:00',3),(109,'Seguranças de Alto Risco ',2015,NULL,'Tristan Aurouet',81,'2020-02-28 00:00:00',5),(110,'Ted',2012,NULL,'Seth MacFarlane',91,'2020-12-31 00:00:00',3),(111,'Os Visitantes ',1993,NULL,'Jean-Marie Poiré',107,'2020-12-31 00:00:00',1),(112,'Cinbderela',2015,NULL,'Kenneth Branagh',101,'2020-03-30 00:00:00',1),(113,'AI- Inteligência Artificial',2001,NULL,'Steven Spielberg',121,'2020-06-30 00:00:00',3),(114,'Cavalo de Guerra',2011,'O filme segue um jovem chamado Albert e seu cavalo, Joey, e mostra sua ligação','Steven Spielberg',131,'2020-06-30 00:00:00',3),(115,'O Resgate do Soldado Ryan',1998,'Na última grande invasão, na última grande guerra, o maior perigo para oito homens... era salvar um','Steven Spielberg',135,'2020-07-30 00:00:00',5),(116,'O Império do Sol',1987,'História de um garoto inglês de onze anos de idade, que vive na cidade chinesa de Xanga','Steven Spielberg',153,'2020-07-30 00:00:00',3),(117,'Star Wars: O Despertar da Força',2015,NULL,'J.J.Abrams',155,'2020-12-31 00:00:00',3),(118,'Alien vs. Predador ',2004,NULL,'Paul W. S. Anderson',180,'2020-12-31 00:00:00',5);
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int NOT NULL,
  `desc_genero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Ação'),(2,'Animação'),(3,'Aventura'),(4,'Biografia'),(5,'Comédia'),(6,'Documentário'),(7,'Drama');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero_filme`
--

DROP TABLE IF EXISTS `genero_filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero_filme` (
  `id_filme` int NOT NULL,
  `id_genero` int NOT NULL,
  PRIMARY KEY (`id_filme`,`id_genero`),
  KEY `id_genero_idx` (`id_genero`),
  CONSTRAINT `id_filmeGenero` FOREIGN KEY (`id_filme`) REFERENCES `filme` (`id_filme`),
  CONSTRAINT `id_genero` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero_filme`
--

LOCK TABLES `genero_filme` WRITE;
/*!40000 ALTER TABLE `genero_filme` DISABLE KEYS */;
INSERT INTO `genero_filme` VALUES (101,1),(103,1),(106,1),(113,1),(114,1),(115,1),(117,1),(118,1),(102,2),(111,2),(112,2),(101,3),(106,3),(112,3),(113,3),(116,3),(117,3),(103,5),(105,5),(109,5),(110,5),(111,5),(104,6),(103,7),(107,7),(108,7),(114,7),(115,7),(116,7),(118,7);
/*!40000 ALTER TABLE `genero_filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `num_ator`
--

DROP TABLE IF EXISTS `num_ator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `num_ator` (
  `id_filme` int NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `num_atores` int DEFAULT NULL,
  PRIMARY KEY (`id_filme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `num_ator`
--

LOCK TABLES `num_ator` WRITE;
/*!40000 ALTER TABLE `num_ator` DISABLE KEYS */;
INSERT INTO `num_ator` VALUES (103,'Exterminador: Genisys',2),(114,'Cavalo de Guerra',1),(116,'O Império do Sol',1),(117,'Star Wars: O Despertar da Força',1),(118,'Alien vs. Predador ',1);
/*!40000 ALTER TABLE `num_ator` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-13 15:44:22
