CREATE DATABASE rest_info;

-- need to add user creation and privileges assignment
-- $dbusername = "rest_manager";
-- $dbpassword = "iF2ONNbmcCTcdjrd";
-- $dbname = "rest_info";


-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: rest_info
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `menuCategories`
--

DROP TABLE IF EXISTS `menuCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuCategories` (
  `name` varchar(30) DEFAULT NULL,
  `id` int NOT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuCategories`
--

LOCK TABLES `menuCategories` WRITE;
/*!40000 ALTER TABLE `menuCategories` DISABLE KEYS */;
INSERT INTO `menuCategories` VALUES ('Drinks',0,1,'drinks.jpg'),('Appetizers',1,1,'appetizers.jpg'),('Soups & Salads',2,1,'salad.jpg'),('Kids Meals',3,1,'kidsMeal.jpg'),('Entrées',4,1,'entrees.jpg'),('Desserts',5,1,'desserts.jpg');
/*!40000 ALTER TABLE `menuCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuItems`
--

DROP TABLE IF EXISTS `menuItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuItems` (
  `name` varchar(30) DEFAULT NULL,
  `id` int NOT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `timesOrdered` int DEFAULT NULL,
  `category` int DEFAULT NULL,
  `subcategory` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menuItems_1_idx` (`category`),
  KEY `fk_menuItems_2_idx` (`subcategory`),
  CONSTRAINT `fk_menuItems_1` FOREIGN KEY (`category`) REFERENCES `menuCategories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_menuItems_2` FOREIGN KEY (`subcategory`) REFERENCES `menuSubcategories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuItems`
--

LOCK TABLES `menuItems` WRITE;
/*!40000 ALTER TABLE `menuItems` DISABLE KEYS */;
INSERT INTO `menuItems` VALUES ('Smashing Pumpkin',0,1,'All Spice and Black Pepper Infused Real McCoy 5yr, Pumpkin Puree, Coconut Cream, Almond Milk, Nutmeg, OJ, Pineapple Juice,',10.00,0,0,0),('From Mexico with Love',1,1,'Vida Mezcal, Fiorente Elderflower, Lillet, Lime Shrub, Lemon Juice, Lime JuiceThis is a very unique cocktail with unique flavors. It is not for everyone!',13.00,0,0,0),('Fizzy Ginger Man',2,1,'Ginger Infused Gin, Triple Sec, Grapefruit Juice, Sparkling Wine',10.00,0,0,0),('Fall in Boulevardier',3,1,'Tin Cup Rye, Campari, Lazzaroni Maraschino, Cinnamon Infused Sweet Vermouth',12.00,0,0,0),('Caipirinha',4,1,'Cachaca, Lime, Simple, Sugar in the Raw',10.00,0,0,0),('Noah\'s Margarita',5,1,'Exotico Silver Tequila, Triple Sec, Fresh Citrus Juices, on the Rocks',10.00,0,0,0),('Magnificent Manhattan',6,1,'Sazerac Rye, Carpano Antica, Bitters',15.00,0,0,0),('House Made Sangria',7,1,'Red or White, Your Call...Made to Order',11.00,0,0,0),('IPA',8,1,'lorem ipsum',15.00,0,0,1),('Pale Lager',9,1,'lorem ipsum',12.00,0,0,1),('Wheat',10,1,'lorem ipsum',13.00,0,0,1),('Seasonal',11,1,'lorem ipsum',14.00,0,0,1),('Bud Light',12,1,'',4.00,0,0,2),('Cider Boys',13,1,'First Press Cider 16oz. [Gluten Free]',8.00,0,0,2),('Buckler',14,1,'Non-alcoholic',4.00,0,0,2),('Guinness Draft',15,1,'',6.00,0,0,2),('IPA of the Moment',16,1,'Seasonal, local, or hard to find.  Ask your server.',5.00,0,0,2),('Pinot Noir',17,1,'Angeline Reserve, Sonoma Coast',10.00,0,0,3),('Pinot Noir',18,1,'Straight Shooter Willamette Valley, Oregon',15.00,0,0,3),('Merlot',19,1,'Olelo, Paso Robles',10.00,0,0,3),('Garnacha',20,1,'Las Rocas, Calatayud, Spain',9.00,0,0,3),('Bordeaux Blend',21,1,'Vieux Chateau Brun, Pomerol, France',13.00,0,0,3),('Cabernet Sauvignon',22,1,'Montes, Colchagua Valley, Chile',8.00,0,0,3),('Prosecco',23,1,'La Marca, DOC, Italy',9.00,0,0,4),('Champagne',24,1,'Veuve Clicquot, Yellow Label, France',15.00,0,0,4),('Sauvignon Blanc',25,1,'Saint Clair, Marlborough, New Zealand',9.00,0,0,4),('Rose',26,1,'Famille Perrin, Cotes du Rhone, Reseve, France',8.00,0,0,4),('Dessert Wine',27,1,'Chateau Laribotte, Sauternes, France',11.00,0,0,4),('Vodka',28,1,'Absolut',8.00,0,0,5),('Gin',29,1,'Bombay',8.00,0,0,5),('Gin',30,1,'Tanqueray',9.00,0,0,5),('Rum',31,1,'Bacardi',8.00,0,0,5),('Tequila',32,1,'Patron Reposado',12.00,0,0,5),('Brandy',33,1,'Hennessy VS',9.00,0,0,5),('Whiskey',34,1,'Canadian Club',8.00,0,0,5),('Bourbon',35,1,'1792',11.00,0,0,5),('Coca Cola',36,1,'Coke, Sprite, Diet Coke, Fanta',3.00,0,0,6),('Nestea',37,1,'Lemon, Peach',4.00,0,0,6),('Coffee',38,1,'Espresso, Cappuccino, Latte Macchiato, Black',8.00,0,0,6),('Tea',39,1,'Milk, Lemon',3.00,0,0,6);
/*!40000 ALTER TABLE `menuItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuSubcategories`
--

DROP TABLE IF EXISTS `menuSubcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuSubcategories` (
  `name` varchar(30) DEFAULT NULL,
  `id` int NOT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `category` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_menuSubcategories_1_idx` (`category`),
  CONSTRAINT `fk_menuSubcategories_1` FOREIGN KEY (`category`) REFERENCES `menuCategories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuSubcategories`
--

LOCK TABLES `menuSubcategories` WRITE;
/*!40000 ALTER TABLE `menuSubcategories` DISABLE KEYS */;
INSERT INTO `menuSubcategories` VALUES ('Cocktails and Martinis',0,1,0),('Draft Beer',1,1,0),('Bottled Beer',2,1,0),('Red Wine',3,1,0),('White Wine',4,1,0),('Spirits',5,1,0),('Soft Drinks',6,1,0);
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

-- Dump completed on 2021-10-30 18:46:41
