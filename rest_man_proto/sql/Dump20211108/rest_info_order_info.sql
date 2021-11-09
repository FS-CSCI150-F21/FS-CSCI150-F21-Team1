CREATE DATABASE  IF NOT EXISTS `rest_info` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rest_info`;
-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: rest_info
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
  `togo` tinyint(1) DEFAULT '1',
  `status` varchar(50) DEFAULT 'Opened',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finished` timestamp NULL DEFAULT NULL,
  `items` blob,
  `table_num` int DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_info`
--

LOCK TABLES `order_info` WRITE;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
INSERT INTO `order_info` VALUES ('angryduck462',0,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00','',0,'2021-11-06 21:23:36'),('angryduck462',1,NULL,NULL,'2021-11-04 19:38:26','2021-11-04 19:38:26',NULL,NULL,'2021-11-06 21:23:36'),('angryduck462',2,0,'','0000-00-00 00:00:00','0000-00-00 00:00:00',_binary '[{1,4},{26:1},{86:1}]',2,'2021-11-06 21:23:36'),('angryduck462',3,1,'','0000-00-00 00:00:00','0000-00-00 00:00:00','',4,'2021-11-06 21:23:36'),('angryduck462',4,1,'closed','0000-00-00 00:00:00','2021-11-04 06:50:07',_binary '[{1,4},{26:1},{86:1}]',6,'2021-11-06 21:23:36'),('angryduck462',6,0,'open','0000-00-00 00:00:00','0000-00-00 00:00:00',_binary '[{1,4},{26:1},{86:2},{99:1}]',2,'2021-11-06 21:23:36'),('angryduck462',7,0,'open','0000-00-00 00:00:00','0000-00-00 00:00:00','',3,'2021-11-06 21:23:36'),('angryduck462',8,0,'open','0000-00-00 00:00:00','0000-00-00 00:00:00','',0,'2021-11-06 21:23:36'),('',9,0,'','2021-11-04 07:17:52','2021-11-04 07:17:52','',0,'2021-11-06 21:23:36'),('angryduck462',10,0,'','2021-11-04 07:34:07','2021-11-04 07:34:07','',0,'2021-11-06 21:23:36'),('angryduck462',11,0,'','2021-11-04 07:34:17','2021-11-04 07:34:17','',0,'2021-11-06 21:23:36'),('angryduck462',12,NULL,NULL,'2021-11-04 07:37:28','2021-11-04 07:37:28',NULL,NULL,'2021-11-06 21:23:36'),('angryduck462',13,NULL,NULL,'2021-11-04 07:39:38','2021-11-04 07:39:38',NULL,NULL,'2021-11-06 21:23:36'),('angryduck462',14,NULL,NULL,'2021-11-04 07:39:41','2021-11-04 07:39:41',_binary '[{\"1\":4},{\"26\":1},{\"86\":2},{\"99\":1}]',NULL,'2021-11-06 21:23:36'),('angryduck462',15,NULL,NULL,'2021-11-04 07:43:45','2021-11-04 07:43:45',_binary '{\"1\":4,\"26\":1,\"86\":2,\"99\":1}',NULL,'2021-11-06 21:23:36'),('angryduck462',16,NULL,NULL,'2021-11-04 19:27:45','2021-11-04 19:27:45',_binary '{\"0\":1,\"1\":4,\"26\":1,\"86\":2,\"99\":1}',NULL,'2021-11-06 21:23:36'),('angryduck462',17,NULL,NULL,'2021-11-04 20:37:59','2021-11-04 20:37:59',_binary '{\"0\":2,\"1\":6,\"2\":1,\"3\":1,\"4\":1,\"5\":1,\"6\":1,\"7\":1}',NULL,'2021-11-06 21:23:36'),('angryduck462',18,NULL,NULL,'2021-11-06 00:06:37','2021-11-06 00:06:37',NULL,NULL,'2021-11-06 21:23:36'),('angryduck462',19,NULL,NULL,'2021-11-06 03:37:54','2021-11-06 03:37:54',_binary '{\"0\":2,\"1\":2,\"41\":3,\"42\":1,\"43\":1,\"44\":1}',NULL,'2021-11-06 21:23:36'),('angryduck462',20,NULL,NULL,'2021-11-06 07:12:18','2021-11-06 07:12:18',_binary '{\"40\":1,\"41\":1,\"43\":1,\"44\":1,\"47\":2,\"75\":1}',NULL,'2021-11-06 21:23:36'),('angryduck462',21,NULL,NULL,'2021-11-06 19:15:20','2021-11-06 19:15:20',_binary '{}',NULL,'2021-11-06 21:23:36'),('angryduck462',22,NULL,NULL,'2021-11-06 19:43:10','2021-11-06 19:43:10',NULL,NULL,'2021-11-06 21:23:36'),('angryduck462',23,NULL,NULL,'2021-11-06 19:43:53','2021-11-06 19:43:53',NULL,NULL,'2021-11-06 21:23:36'),('angryduck462',24,NULL,NULL,'2021-11-06 19:44:25','2021-11-06 19:44:25',_binary '{\"1\":2,\"72\":1}',NULL,'2021-11-06 21:23:36'),('angryduck462',25,NULL,NULL,'2021-11-06 20:00:03','2021-11-06 20:00:03',_binary '{\"76\":2,\"77\":2,\"78\":1,\"79\":1,\"81\":1}',NULL,'2021-11-06 21:23:36'),('angryduck462',26,1,NULL,'2021-11-06 21:28:22',NULL,_binary '{\"66\":4,\"77\":2,\"92\":1}',NULL,'2021-11-06 22:45:45'),('angryduck462',27,NULL,NULL,'2021-11-07 02:09:38',NULL,NULL,NULL,'2021-11-07 02:09:38'),('MrDarcy',28,NULL,NULL,'2021-11-07 02:16:03',NULL,_binary '{\"0\":1,\"1\":1,\"7\":1,\"63\":1,\"66\":1,\"78\":1,\"132\":1}',NULL,'2021-11-07 02:16:12');
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

-- Dump completed on 2021-11-08 21:22:03
