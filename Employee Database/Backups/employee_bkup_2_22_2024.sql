CREATE DATABASE  IF NOT EXISTS `employees` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `employees`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: employees
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `eaid` int NOT NULL,
  `estreet` varchar(45) NOT NULL,
  `ecity` varchar(45) NOT NULL,
  `est` char(2) NOT NULL,
  `ezip` char(5) NOT NULL,
  `eid` int NOT NULL,
  PRIMARY KEY (`eaid`),
  KEY `fk_Address_Employee_idx` (`eid`),
  CONSTRAINT `fk_Address_Employee` FOREIGN KEY (`eid`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacttype`
--

DROP TABLE IF EXISTS `contacttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacttype` (
  `contact_id` int NOT NULL,
  `contact_desc` varchar(45) NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacttype`
--

LOCK TABLES `contacttype` WRITE;
/*!40000 ALTER TABLE `contacttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` int NOT NULL,
  `dept_name` varchar(45) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empcontact`
--

DROP TABLE IF EXISTS `empcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empcontact` (
  `eid` int NOT NULL,
  `contact_id` int NOT NULL,
  `contact` varchar(45) NOT NULL,
  PRIMARY KEY (`eid`,`contact_id`),
  KEY `fk_Employee_has_Contact_Contact1_idx` (`contact_id`),
  KEY `fk_Employee_has_Contact_Employee1_idx` (`eid`),
  CONSTRAINT `fk_Employee_has_Contact_Contact1` FOREIGN KEY (`contact_id`) REFERENCES `contacttype` (`contact_id`),
  CONSTRAINT `fk_Employee_has_Contact_Employee1` FOREIGN KEY (`eid`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empcontact`
--

LOCK TABLES `empcontact` WRITE;
/*!40000 ALTER TABLE `empcontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `empcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emphistory`
--

DROP TABLE IF EXISTS `emphistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emphistory` (
  `eid` int NOT NULL,
  `pos_id` int NOT NULL,
  `start_date` datetime NOT NULL,
  `salary` int NOT NULL,
  `comments` varchar(255) NOT NULL,
  `status_id` int NOT NULL,
  PRIMARY KEY (`eid`,`pos_id`,`start_date`),
  KEY `4_idx` (`status_id`),
  KEY `5_idx` (`eid`),
  KEY `6_idx` (`pos_id`),
  CONSTRAINT `4` FOREIGN KEY (`status_id`) REFERENCES `historystatus` (`status_id`),
  CONSTRAINT `5` FOREIGN KEY (`eid`) REFERENCES `employee` (`eid`),
  CONSTRAINT `6` FOREIGN KEY (`pos_id`) REFERENCES `emppos` (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emphistory`
--

LOCK TABLES `emphistory` WRITE;
/*!40000 ALTER TABLE `emphistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `emphistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `eid` int NOT NULL,
  `efn` varchar(45) NOT NULL,
  `eln` varchar(45) NOT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emppos`
--

DROP TABLE IF EXISTS `emppos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emppos` (
  `pos_id` int NOT NULL,
  `pos_name` varchar(45) NOT NULL,
  `dept_id` int NOT NULL,
  PRIMARY KEY (`pos_id`),
  KEY `1_idx` (`dept_id`),
  CONSTRAINT `1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emppos`
--

LOCK TABLES `emppos` WRITE;
/*!40000 ALTER TABLE `emppos` DISABLE KEYS */;
/*!40000 ALTER TABLE `emppos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historystatus`
--

DROP TABLE IF EXISTS `historystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historystatus` (
  `status_id` int NOT NULL,
  `status_desc` varchar(45) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historystatus`
--

LOCK TABLES `historystatus` WRITE;
/*!40000 ALTER TABLE `historystatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `historystatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salpos`
--

DROP TABLE IF EXISTS `salpos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salpos` (
  `pos_id` int NOT NULL,
  `sal_id` int NOT NULL,
  `sal_date` datetime NOT NULL,
  `sal_value` int NOT NULL,
  PRIMARY KEY (`pos_id`,`sal_id`,`sal_date`),
  KEY `2_idx` (`sal_id`),
  KEY `3_idx` (`pos_id`),
  CONSTRAINT `2` FOREIGN KEY (`sal_id`) REFERENCES `saltype` (`sal_id`),
  CONSTRAINT `3` FOREIGN KEY (`pos_id`) REFERENCES `emppos` (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salpos`
--

LOCK TABLES `salpos` WRITE;
/*!40000 ALTER TABLE `salpos` DISABLE KEYS */;
/*!40000 ALTER TABLE `salpos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saltype`
--

DROP TABLE IF EXISTS `saltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saltype` (
  `sal_id` int NOT NULL,
  `sal_desc` varchar(45) NOT NULL,
  PRIMARY KEY (`sal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saltype`
--

LOCK TABLES `saltype` WRITE;
/*!40000 ALTER TABLE `saltype` DISABLE KEYS */;
/*!40000 ALTER TABLE `saltype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-22 14:39:13
