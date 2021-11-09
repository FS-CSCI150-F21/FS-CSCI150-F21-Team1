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
-- Table structure for table `menuSubcategories`
--

DROP TABLE IF EXISTS `menuSubcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuSubcategories` (
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id` int NOT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `category` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_menuSubcategories_1_idx` (`category`),
  CONSTRAINT `fk_menuSubcategories_1` FOREIGN KEY (`category`) REFERENCES `menuCategories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuSubcategories`
--

LOCK TABLES `menuSubcategories` WRITE;
/*!40000 ALTER TABLE `menuSubcategories` DISABLE KEYS */;
INSERT INTO `menuSubcategories` VALUES ('Cocktails and Martinis',0,1,0),('Draft Beer',1,1,0),('Bottled Beer',2,1,0),('Red Wine',3,1,0),('White Wine',4,1,0),('Spirits',5,1,0),('Soft Drinks',6,1,0),('Canapés',7,1,1),('Hors d’Oeuvres',8,1,1),('Chips & Dips',9,1,1),('Soups',10,1,2),('Salads',11,1,2),('4 Kids',12,1,3),('Wood Fired Pizza',13,1,4),('Handcrafted Pasta',14,1,4),('Chicken',15,1,4),('Veal',16,1,4),('Pork & Ribs',17,1,4),('Seafood',18,1,4),('Beef',19,1,4),('Low Calorie',20,0,4),('Cake',21,1,5),('Pie',22,1,5),('Cookie',23,1,5),('Brownie',24,1,5),('Ice Cream',25,1,5);
/*!40000 ALTER TABLE `menuSubcategories` ENABLE KEYS */;
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
