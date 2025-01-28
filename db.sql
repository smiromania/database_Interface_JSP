
CREATE DATABASE IF NOT EXISTS Festival;
USE Festival;

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
-- Table structure for table `consultatie`
--

DROP TABLE IF EXISTS `Festival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Festival` (
  `idConcert` int(11) NOT NULL AUTO_INCREMENT,
  `idStil` int(11) DEFAULT NULL,
  `idMuzician` int(11) DEFAULT NULL,
  `DataCantarii` date DEFAULT NULL,
  `Scena` varchar(45) DEFAULT NULL,
  `Ora` time DEFAULT NULL,
  PRIMARY KEY (`idConcert`),
  KEY `fk_link_1_idx` (`idMuzician`),
  KEY `fk_link_2_idx` (`idStil`),
  CONSTRAINT `fk_link_1` FOREIGN KEY (`idMuzician`) REFERENCES `Muzicieni` (`idMuzician`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_link_2` FOREIGN KEY (`idStil`) REFERENCES `StiluriMuzicale` (`idStil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultatie`
--

LOCK TABLES `Festival` WRITE;
/*!40000 ALTER TABLE `Festival` DISABLE KEYS */;
/*!40000 ALTER TABLE `Festival` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medici`
--

DROP TABLE IF EXISTS `Muzicieni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Muzicieni` (
  `idMuzician` int(11) NOT NULL AUTO_INCREMENT,
	`DataNasterii` DATE,
  `Nume` varchar(45) DEFAULT NULL,
  `Prenume` varchar(45) DEFAULT NULL,
  `NumeDeScena` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMuzician`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medici`
--

LOCK TABLES `Muzicieni` WRITE;
/*!40000 ALTER TABLE `Muzicieni` DISABLE KEYS */;
/*!40000 ALTER TABLE `Muzicieni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacienti`
--

DROP TABLE IF EXISTS `StiluriMuzicale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StiluriMuzicale` (
  `idStil` int(11) NOT NULL AUTO_INCREMENT,
  `Nume` varchar(45) DEFAULT NULL,
  `Descriere` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`idStil`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacienti`
--




LOCK TABLES `StiluriMuzicale` WRITE;
/*!40000 ALTER TABLE `StiluriMuzicale` DISABLE KEYS */;
/*!40000 ALTER TABLE `StiluriMuzicale` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

insert into StiluriMuzicale(Nume, Descriere) values('" + Nume + "', '" + Descriere + "');