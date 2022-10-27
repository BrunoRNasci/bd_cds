-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: bd_cds
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_artista` (
  `Cod_Art` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Art` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_Art`),
  UNIQUE KEY `Nome_Art` (`Nome_Art`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categoria` (
  `Cod_Cat` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Cat` varchar(50) NOT NULL,
  PRIMARY KEY (`Cod_Cat`),
  UNIQUE KEY `Nome_Cat` (`Nome_Cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_cidade`
--

DROP TABLE IF EXISTS `tb_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cidade` (
  `Cod_Cid` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Cid` varchar(100) NOT NULL,
  `Sigla_Est` char(2) NOT NULL,
  PRIMARY KEY (`Cod_Cid`),
  KEY `Fk_SiglaEst` (`Sigla_Est`),
  CONSTRAINT `Fk_SiglaEst` FOREIGN KEY (`Sigla_Est`) REFERENCES `tb_estado` (`Sigla_Est`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente` (
  `Cod_Cli` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Cid` int(11) NOT NULL,
  `Nome_Cli` varchar(100) NOT NULL,
  `End_Cli` varchar(200) NOT NULL,
  `Renda_Cli` decimal(10,2) NOT NULL DEFAULT 0.00,
  `Sexo_Cli` enum('F','M') NOT NULL DEFAULT 'F',
  PRIMARY KEY (`Cod_Cli`),
  KEY `Fk_CodCid` (`Cod_Cid`),
  CONSTRAINT `Fk_CodCid` FOREIGN KEY (`Cod_Cid`) REFERENCES `tb_cidade` (`Cod_Cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_conjuge`
--

DROP TABLE IF EXISTS `tb_conjuge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_conjuge` (
  `Cod_Cli` int(11) NOT NULL,
  `Nome_Cunj` varchar(100) NOT NULL,
  `Renda_Conj` decimal(10,2) NOT NULL DEFAULT 0.00,
  `Sexo_Conj` enum('F','M') NOT NULL DEFAULT 'M',
  KEY `Fk_CodCli` (`Cod_Cli`),
  CONSTRAINT `Fk_CodCli` FOREIGN KEY (`Cod_Cli`) REFERENCES `tb_cliente` (`Cod_Cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_estado`
--

DROP TABLE IF EXISTS `tb_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_estado` (
  `Sigla_Est` char(2) NOT NULL,
  `Nome_Est` char(50) NOT NULL,
  PRIMARY KEY (`Sigla_Est`),
  UNIQUE KEY `Nome_Est` (`Nome_Est`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_gravadora`
--

DROP TABLE IF EXISTS `tb_gravadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_gravadora` (
  `Cod_Grav` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Grav` varchar(50) NOT NULL,
  PRIMARY KEY (`Cod_Grav`),
  UNIQUE KEY `Nome_Grav` (`Nome_Grav`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-27 12:46:51
