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
-- Table structure for table `closed_order_info`
--

DROP TABLE IF EXISTS `closed_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `closed_order_info` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dinerTable` int DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `finished` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `items` blob,
  `prep_time` int DEFAULT NULL,
  `people_dining_in` int DEFAULT NULL,
  `paid` tinyint DEFAULT '0',
  `total` decimal(10,2) DEFAULT NULL,
  `customer_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `eRTime` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `closed_order_info`
--

LOCK TABLES `closed_order_info` WRITE;
/*!40000 ALTER TABLE `closed_order_info` DISABLE KEYS */;
INSERT INTO `closed_order_info` VALUES (71,'angryduck462',10,'Closed','2021-11-19 02:47:18','2021-11-19 04:02:10','2021-11-19 02:47:18',_binary '{\"0\":6,\"1\":1,\"3\":2,\"6\":2,\"121\":1,\"122\":1,\"124\":1,\"126\":1}',26,7,1,NULL,NULL,'2021-11-18 20:27:32'),(72,'angryduck462',4,'Closed','2021-11-19 04:02:54','2021-11-19 04:21:03','2021-11-19 04:02:54',_binary '{\"0\":3,\"1\":1,\"3\":1,\"4\":1,\"6\":2,\"74\":1,\"75\":1,\"79\":2,\"121\":2,\"125\":2,\"128\":2}',27,6,1,NULL,NULL,'2021-11-18 20:30:19'),(75,'angryduck462',6,'Closed','2021-11-19 04:16:10','2021-11-19 04:21:49','2021-11-19 04:16:10',_binary '{\"62\":1,\"65\":6,\"68\":1}',17,5,1,NULL,NULL,'2021-11-18 20:33:20'),(76,'angryduck462',4,'Closed','2021-11-19 04:44:22','2021-11-19 04:46:31','2021-11-19 04:44:22',_binary '{\"0\":1,\"1\":1,\"3\":1,\"4\":1,\"5\":1,\"7\":1}',26,6,1,NULL,NULL,'2021-11-18 21:10:47'),(77,'bigleopard946',0,'Closed','2021-11-19 04:47:22','2021-11-19 05:00:46','2021-11-19 04:47:22',_binary '{\"0\":1,\"1\":3,\"3\":1,\"6\":1,\"9\":1,\"11\":1,\"13\":1}',21,0,1,NULL,NULL,'2021-11-18 21:09:07'),(78,'bigleopard946',0,'Closed','2021-11-19 05:00:57','2021-11-19 05:10:25','2021-11-19 05:00:57',_binary '{\"41\":1,\"43\":1,\"46\":2,\"49\":1,\"52\":1,\"53\":1,\"57\":2,\"58\":1}',27,0,1,NULL,NULL,'2021-11-18 21:28:16'),(79,'bigleopard946',0,'Closed','2021-11-19 05:04:33','2021-11-19 20:38:43','2021-11-19 05:04:33',_binary '{\"4\":1,\"7\":1,\"9\":1,\"10\":1,\"11\":1,\"14\":1,\"15\":1}',24,0,1,NULL,NULL,'2021-11-18 21:33:51'),(80,'bigleopard946',0,'Closed','2021-11-19 05:10:53','2021-11-19 20:38:59','2021-11-19 05:10:53',_binary '{\"1\":4}',26,0,1,NULL,NULL,'2021-11-19 13:04:16'),(81,'angryduck462',0,'Closed','2021-11-19 22:28:32','2021-11-19 22:29:49','2021-11-19 22:28:32',_binary '{\"3\":1,\"5\":1,\"7\":1,\"10\":2}',11,0,1,NULL,NULL,'2021-11-19 14:40:02'),(82,'angryduck462',3,'Closed','2021-11-19 23:20:52','2021-11-24 00:04:43','2021-11-19 23:20:52',_binary '{\"1\":4,\"63\":2,\"65\":1,\"66\":1}',27,12,1,NULL,NULL,'2021-11-19 15:48:02'),(83,'angryduck462',4,'Closed','2021-11-19 23:41:18','2021-11-24 00:04:48','2021-11-19 23:41:18',_binary '{\"0\":1,\"1\":1,\"3\":1,\"4\":2,\"7\":4}',26,2,1,NULL,NULL,'2021-11-19 16:07:39'),(84,'angryduck462',0,'Closed','2021-11-20 22:34:19','2021-11-24 00:08:58','2021-11-20 22:34:19',_binary '{\"41\":3,\"42\":1,\"58\":1,\"86\":1,\"93\":2,\"96\":1}',27,0,1,NULL,NULL,'2021-11-23 16:34:25'),(85,'angryduck462',0,'Closed','2021-11-23 23:11:48','2021-11-24 00:04:53','2021-11-23 23:11:48',NULL,NULL,0,1,NULL,NULL,NULL),(95,'angryduck462',0,'Closed','2021-11-23 23:16:39','2021-11-24 00:06:50','2021-11-23 23:16:39',_binary '{\"42\":1,\"44\":4,\"45\":1}',19,8,1,NULL,NULL,'2021-11-23 15:58:41');
/*!40000 ALTER TABLE `closed_order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitchen`
--

DROP TABLE IF EXISTS `kitchen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kitchen` (
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `start` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `quantity` int DEFAULT NULL,
  `completed` int DEFAULT '0',
  `end` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitchen`
--

