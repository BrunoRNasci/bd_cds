CREATE DATABASE  IF NOT EXISTS `bd_cds` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_cds`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_cds
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `tb_artista`
--

DROP TABLE IF EXISTS `tb_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_artista` (
  `Cod_Art` int NOT NULL AUTO_INCREMENT,
  `Nome_Art` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_Art`),
  UNIQUE KEY `Nome_Art_UNIQUE` (`Nome_Art`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_artista`
--

LOCK TABLES `tb_artista` WRITE;
/*!40000 ALTER TABLE `tb_artista` DISABLE KEYS */;
INSERT INTO `tb_artista` VALUES (1,'Bôa'),(2,'Gorillaz'),(4,'King Crimson'),(6,'Low Roar'),(3,'Metric'),(5,'WoodKid');
/*!40000 ALTER TABLE `tb_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_categoria` (
  `Cod_Cat` int NOT NULL,
  `Nome_Cat` varchar(50) NOT NULL,
  PRIMARY KEY (`Cod_Cat`),
  UNIQUE KEY `Nome_Cat_UNIQUE` (`Nome_Cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` VALUES (4,'Alternativa'),(5,'Indie'),(3,'Indie Rock'),(1,'Post Rock'),(2,'Rock'),(6,'Rock Progressivo');
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cidade`
--

DROP TABLE IF EXISTS `tb_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cidade` (
  `Cod_Cid` int NOT NULL AUTO_INCREMENT,
  `Nome_Cid` varchar(100) NOT NULL,
  `Sigla_Est` char(2) NOT NULL,
  PRIMARY KEY (`Cod_Cid`),
  KEY `Fk_SiglaEst` (`Sigla_Est`),
  CONSTRAINT `Fk_SiglaEst` FOREIGN KEY (`Sigla_Est`) REFERENCES `tb_estado` (`Sigla_Est`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cidade`
--

LOCK TABLES `tb_cidade` WRITE;
/*!40000 ALTER TABLE `tb_cidade` DISABLE KEYS */;
INSERT INTO `tb_cidade` VALUES (16,'São Paulo','SP'),(17,'Santos','SP'),(18,'Rio de Janeiro','RJ'),(19,'Itaquera','SP'),(20,'Moema','SP');
/*!40000 ALTER TABLE `tb_cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente` (
  `Cod_Cli` int NOT NULL AUTO_INCREMENT,
  `Cod_Cid` int NOT NULL,
  `Nome_Cli` varchar(100) NOT NULL,
  `End_Cli` varchar(200) NOT NULL,
  `Renda_Cli` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Sexo_Cli` enum('F','M') NOT NULL DEFAULT 'F',
  PRIMARY KEY (`Cod_Cli`),
  KEY `Fk_CodCid` (`Cod_Cid`),
  CONSTRAINT `Fk_CodCid` FOREIGN KEY (`Cod_Cid`) REFERENCES `tb_cidade` (`Cod_Cid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (7,16,'Miguel Cardoso','Rua Hercílio Luz, 41',1000.00,'M'),(8,16,'Ana Laura Porto','Rua Xororó, 121',2000.00,'F'),(9,16,'Henrique Fogaça','Praça Monteiro Lobato, 603',3000.00,'M'),(10,16,'Samuel Moura','Rua Germano Vítor dos Santos, 606',4000.00,'M'),(11,16,'Maria Vitória Dias','Rua Glucínio, 195',5000.00,'F'),(12,16,'Kaique Freitas','Rua Nelson Ferreira, 918',6000.00,'M');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_conjuge`
--

DROP TABLE IF EXISTS `tb_conjuge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_conjuge` (
  `Cod_Cli` int NOT NULL,
  `Nome_Conj` varchar(100) NOT NULL,
  `Renda_Conj` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Sexo_Conj` enum('F','M') NOT NULL DEFAULT 'M',
  KEY `Fk_CodCli` (`Cod_Cli`),
  CONSTRAINT `Fk_CodCli` FOREIGN KEY (`Cod_Cli`) REFERENCES `tb_cliente` (`Cod_Cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_conjuge`
--

LOCK TABLES `tb_conjuge` WRITE;
/*!40000 ALTER TABLE `tb_conjuge` DISABLE KEYS */;
INSERT INTO `tb_conjuge` VALUES (7,'Samuel Viana',1000.00,'M'),(8,'Sofia Moreira',1000.00,'F'),(9,'Renan da Luz',1000.00,'M'),(10,'Caio Carvalho',1000.00,'M'),(11,'Isabelly Castro',1000.00,'F'),(12,'Yago Pires',1000.00,'M');
/*!40000 ALTER TABLE `tb_conjuge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dependente`
--

DROP TABLE IF EXISTS `tb_dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_dependente` (
  `Cod_Dep` int NOT NULL AUTO_INCREMENT,
  `Cod_Func` int NOT NULL,
  `Nome_Dep` varchar(100) NOT NULL,
  `Sexo_Dep` enum('F','M') NOT NULL DEFAULT 'M',
  PRIMARY KEY (`Cod_Dep`),
  KEY `Fk_CodFunc` (`Cod_Func`),
  CONSTRAINT `Fk_CodFunc` FOREIGN KEY (`Cod_Func`) REFERENCES `tb_funcionario` (`Cod_Func`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dependente`
--

LOCK TABLES `tb_dependente` WRITE;
/*!40000 ALTER TABLE `tb_dependente` DISABLE KEYS */;
INSERT INTO `tb_dependente` VALUES (1,1,'Julia da Rosa','F'),(2,2,'Davi Luiz Nascimento','M'),(3,3,'Sarah Vieira','F'),(4,4,'Leonardo Nunes','M'),(5,5,'Maria Mendes','F'),(6,6,'Carlos Eduardo das Neves','M');
/*!40000 ALTER TABLE `tb_dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estado`
--

DROP TABLE IF EXISTS `tb_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_estado` (
  `Sigla_Est` char(2) NOT NULL,
  `Nome_Est` char(50) NOT NULL,
  PRIMARY KEY (`Sigla_Est`),
  UNIQUE KEY `Tb_Categoriacol_UNIQUE` (`Nome_Est`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estado`
--

LOCK TABLES `tb_estado` WRITE;
/*!40000 ALTER TABLE `tb_estado` DISABLE KEYS */;
INSERT INTO `tb_estado` VALUES ('MG','Minas Gerais'),('RJ','Rio de Janeiro'),('SP','São Paulo');
/*!40000 ALTER TABLE `tb_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcionario`
--

DROP TABLE IF EXISTS `tb_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_funcionario` (
  `Cod_Func` int NOT NULL AUTO_INCREMENT,
  `Nome_Func` varchar(100) NOT NULL,
  `End_Func` varchar(200) NOT NULL,
  `Sal_Func` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Sexo_func` enum('F','M') DEFAULT 'M',
  PRIMARY KEY (`Cod_Func`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcionario`
--

LOCK TABLES `tb_funcionario` WRITE;
/*!40000 ALTER TABLE `tb_funcionario` DISABLE KEYS */;
INSERT INTO `tb_funcionario` VALUES (1,'João Guilherme Moraes','Praça Madre Maria Josefina Villac, 251',1000.00,'M'),(2,'Diogo Peixoto','Rua Banana-Branca',2000.00,'M'),(3,'Mariane da Cruz','Rua Dominique Lagru',3000.00,'F'),(4,'Alana Nunes','Rua Nova Olinda do Norte',4000.00,'F'),(5,'Yuri Silveira','Rua Paolo Porpora',5000.00,'M'),(6,'Larissa da Cunha','Travessa Bom Jesus do Norte',6000.00,'F');
/*!40000 ALTER TABLE `tb_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_gravadora`
--

DROP TABLE IF EXISTS `tb_gravadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_gravadora` (
  `Cod_Grav` int NOT NULL,
  `Nome_Grav` varchar(50) NOT NULL,
  PRIMARY KEY (`Cod_Grav`),
  UNIQUE KEY `Nome_Grav_UNIQUE` (`Nome_Grav`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gravadora`
--

LOCK TABLES `tb_gravadora` WRITE;
/*!40000 ALTER TABLE `tb_gravadora` DISABLE KEYS */;
INSERT INTO `tb_gravadora` VALUES (3,'Atlantic Records'),(2,'EMi'),(6,'Green United Music'),(5,'Last Gang Records'),(1,'Pioneer'),(4,'Tonequake Records');
/*!40000 ALTER TABLE `tb_gravadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedido`
--

DROP TABLE IF EXISTS `tb_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pedido` (
  `Num_Ped` int NOT NULL AUTO_INCREMENT,
  `Cod_Cli` int NOT NULL,
  `Cod_Func` int NOT NULL,
  `Data_Ped` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Val_Ped` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Num_Ped`),
  KEY `Fk_Cod_Cli` (`Cod_Cli`),
  KEY `Fk_Cod_Func` (`Cod_Func`),
  CONSTRAINT `Fk_Cod_Cli` FOREIGN KEY (`Cod_Cli`) REFERENCES `tb_cliente` (`Cod_Cli`),
  CONSTRAINT `Fk_Cod_Func` FOREIGN KEY (`Cod_Func`) REFERENCES `tb_funcionario` (`Cod_Func`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedido`
--

LOCK TABLES `tb_pedido` WRITE;
/*!40000 ALTER TABLE `tb_pedido` DISABLE KEYS */;
INSERT INTO `tb_pedido` VALUES (7,7,1,'2022-10-28 17:42:02',120.00),(8,8,2,'2022-10-28 17:42:02',220.00),(9,9,3,'2022-10-28 17:42:02',320.00),(10,10,4,'2022-10-28 17:42:02',420.00),(11,11,5,'2022-10-28 17:42:02',520.00),(12,12,6,'2022-10-28 17:42:02',620.00);
/*!40000 ALTER TABLE `tb_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_titulo`
--

DROP TABLE IF EXISTS `tb_titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_titulo` (
  `Cod_Tit` int NOT NULL AUTO_INCREMENT,
  `Cod_Cat` int NOT NULL,
  `Cod_Grav` int NOT NULL,
  `Nome_CD` varchar(100) NOT NULL,
  `Val_Cd` decimal(10,2) NOT NULL,
  `Qtd_Estq` int NOT NULL,
  PRIMARY KEY (`Cod_Tit`),
  UNIQUE KEY `Nome_CD` (`Nome_CD`),
  KEY `Fk_CodCat` (`Cod_Cat`),
  KEY `Fk_CodGrav` (`Cod_Grav`),
  CONSTRAINT `Fk_CodCat` FOREIGN KEY (`Cod_Cat`) REFERENCES `tb_categoria` (`Cod_Cat`),
  CONSTRAINT `Fk_CodGrav` FOREIGN KEY (`Cod_Grav`) REFERENCES `tb_gravadora` (`Cod_Grav`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_titulo`
--

LOCK TABLES `tb_titulo` WRITE;
/*!40000 ALTER TABLE `tb_titulo` DISABLE KEYS */;
INSERT INTO `tb_titulo` VALUES (1,1,1,'Twilight',60.00,20),(2,2,2,'Demon Days',60.00,30),(3,3,3,'In The Court Of The Crimson King',80.00,40),(4,4,4,'Low Roar',60.00,50),(5,5,5,'Old World Underground, Where Are You Now?',60.00,60),(6,6,6,'The Golden Age',60.00,70);
/*!40000 ALTER TABLE `tb_titulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_titulo_artista`
--

DROP TABLE IF EXISTS `tb_titulo_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_titulo_artista` (
  `Cod_Tit` int NOT NULL,
  `Cod_Art` int NOT NULL,
  PRIMARY KEY (`Cod_Tit`,`Cod_Art`),
  KEY `Fk_Cod_Art` (`Cod_Art`),
  CONSTRAINT `Fk_Cod_Art` FOREIGN KEY (`Cod_Art`) REFERENCES `tb_artista` (`Cod_Art`),
  CONSTRAINT `Fk_Cod_Tit` FOREIGN KEY (`Cod_Tit`) REFERENCES `tb_titulo` (`Cod_Tit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_titulo_artista`
--

LOCK TABLES `tb_titulo_artista` WRITE;
/*!40000 ALTER TABLE `tb_titulo_artista` DISABLE KEYS */;
INSERT INTO `tb_titulo_artista` VALUES (1,1),(2,2),(5,3),(3,4),(6,5),(4,6);
/*!40000 ALTER TABLE `tb_titulo_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_titulo_pedido`
--

DROP TABLE IF EXISTS `tb_titulo_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_titulo_pedido` (
  `Num_Ped` int NOT NULL,
  `Cod_Tit` int NOT NULL,
  `Qtd_CD` int NOT NULL,
  `Val_CD` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Num_Ped`,`Cod_Tit`),
  KEY `Fk_CodTit` (`Cod_Tit`),
  CONSTRAINT `Fk_CodTit` FOREIGN KEY (`Cod_Tit`) REFERENCES `tb_titulo` (`Cod_Tit`),
  CONSTRAINT `Fk_NumPed` FOREIGN KEY (`Num_Ped`) REFERENCES `tb_pedido` (`Num_Ped`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_titulo_pedido`
--

LOCK TABLES `tb_titulo_pedido` WRITE;
/*!40000 ALTER TABLE `tb_titulo_pedido` DISABLE KEYS */;
INSERT INTO `tb_titulo_pedido` VALUES (7,6,10,80.00),(8,4,20,60.00),(9,5,30,70.00),(10,2,40,50.00),(11,3,50,40.00),(12,1,60,30.00);
/*!40000 ALTER TABLE `tb_titulo_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-28 17:57:34
