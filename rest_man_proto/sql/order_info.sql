CREATE DATABASE  IF NOT EXISTS `rest_info` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rest_info`;
-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: rest_info
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
-- Table structure for table `order_info`
--

DROP TABLE IF EXISTS `order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_info` (
  `username` varchar(100) NOT NULL,
  `number` int NOT NULL AUTO_INCREMENT,
  `togo` tinyint(1) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finished` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `items` blob,
  `table_num` int DEFAULT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_info`
--

LOCK TABLES `order_info` WRITE;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
INSERT INTO `order_info` VALUES ('angryduck462',0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00','',0),('angryduck462',1,NULL,NULL,'2021-11-04 19:38:26','2021-11-04 19:38:26',NULL,NULL),('angryduck462',2,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',_binary '[{1,4},{26:1},{86:1}]',2),('angryduck462',3,1,'','0000-00-00 00:00:00','0000-00-00 00:00:00','',4),('angryduck462',4,1,'closed','0000-00-00 00:00:00','2021-11-04 06:50:07',_binary '[{1,4},{26:1},{86:1}]',6),('angryduck462',6,0,'open','0000-00-00 00:00:00','0000-00-00 00:00:00',_binary '[{1,4},{26:1},{86:2},{99:1}]',2),('angryduck462',7,0,'open','0000-00-00 00:00:00','0000-00-00 00:00:00','',3),('angryduck462',8,0,'open','0000-00-00 00:00:00','0000-00-00 00:00:00','',0),('',9,0,'','2021-11-04 07:17:52','2021-11-04 07:17:52','',0),('angryduck462',10,0,'','2021-11-04 07:34:07','2021-11-04 07:34:07','',0),('angryduck462',11,0,'','2021-11-04 07:34:17','2021-11-04 07:34:17','',0),('angryduck462',12,NULL,NULL,'2021-11-04 07:37:28','2021-11-04 07:37:28',NULL,NULL),('angryduck462',13,NULL,NULL,'2021-11-04 07:39:38','2021-11-04 07:39:38',NULL,NULL),('angryduck462',14,NULL,NULL,'2021-11-04 07:39:41','2021-11-04 07:39:41',_binary '[{\"1\":4},{\"26\":1},{\"86\":2},{\"99\":1}]',NULL),('angryduck462',15,NULL,NULL,'2021-11-04 07:43:45','2021-11-04 07:43:45',_binary '{\"1\":4,\"26\":1,\"86\":2,\"99\":1}',NULL),('angryduck462',16,NULL,NULL,'2021-11-04 19:27:45','2021-11-04 19:27:45',_binary '{\"0\":1,\"1\":4,\"26\":1,\"86\":2,\"99\":1}',NULL),('angryduck462',17,NULL,NULL,'2021-11-04 20:37:59','2021-11-04 20:37:59',_binary '{\"0\":2,\"1\":6,\"2\":1,\"3\":1,\"4\":1,\"5\":1,\"6\":1,\"7\":1}',NULL);
/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-04 15:26:11
