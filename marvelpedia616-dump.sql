-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: marvel
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `allies_of`
--

DROP TABLE IF EXISTS `allies_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allies_of` (
  `TeamID` varchar(5) NOT NULL,
  `AllyChar` varchar(5) DEFAULT NULL,
  `AllyTeam` varchar(5) DEFAULT NULL,
  KEY `TeamID` (`TeamID`),
  KEY `AllyTeam` (`AllyTeam`),
  KEY `AllyChar` (`AllyChar`),
  CONSTRAINT `allies_of_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`),
  CONSTRAINT `allies_of_ibfk_2` FOREIGN KEY (`AllyTeam`) REFERENCES `teams` (`TeamID`),
  CONSTRAINT `allies_of_ibfk_3` FOREIGN KEY (`AllyChar`) REFERENCES `characters` (`CharID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allies_of`
--

LOCK TABLES `allies_of` WRITE;
/*!40000 ALTER TABLE `allies_of` DISABLE KEYS */;
INSERT INTO `allies_of` VALUES ('T0001','C0004','T0002'),('T0001','C0005','T0002'),('T0001','C0006','T0002'),('T0002','C0001','T0001'),('T0002','C0002','T0001'),('T0002','C0003','T0001');
/*!40000 ALTER TABLE `allies_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `CharID` varchar(5) NOT NULL,
  `CharName` varchar(50) DEFAULT NULL,
  `Leads` varchar(5) DEFAULT NULL,
  `Race` varchar(15) DEFAULT NULL,
  `BirthPlace` varchar(30) DEFAULT NULL,
  `MaritalStatus` varchar(10) DEFAULT NULL,
  `CharCurAlias` varchar(20) DEFAULT NULL,
  `first_appeared_in` varchar(5) DEFAULT NULL,
  `Identity` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CharID`),
  KEY `Leads` (`Leads`),
  KEY `BirthPlace` (`BirthPlace`),
  KEY `Race` (`Race`),
  KEY `first_appeared_in` (`first_appeared_in`),
  CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`Leads`) REFERENCES `teams` (`TeamID`),
  CONSTRAINT `characters_ibfk_2` FOREIGN KEY (`BirthPlace`) REFERENCES `locations` (`LocID`),
  CONSTRAINT `characters_ibfk_3` FOREIGN KEY (`Race`) REFERENCES `races` (`RaceID`),
  CONSTRAINT `characters_ibfk_4` FOREIGN KEY (`first_appeared_in`) REFERENCES `comics` (`ComicID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES ('C0001','Reed Richards','T0001','Ra001','L0001','Married','Mister Fantastic','Co003','Public Identity'),('C0002','Susan Storm-Richards',NULL,'Ra001','L0003','Married','Invisible Woman','Co003','Public Identity'),('C0003','Jonathan Lowell Spencer Johnny Storm',NULL,'Ra001','L0003','Divorced','Human Torch','Co003','Public Identity'),('C0004','Valeria Meghan Richards',NULL,'Ra001','L0004','Single','Brainstorm','Co005','Public Identity'),('C0005','Franklin Benjamin Richards',NULL,'Ra002','L0005','Single','Powerhouse','Co004','Public Identity'),('C0006','Dragon Name','T0002','Ra003','L0005','Single','Dragon','Co005','No Dual'),('C0007','Galan',NULL,'Ra004','L0006','Single','Galactus','Co005','No Dual');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comics`
--

DROP TABLE IF EXISTS `comics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comics` (
  `ComicID` varchar(5) NOT NULL,
  `ComicName` varchar(50) NOT NULL,
  `PublishDate` date DEFAULT NULL,
  PRIMARY KEY (`ComicID`),
  UNIQUE KEY `ComicID` (`ComicID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comics`
--

LOCK TABLES `comics` WRITE;
/*!40000 ALTER TABLE `comics` DISABLE KEYS */;
INSERT INTO `comics` VALUES ('Co001','Motion Picture Funnies Weekly #1','1939-04-01'),('Co002','Human Torch Comics #23','1946-06-06'),('Co003','Fantastic Four #1','1961-11-01'),('Co004','Fantastic Four Annual #6','1968-11-01'),('Co005','Fantastic Four Vol 3 #54','2002-06-06'),('Co006','Strange Tales #101','1962-10-01'),('Co007','Marvel Comics #1','1939-10-01');
/*!40000 ALTER TABLE `comics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `created_by`
--

DROP TABLE IF EXISTS `created_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `created_by` (
  `CreatorID` varchar(5) NOT NULL,
  `ComicID` varchar(5) NOT NULL,
  KEY `CreatorID` (`CreatorID`),
  KEY `ComicID` (`ComicID`),
  CONSTRAINT `created_by_ibfk_1` FOREIGN KEY (`CreatorID`) REFERENCES `creators` (`CreatorID`),
  CONSTRAINT `created_by_ibfk_2` FOREIGN KEY (`ComicID`) REFERENCES `comics` (`ComicID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `created_by`
--

LOCK TABLES `created_by` WRITE;
/*!40000 ALTER TABLE `created_by` DISABLE KEYS */;
INSERT INTO `created_by` VALUES ('Cr001','Co001'),('Cr002','Co001'),('Cr001','Co002'),('Cr007','Co002'),('Cr001','Co003'),('Cr004','Co003'),('Cr001','Co004'),('Cr004','Co004'),('Cr002','Co005'),('Cr005','Co005'),('Cr001','Co006'),('Cr007','Co006'),('Cr001','Co007'),('Cr007','Co007');
/*!40000 ALTER TABLE `created_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creators`
--

DROP TABLE IF EXISTS `creators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creators` (
  `CreatorID` varchar(5) NOT NULL,
  `CreatorName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`CreatorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creators`
--

LOCK TABLES `creators` WRITE;
/*!40000 ALTER TABLE `creators` DISABLE KEYS */;
INSERT INTO `creators` VALUES ('Cr001','Stan Lee'),('Cr002','Rafael Marin'),('Cr003','Jonathan Hickman'),('Cr004','Jack Kirby'),('Cr005','Tom Grummett'),('Cr006','Neil Edwards'),('Cr007','Steve Ditko');
/*!40000 ALTER TABLE `creators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enemies_of`
--

DROP TABLE IF EXISTS `enemies_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enemies_of` (
  `TeamID` varchar(5) NOT NULL,
  `EnemyChar` varchar(5) DEFAULT NULL,
  `EnemyTeam` varchar(5) DEFAULT NULL,
  KEY `TeamID` (`TeamID`),
  KEY `EnemyTeam` (`EnemyTeam`),
  KEY `EnemyChar` (`EnemyChar`),
  CONSTRAINT `enemies_of_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`),
  CONSTRAINT `enemies_of_ibfk_2` FOREIGN KEY (`EnemyTeam`) REFERENCES `teams` (`TeamID`),
  CONSTRAINT `enemies_of_ibfk_3` FOREIGN KEY (`EnemyChar`) REFERENCES `characters` (`CharID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enemies_of`
--

LOCK TABLES `enemies_of` WRITE;
/*!40000 ALTER TABLE `enemies_of` DISABLE KEYS */;
INSERT INTO `enemies_of` VALUES ('T0001','C0007',NULL),('T0002','C0007',NULL);
/*!40000 ALTER TABLE `enemies_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `ItemID` varchar(5) NOT NULL,
  `ItemName` varchar(30) DEFAULT NULL,
  `first_appeared_in` varchar(5) DEFAULT NULL,
  `CurrPossessedBy` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `first_appeared_in` (`first_appeared_in`),
  KEY `CurrPossessedBy` (`CurrPossessedBy`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`first_appeared_in`) REFERENCES `comics` (`ComicID`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`CurrPossessedBy`) REFERENCES `characters` (`CharID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES ('I0001','Universal Translator','Co005','C0001'),('I0002','Fantasti-Flare','Co003','C0002'),('I0003','Fantastic Four Uniform','Co003','C0004');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localiases`
--

DROP TABLE IF EXISTS `localiases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localiases` (
  `LocID` varchar(5) DEFAULT NULL,
  `LocAlias` varchar(50) DEFAULT NULL,
  KEY `LocID` (`LocID`),
  CONSTRAINT `localiases_ibfk_1` FOREIGN KEY (`LocID`) REFERENCES `locations` (`LocID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localiases`
--

LOCK TABLES `localiases` WRITE;
/*!40000 ALTER TABLE `localiases` DISABLE KEYS */;
INSERT INTO `localiases` VALUES ('L0002','Big Blue Marble'),('L0005','The Big Apple'),('L0005','The City that Never Sleeps'),('L0005','The Capital of the World'),('L0005','Empire City'),('L0003','Fantastic Four headquarters'),('L0003','Four Freedoms Plaza'),('L0003','Parker Industries');
/*!40000 ALTER TABLE `localiases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `Galaxy` varchar(30) DEFAULT NULL,
  `LocID` varchar(5) NOT NULL,
  `LocName` varchar(25) NOT NULL,
  `StarSystem` varchar(20) DEFAULT NULL,
  `Planet` varchar(20) DEFAULT NULL,
  `Locale` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`LocID`),
  UNIQUE KEY `LocID` (`LocID`),
  UNIQUE KEY `LocName` (`LocName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES ('Milky Way','L0001','Central City','Sol','Earth','North America'),('Milky Way','L0002','Earth','Sol',NULL,NULL),('Milky Way','L0003','Glenville','Sol','Earth','Long Island'),('Milky Way','L0004','Baxter Building','Sol','Earth','Manhattan'),('Milky Way','L0005','City of New York','Sol','Earth','North America'),(NULL,'L0006','Taa',NULL,'Taa',NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operates_at`
--

DROP TABLE IF EXISTS `operates_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operates_at` (
  `TeamID` varchar(5) DEFAULT NULL,
  `OpBase` varchar(5) DEFAULT NULL,
  KEY `TeamID` (`TeamID`),
  KEY `OpBase` (`OpBase`),
  CONSTRAINT `operates_at_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`),
  CONSTRAINT `operates_at_ibfk_2` FOREIGN KEY (`OpBase`) REFERENCES `locations` (`LocID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operates_at`
--

LOCK TABLES `operates_at` WRITE;
/*!40000 ALTER TABLE `operates_at` DISABLE KEYS */;
INSERT INTO `operates_at` VALUES ('T0001','L0001'),('T0002','L0004');
/*!40000 ALTER TABLE `operates_at` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part_of`
--

DROP TABLE IF EXISTS `part_of`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part_of` (
  `TeamID` varchar(5) NOT NULL,
  `MemChar` varchar(5) DEFAULT NULL,
  KEY `TeamID` (`TeamID`),
  KEY `MemChar` (`MemChar`),
  CONSTRAINT `part_of_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`),
  CONSTRAINT `part_of_ibfk_2` FOREIGN KEY (`MemChar`) REFERENCES `characters` (`CharID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part_of`
--

LOCK TABLES `part_of` WRITE;
/*!40000 ALTER TABLE `part_of` DISABLE KEYS */;
INSERT INTO `part_of` VALUES ('T0001','C0001'),('T0001','C0002'),('T0001','C0003'),('T0002','C0004'),('T0002','C0005'),('T0002','C0006');
/*!40000 ALTER TABLE `part_of` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `races`
--

DROP TABLE IF EXISTS `races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `races` (
  `RaceID` varchar(5) NOT NULL,
  `RaceName` varchar(30) DEFAULT NULL,
  `IdentityStatus` varchar(10) DEFAULT NULL,
  `originated_at` varchar(5) DEFAULT NULL,
  `first_appeared_at` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`RaceID`),
  KEY `originated_at` (`originated_at`),
  KEY `first_appeared_at` (`first_appeared_at`),
  CONSTRAINT `races_ibfk_1` FOREIGN KEY (`originated_at`) REFERENCES `locations` (`LocID`),
  CONSTRAINT `races_ibfk_2` FOREIGN KEY (`first_appeared_at`) REFERENCES `comics` (`ComicID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `races`
--

LOCK TABLES `races` WRITE;
/*!40000 ALTER TABLE `races` DISABLE KEYS */;
INSERT INTO `races` VALUES ('Ra001','Humans','Public','L0002','Co001'),('Ra002','Mutants','Public','L0002','Co001'),('Ra003','Robots','Public','L0002','Co007'),('Ra004','Taa-ans','Secret','L0002','Co002');
/*!40000 ALTER TABLE `races` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `related_to`
--

DROP TABLE IF EXISTS `related_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `related_to` (
  `RelID` varchar(5) NOT NULL,
  `CharID` varchar(5) DEFAULT NULL,
  `Relative` varchar(5) DEFAULT NULL,
  `Relation` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`RelID`),
  UNIQUE KEY `RelID` (`RelID`),
  KEY `CharID` (`CharID`),
  KEY `Relative` (`Relative`),
  CONSTRAINT `related_to_ibfk_1` FOREIGN KEY (`CharID`) REFERENCES `characters` (`CharID`),
  CONSTRAINT `related_to_ibfk_2` FOREIGN KEY (`Relative`) REFERENCES `characters` (`CharID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_to`
--

LOCK TABLES `related_to` WRITE;
/*!40000 ALTER TABLE `related_to` DISABLE KEYS */;
INSERT INTO `related_to` VALUES ('R0001','C0001','C0002','wife'),('R0002','C0001','C0003','brother-in-law'),('R0003','C0001','C0005','son'),('R0004','C0001','C0004','daughter'),('R0005','C0002','C0003','brother'),('R0006','C0002','C0001','husband'),('R0007','C0002','C0005','son'),('R0008','C0002','C0004','daughter'),('R0009','C0004','C0001','father'),('R0010','C0004','C0002','mother'),('R0011','C0004','C0005','brother'),('R0012','C0004','C0003','maternal uncle'),('R0013','C0003','C0002','sister'),('R0014','C0003','C0001','brother-in-law'),('R0015','C0003','C0005','nephew'),('R0016','C0003','C0004','niece'),('R0017','C0005','C0002','mother'),('R0018','C0005','C0001','father'),('R0019','C0005','C0003','maternal uncle'),('R0020','C0005','C0004','sister');
/*!40000 ALTER TABLE `related_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teamaliases`
--

DROP TABLE IF EXISTS `teamaliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teamaliases` (
  `TeamID` varchar(5) DEFAULT NULL,
  `TeamAlias` varchar(25) DEFAULT NULL,
  KEY `TeamID` (`TeamID`),
  CONSTRAINT `teamaliases_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teamaliases`
--

LOCK TABLES `teamaliases` WRITE;
/*!40000 ALTER TABLE `teamaliases` DISABLE KEYS */;
INSERT INTO `teamaliases` VALUES ('T0001','The Four'),('T0001','The F.F.'),('T0001','First Family of Heroes'),('T0001','Prime Elements'),('T0001','First Family of Earth'),('T0002','FF');
/*!40000 ALTER TABLE `teamaliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `TeamName` varchar(30) DEFAULT NULL,
  `Leaders` varchar(30) DEFAULT NULL,
  `TeamID` varchar(5) NOT NULL,
  `first_appeared_in` varchar(5) DEFAULT NULL,
  `TeamIdentity` varchar(10) DEFAULT NULL,
  `TeamStatus` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`TeamID`),
  UNIQUE KEY `TeamID` (`TeamID`),
  KEY `Leaders` (`Leaders`),
  KEY `first_appeared_in` (`first_appeared_in`),
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`Leaders`) REFERENCES `characters` (`CharID`),
  CONSTRAINT `teams_ibfk_2` FOREIGN KEY (`first_appeared_in`) REFERENCES `comics` (`ComicID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES ('Fantastic Four','C0001','T0001','Co003','Public','Active'),('Future Foundation','C0006','T0002','Co005','Public','Active');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-14 18:34:36
