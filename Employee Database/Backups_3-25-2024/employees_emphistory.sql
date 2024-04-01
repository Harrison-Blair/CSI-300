CREATE DATABASE  IF NOT EXISTS `employees` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `employees`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: employees
-- ------------------------------------------------------
-- Server version	8.0.20

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
  CONSTRAINT `6` FOREIGN KEY (`pos_id`) REFERENCES `emppos` (`pos_id`),
  CONSTRAINT `fk_EmpHist_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emphistory`
--

LOCK TABLES `emphistory` WRITE;
/*!40000 ALTER TABLE `emphistory` DISABLE KEYS */;
INSERT INTO `emphistory` VALUES (1,1,'2022-11-19 00:00:00',45000,'Hope this one works out',222222),(1,1,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(2,1,'2022-07-26 00:00:00',45000,'Hope this one works out',222222),(2,1,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(3,2,'2022-02-03 00:00:00',45000,'Hope this one works out',222222),(4,2,'2022-04-30 00:00:00',45000,'Hope this one works out',222222),(5,3,'2024-03-25 00:00:00',45000,'Hope this one works out',222222),(6,3,'2022-07-26 00:00:00',45000,'Hope this one works out',222222),(7,4,'2022-09-19 00:00:00',45000,'Hope this one works out',222222),(7,4,'2024-03-21 15:42:46',55000,'One-time adjustment approved by management',121212),(8,4,'2022-04-24 00:00:00',45000,'Hope this one works out',222222),(8,4,'2024-03-21 15:42:46',55000,'One-time adjustment approved by management',121212),(9,5,'2023-08-30 00:00:00',45000,'Hope this one works out',222222),(9,5,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(10,5,'2023-11-27 00:00:00',45000,'Hope this one works out',222222),(10,5,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(11,6,'2022-11-10 00:00:00',45000,'Hope this one works out',222222),(12,6,'2023-02-11 00:00:00',45000,'Hope this one works out',222222),(13,7,'2022-08-16 00:00:00',45000,'Hope this one works out',222222),(20,8,'2023-08-03 00:00:00',43000,'Hope this one works out',222222),(20,8,'2024-03-21 15:42:46',55000,'One-time adjustment approved by management',121212),(21,9,'2022-06-27 00:00:00',43000,'Hope this one works out',222222),(21,9,'2024-03-21 15:42:46',75000,'One-time adjustment approved by management',121212),(22,10,'2024-03-21 15:42:46',80000,'One-time adjustment approved by management',121212),(22,10,'2024-12-08 00:00:00',43000,'Hope this one works out',222222),(26,62,'2024-01-09 00:00:00',45000,'Hope this one works out',222222),(26,62,'2024-03-21 15:42:46',64000,'One-time adjustment approved by management',121212),(27,66,'2023-02-27 00:00:00',45000,'Hope this one works out',222222),(27,66,'2024-03-21 15:42:46',64000,'One-time adjustment approved by management',121212),(28,49,'2022-10-29 00:00:00',30000,'Hope this one works out',222222),(29,55,'2022-12-06 00:00:00',55000,'Hope this one works out',222222),(29,55,'2024-03-21 15:42:46',85000,'One-time adjustment approved by management',121212),(30,39,'2022-11-23 00:00:00',80000,'Hope this one works out',222222),(30,39,'2024-03-25 15:13:39',60000,'One-time adjustment approved by management',121212),(31,57,'2022-01-12 00:00:00',75000,'Hope this one works out',222222),(31,57,'2024-03-25 15:13:39',74000,'One-time adjustment approved by management',121212),(32,24,'2022-07-15 00:00:00',110000,'Hope this one works out',222222),(32,24,'2024-03-25 15:13:39',75000,'One-time adjustment approved by management',121212),(33,36,'2023-01-21 00:00:00',45000,'Hope this one works out',222222),(36,45,'2023-02-28 00:00:00',42000,'Hope this one works out',222222),(37,28,'2022-06-10 00:00:00',88000,'Hope this one works out',222222),(39,8,'2023-08-06 00:00:00',32000,'Hope this one works out',222222),(39,8,'2024-03-21 15:42:46',55000,'One-time adjustment approved by management',121212),(40,9,'2022-08-02 00:00:00',32000,'Hope this one works out',222222),(40,9,'2024-03-21 15:42:46',75000,'One-time adjustment approved by management',121212),(41,10,'2022-10-07 00:00:00',60000,'Hope this one works out',222222),(41,10,'2024-03-21 15:42:46',80000,'One-time adjustment approved by management',121212),(42,11,'2023-11-14 00:00:00',43000,'Hope this one works out',222222),(42,11,'2024-03-21 15:42:46',85000,'One-time adjustment approved by management',121212),(45,8,'2022-04-30 00:00:00',43000,'Hope this one works out',222222),(45,8,'2024-03-21 15:42:46',55000,'One-time adjustment approved by management',121212),(46,9,'2023-02-06 00:00:00',43000,'Hope this one works out',222222),(46,9,'2024-03-21 15:42:46',75000,'One-time adjustment approved by management',121212),(47,10,'2023-07-12 00:00:00',43000,'Hope this one works out',222222),(47,10,'2024-03-21 15:42:46',80000,'One-time adjustment approved by management',121212),(48,10,'2024-03-04 00:00:00',45000,'Hope this one works out',222222),(48,10,'2024-03-21 15:42:46',80000,'One-time adjustment approved by management',121212),(49,26,'2024-03-03 00:00:00',45000,'Hope this one works out',222222),(49,26,'2024-03-21 15:42:46',75000,'One-time adjustment approved by management',121212),(50,28,'2022-10-03 00:00:00',45000,'Hope this one works out',222222),(50,28,'2024-03-21 15:42:46',85000,'One-time adjustment approved by management',121212),(51,34,'2022-05-05 00:00:00',45000,'Hope this one works out',222222),(51,34,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(52,18,'2022-10-29 00:00:00',45000,'Hope this one works out',222222),(52,18,'2024-03-21 15:42:46',80000,'One-time adjustment approved by management',121212),(53,1,'2023-07-05 00:00:00',35000,'Hope this one works out',222222),(55,9,'2024-09-15 00:00:00',85000,'Hope this one works out',222222),(56,10,'2024-05-22 00:00:00',90000,'Hope this one works out',222222),(57,20,'2023-10-23 00:00:00',105000,'Hope this one works out',222222),(58,1,'2023-08-18 00:00:00',45000,'Hope this one works out',222222),(58,1,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(59,2,'2022-02-20 00:00:00',65000,'Hope this one works out',222222),(59,2,'2024-03-25 15:13:39',45000,'One-time adjustment approved by management',121212),(60,3,'2022-01-19 00:00:00',35000,'Hope this one works out',222222),(60,3,'2024-03-21 15:42:46',45000,'One-time adjustment approved by management',121212),(61,4,'2024-10-15 00:00:00',65000,'Hope this one works out',222222),(62,5,'2022-03-11 00:00:00',35000,'Hope this one works out',222222),(63,4,'2024-01-12 00:00:00',65000,'Hope this one works out',222222),(64,11,'2022-07-23 00:00:00',55000,'Hope this one works out',222222),(64,11,'2024-03-21 15:42:46',85000,'One-time adjustment approved by management',121212),(66,2,'2022-10-12 00:00:00',70000,'Hope this one works out',222222),(66,2,'2024-03-25 15:13:39',45000,'One-time adjustment approved by management',121212),(68,12,'2024-10-17 00:00:00',90000,'Hope this one works out',222222),(69,22,'2023-02-02 00:00:00',55000,'Hope this one works out',222222),(70,48,'2022-04-17 00:00:00',55000,'Hope this one works out',222222),(71,57,'2022-10-23 00:00:00',55000,'Hope this one works out',222222),(71,57,'2024-03-21 15:42:46',64000,'One-time adjustment approved by management',121212),(72,6,'2024-01-30 00:00:00',35000,'Hope this one works out',222222),(73,9,'2022-05-23 00:00:00',80000,'Hope this one works out',222222),(74,24,'2022-05-25 00:00:00',72000,'Hope this one works out',222222),(75,17,'2023-07-20 00:00:00',82143,'Hope this one works out',222222),(76,51,'2022-09-13 00:00:00',20000,'Hope this one works out',222222),(77,54,'2022-08-16 00:00:00',76000,'Hope this one works out',222222),(78,5,'2022-10-14 00:00:00',65000,'Hope this one works out',222222),(78,5,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(79,5,'2022-05-08 00:00:00',40000,'Hope this one works out',222222),(80,6,'2022-08-20 00:00:00',66000,'Hope this one works out',222222),(80,6,'2024-03-25 15:13:39',45000,'One-time adjustment approved by management',121212),(81,6,'2022-07-26 00:00:00',62000,'Hope this one works out',222222),(81,6,'2024-03-25 15:13:39',45000,'One-time adjustment approved by management',121212),(82,6,'2023-04-25 00:00:00',61000,'Hope this one works out',222222),(82,6,'2024-03-25 15:13:39',45000,'One-time adjustment approved by management',121212),(83,8,'2023-08-04 00:00:00',46000,'Hope this one works out',222222),(83,8,'2024-03-21 15:42:46',55000,'One-time adjustment approved by management',121212),(85,6,'2022-09-13 00:00:00',44000,'Hope this one works out',222222),(86,10,'2022-12-15 00:00:00',45000,'Hope this one works out',222222),(86,10,'2024-03-21 15:42:46',80000,'One-time adjustment approved by management',121212),(89,5,'2022-03-02 00:00:00',450000,'Hope this one works out',222222),(89,5,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(94,6,'2024-09-06 00:00:00',42100,'Hope this one works out',222222),(95,5,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(95,5,'2024-11-26 00:00:00',42125,'Hope this one works out',222222),(96,4,'2023-11-25 00:00:00',42150,'Hope this one works out',222222),(96,4,'2024-03-21 15:42:46',55000,'One-time adjustment approved by management',121212),(97,3,'2023-04-13 00:00:00',42175,'Hope this one works out',222222),(97,3,'2024-03-21 15:42:46',45000,'One-time adjustment approved by management',121212),(98,29,'2023-10-26 00:00:00',46500,'Hope this one works out',222222),(99,49,'2023-01-06 00:00:00',22000,'Hope this one works out',222222),(100,42,'2022-07-29 00:00:00',37000,'Hope this one works out',222222),(101,21,'2022-04-21 00:00:00',51000,'Hope this one works out',222222),(102,9,'2024-04-24 00:00:00',77000,'Hope this one works out',222222),(103,16,'2022-09-27 00:00:00',115000,'Hope this one works out',222222),(104,17,'2024-03-09 00:00:00',80000,'Hope this one works out',222222),(105,18,'2022-12-28 00:00:00',83000,'Hope this one works out',222222),(106,19,'2022-11-26 00:00:00',100000,'Hope this one works out',222222),(107,20,'2023-09-17 00:00:00',110000,'Hope this one works out',222222),(108,29,'2024-11-16 00:00:00',50000,'Hope this one works out',222222),(109,41,'2024-03-23 00:00:00',35000,'Hope this one works out',222222),(110,44,'2022-08-17 00:00:00',65000,'Hope this one works out',222222),(110,44,'2024-03-25 15:13:39',50000,'One-time adjustment approved by management',121212),(111,30,'2023-11-15 00:00:00',55000,'Hope this one works out',222222),(112,51,'2023-05-01 00:00:00',45000,'Hope this one works out',222222),(112,51,'2024-03-25 15:13:39',30000,'One-time adjustment approved by management',121212),(113,1,'2022-05-06 00:00:00',50000,'Hope this one works out',222222),(113,1,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(114,2,'2024-03-25 15:13:39',45000,'One-time adjustment approved by management',121212),(114,2,'2024-08-08 00:00:00',60000,'Hope this one works out',222222),(115,3,'2022-10-09 00:00:00',100000,'Hope this one works out',222222),(115,3,'2024-03-25 15:13:39',55000,'One-time adjustment approved by management',121212),(116,4,'2022-03-20 00:00:00',55000,'Hope this one works out',222222),(117,5,'2022-09-25 00:00:00',75000,'Hope this one works out',222222),(117,5,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(118,31,'2023-01-02 00:00:00',58000,'Hope this one works out',222222),(119,20,'2022-04-23 00:00:00',120000,'Hope this one works out',222222),(120,44,'2022-05-03 00:00:00',47000,'Hope this one works out',222222),(121,22,'2022-05-18 00:00:00',63500,'Hope this one works out',222222),(122,64,'2023-06-25 00:00:00',74000,'Hope this one works out',222222),(123,26,'2023-01-25 00:00:00',82000,'Hope this one works out',222222),(124,20,'2022-02-23 00:00:00',120000,'Hope this one works out',222222),(125,60,'2023-12-11 00:00:00',64000,'Hope this one works out',222222),(126,8,'2022-05-29 00:00:00',60000,'Hope this one works out',222222),(127,49,'2023-08-07 00:00:00',20000,'Hope this one works out',222222),(128,52,'2024-03-25 15:13:39',30000,'One-time adjustment approved by management',121212),(128,52,'2024-07-24 00:00:00',45000,'Hope this one works out',222222),(130,62,'2022-05-02 00:00:00',25000,'Hope this one works out',222222),(130,62,'2024-03-21 15:42:46',64000,'One-time adjustment approved by management',121212),(131,54,'2024-03-21 15:42:46',75000,'One-time adjustment approved by management',121212),(131,54,'2024-07-03 00:00:00',41500,'Hope this one works out',222222),(132,57,'2022-02-28 00:00:00',49000,'Hope this one works out',222222),(132,57,'2024-03-21 15:42:46',64000,'One-time adjustment approved by management',121212),(133,52,'2024-07-01 00:00:00',29000,'Hope this one works out',222222),(134,29,'2024-11-06 00:00:00',40500,'Hope this one works out',222222),(136,47,'2022-10-25 00:00:00',56000,'Hope this one works out',222222),(138,68,'2022-05-19 00:00:00',99999,'Hope this one works out',222222),(142,63,'2022-02-23 00:00:00',16,'Hope this one works out',222222),(142,63,'2024-03-21 15:42:46',64000,'One-time adjustment approved by management',121212),(143,5,'2022-11-24 00:00:00',45000,'Hope this one works out',222222),(143,5,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(144,5,'2022-10-05 00:00:00',45000,'Hope this one works out',222222),(144,5,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(145,6,'2023-06-15 00:00:00',45000,'Hope this one works out',222222),(146,3,'2022-04-03 00:00:00',45000,'Hope this one works out',222222),(147,2,'2024-09-20 00:00:00',45000,'Hope this one works out',222222),(148,19,'2022-09-26 00:00:00',45000,'Hope this one works out',222222),(148,19,'2024-03-21 15:42:46',95000,'One-time adjustment approved by management',121212),(149,44,'2022-11-17 00:00:00',45000,'Hope this one works out',222222),(150,62,'2022-10-06 00:00:00',45000,'Hope this one works out',222222),(150,62,'2024-03-21 15:42:46',64000,'One-time adjustment approved by management',121212),(151,29,'2022-06-03 00:00:00',45000,'Hope this one works out',222222),(152,26,'2023-03-28 00:00:00',45000,'Hope this one works out',222222),(152,26,'2024-03-21 15:42:46',75000,'One-time adjustment approved by management',121212),(153,12,'2024-03-21 15:42:46',90000,'One-time adjustment approved by management',121212),(153,12,'2024-07-17 00:00:00',30000,'Hope this one works out',222222),(154,5,'2022-12-30 00:00:00',75000,'Hope this one works out',222222),(154,5,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(158,1,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212),(158,1,'2024-08-24 00:00:00',45000,'Hope this one works out',222222),(159,2,'2024-12-25 00:00:00',45000,'Hope this one works out',222222),(160,3,'2022-01-26 00:00:00',45000,'Hope this one works out',222222),(161,4,'2023-10-16 00:00:00',45000,'Hope this one works out',222222),(161,4,'2024-03-21 15:42:46',55000,'One-time adjustment approved by management',121212),(162,5,'2022-01-05 00:00:00',45000,'Hope this one works out',222222),(162,5,'2024-03-25 15:13:39',40000,'One-time adjustment approved by management',121212);
/*!40000 ALTER TABLE `emphistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-25 15:24:13
