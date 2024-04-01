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
-- Table structure for table `delemps`
--

DROP TABLE IF EXISTS `delemps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delemps` (
  `eid` int DEFAULT NULL,
  `efn` varchar(45) DEFAULT NULL,
  `eln` varchar(45) DEFAULT NULL,
  `estreet` varchar(45) DEFAULT NULL,
  `ecity` varchar(45) DEFAULT NULL,
  `est` char(2) DEFAULT NULL,
  `ezip` char(5) DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `pos_id` int DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `status_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delemps`
--

LOCK TABLES `delemps` WRITE;
/*!40000 ALTER TABLE `delemps` DISABLE KEYS */;
INSERT INTO `delemps` VALUES (14,'Joanne','Ovitt','23 South Winner Road','Enosburg Falls','VT','05450',2,'JoanneOvitt@neb.com','802-365-6566',11,45000,'2022-05-16 00:00:00','Hope this one works out',222222),(15,'Doris','Flower','16 South Union Road','Halifax','MA','02338',2,'DorisFlower@neb.com','802-365-7363',8,45000,'2022-07-10 00:00:00','Hope this one works out',222222),(16,'Daniel','Wicks','8 North Genius Road','Plymouth','MA','02334',2,'DanielWicks@neb.com','802-365-9062',4,45000,'2022-11-02 00:00:00','Hope this one works out',222222),(17,'Samantha','Ovitt','88 North Ovitt Road','Lisbon','NH','03101',2,'SamanthaOvitt@neb.com','802-365-7390',9,45000,'2022-09-08 00:00:00','Hope this one works out',222222),(18,'Taylor','Bigam','23 Pants Rd','Boston','MA','04424',2,'TaylorBigam@neb.com','802-365-1768',7,43000,'2023-08-14 00:00:00','Hope this one works out',222222),(19,'Danielle','Dudders','21 Yearling Circle','Wherewithall','NJ','18888',2,'DanielleDudders@neb.com','802-365-7205',7,43000,'2024-01-16 00:00:00','Hope this one works out',222222),(23,'Lawrence','Walker','12 Gallant Street','Oswego','NY','19570',2,'LawrenceWalker@neb.com','802-365-5243',52,45000,'2022-01-05 00:00:00','Hope this one works out',222222),(24,'Ronald','Kimber','1 Middle Road','South Burlington','VT','21350',2,'RonaldKimber@neb.com','802-365-4826',48,45000,'2022-08-01 00:00:00','Hope this one works out',222222),(25,'Kurt','Sohn','99 Jetson Avenue','Hempstead','NY','11550',2,'KurtSohn@neb.com','802-365-7485',67,45000,'2024-03-15 00:00:00','Hope this one works out',222222),(34,'Samantha','Clauson','1 Pond Lane','Charlton','MA','04566',2,'SamanthaClauson@neb.com','802-365-4265',50,27500,'2023-10-12 00:00:00','Hope this one works out',222222),(35,'Johnny','Roberts','146 East Northeast Avenue','Topeka','KS','89562',2,'JohnnyRoberts@neb.com','802-365-2750',20,56000,'2022-10-05 00:00:00','Hope this one works out',222222),(38,'Timothy','Smith','182 Brook Hill Lane','Vernon Hills','IL','60061',2,'TimothySmith@neb.com','802-365-9095',7,32000,'2022-10-09 00:00:00','Hope this one works out',222222),(43,'James','Boiben','303 South Street','Multivast','TX','03784',2,'JamesBoiben@neb.com','802-365-5096',7,43000,'2022-03-25 00:00:00','Hope this one works out',222222),(44,'Sally','Jane','312 North James Road','Alabaster','CT','06453',2,'SallyJane@neb.com','802-365-5383',7,43000,'2022-12-09 00:00:00','Hope this one works out',222222),(54,'Sam','Clues','14 South Dr','Barton','ND','55404',2,'SamClues@neb.com','802-365-7584',5,40000,'2022-08-02 00:00:00','Hope this one works out',222222),(65,'Foster','Donnelly','666 Rocky Rd','Dowling','HI','11100',2,'FosterDonnelly@neb.com','802-365-5111',9,35000,'2022-04-29 00:00:00','Hope this one works out',222222),(67,'Kat','Killinger','509 Woods Hollow Road','Westford','VT','05494',2,'KatKillinger@neb.com','802-365-7928',5,45000,'2022-11-04 00:00:00','Hope this one works out',222222),(84,'David','Jones','38 South Main Street','North Brookfield','MA','01535',2,'DavidJones@neb.com','802-365-4613',2,32000,'2022-11-09 00:00:00','Hope this one works out',222222),(87,'Rachael','Hunter','987 Windy Drive','Santa Monica','CA','98960',2,'RachaelHunter@neb.com','802-365-9859',12,38000,'2022-12-21 00:00:00','Hope this one works out',222222),(88,'Ester','Baxter','4592 Drive Way','Orlando','FL','78523',2,'EsterBaxter@neb.com','802-365-3574',9,68000,'2022-10-11 00:00:00','Hope this one works out',222222),(90,'Franklin','Arts','103 Southern Street','Winooski','VT','05404',2,'FranklinArts@neb.com','802-365-7657',4,490000,'2022-03-29 00:00:00','Hope this one works out',222222),(91,'Anna','Caisse','102 Cushman Street','Waterbury','CT','06704',2,'AnnaCaisse@neb.com','802-365-5226',8,9999999,'2023-07-25 00:00:00','Hope this one works out',222222),(92,'Eric','Olivares','120 Vista Street','San Antonio','TX','78213',2,'EricOlivares@neb.com','802-365-9988',8,120000,'2022-04-29 00:00:00','Hope this one works out',222222),(93,'Thomas','Sampson','186 Devoe Avenue','Yonkers','NY','10705',2,'ThomasSampson@neb.com','802-365-4782',7,42075,'2024-08-21 00:00:00','Hope this one works out',222222),(129,'Allen','Greene','19083 Paulson Place','Monoville','AK','45650',2,'AllenGreene@neb.com','802-365-1941',61,35000,'2022-02-20 00:00:00','Hope this one works out',222222),(135,'Jake','Johnson','450 College Street','Burlington','VT','05401',2,'JakeJohnson@neb.com','802-365-8074',36,48000,'2023-04-09 00:00:00','Hope this one works out',222222),(137,'Bruce','Jones','89 Dogwood Dr','Townshend','VT','05114',2,'BruceJones@neb.com','802-365-8040',34,31000,'2024-05-11 00:00:00','Hope this one works out',222222),(139,'Guy','Downey','69 Grains Way','Freeman Town','CA','44206',2,'GuyDowney@neb.com','802-365-2304',44,99999,'2023-01-13 00:00:00','Hope this one works out',222222),(140,'Sung','Yong','65 South Union','Burlington','VT','05401',2,'SungFugong@neb.com','802-365-5498',20,2,'2023-07-24 00:00:00','Hope this one works out',222222),(141,'Bruce','Wayne','1 Wayne Manor Road','Gotham City','NY','10118',2,'BruceWayne@neb.com','802-365-2304',52,99999,'2023-05-01 00:00:00','Hope this one works out',222222),(155,'Amanda','Fintz','568 East Varsity Street','Albany','NY','13440',2,'AmandaFintz@neb.com','802-365-9268',7,99999,'2024-08-18 00:00:00','Hope this one works out',222222),(156,'Marc','Bartalone','10284 West Advantage Avenue','Northport','CA','95832',2,'MarcBartalone@neb.com','802-365-4735',31,15000,'2022-02-11 00:00:00','Hope this one works out',222222),(157,'Brian','Parker','745 Falcon Way Road','Portland','WA','68440',2,'BrianParker@neb.com','802-365-1577',10,45000,'2022-02-10 00:00:00','Hope this one works out',222222);
/*!40000 ALTER TABLE `delemps` ENABLE KEYS */;
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
