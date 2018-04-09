-- MySQL dump 10.13  Distrib 5.7.21, for Linux (i686)
--
-- Host: localhost    Database: myairblast
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `PStatus`
--

DROP TABLE IF EXISTS `PStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PStatus` (
  `nStatus` varchar(5) NOT NULL,
  `mStatus` varchar(45) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UserCreate` varchar(45) NOT NULL DEFAULT '',
  `ModifyDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UserModify` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`nStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PStatus`
--

LOCK TABLES `PStatus` WRITE;
/*!40000 ALTER TABLE `PStatus` DISABLE KEYS */;
INSERT INTO `PStatus` VALUES ('F','กำลังแช่แข็ง','2018-03-27 10:41:57','ez','0000-00-00 00:00:00',''),('G','G','2018-02-27 11:23:45','admin','0000-00-00 00:00:00',''),('H','รอผล','2018-03-27 10:45:38','admin','0000-00-00 00:00:00',''),('P','นำไปหีบห่อ','2018-03-27 10:42:26','ez','0000-00-00 00:00:00',''),('T','ทดลอง','2018-03-27 10:42:09','ez','0000-00-00 00:00:00',''),('V','V','2018-03-28 15:55:02','admin','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `PStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airIN`
--

DROP TABLE IF EXISTS `airIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airIN` (
  `airNo` int(11) NOT NULL,
  `airTemp` varchar(45) NOT NULL,
  `airArea` varchar(45) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UserCreate` varchar(45) NOT NULL DEFAULT '',
  `ModifyDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UserModify` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`airNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airIN`
--

LOCK TABLES `airIN` WRITE;
/*!40000 ALTER TABLE `airIN` DISABLE KEYS */;
INSERT INTO `airIN` VALUES (1,'-10','5','2018-03-30 16:02:45','pipe','2018-04-04 11:05:03','admin'),(2,'-5','30','2018-03-30 16:18:54','pipe','0000-00-00 00:00:00',''),(3,'-9999','40','2018-03-30 17:08:03','pipe','0000-00-00 00:00:00',''),(4,'-6','60','2018-04-04 11:02:43','admin','0000-00-00 00:00:00',''),(5,'-2','5','2018-04-04 11:06:08','admin','0000-00-00 00:00:00',''),(12121,'-44','50','2018-04-04 11:23:46','admin','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `airIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factory`
--

DROP TABLE IF EXISTS `factory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factory` (
  `facID` int(11) unsigned NOT NULL,
  `facName` varchar(50) DEFAULT NULL,
  `facType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`facID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory`
--

LOCK TABLES `factory` WRITE;
/*!40000 ALTER TABLE `factory` DISABLE KEYS */;
/*!40000 ALTER TABLE `factory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `Position` varchar(45) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Status` enum('Admin','User') NOT NULL DEFAULT 'User',
  `CreateDate` datetime DEFAULT '0000-00-00 00:00:00',
  `UserCreate` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=778 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (5,'p','p','pipe','คน','88','Admin','0000-00-00 00:00:00',''),(4,'000','000','ez','IT','99','User','0000-00-00 00:00:00',''),(124,'apzzz','apz','apz','SA','097666','Admin','0000-00-00 00:00:00',''),(123,'a','a','aof','ปกม','098','Admin','0000-00-00 00:00:00',''),(776,'admin','admin','admin','admin','0999999999','Admin','0000-00-00 00:00:00',''),(6,'xx','xx','xx','xx','xx','Admin','0000-00-00 00:00:00',''),(7,'sss','sss','sss','sss','000','User','0000-00-00 00:00:00',''),(777,'test','test','test','test','test','User','2018-04-03 10:14:01','admin');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productIN`
--

DROP TABLE IF EXISTS `productIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productIN` (
  `pCode` varchar(13) NOT NULL,
  `pName` varchar(45) NOT NULL,
  `pTime` varchar(45) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UserCreate` varchar(45) NOT NULL DEFAULT '',
  `ModifyDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UserModify` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`pCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productIN`
--

LOCK TABLES `productIN` WRITE;
/*!40000 ALTER TABLE `productIN` DISABLE KEYS */;
INSERT INTO `productIN` VALUES ('0','','','0000-00-00 00:00:00','','0000-00-00 00:00:00',''),('1','SSS','25','0000-00-00 00:00:00','','0000-00-00 00:00:00',''),('111','Fishh','20','0000-00-00 00:00:00','','0000-00-00 00:00:00',''),('1111111111111','ข้าว','15','2018-03-28 10:20:07','admin','0000-00-00 00:00:00',''),('123123','แกงจืด','60','2018-03-28 10:08:05','admin','0000-00-00 00:00:00',''),('123456','piede','11','0000-00-00 00:00:00','','0000-00-00 00:00:00',''),('1234567891231','pineapple2','20','0000-00-00 00:00:00','','0000-00-00 00:00:00',''),('1234572234342','ไก่','1','2018-04-02 09:30:26','admin','0000-00-00 00:00:00',''),('2','kapowmoo','50','0000-00-00 00:00:00','','0000-00-00 00:00:00',''),('3','kapowmoo','50','0000-00-00 00:00:00','','0000-00-00 00:00:00',''),('4444444444444','Test','60','2018-04-04 11:16:44','admin','0000-00-00 00:00:00',''),('5','kfirerice','55','0000-00-00 00:00:00','','0000-00-00 00:00:00',''),('555','ข้าวไข่เจียว','99','2018-03-28 10:03:05','admin','0000-00-00 00:00:00',''),('5555555555555','พพพพพ','15','2018-03-28 15:53:41','admin','0000-00-00 00:00:00',''),('6','water z','50','0000-00-00 00:00:00','','0000-00-00 00:00:00',''),('7','Test','60','0000-00-00 00:00:00','','0000-00-00 00:00:00',''),('9','pineapple2','40','0000-00-00 00:00:00','','0000-00-00 00:00:00',''),('98751242','SSwww','33','0000-00-00 00:00:00','','2018-03-28 15:52:54','admin');
/*!40000 ALTER TABLE `productIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showin`
--

DROP TABLE IF EXISTS `showin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `showin` (
  `airNo` int(11) NOT NULL,
  `pName` varchar(45) NOT NULL,
  `carNo` varchar(100) NOT NULL,
  `pLot` varchar(45) NOT NULL,
  `pAmount` varchar(45) NOT NULL,
  `sTime` varchar(45) NOT NULL,
  `eTime` varchar(45) NOT NULL,
  `TAir` varchar(45) NOT NULL,
  `pStatus` varchar(45) NOT NULL,
  `CreateDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UserCreate` varchar(45) NOT NULL,
  PRIMARY KEY (`airNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showin`
--

LOCK TABLES `showin` WRITE;
/*!40000 ALTER TABLE `showin` DISABLE KEYS */;
INSERT INTO `showin` VALUES (1,'1,ไก่','5','1','50','9:31:31','09:32:31','-2','P','2018-04-02 09:31:32','admin'),(3,'1,ไก่','c11,c22','2','60','11:20:47','11:21:47','-2','P','2018-04-04 11:20:48','admin'),(4,'1,ไก่','','1','55','11:08:34','11:09:34','-2','P','2018-04-04 11:08:35','admin');
/*!40000 ALTER TABLE `showin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airArea` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'4'),(2,'20'),(3,'30'),(4,'55'),(5,'3'),(12121,'50');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-09 13:39:46