LOCK TABLES `kitchen` WRITE;
/*!40000 ALTER TABLE `kitchen` DISABLE KEYS */;
/*!40000 ALTER TABLE `kitchen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuCategories`
--

DROP TABLE IF EXISTS `menuCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuCategories` (
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id` int NOT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `imageURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id` int NOT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `timesOrdered` int DEFAULT NULL,
  `category` int DEFAULT NULL,
  `subcategory` int DEFAULT NULL,
  `prep_time` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menuItems_1_idx` (`category`),
  KEY `fk_menuItems_2_idx` (`subcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuItems`
--

LOCK TABLES `menuItems` WRITE;
/*!40000 ALTER TABLE `menuItems` DISABLE KEYS */;
INSERT INTO `menuItems` VALUES ('Smashing Pumpkin',0,1,'All Spice and Black Pepper Infused Real McCoy 5yr, Pumpkin Puree, Coconut Cream, Almond Milk, Nutmeg, OJ, Pineapple Juice,',10.00,0,0,0,11),('From Mexico with Love',1,1,'Vida Mezcal, Fiorente Elderflower, Lillet, Lime Shrub, Lemon Juice, Lime JuiceThis is a very unique cocktail with unique flavors. It is not for everyone!',19.00,0,0,0,26),('Fizzy Ginger Man',2,1,'Ginger Infused Gin, Triple Sec, Grapefruit Juice, Sparkling Wine',10.00,0,0,0,16),('Fall in Boulevardier',3,1,'Tin Cup Rye, Campari, Lazzaroni Maraschino, Cinnamon Infused Sweet Vermouth',12.00,0,0,0,11),('Caipirinha',4,1,'Cachaca, Lime, Simple, Sugar in the Raw',10.00,0,0,0,17),('Noah\'s Margarita',5,1,'Exotico Silver Tequila, Triple Sec, Fresh Citrus Juices, on the Rocks',10.00,0,0,0,11),('Magnificent Manhattan',6,1,'Sazerac Rye, Carpano Antica, Bitters',15.00,0,0,0,15),('House Made Sangria',7,1,'Red or White, Your Call...Made to Order',11.00,0,0,0,6),('IPA',8,1,'Indian Pale Ale',15.00,0,0,1,17),('Pale Lager',9,1,'very pale-to-golden-colored lager beer with a well-attenuated body and a varying degree of noble hop bitterness',12.00,0,0,1,21),('Wheat',10,1,'top-fermented beer which is brewed with a large proportion of wheat relative to the amount of malted barley',13.00,0,0,1,9),('Seasonal',11,1,'typically brewed during or for a particular season, holiday or festival period.  Ask your server about the current batch.',14.00,0,0,1,15),('Bud Light',12,1,'Brewed the same way since 1982, Bud Light is a refreshing American-style light lager beer with a clean, crisp taste and fast finish.',4.00,0,0,2,28),('Cider Boys',13,1,'First Press Cider 16oz. [Gluten Free]',8.00,0,0,2,9),('Buckler',14,1,'Non-alcoholic',4.00,0,0,2,16),('Guinness Draft',15,1,'Stout - Irish Dry style beer brewed by Guinness Ltd. in Dublin, Ireland.',6.00,0,0,2,24),('IPA of the Moment',16,1,'Seasonal, local, or hard to find.  Ask your server.',5.00,0,0,2,13),('Pinot Noir',17,1,'Angeline Reserve, Sonoma Coast',10.00,0,0,3,29),('Pinot Noir',18,1,'Straight Shooter Willamette Valley, Oregon',15.00,0,0,3,13),('Merlot',19,1,'Olelo, Paso Robles',10.00,0,0,3,24),('Garnacha',20,1,'Las Rocas, Calatayud, Spain',9.00,0,0,3,6),('Bordeaux Blend',21,1,'Vieux Chateau Brun, Pomerol, France',13.00,0,0,3,21),('Cabernet Sauvignon',22,1,'Montes, Colchagua Valley, Chile',8.00,0,0,3,14),('Prosecco',23,1,'La Marca, DOC, Italy',9.00,0,0,4,9),('Champagne',24,1,'Veuve Clicquot, Yellow Label, France',15.00,0,0,4,23),('Sauvignon Blanc',25,1,'Saint Clair, Marlborough, New Zealand',9.00,0,0,4,29),('Rose',26,1,'Famille Perrin, Cotes du Rhone, Reseve, France',8.00,0,0,4,28),('Dessert Wine',27,1,'Chateau Laribotte, Sauternes, France',11.00,0,0,4,24),('Vodka',28,1,'Absolut',8.00,0,0,5,29),('Gin',29,1,'Bombay',8.00,0,0,5,28),('Gin',30,1,'Tanqueray',9.00,0,0,5,18),('Rum',31,1,'Bacardi',8.00,0,0,5,28),('Tequila',32,1,'Patron Reposado',12.00,0,0,5,9),('Brandy',33,1,'Hennessy VS',9.00,0,0,5,7),('Whiskey',34,1,'Canadian Club',8.00,0,0,5,21),('Bourbon',35,1,'1792',11.00,0,0,5,18),('Coca Cola',36,1,'Coke, Sprite, Diet Coke, Fanta',3.00,0,0,6,11),('Nestea',37,1,'Lemon, Peach',4.00,0,0,6,19),('Coffee',38,1,'Espresso, Cappuccino, Latte Macchiato, Black',8.00,0,0,6,18),('Tea',39,1,'Milk, Lemon',3.00,0,0,6,5),('Sushi Rice and Tuna',40,1,'Sashimi-grade tuna and vinegared  sushi rice',9.00,0,1,7,6),('Hoisin Beef Swiss Roll with Baby Leek',41,1,'Rice paper-wrapped Hoisin Beef Spring Rolls are ideal for an outdoor party—no utensils required.',11.00,0,1,7,27),('Mini Prawn Tacos',42,1,'Small crustaceans inside tortillas.',13.00,0,1,7,11),('Smoked Salmon Tartare Blini with Lime Mayo',43,1,'This easy yet sophisticated canapé recipe from Delpeyrat and Saint Jean will delight',9.00,0,1,7,6),('Smoked Duck with Enoki Mushroom and Thai Asparagus, Sweet Onion',44,1,'This is a lovely dish, both in colour and texture. ',6.00,0,1,7,11),('Goat’s Cheese Mousse and Fig Tart',45,1,'plays on sweet and sour flavours by combining goats cheese and figs to create an Australian inspired savoury tart',8.00,0,1,7,19),('Beef Croquette with Paprika Sauce',46,1,'These crispy, creamy croquettes are studded with spicy chorizo and two types of cheese. Serve with smoky dipping sauce for an extra kick.',13.00,0,1,7,22),('Brie Tomato Tart with Red Onion Marmalade',47,1,'This tart is alfresco dining at its best - fresh, full of flavour and fun',9.00,0,1,7,16),('Tofu Balls with Peanut Sauce',48,1,'Tasty balls to have with your spaghetti or by themselves.',8.00,0,1,7,22),('Braised Ox Cheeks with Mini Yorkshire Pudding and Horseradish Mash',49,1,'A beautiful little bite of tender, rare roast beef spiked with horseradish in a baby Yorkshire pudding - glorious.',12.00,0,1,7,25),('Angels on Horseback',50,1,'Oysters wrapped in bacon, served hot.',19.00,0,1,8,27),('Bruschetta',51,1,'Grilled bread rubbed with garlic, and topped with olive oil, salt, pepper, and tomato.',15.00,0,1,8,14),('Buffalo Wings',52,1,'Deep-fried and unbreaded chicken wingettes coated in vinegar-based cayenne pepper, hot sauce, and butter.',13.00,0,1,8,8),('Caviar',53,1,'Wild Sturgeon Roe of Caspian and Black Seas.',33.00,0,1,8,22),('Mozzarella Sticks',54,1,'Elongated pieces of battered mozzarella.',8.00,0,1,8,23),('Nachos',55,1,'Tortilla chips covered in shredded cheese, salsa, and guacamole.',13.00,0,1,8,15),('Potato Skins',56,1,'Covered with bacon, cheddar cheese, green onions, and sour cream.',11.00,0,1,8,14),('Shrimp Cocktail',57,1,'Shelled prawns in mayonnaise and tomato dressing, served in a glass.',15.00,0,1,8,11),('Crudité Platter',58,1,'Fried asparagus and zucchini, baby arthichokes, kalamata olives, halved radishes, snap peas, cherry tomatoes, sliced cucumber, and carrot sticks with avocado ranch dressing or hummus on the side.',19.00,0,1,8,24),('Togarashi Chips with Toasted Sesame Onion Dip',59,1,'Flash fried Idaho potatoes, dusted with salt and chili-centric Japanese togarashi spice mix.  Paired with mayo-based dip made with slow roasted Spanish onion, toasted sesame oil, crispy garlic, and Canadian steak seasoning.',17.00,0,1,9,12),('Clarified Butter Fried Chips and Caviar',60,1,'Yukon gold potato chips fried in clarified butter served with whipped créme frâiche deced out with chives – plus Ossetra caviar.',18.00,0,1,9,7),('Deviled Crab Dip with Old Bay Chips',61,1,'Crab, cream cheese, aged white cheddar, yellow cheddar, and cayenne covered in breadcrumbs.  Old Bay spiced potato chips with pickled vegetables: chilies, onions, okra, cauliflower, and zucchini.',20.00,0,1,9,24),('Vegan Lentil with Ancient Grains Soup',62,1,'This rich vegan soup is made with savory lentils and nutritious ancient grains.',13.00,0,2,10,6),('Piranha Pale Ale Chili',63,1,'Our original recipe, filled with beef, onions & signature blend of spices. Topped with shredded cheese & tortilla strips.',12.00,0,2,10,27),('Chicken Tortilla Soup',64,1,'Chicken, tomatoes, corn, black beans, avocado, cheese, and crunchy tortilla strips! ',14.00,0,2,10,17),('Tuscan Tomato Bisque',65,1,'Pappa al Pomodoro – a rustic authentic Tuscan Tomato Soup made with bread; wholesome, hearty, warming and filling.',8.00,0,2,10,17),('Broccoli Cheddar Soup',66,1,'Healthy broccoli cheddar soup packed with carrots, broccoli, garlic, and cheese.',19.00,0,2,10,13),('Clam Chowder',67,1,'Unbelievably creamy, flavorful and chockfull of clams!',23.00,0,2,10,15),('House Wedge Salad',68,1,'Lettuce in a big wedge shape.  Croutons and blue cheese.',7.00,0,2,11,9),('Southwest Chicken Caesar Salad',69,1,'Grilled chicken, tomatoes, queso fresco, tortilla strips with Caesar dressing.',15.00,0,2,11,29),('Fresh Mozzarella and Tomato Salad',70,1,'Sliced mozzarella and tomatoes in lettuce.',17.00,0,2,11,15),('Caribbean Salad with Seared Shrimp',71,1,'Pineapple, mandarin oranges, dried cranberries, red bell peppers, green onions, cilantro, with honey-lime dressing.',18.00,0,2,11,17),('Santa Fe Chicken Salad',72,1,'Spicy grilled chicken, pico, avocado, cilantro, tortilla strips, house-made ranch & a drizzle of spicy Santa Fe sauce.',15.00,0,2,11,22),('Roadside Sliders',73,1,'Two bite-sized burgers on mini-buns. Served with fries or fresh fruit.',7.00,0,3,12,5),('Mini Corn Dogs',74,1,'Three all beef mini hot dogs.  Served with fries or fresh fruit.',7.00,0,3,12,18),('Flatbread Pizzas',75,1,'Cheese or Pepperoni',7.00,0,3,12,22),('Pasta',76,1,'Served with bowtie pasta.  Choose from butter and parmesan, marinara sauce, or Alfredo sauce.',7.00,0,3,12,19),('Spaghetti with Meatball',77,1,'The reliable classic.  Enough said.',7.00,0,3,12,19),('Macaroni and Cheese',78,1,'The original mac and cheese every kid loves.',7.00,0,3,12,8),('Fried Chicken Strips',79,1,'Served with fries or fresh fruit.',7.00,0,3,12,10),('Quessadilla',80,1,'Grilled flour tortilla filled with melted cheese.  Available with chicken.',7.00,0,3,12,30),('Cheesy Pizza',81,1,'6” four-cheese pizza',7.00,0,3,12,22),('Margherita',82,1,'Mozzarella, tomato sauce, basil',16.00,0,4,13,28),('Pepperoni',83,1,'Mozzarella, tomato sauce, oregano',18.00,0,4,13,8),('Mixed Mushroom',84,1,'Mozzarella, fontina, truffled cheese, thyme',18.00,0,4,13,18),('Smoke Prosciutto',85,1,'Mozzarella, fontina, goat cheese, caramelized onion',19.00,0,4,13,28),('Diavola',86,1,'Spicy tomato sauce, mozzarella, soppressata, sausage, bacon, roasted red pepper',20.00,0,4,13,11),('Carbonara',87,1,'Mozzarella, fontina, bacon, onions, baked egg, parmigiano',20.00,0,4,13,21),('Butternut Squash Agnolotti',88,1,'Crispy sage, aged balsamic, amaretti cookie',23.00,0,4,14,22),('Bucatini',89,1,'Spicy tomato sauce, pancetta, red onion, pecorino',23.00,0,4,14,27),('Mezzi Rigatoni',90,1,'Sausage ragu',24.00,0,4,14,19),('Tagliatelle',91,1,'Ribbon noodles, lamb ragu',24.00,0,4,14,30),('Fusilli',92,1,'Roasted chicken, pancetta, mushrooms, marsala, herbs',24.00,0,4,14,23),('Tagliolini',93,1,'Thin ribbon noodles, spicy tomato sauce, shrimp, crab, arugula',28.00,0,4,14,27),('Chicken Cacciatore',94,1,'Chicken breast sauteed with onions, mushrooms, and green peppers, served in a red sauce.',29.00,0,4,15,21),('Chicken Piccata',95,1,'Chicken breast in lemon butter sauce with mushrooms, fresh garlic and pimento',29.00,0,4,15,20),('Chicken Marsala',96,1,'Chicken breast sauteed with mushrooms, onions, carrots and celery, served in a brown sauce.',29.00,0,4,15,13),('Chicken Parmigiana',97,1,'Breaded chicken breast smothered with mozzarella cheese',28.00,0,4,15,16),('Chicken Cordon Blue',98,1,'Baked breaded chicken stuffed with ham and cheese, served with a mushroom cream sauce.',29.00,0,4,15,22),('Veal Cordon Blue',99,1,'Baked breaded veal stuffed with ham and cheese served with a mushroom cream sauce',30.00,0,4,16,15),('Veal Parmigiana',100,1,'Breaded veal smothered with mozzarella cheese',30.00,0,4,16,10),('Veal Piccata',101,1,'Served in a lemon butter sauce with mushrooms and garlic',30.00,0,4,16,30),('Veal Scallopini',102,1,'Veal sauteed with mushrooms and onions in a red sauce',30.00,0,4,16,17),('Veal Shoemaker',103,1,'Served in a lemon sauce with mushrooms, green olives, and capers.',30.00,0,4,16,23),('Veal Marsala',104,1,'Veal sauteed with mushrooms and onions, served in a brown sauce',30.00,0,4,16,13),('Sorrento',105,1,'Shrimp, calamari, clams, green olives, and capers with red sauce',27.00,0,4,14,8),('Baby Back Pork Ribs',106,1,'A full rack of slow-roasted overnight baby back ribs.  Choice of two sides.',28.00,0,4,17,7),('Mandarin Orange-Glazed Pork Chop',107,1,'Slow-roasted, double bone-in pork chop with mandarin orange glaze or bacon onion jam.',22.00,0,4,17,10),('Double Bone-In Pork Chop',108,1,'Slow-roasted, double bone-in pork chop.',21.00,0,4,17,7),('Big Shrimp',109,1,'Sauteed in a lemon butter sauce with  mostacciolli, aglio, and a touch of feta cheese.',29.00,0,4,18,11),('Atlantic Salmon',110,1,'Baked in light lemon butter sauce, served with mostacciollo primavera',27.00,0,4,18,15),('New Orleans Jambalaya',111,1,'Blackened chicken breasts sauteed shrimp, sausage, bell peppers, onions, tomatoes, cajun-spiced broth, and rice-pilaf.',22.00,0,4,18,19),('Enlightened Pacific Poke Soba Noodles',112,1,'Sashimi-grade ahi tuna, buckwheat soba noodles, poke sauce, carrots, pickled vegetables, soy ginger sauce, wasabi guacamole, crispy wonton strips, green onions, and sesame seeds.',18.00,0,4,18,13),('Blonde Fish ‘N’ Chips',113,1,'Lightly fried cod fillets, Blonde beer batter, fries, and housemade tartar sauce.',19.00,0,4,18,13),('Enlightened Cherry Chipotle Glazed Salmon',114,1,'Oven-roasted Atlantic salmon, sweet and savory cherry Chipotle glaze, roasted asparagus, fire-roasted red pepper, and tomato and spinach couscous.',19.00,0,4,18,15),('Bacon Jam Rib-Eye',115,1,'Juicy, well-marbled 14 oz rib-eye.',29.00,0,4,19,28),('Prime Rib',116,1,'15 oz prime rib slow-roasted over four hours, au jus, and creamy horseradish.',30.00,0,4,19,22),('Slow-Roasted Tri-tip',117,1,'8 oz slow-roasted sirloin tri-tip glazed with peppered BBQ sauce.',21.00,0,4,19,19),('Classic Rib-Eye',118,1,'Juicy, well-marbled 14 oz rib-eye.',28.00,0,4,19,8),('Tiramisu Cheesecake',119,1,'Mascarpone, cream cheese, chocolate, and ladyfinger crust.',9.00,0,5,21,19),('Italian Cheesecake',120,1,'With riccota cheese, lemon zest & Graham cracker crust.',9.00,0,5,21,20),('Tiramisu',121,1,'Mascarpone cheese, brandy & espresso layered with ladyfinger and dusted with chocolate',8.00,0,5,21,14),('Molten Chocolate Cake',122,1,'With a melted chocolate center.  Served with choice of ice cream.',13.00,0,5,21,10),('Red Velvet Cake',123,1,'A southern classic with cream cheese frosting',12.00,0,5,21,24),('“The Best” Carrot Cake',124,1,'Citrus cream cheese icing',8.00,0,5,21,7),('Deep Dark Fudge Cake',125,1,'Fudgy chocolate frosting',11.00,0,5,21,21),('Pineapple Upside-Down Cake',126,1,'Warm pineapple upside-down cake, on a bed of kahlúa cream sauce.  Topped with ice cream, whipped cream, and toasted coconut.',13.00,0,5,21,22),('Key Lime Pie',127,1,'Baked Fresh with a graham-pecan crust.  Topped with fresh whipped cream.',17.00,0,5,22,24),('Blueberry Pie',128,1,'Blueberries shine in this pie. The pie is lightly sweetened with a touch of spice from allspice and cinnamon.',15.00,0,5,22,27),('Apple Pie',129,1,'Perfectly cooked (not mushy) apples surrounded by a thickened and gently spiced sauce all baked inside a flaky, golden-brown crust',15.00,0,5,22,13),('Chocolate',130,1,'Chocolatey goodness in moist, flaky crust.',15.00,0,5,22,18),('Chocolate Chip',131,1,'Drop cookie with chocolate chips.',5.00,0,5,23,9),('Snickerdoodle',132,1,'The popular cinnamon-sugar soft and chewy sugar cookie',5.00,0,5,23,28),('Peanut Butter',133,1,'Soft and chewy, packed with peanut butter flavor, and they’re super delicious dunked in milk!',5.00,0,5,23,21),('Bakeshop Brownie',134,1,'A twist on a classic favorite, this rich fudge brownie holds a hidden surprise.  It’s center is filled with gourmet semisweet chocolate chips.  Topped with a white chocolate glaze.',19.00,0,5,24,19),('Fudge Walnut',135,1,'Made just like a regular brownie and jam-packed with walnuts.',12.00,0,5,24,10),('Fudge Iced Brownies',136,1,'Covered in rich, creamy, chocolate icing.',13.00,0,5,24,24),('Vanilla',137,1,'An old fashioned vanilla ice cream recipe that everyone loves!',8.00,0,5,25,29),('Chocolate',138,1,'Rich, ultra-creamy, and chocolatey — this is the best homemade chocolate ice cream recipe ever!',8.00,0,5,25,6),('Cookies N’ Cream',139,1,'With only 5 ingredients, this Cookies and Cream Ice Cream is not only extremely easy, but incredibly delicious.',8.00,0,5,25,11),('Butter Pecan',140,1,'This rich buttery ice cream sure beats store-bought versions. And with its pretty color and plentiful pecan crunch, you\'ll come back for more.',8.00,0,5,25,22),('Strawberry',141,1,'Creamy, dreamy, and made with fresh strawberries',9.00,0,5,25,22);
/*!40000 ALTER TABLE `menuItems` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `open_order_info`
--

DROP TABLE IF EXISTS `open_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `open_order_info` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dinerTable` int DEFAULT '0',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Opened',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `finished` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `items` blob,
  `prep_time` int DEFAULT NULL,
  `people_dining_in` int DEFAULT '0',
  `paid` tinyint DEFAULT '0',
  `total` decimal(10,2) DEFAULT NULL,
  `customer_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `eRTime` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_order_info`
--

LOCK TABLES `open_order_info` WRITE;
/*!40000 ALTER TABLE `open_order_info` DISABLE KEYS */;
INSERT INTO `open_order_info` VALUES (86,'angryduck462',0,'Opened','2021-11-23 23:16:28','2021-11-23 23:16:28','2021-11-23 23:16:28',NULL,NULL,0,0,NULL,NULL,NULL),(87,'angryduck462',0,'Opened','2021-11-23 23:16:28','2021-11-23 23:16:28','2021-11-23 23:16:28',NULL,NULL,0,0,NULL,NULL,NULL),(88,'angryduck462',0,'Opened','2021-11-23 23:16:29','2021-11-23 23:16:29','2021-11-23 23:16:29',NULL,NULL,0,0,NULL,NULL,NULL),(89,'angryduck462',0,'Served','2021-11-23 23:16:31','2021-11-24 00:04:23','2021-11-23 23:16:31',NULL,NULL,0,0,NULL,NULL,NULL),(90,'angryduck462',0,'Opened','2021-11-23 23:16:36','2021-11-23 23:16:36','2021-11-23 23:16:36',NULL,NULL,0,0,NULL,NULL,NULL),(91,'angryduck462',0,'Opened','2021-11-23 23:16:36','2021-11-23 23:16:36','2021-11-23 23:16:36',NULL,NULL,0,0,NULL,NULL,NULL),(92,'angryduck462',0,'Opened','2021-11-23 23:16:37','2021-11-23 23:16:37','2021-11-23 23:16:37',NULL,NULL,0,0,NULL,NULL,NULL),(93,'angryduck462',0,'Opened','2021-11-23 23:16:37','2021-11-23 23:16:37','2021-11-23 23:16:37',NULL,NULL,0,0,NULL,NULL,NULL),(94,'angryduck462',0,'Opened','2021-11-23 23:16:38','2021-11-23 23:16:38','2021-11-23 23:16:38',NULL,NULL,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `open_order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people_count`
--

DROP TABLE IF EXISTS `people_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people_count` (
  `num_people_inside` int NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `num_people_in_line` int DEFAULT NULL,
  `wait_time` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people_count`
--

LOCK TABLES `people_count` WRITE;
/*!40000 ALTER TABLE `people_count` DISABLE KEYS */;
INSERT INTO `people_count` VALUES (1,'2021-11-15 09:01:47',-2,0,33),(2,'2021-11-15 09:01:51',-1,0,34),(1,'2021-11-15 09:01:53',-2,0,35),(2,'2021-11-15 09:01:55',-1,0,36),(3,'2021-11-15 09:02:08',0,0,37),(4,'2021-11-15 09:02:08',1,0,38),(1,'2021-11-15 09:09:26',-2,70,39),(2,'2021-11-15 09:09:30',-1,70,40),(3,'2021-11-15 09:09:32',0,70,41),(4,'2021-11-15 09:09:32',1,70,42),(5,'2021-11-15 09:09:33',2,70,43),(6,'2021-11-15 09:09:36',3,70,44),(1,'2021-11-17 19:06:54',1,319,45),(2,'2021-11-17 19:06:57',2,319,46),(3,'2021-11-17 19:06:59',3,319,47),(4,'2021-11-17 19:07:02',4,319,48),(1,'2021-11-17 19:08:02',1,319,50),(0,'2021-11-17 19:08:05',0,319,51),(1,'2021-11-17 19:08:07',1,319,52),(0,'2021-11-17 19:08:09',0,319,53),(1,'2021-11-17 19:08:10',1,319,54);
/*!40000 ALTER TABLE `people_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablegrid`
--

DROP TABLE IF EXISTS `tablegrid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablegrid` (
  `id` int NOT NULL DEFAULT '1',
  `numberof` int NOT NULL,
  `grid` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablegrid`
--

LOCK TABLES `tablegrid` WRITE;
/*!40000 ALTER TABLE `tablegrid` DISABLE KEYS */;
INSERT INTO `tablegrid` VALUES (1,0,_binary 'a:10:{i:0;a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}i:1;a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}i:2;a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}i:3;a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}i:4;a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}i:5;a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}i:6;a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}i:7;a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}i:8;a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}i:9;a:10:{i:0;i:0;i:1;i:0;i:2;i:0;i:3;i:0;i:4;i:0;i:5;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:9;i:0;}}');
/*!40000 ALTER TABLE `tablegrid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `level` int NOT NULL DEFAULT '2',
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `position` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wage` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES ('Ümit','Başoğlu','angrybutterfly804','9010072f85ea546925888515cbacd8cf44204c2a640bc4d60ac61ff65ecb73e7',1,'(056)-246-3798','umit.basoglu@example.com','greeter',19.13),('Samir','Silveira','angrycat530','05b9115df05a2a467841772eccc969822d884c9e71841050fe9e0893cce7d11b',2,'(03) 9109-3815','samir.silveira@example.co','',0),('Flenn','Anderson','angryduck462','3f2e23b2ee1991da34bdc689a44a229d1b64f3b617d6569ffb6e19f760acfded',0,'013873 98828','flenn.anderson@example.co','cook',23.65),('Janne','Sangolt','angrygorilla975','305264b8799855a71e3e0344f3c66b95998be4ff044594b29c50a96ce9e0c8e7',1,'54673080','janne.sangolt@example.com','waiter',17.94),('Charlie','Moore','angrywolf324','544e2d6145f6ea1d858b94f75a392dac7f53df9403948acd1e939e6dfbc64104',1,'(978)-021-1058','charlie.moore@example.com','cook',16.05),('Jose','Alonso','angryzebra467','3deaf968b56510d8421b122f7b401eb2e4616bf1388fd9098b7d63f072441089',0,'945-700-621','jose.alonso@example.com','waiter',7.31),('Camille','Pelletier','beautifulfrog434','164c4e46a137c7485f6a0fa1127d9e615dd703f72a5e02f63332085ab0ae6f02',0,'729-665-4599','camille.pelletier@example','waiter',13.3),('یسنا','گلشن','beautifulostrich362','d29af8a2e160dd867fe45a75f70bf805b1b6c1cf92017cf53cdf1d5cf390c916',0,'084-75234930','ysn.glshn@example.com','bartender',18.36),('میلاد','نجاتی','beautifulzebra280','090b235e9eb8f197f2dd927937222c570396d971222d9009a9189e2b6cc0a2c1',2,'053-77880089','myld.njty@example.com','',0),('Gertraud','Neugebauer','bigfish236','5ccca5bb6d737c724c872058d9633da7faa3faecc75a81ac96b87126d6829816',0,'0137-4249729','gertraud.neugebauer@examp','waiter',4.36),('سینا','كامياران','bigfish319','87c3bbd5b9a829bef126aeeb3ba9949b4aa168b1320a4349afee66ea624a28f9',2,'068-33698387','syn.kmyrn@example.com','',0),('Fred','Carter','bigfrog346','cee515720c19b3ad855d35ab72eddd9107bde3496c8d9b0603293edc8b66d11b',1,'07-9966-7567','fred.carter@example.com','bartender',17.54),('Randall','Romero','bigladybug624','6770928359445e82d7785c6372ec6f076b49c88bf84e2bff9cf998fe3b1e32a1',1,'015394 23071','randall.romero@example.co','waiter',20.24),('Eva','Lee','bigleopard946','7cbccda65959a4fe629dbdf546ae3ddea9328ae5a53498785f4a27394fe26515',2,'(854)-884-3125','eva.lee@example.com','',0),('Hugo','Benitez','blackelephant143','116f54c41d0405dbb10e7b04ebc31e262a5b8c85c1233fcf36eaee344d91ae58',1,'934-080-298','hugo.benitez@example.com','bartender',17.32),('Sarah','Chan','blackgorilla508','23f7bbe7865778a4b534e9335e5eda550feb75de4ef163c56a7a48824abc9b37',2,'802-260-5476','sarah.chan@example.com','',0),('Aaron','Kumar','blackpanda751','08234c948b5a00f9d33f57f120e68cfe627abf576decb1f8f9bc95cb2114e990',0,'(141)-548-2557','aaron.kumar@example.com','cook',18.8),('Hector','Arias','blackrabbit342','89a87efc19f20c057d890285060a5d12fcc5a753762a2b97de11cf3fe9d732c6',0,'981-037-683','hector.arias@example.com','waiter',7.47),('Naja','Nielsen','blackwolf283','3e2b8f7655a269367d0503ead3d27ef7e070fa31a0ccdff6d3150c67cc5c789e',0,'30289239','naja.nielsen@example.com','janitor',20.69),('Jozef','Jacob','bluedog307','3786488b6f8ef36db49b93f33ea84ed8358a963c362d30764c319d4a34eaf4ba',0,'0453-4240795','jozef.jacob@example.com','janitor',14.53),('Anna','Sullivan','bluegoose319','5e0cf7bd1dfa3831788b0cf6dedcdd228fba6f34dc238d371e746567e80bc7b6',2,'061-308-9589','anna.sullivan@example.com','',0),('Marie','Christiansen','bluemeercat865','15b45021ccf8ed60039e5a2f7d345c30d2dc6356aebbc43982c8aa05f64d79d7',1,'93459307','marie.christiansen@exampl','bartender',13.54),('Gabe','Nelson','bluerabbit566','cd96b5def4ed2b502ab6cc6ce3c04ddd56e194c70949f750b0ab29f3e5ce3dda',0,'061-201-7949','gabe.nelson@example.com','greeter',17.02),('Ceylan','Özbey','brownbear535','34a533dfd7273a9bb03656b32956a2b1d08dc62533b11c813b28d0ef23ec8e67',0,'(159)-134-3028','ceylan.ozbey@example.com','waiter',7.93),('Blake','Moore','brownelephant605','0c08d7b9b45c0753aed44e5395aedb56cd4856c02b7ffc409d4a24d3c729db3c',2,'(309)-454-0973','blake.moore@example.com','',0),('Phoebe','Murphy','browngoose276','28f8258878dcf516807e8c88fd518b3e2a3b463926d9b8bc17d678ad49c184c5',2,'015242 40811','phoebe.murphy@example.com','',0),('Eddie','Banks','browngoose887','5bcb80d0681d6b5e42674b1b224318829266df06c58a0447d51ac6311fafae70',1,'05-2160-8995','eddie.banks@example.com','greeter',22.45),('Gilberte','Gauthier','brownkoala712','502913bfdd49eab564282dff101e6d167321237eeec66eedb2a438ed80fdeaa0',0,'078 551 42 71','gilberte.gauthier@example','janitor',10.5),('Soan','Charles','brownmeercat269','4bf55a9ce713ee0c1ca0a4d517cc5a5c3b83f7dd4dc5f9009b19b3346191e8cd',2,'05-40-25-76-84','soan.charles@example.com','',0),('Charly','Meunier','brownostrich144','e871995955fd88922e9351f6a941fc9ba19bc25a885a2bd530b67990af9746d5',0,'02-49-73-88-90','charly.meunier@example.co','janitor',20.62),('Berit','Beyer','brownpanda411','e40dfff1a71eb7baf65ea49495977ddd33d81611a9c59c5573fc42205baa7e85',2,'0199-7180870','berit.beyer@example.com','',0),('Addison','Slawa','browntiger864','430a68d98309dd8306dfb7e44c643f7177ecc262066f711014badea2b3e88dc8',1,'646-277-0062','addison.slawa@example.com','bartender',5.16),('Romy','Sanchez','crazybird420','fd8ed7f18b1dd519356074c82b0628c97ad8c0a5a293fd634fa69dcc79a3381b',2,'02-80-30-32-02','romy.sanchez@example.com','',0),('Nolan','Ruiz','crazybutterfly998','4e18123e0f06635b3cab7a620ecf4bbeff385a2f34cecd808dd232fb47b0e655',1,'013873 89611','nolan.ruiz@example.com','janitor',8.33),('Murat','Örge','crazyduck338','70fc4b74eac4319f1f5558f146671b5753a19267e8821f2bae06f54a0d99eac1',1,'(700)-261-1940','murat.orge@example.com','janitor',12.23),('Gilbert','Rohmann','crazyfrog650','008231aaf99956982ffbb132c5fe9d79272f6f109abdefb723afe455a4213765',0,'0475-1824991','gilbert.rohmann@example.c','cook',23.42),('بهاره','نكو نظر','crazyostrich586','bc020a35b7f9cb1382e7b534c68e3c531d849b119bf14f75ddead6cc45c3ccc1',1,'086-32513964','bhrh.nkwnzr@example.com','cook',22.41),('Yvette','Stich','crazyzebra713','63331ed16f62645011bf44e29d81a2252405a5d1c007ae33208223bffa2cf4f1',1,'0200-8181380','yvette.stich@example.com','waiter',3.92),('Anna','Davies','goldenleopard125','9567d4378a886feea6e0e94f7fd3021b79c629bfdc65c5adb3f3ddd2dba55fb3',0,'(501)-026-1849','anna.davies@example.com','greeter',14.87),('Quênia','Moreira','goldenleopard140','b5a2c96250612366ea272ffac6d9744aaf4b45aacd96aa7cfcb931ee3b558259',1,'(11) 9956-2183','quenia.moreira@example.co','cook',12.79),('Maya','Knight','goldensnake107','f5903f51e341a783e69ffc2d9b335048716f5f040a782a2764cd4e728b0f74d9',0,'017684 80507','maya.knight@example.com','cook',22.17),('Franklin','Willis','greendog264','a0978d4c311943296edb1ff2ec69ed5f30155554e650f49f3efc484dc22170a1',1,'051-449-2850','franklin.willis@example.c','greeter',6.19),('Sean','Watkins','greenfrog690','1b60eb2c637e75142ebb7f039cb8f7358b55c6517c8eb2cc1e90fa719424a52b',2,'(145)-147-5190','sean.watkins@example.com','',0),('Florence','Cooper','greengoose591','fd782ad6a7d31feedc1ea128c85526be3cad24a27ff92ef24f562eb52ac5dba2',2,'(196)-133-5181','florence.cooper@example.c','',0),('Alicja','Kjærland','greengorilla849','9cdc6c47aa193ae7fdab6c57a88f118e0adbe254c82095d39531f5e5c1314bdd',0,'86423167','alicja.kjaerland@example.','greeter',22.44),('Rose','Macrae','greenostrich110','f77d1bb58da886e3cbeebbf35a0b3d217b003506792268052c6a730fbc5ec9bc',1,'015396 46442','rose.macrae@example.com','cook',24.53),('Ronald','Price','greenpeacock230','9651b33118f3c9513c7758414424947b789ed74e121b2c2134d34bacb9e9ca31',2,'03-7021-6087','ronald.price@example.com','',0),('Diná','Mendes','greenzebra436','2623bb187d5aff1a31b932433e1ab0e40ed333efcdad4c6907b0e8430763d63c',1,'(89) 2370-3121','dina.mendes@example.com','janitor',16.56),('Dexter','Hagerup','happyduck765','e12dc8ccc151caf5bfc0c99fcc6a289e7440f4039624ae437d5a0078f2d76891',1,'80895225','dexter.hagerup@example.co','janitor',4.72),('بیتا','سالاری','happygoose568','bd84dc633654d437de72ce67276ae9f9bd702392f7701cef86743dc571fb015a',1,'067-30712114','byt.slry@example.com','greeter',15.07),('Connie','Castro','happygorilla928','ccc68482d9e0eee0789e64c7674421076738f8836857ea89bcd0afb832bf3fc3',2,'03-6267-8386','connie.castro@example.com','',0),('Edith','Burke','happyostrich631','6ac9a32c0ca8e84e5bf0c3eccf128cc298ef5cc009ee295209465b79b55a9367',2,'08-6630-1696','edith.burke@example.com','',0),('Marco','Hernandez','happyzebra819','fc4d6c9e874c1f120aa1e3d2dac53dd7804d2d66abbd82ba41599c1a71925048',1,'999-758-663','marco.hernandez@example.c','greeter',20.83),('Roberto','Holmes','heavycat105','e5cd1243e0e97f6d7b30cd7a6e17be3e63aa4135ced9b80b0a551d99913612ab',1,'011-946-4863','roberto.holmes@example.co','waiter',12.51),('Joel','Dunne','heavycat762','701667eff73a8289f9750f69c6aa675fda2e131b505486639a9bd8fd5121a1e7',2,'061-084-6456','joel.dunne@example.com','',0),('Lærke','Thomsen','heavygoose846','130c699460d1eb3040e7af7bbf9ac74667c5c9fef45a0edd61c79fdedc05ab32',2,'05431581','laerke.thomsen@example.co','',0),('Mary','Lewis','heavygorilla987','7fd09250a8d625f850e9981efb0aff6a97385645ce134ac9ed8ec9ee774816b4',2,'(040)-228-7089','mary.lewis@example.com','',0),('Wenzel','Raasch','heavyleopard280','11239872d178729acc9e5aeaf7fc001a0ffd878c922330be43712b9b3be043a7',1,'0127-4292394','wenzel.raasch@example.com','bartender',16.88),('Edgar','Jensen','heavylion793','fc4fe1af2b46813efc38e648f02a24edc639c0ae14d0214fec1335445728c383',1,'(794)-808-6650','edgar.jensen@example.com','waiter',22.32),('Miodrag','Emde','heavysnake692','924d83b97ca0ad09281263341d751738fbc15ff8b04cf53253cefaa715a543fe',2,'0405-3228813','miodrag.emde@example.com','',0),('Erik','Velde','heavytiger736','24e0f0ae0ed7bf630f6e09cd94877bbe94720dac0ed81ec9bb94fd1567e8b6f8',0,'62278705','erik.velde@example.com','waiter',19.69),('Jaxon','Cooper','heavytiger899','6be7e2cc6b2a2971e04d3bd54576ac2cf1236f8e771c0d2326ebfc691df30372',2,'(319)-441-3450','jaxon.cooper@example.com','',0),('Louis','Lavigne','heavyzebra990','03b0bd366e8184f8d871c3a7c7cc26c73c25b54ff54c64b28b10b898242cdc8a',0,'789-923-2044','louis.lavigne@example.com','cook',19.09),('Wilfriede','Lamprecht','lazybear473','571543876c684a8b50a6980db3ae8f0336d573981fcf6c48759648e03d0c3092',0,'0032-9001225','wilfriede.lamprecht@examp','waiter',9.34),('Tony','Little','lazybear504','1f350552ae50d3c89758b5aea1405660575fea1b57756277457f14d6ead04ca4',2,'019467 22310','tony.little@example.com','',0),('Nathan','Knight','lazybird163','cbc62794911ff31b2864ecd3dbbbee7ebcb7ea41c5a42e2cba377f3cfdb42811',0,'890-158-3171','nathan.knight@example.com','bartender',1.26),('William','Li','lazygoose746','e9b71991b7f947a3467fff8aeb5f6944a34cb9c5f9ab9e605411dd3655190c6c',1,'165-247-3581','william.li@example.com','janitor',8.47),('Tilje','Khan','lazylion908','9ad08878dc38c1d6baecc3a02ad8874a41cbc09212b27ec92547df7ec561ddb3',2,'54323060','tilje.khan@example.com','',0),('Sofia','Gutierrez','lazyrabbit306','182072537ada59e4d6b18034a80302ebae935f66adbdf0f271d3d36309c2d481',1,'960-261-926','sofia.gutierrez@example.c','greeter',12.48),('Michael','Fox','MJFox','0ba854d8d1fb4611746147bb379d6bea8662abc0db14eced28667b9b293968de',2,NULL,NULL,NULL,0),('Fitzwilliam','Darcy','MrDarcy','5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8',0,'5592322222','FitzwilliamD@msn.com','Manager',15),('Fanny','Dumont','orangeelephant526','c195d2d8756234367242ba7616c5c60369bc25ced2dcb5b92808d31b58ef217a',2,'078 564 83 69','fanny.dumont@example.com','',0),('Ali','Koç','orangegoose802','7c9c9aa1724e22d278a8235ebf4f8db69ef173b6d7bb3e0ab09bcd559faefc98',1,'(934)-033-0054','ali.koc@example.com','waiter',15.13),('Vilma','Perala','orangeladybug889','dd601fcffc0805d3cddc10cc22cf5d390b4e63c109cdae89503328d6c5086c28',1,'06-244-526','vilma.perala@example.com','cook',22.96),('Johanne','Nielsen','organicrabbit197','8874cad5961bfcfc10e3215346bc033dc71810b698f4c3795ebc96823ae3e04f',1,'85920705','johanne.nielsen@example.c','waiter',14.38),('Oğuzhan','Kumcuoğlu','organicsnake716','75490bd7b93e6fa7d18cfdea90cc6bcb983d5f3ea326249d2709ca6c94bc07ba',2,'(580)-756-5771','oguzhan.kumcuoglu@example','',0),('Danielle','May','organicwolf246','f1996a7cda48bca0dc87f700b183266eed3a770330d924fb1507b3036e37b0ff',2,'0718-2233015','danielle.may@example.com','',0),('Mattheüs','Bierman','purplebear522','cff47fe5d92c58d654b08b2624bbb62aa5034530e3e5eff1f4a7186cba2e03fa',1,'(157)-125-3141','mattheus.bierman@example.','greeter',18),('Marius','Møller','purplekoala987','5b90071aea261a5b838035eadaa5066ac347a6cff1b528053c57f858c6508a27',0,'59646285','marius.moller@example.com','cook',3.17),('Lindoro','da Mata','purplelion472','b0b5f54b20114024d9a08e1ea68051fe795be045f5a83ce86cffd76d3bf56304',1,'(42) 9620-6317','lindoro.damata@example.co','waiter',3.71),('Anna','Hall','purplelion937','4361cc01e665e9d5dfa0bbd56f0ec8272a35dd9289b868d8490d606997ad1567',2,'(107)-007-7678','anna.hall@example.com','',0),('Kiomi','Duits','purplemeercat820','310ced37200b1a0dae25edb263fe52c491f6e467268acab0ffec06666e2ed959',2,'(794)-714-0126','kiomi.duits@example.com','',0),('Emmi','Lehtola','purplemouse860','4fc4f506ec9ef3a4e3f4c63c1d5ec83e5ab28165587936ed78a4717c0d1ffd76',2,'05-387-964','emmi.lehtola@example.com','',0),('Shayan','Urstad','purpleostrich963','60386cf403ca121ea3cba22c04b1258b971da61e9de5f24790005a4324c25be4',2,'58743497','shayan.urstad@example.com','',0),('Eduardo','Silva','purplepanda611','cd8028c53afbf33357a57a5bc96d55e1f244315381b8ce650f98604d5260c4f3',0,'(64) 2366-4132','eduardo.silva@example.com','greeter',8.37),('Lemuel','Teixeira','purplerabbit672','0b83cd023137f13e4413462e372e09251bf24f9e8774909f0d529af62c873e5c',2,'(75) 6837-3483','lemuel.teixeira@example.c','',0),('Sophie','King','purplerabbit966','1696c27ef5a17b20609e4a3e99a677ade376906d2d1a4c3613662f3106d2247e',2,'(797)-288-9352','sophie.king@example.com','',0),('Lily','Walker','purplezebra927','dc365e79d41cfae1c3c0d969319ae62165b81b1815a86c32bbc6c64cbdf2311b',0,'952-619-4258','lily.walker@example.com','janitor',23.42),('Iwona','Hasse','redbear598','6def291378ec54715653340f91d2f1eb632090f69786e63cc9d12bf545762a2f',2,'0898-4503300','iwona.hasse@example.com','',0),('Esteban','Torres','reddog693','59c9ae87c76b4851159c094254dbaebf32e807692b29d625e0b9351fd46be37b',1,'904-360-351','esteban.torres@example.co','janitor',7.27),('Anneleen','Stouthart','redgoose725','884a339b96f4273d9ca4dd40bec0ef67491e64f6a03f475cacb3325dfe372017',1,'(653)-833-7058','anneleen.stouthart@exampl','greeter',16.01),('Necati','Kutlay','redlion680','308a173ee6765335a4b104cd7bbdbf3b23aaced3ed27cf9557a2e0a9749b4317',0,'(137)-069-2544','necati.kutlay@example.com','bartender',8.78),('Elijah','Walker','redmeercat303','e4beb6aad03a5bec892eef25fbe75a0953a68ffafa5b1ddd87864344ac4a6924',0,'(415)-001-5266','elijah.walker@example.com','janitor',4.77),('Isabela','Pereira','redmouse893','09825fb3ec43d949dbfd13f09612323367b64c75f94810b171060262adbc1d3a',2,'(74) 3156-2559','isabela.pereira@example.c','',0),('Danijela','Ten Donkelaar','sadcat302','2931f7f6b6c90582e9d2f0f560c1072a45076b11d547f788d52575dea11bbe1d',0,'(526)-577-5529','danijela.tendonkelaar@exa','waiter',17.18),('Tommy','Garcia','sadfish299','dd92623b0a4b255f87cc4aaee7990ee182d91db49189df6229ce65b5e9d960da',1,'02-7818-8724','tommy.garcia@example.com','cook',13.1),('Simon','Pedersen','sadleopard507','efc0c180c86492bc7bcd30c9e0b79f364347206d94613f3c86bab7aea63f8877',2,'89741734','simon.pedersen@example.co','',0),('Minea','Peltola','sadmouse944','b541fd78860b2f67f4bd3b2ecc581e2f338fbe316dec05d63d05478749057b98',0,'09-326-248','minea.peltola@example.com','greeter',14.83),('Isaiah','Nichols','sadostrich182','a1edfc930ac08f267a53dfd890d30ea2b668a326b51397124a4e16ee6b27c41f',1,'016973 00900','isaiah.nichols@example.co','waiter',4.74),('Carolijn','Juffermans','sadsnake239','9b304b757bff1b09e2ce14a8d2b3223972e591523c0553250509e0ed8abfdf5c',1,'(471)-688-4294','carolijn.juffermans@examp','janitor',19.29),('Louis','Bjerknes','sadswan160','a2bdc78162b620e9e831d1943a8320b320affa98a52441155013b6d6f0f95246',0,'62130892','louis.bjerknes@example.co','bartender',20.97),('ایلیا','کامروا','sadswan288','b64866d9d481181a9b3cd74f1323d7e35cd0ba87b48945ac92c1619827694fd2',2,'018-73928031','yly.khmrw@example.com','',0),('Jack','Daniels','sadswan289','816e2845d395e7703abac2dcbf9d54e39236fd39133362bf7ad3fce70dd7d78e',2,'051-061-4376','jack.daniels@example.com','',0),('Ayşe','Erez','sadswan427','50573ac999b4f7516852df798aafddb1ef893a0352b7c1c7559b984eb5a40bbc',1,'(069)-163-7634','ayse.erez@example.com','janitor',15.93),('Oskari','Wuollet','sadzebra301','2590c36cff76b98c71773025158680f0abe4025d09bed4043cdab891fb811034',1,'07-715-189','oskari.wuollet@example.co','bartender',15.26),('Charlie','Thomas','silverbutterfly869','d0cfc2e5319b82cdc71a33873e826c93d7ee11363f8ac91c4fa3a2cfcd2286e5',1,'021-370-9820','charlie.thomas@example.co','janitor',15.91),('Benjamin','Madsen','silverlion216','96b8b43b198b278c2242dd44ed27e80dd3dcd860be69cda1f805ef50e2667760',1,'79235504','benjamin.madsen@example.c','cook',8.08),('Deniz','Kaya','silverpeacock483','79891e980747ffbd21e690297394efe764fa56d7e37750f800879fbb2d34571a',0,'(416)-774-8382','deniz.kaya@example.com','janitor',18.95),('Giulia','Adam','silversnake862','97c10efe01d5c9c88704a12d361d8429b3a6aa2412290a0773109d5d2d603d5e',1,'04-52-62-63-70','giulia.adam@example.com','bartender',17.13),('Emanuel','Freitas','smallbear610','1d78b370ad96e7a8091888d902360187bdea87ab6a4af003ec63c791894513ec',2,'(58) 8392-0949','emanuel.freitas@example.c','',0),('Jose','Holt','smallfrog356','f75c752658645ad42bc43fab5385ad94d68f3fa9cea77573e288d54aee4ddd2d',0,'017687 33568','jose.holt@example.com','waiter',15.74),('Maddison','Green','smallfrog532','060672b8531404f598515957df33d6387e0647cbc382d35ef286fa3466362384',2,'(069)-834-6585','maddison.green@example.co','',0),('Florence','Singh','smallfrog986','80fd73d0ae9df67b132c85fcb38da0a3930d207e209636f5c75f4e158b32ee3b',0,'526-802-4073','florence.singh@example.co','cook',18.74),('Anna','Santana','smallgoose496','784ba7f84648847e1eb6d3ee266b356e474bb14c808d055667ada615a95fc839',0,'957-568-591','anna.santana@example.com','cook',10.65),('Lidia','Romero','smallleopard126','e2efdd7db924f31dc81b659db07e6eba303497f110acbe8dddb8c13f2e3786d7',2,'914-039-230','lidia.romero@example.com','',0),('Diana','Meyer','smalllion840','74bd50f98d4b8b512e5856f1c718974d5b066fd040a879ff72a84e0501563625',2,'041-966-0482','diana.meyer@example.com','',0),('Lucy','Chen','ticklishelephant745','d254fa846ea7252ec95bf229075e9ac6bda6f8944f5e445e589a4d54184c931d',1,'(519)-993-0918','lucy.chen@example.com','janitor',20.58),('Pasquale','Borgers','ticklishlion707','b51000ef0db2025c124e92cc29880418e2cefbe7fa5badd472cc32c41dfdba57',2,'(540)-573-0479','pasquale.borgers@example.','',0),('Kim','Stewart','ticklishlion748','5bc5f7d10c706393b828db4a427c034cf2befc2662c02275cbfbbdf20a6fe6d9',0,'041-423-6989','kim.stewart@example.com','cook',5.07),('Sharon','Washington','ticklishmouse678','f08689f14e3421bb12d709dfb885e386df1f35e4c3a4bebc71643386661a496a',0,'016977 3411','sharon.washington@example','greeter',5.68),('Karl-Otto','Olschewski','ticklishpeacock921','f5be4b62e1c45f6151b247dcae513da8a91906942535f0e2c232bf7efe4750bd',0,'0179-1492728','karl-otto.olschewski@exam','bartender',1.84),('Hélèna','Bourgeois','ticklishswan953','d8d997e381c7defa12908912423232609dfd56509919413430c2a7b5b69228e1',0,'01-76-75-87-67','helena.bourgeois@example.','janitor',24.03),('Oskari','Haapala','ticklishtiger443','68fcdd78afb0c7b3d671da85513374ade37d091722d4eae13d15cd4e975cc8c0',1,'08-219-500','oskari.haapala@example.co','cook',6),('Lucas','Calvo','ticklishzebra223','14cf83dca489b21646524bbccb754d4161060bd5d3f11366a49cf1590a3230c8',0,'989-826-917','lucas.calvo@example.com','janitor',20.28),('Marinalda','Porto','tinyelephant309','554ba2997b63432b6edacc7f4cbf573dbcfb3e972fd277c047335886af8ade64',0,'(45) 3968-1994','marinalda.porto@example.c','janitor',13.93),('علیرضا','یاسمی','tinyfrog677','8fd0548a8d11659bb97657bc56b3ba2b1655b7e951292b42d1633d9e1b1c2ac2',1,'057-31847227','aalyrd.ysmy@example.com','cook',14.98),('Tanya','Fowler','tinysnake878','d931a74fe3bb28deee7f370e404c97740113e325b75c41335fe7798fbbbb67cc',2,'04-2706-6200','tanya.fowler@example.com','',0),('Cristina','Saez','tinywolf341','a555b5daab9df299c88fbd5ed138505d447ec189707d464a7d6fdc22deac2aef',0,'906-080-249','cristina.saez@example.com','janitor',6.73),('سوگند','مرادی','tinyzebra897','7f39c02109ee0083beee61e5fed6f78bd338305725f930b71811da73f1f743fe',2,'033-29140745','swgnd.mrdy@example.com','',0),('Elise','Vatland','whitebear966','b21b17b4ecc60cdbfa7b8dfd13b611a862f8c0a8416f0a0958356cffef8e26f2',2,'50762789','elise.vatland@example.com','',0),('Thomas','Shelton','whitebird661','3f8375f34e9c5d1c54f61b8763f9c322884f43edfae0bbceb75dc720b1d27d69',0,'0161 710 6274','thomas.shelton@example.co','greeter',9.74),('Celso','Gomes','whitedog632','c5b389beb081fe1e43ae92e895deca086b4eed5cf9efc7b78eebbbc9dc75c3f0',1,'(93) 5914-2544','celso.gomes@example.com','greeter',18.99),('Karen','Webb','whitedog745','3d7c42ace9e0f1f091ed192e346d4f18b890d0161bd1c4a94e85848f2108969d',0,'061-419-8194','karen.webb@example.com','waiter',22.98),('Mille','Johansen','whiteelephant158','6201eb4dccc956cc4fa3a78dca0c2888177ec52efd48f125df214f046eb43138',0,'11241015','mille.johansen@example.co','bartender',1.45),('Olivia','Wilson','whitefish811','fe1ce1f8c675028ad574b2c5093b3bc4744e824a28e5992b6a65547203297b08',2,'(918)-345-6634','olivia.wilson@example.com','',0),('Jenny','King','whitegoose627','2d51a3b3ca1cdf790485938566c720527b2ebbe5a1f0326316ce63aafbc385d4',0,'011-429-9826','jenny.king@example.com','greeter',20.09),('James','Green','whitelion915','c9022680f888674e2b2274758755bfa07dea729b68d71cde5c521ed70ef261bf',1,'(403)-955-8859','james.green@example.com','bartender',18.4),('Miriam','Ferrer','whiteswan363','3ae83660f67600220d1793cab11212571c61529952f4fccc4e1028272ece4d98',0,'998-155-458','miriam.ferrer@example.com','waiter',21.9),('Alissia','Boekhorst','yellowduck810','8ed3d27fe50e9b60dc78bd80ae75788ecfe22f4af26b10bbf249eef194b8879d',2,'(598)-505-1854','alissia.boekhorst@example','',0),('Friedrich','Rey','yellowpanda460','d2dbacce3e851bf99053241e00ac5398bf17b61e228900dd22af0c5528c0e90b',0,'075 612 72 37','friedrich.rey@example.com','cook',15.8),('Molly','Gonzales','yellowpeacock835','79ce988ba7b2e8c079a716b8957164384dcc9933ec9c6ed84683b783383a729d',1,'015396 55911','molly.gonzales@example.co','waiter',8.55);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-23 23:25:57
