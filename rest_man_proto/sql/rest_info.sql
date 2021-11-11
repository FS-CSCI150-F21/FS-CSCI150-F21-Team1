

-- script to create "rest_manager" user, and "rest_info" database that accesses database from php backend.


-- create user
CREATE USER IF NOT EXISTS 'rest_manager'@'localhost' IDENTIFIED BY 'iF2ONNbmcCTcdjrd';

-- grant privileges to newly created user.  
-- this statement likely to fail if not ran from root.
GRANT ALL ON rest_info.* to 'rest_manager'@'localhost';

CREATE DATABASE  IF NOT EXISTS `rest_info` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
-- Table structure for table `closed_order_info`
--

DROP TABLE IF EXISTS `closed_order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `closed_order_info` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dinerTable` int DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `finished` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `items` blob,
  `prep_time` int DEFAULT NULL,
  `people_dining_in` int DEFAULT NULL,
  `paid` tinyint DEFAULT '0',
  `total` decimal(10,2) DEFAULT NULL,
  `customer_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `eRTime` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `closed_order_info`
--

LOCK TABLES `closed_order_info` WRITE;
/*!40000 ALTER TABLE `closed_order_info` DISABLE KEYS */;
INSERT INTO `closed_order_info` VALUES (48,'angryduck462',0,'Closed','2021-11-11 04:28:37','2021-11-11 21:05:40',NULL,_binary '{\"1\":4,\"7\":1,\"76\":2}',NULL,0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `closed_order_info` ENABLE KEYS */;
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
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id` int NOT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
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
INSERT INTO `menuItems` VALUES ('Smashing Pumpkin',0,1,'All Spice and Black Pepper Infused Real McCoy 5yr, Pumpkin Puree, Coconut Cream, Almond Milk, Nutmeg, OJ, Pineapple Juice,',10.00,0,0,0,11),('From Mexico with Love',1,1,'Vida Mezcal, Fiorente Elderflower, Lillet, Lime Shrub, Lemon Juice, Lime JuiceThis is a very unique cocktail with unique flavors. It is not for everyone!',13.00,0,0,0,26),('Fizzy Ginger Man',2,1,'Ginger Infused Gin, Triple Sec, Grapefruit Juice, Sparkling Wine',10.00,0,0,0,16),('Fall in Boulevardier',3,1,'Tin Cup Rye, Campari, Lazzaroni Maraschino, Cinnamon Infused Sweet Vermouth',12.00,0,0,0,11),('Caipirinha',4,1,'Cachaca, Lime, Simple, Sugar in the Raw',10.00,0,0,0,17),('Noah\'s Margarita',5,1,'Exotico Silver Tequila, Triple Sec, Fresh Citrus Juices, on the Rocks',10.00,0,0,0,11),('Magnificent Manhattan',6,1,'Sazerac Rye, Carpano Antica, Bitters',15.00,0,0,0,15),('House Made Sangria',7,1,'Red or White, Your Call...Made to Order',11.00,0,0,0,6),('IPA',8,1,'lorem ipsum',15.00,0,0,1,17),('Pale Lager',9,1,'lorem ipsum',12.00,0,0,1,21),('Wheat',10,1,'lorem ipsum',13.00,0,0,1,9),('Seasonal',11,1,'lorem ipsum',14.00,0,0,1,15),('Bud Light',12,1,'',4.00,0,0,2,28),('Cider Boys',13,1,'First Press Cider 16oz. [Gluten Free]',8.00,0,0,2,9),('Buckler',14,1,'Non-alcoholic',4.00,0,0,2,16),('Guinness Draft',15,1,'',6.00,0,0,2,24),('IPA of the Moment',16,1,'Seasonal, local, or hard to find.  Ask your server.',5.00,0,0,2,13),('Pinot Noir',17,1,'Angeline Reserve, Sonoma Coast',10.00,0,0,3,29),('Pinot Noir',18,1,'Straight Shooter Willamette Valley, Oregon',15.00,0,0,3,13),('Merlot',19,1,'Olelo, Paso Robles',10.00,0,0,3,24),('Garnacha',20,1,'Las Rocas, Calatayud, Spain',9.00,0,0,3,6),('Bordeaux Blend',21,1,'Vieux Chateau Brun, Pomerol, France',13.00,0,0,3,21),('Cabernet Sauvignon',22,1,'Montes, Colchagua Valley, Chile',8.00,0,0,3,14),('Prosecco',23,1,'La Marca, DOC, Italy',9.00,0,0,4,9),('Champagne',24,1,'Veuve Clicquot, Yellow Label, France',15.00,0,0,4,23),('Sauvignon Blanc',25,1,'Saint Clair, Marlborough, New Zealand',9.00,0,0,4,29),('Rose',26,1,'Famille Perrin, Cotes du Rhone, Reseve, France',8.00,0,0,4,28),('Dessert Wine',27,1,'Chateau Laribotte, Sauternes, France',11.00,0,0,4,24),('Vodka',28,1,'Absolut',8.00,0,0,5,29),('Gin',29,1,'Bombay',8.00,0,0,5,28),('Gin',30,1,'Tanqueray',9.00,0,0,5,18),('Rum',31,1,'Bacardi',8.00,0,0,5,28),('Tequila',32,1,'Patron Reposado',12.00,0,0,5,9),('Brandy',33,1,'Hennessy VS',9.00,0,0,5,7),('Whiskey',34,1,'Canadian Club',8.00,0,0,5,21),('Bourbon',35,1,'1792',11.00,0,0,5,18),('Coca Cola',36,1,'Coke, Sprite, Diet Coke, Fanta',3.00,0,0,6,11),('Nestea',37,1,'Lemon, Peach',4.00,0,0,6,19),('Coffee',38,1,'Espresso, Cappuccino, Latte Macchiato, Black',8.00,0,0,6,18),('Tea',39,1,'Milk, Lemon',3.00,0,0,6,5),('Sushi Rice and Tuna',40,1,'',9.00,0,1,7,6),('Hoisin Beef Swiss Roll with Baby Leek',41,1,'',11.00,0,1,7,27),('Mini Prawn Tacos',42,1,'',13.00,0,1,7,11),('Smoked Salmon Tartare Blini with Lime Mayo',43,1,'',9.00,0,1,7,6),('Smoke Duck with Enoki Mushroom and Thai Asparagus, Sweet Onion',44,1,'',6.00,0,1,7,11),('Goat’s Cheese Mousse and Fig Tart',45,1,'',8.00,0,1,7,19),('Beef Croquette with Paprika Sauce',46,1,'',13.00,0,1,7,22),('Brie Tomato Tart with Red Onion Marmalade',47,1,'',9.00,0,1,7,16),('Tofu Balls with Peanut Sauce',48,1,'',8.00,0,1,7,22),('Braised Ox Cheeks with Mini Yorkshire Pudding and Horseradish Mash',49,1,'',12.00,0,1,7,25),('Angels on Horseback',50,1,'Oysters wrapped in bacon, served hot.',19.00,0,1,8,27),('Bruschetta',51,1,'Grilled bread rubbed with garlic, and topped with olive oil, salt, pepper, and tomato.',15.00,0,1,8,14),('Buffalo Wings',52,1,'Deep-fried and unbreaded chicken wingettes coated in vinegar-based cayenne pepper, hot sauce, and butter.',13.00,0,1,8,8),('Caviar',53,1,'Wild Sturgeon Roe of Caspian and Black Seas.',33.00,0,1,8,22),('Mozzarella Sticks',54,1,'Elongated pieces of battered mozzarella.',8.00,0,1,8,23),('Nachos',55,1,'Tortilla chips covered in shredded cheese, salsa, and guacamole.',13.00,0,1,8,15),('Potato Skins',56,1,'Covered with bacon, cheddar cheese, green onions, and sour cream.',11.00,0,1,8,14),('Shrimp Cocktail',57,1,'Shelled prawns in mayonnaise and tomato dressing, served in a glass.',15.00,0,1,8,11),('Crudité Platter',58,1,'Fried asparagus and zucchini, baby arthichokes, kalamata olives, halved radishes, snap peas, cherry tomatoes, sliced cucumber, and carrot sticks with avocado ranch dressing or hummus on the side.',19.00,0,1,8,24),('Togarashi Chips with Toasted Sesame Onion Dip',59,1,'Flash fried Idaho potatoes, dusted with salt and chili-centric Japanese togarashi spice mix.  Paired with mayo-based dip made with slow roasted Spanish onion, toasted sesame oil, crispy garlic, and Canadian steak seasoning.',17.00,0,1,9,12),('Clarified Butter Fried Chips and Caviar',60,1,'Yukon gold potato chips fried in clarified butter served with whipped créme frâiche deced out with chives – plus Ossetra caviar.',18.00,0,1,9,7),('Deviled Crab Dip with Old Bay Chips',61,1,'Crab, cream cheese, aged white cheddar, yellow cheddar, and cayenne covered in breadcrumbs.  Old Bay spiced potato chips with pickled vegetables: chilies, onions, okra, cauliflower, and zucchini.',23.00,0,1,9,24),('Vegan Lentil with Ancient Grains Soup',62,1,'',13.00,0,2,10,6),('Piranha Pale Ale Chili',63,1,'Our original recipe, filled with beef, onions & signature blend of spices. Topped with shredded cheese & tortilla strips.',12.00,0,2,10,27),('Chicken Tortilla Soup',64,1,'',14.00,0,2,10,17),('Tuscan Tomato Bisque',65,1,'',8.00,0,2,10,17),('Broccoli Cheddar Soup',66,1,'',19.00,0,2,10,13),('Clam Chowder',67,1,'',23.00,0,2,10,15),('House Wedge Salad',68,1,'',7.00,0,2,11,9),('Southwest Chicken Caesar Salad',69,1,'Grilled chicken, tomatoes, queso fresco, tortilla strips with Caesar dressing.',15.00,0,2,11,29),('Fresh Mozzarella and Tomato Salad',70,1,'',17.00,0,2,11,15),('Caribbean Salad with Seared Shrimp',71,1,'Pineapple, mandarin oranges, dried cranberries, red bell peppers, green onions, cilantro, with honey-lime dressing.',18.00,0,2,11,17),('Santa Fe Chicken Salad',72,1,'Spicy grilled chicken, pico, avocado, cilantro, tortilla strips, house-made ranch & a drizzle of spicy Santa Fe sauce.',15.00,0,2,11,22),('Roadside Sliders',73,1,'Two bite-sized burgers on mini-buns. Served with fries or fresh fruit.',7.00,0,3,12,5),('Mini Corn Dogs',74,1,'Three all beef mini hot dogs.  Served with fries or fresh fruit.',7.00,0,3,12,18),('Flatbread Pizzas',75,1,'Cheese or Pepperoni',7.00,0,3,12,22),('Pasta',76,1,'Served with bowtie pasta.  Choose from butter and parmesan, marinara sauce, or Alfredo sauce.',7.00,0,3,12,19),('Spaghetti with Meatball',77,1,'The reliable classic.  Enough said.',7.00,0,3,12,19),('Macaroni and Cheese',78,1,'The original mac and cheese every kid loves.',7.00,0,3,12,8),('Fried Chicken Strips',79,1,'Served with fries or fresh fruit.',7.00,0,3,12,10),('Quessadilla',80,1,'Grilled flour tortilla filled with melted cheese.  Available with chicken.',7.00,0,3,12,30),('Cheesy Pizza',81,1,'6” four-cheese pizza',7.00,0,3,12,22),('Margherita',82,1,'Mozzarella, tomato sauce, basil',16.00,0,4,13,28),('Pepperoni',83,1,'Mozzarella, tomato sauce, oregano',18.00,0,4,13,8),('Mixed Mushroom',84,1,'Mozzarella, fontina, truffled cheese, thyme',18.00,0,4,13,18),('Smoke Prosciutto',85,1,'Mozzarella, fontina, goat cheese, caramelized onion',19.00,0,4,13,28),('Diavola',86,1,'Spicy tomato sauce, mozzarella, soppressata, sausage, bacon, roasted red pepper',20.00,0,4,13,11),('Carbonara',87,1,'Mozzarella, fontina, bacon, onions, baked egg, parmigiano',20.00,0,4,13,21),('Butternut Squash Agnolotti',88,1,'Crispy sage, aged balsamic, amaretti cookie',23.00,0,4,14,22),('Bucatini',89,1,'Spicy tomato sauce, pancetta, red onion, pecorino',23.00,0,4,14,27),('Mezzi Rigatoni',90,1,'Sausage ragu',24.00,0,4,14,19),('Tagliatelle',91,1,'Ribbon noodles, lamb ragu',24.00,0,4,14,30),('Fusilli',92,1,'Roasted chicken, pancetta, mushrooms, marsala, herbs',24.00,0,4,14,23),('Tagliolini',93,1,'Thin ribbon noodles, spicy tomato sauce, shrimp, crab, arugula',28.00,0,4,14,27),('Chicken Cacciatore',94,1,'Chicken breast sauteed with onions, mushrooms, and green peppers, served in a red sauce.',29.00,0,4,15,21),('Chicken Piccata',95,1,'Chicken breast in lemon butter sauce with mushrooms, fresh garlic and pimento',29.00,0,4,15,20),('Chicken Marsala',96,1,'Chicken breast sauteed with mushrooms, onions, carrots and celery, served in a brown sauce.',29.00,0,4,15,13),('Chicken Parmigiana',97,1,'Breaded chicken breast smothered with mozzarella cheese',28.00,0,4,15,16),('Chicken Cordon Blue',98,1,'Baked breaded chicken stuffed with ham and cheese, served with a mushroom cream sauce.',29.00,0,4,15,22),('Veal Cordon Blue',99,1,'Baked breaded veal stuffed with ham and cheese served with a mushroom cream sauce',30.00,0,4,16,15),('Veal Parmigiana',100,1,'Breaded veal smothered with mozzarella cheese',30.00,0,4,16,10),('Veal Piccata',101,1,'Served in a lemon butter sauce with mushrooms and garlic',30.00,0,4,16,30),('Veal Scallopini',102,1,'Veal sauteed with mushrooms and onions in a red sauce',30.00,0,4,16,17),('Veal Shoemaker',103,1,'Served in a lemon sauce with mushrooms, green olives, and capers.',30.00,0,4,16,23),('Veal Marsala',104,1,'Veal sauteed with mushrooms and onions, served in a brown sauce',30.00,0,4,16,13),('Sorrento',105,1,'Shrimp, calamari, clams, green olives, and capers with red sauce',27.00,0,4,14,8),('Baby Back Pork Ribs',106,1,'A full rack of slow-roasted overnight baby back ribs.  Choice of two sides.',28.00,0,4,17,7),('Mandarin Orange-Glazed Pork Chop',107,1,'Slow-roasted, double bone-in pork chop with mandarin orange glaze or bacon onion jam.',22.00,0,4,17,10),('Double Bone-In Pork Chop',108,1,'Slow-roasted, double bone-in pork chop.',21.00,0,4,17,7),('Big Shrimp',109,1,'Sauteed in a lemon butter sauce with  mostacciolli, aglio, and a touch of feta cheese.',29.00,0,4,18,11),('Atlantic Salmon',110,1,'Baked in light lemon butter sauce, served with mostacciollo primavera',27.00,0,4,18,15),('New Orleans Jambalaya',111,1,'Blackened chicken breasts sauteed shrimp, sausage, bell peppers, onions, tomatoes, cajun-spiced broth, and rice-pilaf.',22.00,0,4,18,19),('Enlightened Pacific Poke Soba Noodles',112,1,'Sashimi-grade ahi tuna, buckwheat soba noodles, poke sauce, carrots, pickled vegetables, soy ginger sauce, wasabi guacamole, crispy wonton strips, green onions, and sesame seeds.',18.00,0,4,18,13),('Blonde Fish ‘N’ Chips',113,1,'Lightly fried cod fillets, Blonde beer batter, fries, and housemade tartar sauce.',19.00,0,4,18,13),('Enlightened Cherry Chipotle Glazed Salmon',114,1,'Oven-roasted Atlantic salmon, sweet and savory cherry Chipotle glaze, roasted asparagus, fire-roasted red pepper, and tomato and spinach couscous.',19.00,0,4,18,15),('Bacon Jam Rib-Eye',115,1,'Juicy, well-marbled 14 oz rib-eye.',29.00,0,4,19,28),('Prime Rib',116,1,'15 oz prime rib slow-roasted over four hours, au jus, and creamy horseradish.',30.00,0,4,19,22),('Slow-Roasted Tri-tip',117,1,'8 oz slow-roasted sirloin tri-tip glazed with peppered BBQ sauce.',21.00,0,4,19,19),('Classic Rib-Eye',118,1,'Juicy, well-marbled 14 oz rib-eye.',28.00,0,4,19,8),('Tiramisu Cheesecake',119,1,'Mascarpone, cream cheese, chocolate, and ladyfinger crust.',9.00,0,5,21,19),('Italian Cheesecake',120,1,'With riccota cheese, lemon zest & Graham cracker crust.',9.00,0,5,21,20),('Tiramisu',121,1,'Mascarpone cheese, brandy & espresso layered with ladyfinger and dusted with chocolate',8.00,0,5,21,14),('Molten Chocolate Cake',122,1,'With a melted chocolate center.  Served with choice of ice cream.',13.00,0,5,21,10),('Red Velvet Cake',123,1,'A southern classic with cream cheese frosting',12.00,0,5,21,24),('“The Best” Carrot Cake',124,1,'Citrus cream cheese icing',8.00,0,5,21,7),('Deep Dark Fudge Cake',125,1,'Fudgy chocolate frosting',11.00,0,5,21,21),('Pineapple Upside-Down Cake',126,1,'Warm pineapple upside-down cake, on a bed of kahlúa cream sauce.  Topped with ice cream, whipped cream, and toasted coconut.',13.00,0,5,21,22),('Key Lime Pie',127,1,'Baked Fresh with a graham-pecan crust.  Topped with fresh whipped cream.',17.00,0,5,22,24),('Blueberry Pie',128,1,'',15.00,0,5,22,27),('Apple Pie',129,1,'',15.00,0,5,22,13),('Chocolate',130,1,'',15.00,0,5,22,18),('Chocolate Chip',131,1,'Drop cookie with chocolate chips.',5.00,0,5,23,9),('Snickerdoodle',132,1,'',5.00,0,5,23,28),('Peanut Butter',133,1,'',5.00,0,5,23,21),('Bakeshop Brownie',134,1,'A twist on a classic favorite, this rich fudge brownie holds a hidden surprise.  It’s center is filled with gourmet semisweet chocolate chips.  Topped with a white chocolate glaze.',19.00,0,5,24,19),('Fudge Walnut',135,1,'Made just like a regular brownie and jam-packed with walnuts.',12.00,0,5,24,10),('Fudge Iced Brownies',136,1,'Covered in rich, creamy, chocolate icing.',13.00,0,5,24,24),('Vanilla',137,1,'Classic',8.00,0,5,25,29),('Chocolate',138,1,'',8.00,0,5,25,6),('Cookies N’ Cream',139,1,'',8.00,0,5,25,11),('Buttered Pecan',140,1,'',8.00,0,5,25,22),('Strawberry',141,1,'',9.00,0,5,25,22);
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
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dinerTable` int DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `finished` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `items` blob,
  `prep_time` int DEFAULT NULL,
  `people_dining_in` int DEFAULT NULL,
  `paid` tinyint DEFAULT '0',
  `total` decimal(10,2) DEFAULT NULL,
  `customer_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `eRTime` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_order_info`
--

LOCK TABLES `open_order_info` WRITE;
/*!40000 ALTER TABLE `open_order_info` DISABLE KEYS */;
INSERT INTO `open_order_info` VALUES (30,'angryduck462',NULL,'Opened','2021-11-10 05:45:37','2021-11-10 07:41:30',NULL,_binary '{\"1\":4}',NULL,0,0,NULL,NULL,NULL),(31,'angryduck462',NULL,'Opened','2021-11-10 08:16:51','2021-11-10 08:17:11',NULL,_binary '{\"42\":2}',NULL,0,0,NULL,NULL,NULL),(32,'angryduck462',NULL,'Opened','2021-11-10 18:34:00','2021-11-10 18:37:35',NULL,_binary '{\"45\":1,\"51\":1,\"53\":1}',NULL,0,1,NULL,NULL,NULL),(35,'bigleopard946',NULL,'Kitchen','2021-11-10 19:33:22','2021-11-10 20:22:16',NULL,_binary '{\"43\":3,\"44\":2,\"45\":1,\"47\":3,\"48\":1}',NULL,0,1,NULL,NULL,NULL),(36,'bigleopard946',NULL,'Kitchen','2021-11-10 20:22:58','2021-11-10 20:23:08',NULL,_binary '{\"46\":1,\"51\":1,\"124\":1}',NULL,0,1,NULL,NULL,NULL),(37,'bigleopard946',NULL,'Kitchen','2021-11-10 22:21:46','2021-11-10 22:21:55',NULL,_binary '{\"3\":1,\"10\":1,\"16\":1}',NULL,0,1,NULL,NULL,NULL),(38,'bigleopard946',NULL,'Kitchen','2021-11-11 01:14:17','2021-11-11 01:14:23',NULL,_binary '{\"0\":1,\"2\":1}',NULL,0,1,NULL,NULL,NULL),(39,'bigleopard946',NULL,'Kitchen','2021-11-11 01:15:42','2021-11-11 01:15:47',NULL,_binary '{\"68\":1}',NULL,0,1,NULL,NULL,'2021-11-10 17:24:47'),(40,'bigleopard946',NULL,'Kitchen','2021-11-11 01:19:37','2021-11-11 01:19:44',NULL,_binary '{\"16\":1}',NULL,0,1,NULL,NULL,'2021-11-10 17:32:44'),(41,'bigleopard946',NULL,'Kitchen','2021-11-11 03:10:38','2021-11-11 04:01:08',NULL,_binary '{\"6\":2,\"7\":2}',NULL,0,1,NULL,NULL,'2021-11-10 19:27:45'),(42,'angryduck462',NULL,'Opened','2021-11-11 04:07:31','2021-11-11 04:09:32',NULL,_binary '{\"4\":1,\"5\":1,\"7\":2}',NULL,0,1,NULL,NULL,NULL),(43,'bigleopard946',NULL,'Kitchen','2021-11-11 04:09:50','2021-11-11 04:09:57',NULL,_binary '{\"3\":5}',NULL,0,1,NULL,NULL,'2021-11-10 20:20:57'),(45,'angryduck462',NULL,'Opened','2021-11-11 04:23:18','2021-11-11 04:26:33',NULL,_binary '{\"44\":1,\"45\":2,\"48\":1}',NULL,0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `open_order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `level` int NOT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `position` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `wage` float NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES ('Ümit','Başoğlu','angrybutterfly804','eraser',1,'(056)-246-3798','umit.basoglu@example.com','greeter',19.13),('Samir','Silveira','angrycat530','stefano',2,'(03) 9109-3815','samir.silveira@example.co','',0),('Flenn','Anderson','angryduck462','jesse',0,'013873 98828','flenn.anderson@example.co','cook',23.65),('Janne','Sangolt','angrygorilla975','hannah1',1,'54673080','janne.sangolt@example.com','waiter',17.94),('Charlie','Moore','angrywolf324','smart',1,'(978)-021-1058','charlie.moore@example.com','cook',16.05),('Jose','Alonso','angryzebra467','dalejr',0,'945-700-621','jose.alonso@example.com','waiter',7.31),('Camille','Pelletier','beautifulfrog434','buffalo1',0,'729-665-4599','camille.pelletier@example','waiter',13.3),('یسنا','گلشن','beautifulostrich362','bicycle',0,'084-75234930','ysn.glshn@example.com','bartender',18.36),('میلاد','نجاتی','beautifulzebra280','haha',2,'053-77880089','myld.njty@example.com','',0),('Gertraud','Neugebauer','bigfish236','blue42',0,'0137-4249729','gertraud.neugebauer@examp','waiter',4.36),('سینا','كامياران','bigfish319','zxcvb',2,'068-33698387','syn.kmyrn@example.com','',0),('Fred','Carter','bigfrog346','denali',1,'07-9966-7567','fred.carter@example.com','bartender',17.54),('Randall','Romero','bigladybug624','joe123',1,'015394 23071','randall.romero@example.co','waiter',20.24),('Eva','Lee','bigleopard946','pppp',2,'(854)-884-3125','eva.lee@example.com','',0),('Hugo','Benitez','blackelephant143','train',1,'934-080-298','hugo.benitez@example.com','bartender',17.32),('Sarah','Chan','blackgorilla508','616161',2,'802-260-5476','sarah.chan@example.com','',0),('Aaron','Kumar','blackpanda751','savage',0,'(141)-548-2557','aaron.kumar@example.com','cook',18.8),('Hector','Arias','blackrabbit342','basset',0,'981-037-683','hector.arias@example.com','waiter',7.47),('Naja','Nielsen','blackwolf283','trains',0,'30289239','naja.nielsen@example.com','janitor',20.69),('Jozef','Jacob','bluedog307','firefigh',0,'0453-4240795','jozef.jacob@example.com','janitor',14.53),('Anna','Sullivan','bluegoose319','slow',2,'061-308-9589','anna.sullivan@example.com','',0),('Marie','Christiansen','bluemeercat865','hatred',1,'93459307','marie.christiansen@exampl','bartender',13.54),('Gabe','Nelson','bluerabbit566','shelter',0,'061-201-7949','gabe.nelson@example.com','greeter',17.02),('Ceylan','Özbey','brownbear535','disney',0,'(159)-134-3028','ceylan.ozbey@example.com','waiter',7.93),('Blake','Moore','brownelephant605','xander',2,'(309)-454-0973','blake.moore@example.com','',0),('Phoebe','Murphy','browngoose276','spunk',2,'015242 40811','phoebe.murphy@example.com','',0),('Eddie','Banks','browngoose887','snowboard',1,'05-2160-8995','eddie.banks@example.com','greeter',22.45),('Gilberte','Gauthier','brownkoala712','anthony',0,'078 551 42 71','gilberte.gauthier@example','janitor',10.5),('Soan','Charles','brownmeercat269','donnie',2,'05-40-25-76-84','soan.charles@example.com','',0),('Charly','Meunier','brownostrich144','aragorn',0,'02-49-73-88-90','charly.meunier@example.co','janitor',20.62),('Berit','Beyer','brownpanda411','advance',2,'0199-7180870','berit.beyer@example.com','',0),('Addison','Slawa','browntiger864','passthie',1,'646-277-0062','addison.slawa@example.com','bartender',5.16),('Romy','Sanchez','crazybird420','crimson',2,'02-80-30-32-02','romy.sanchez@example.com','',0),('Nolan','Ruiz','crazybutterfly998','mongoose',1,'013873 89611','nolan.ruiz@example.com','janitor',8.33),('Murat','Örge','crazyduck338','hookers',1,'(700)-261-1940','murat.orge@example.com','janitor',12.23),('Gilbert','Rohmann','crazyfrog650','express',0,'0475-1824991','gilbert.rohmann@example.c','cook',23.42),('بهاره','نكو نظر','crazyostrich586','machine',1,'086-32513964','bhrh.nkwnzr@example.com','cook',22.41),('Yvette','Stich','crazyzebra713','feng',1,'0200-8181380','yvette.stich@example.com','waiter',3.92),('Anna','Davies','goldenleopard125','laetitia',0,'(501)-026-1849','anna.davies@example.com','greeter',14.87),('Quênia','Moreira','goldenleopard140','dummy',1,'(11) 9956-2183','quenia.moreira@example.co','cook',12.79),('Maya','Knight','goldensnake107','apples',0,'017684 80507','maya.knight@example.com','cook',22.17),('Franklin','Willis','greendog264','goldwing',1,'051-449-2850','franklin.willis@example.c','greeter',6.19),('Sean','Watkins','greenfrog690','shou',2,'(145)-147-5190','sean.watkins@example.com','',0),('Florence','Cooper','greengoose591','cascade',2,'(196)-133-5181','florence.cooper@example.c','',0),('Alicja','Kjærland','greengorilla849','always',0,'86423167','alicja.kjaerland@example.','greeter',22.44),('Rose','Macrae','greenostrich110','timeout',1,'015396 46442','rose.macrae@example.com','cook',24.53),('Ronald','Price','greenpeacock230','koolaid',2,'03-7021-6087','ronald.price@example.com','',0),('Diná','Mendes','greenzebra436','callie',1,'(89) 2370-3121','dina.mendes@example.com','janitor',16.56),('Dexter','Hagerup','happyduck765','technics',1,'80895225','dexter.hagerup@example.co','janitor',4.72),('بیتا','سالاری','happygoose568','regina',1,'067-30712114','byt.slry@example.com','greeter',15.07),('Connie','Castro','happygorilla928','bruno',2,'03-6267-8386','connie.castro@example.com','',0),('Edith','Burke','happyostrich631','cards',2,'08-6630-1696','edith.burke@example.com','',0),('Marco','Hernandez','happyzebra819','superior',1,'999-758-663','marco.hernandez@example.c','greeter',20.83),('Roberto','Holmes','heavycat105','fellatio',1,'011-946-4863','roberto.holmes@example.co','waiter',12.51),('Joel','Dunne','heavycat762','mephisto',2,'061-084-6456','joel.dunne@example.com','',0),('Lærke','Thomsen','heavygoose846','pimping',2,'05431581','laerke.thomsen@example.co','',0),('Mary','Lewis','heavygorilla987','carlitos',2,'(040)-228-7089','mary.lewis@example.com','',0),('Wenzel','Raasch','heavyleopard280','total',1,'0127-4292394','wenzel.raasch@example.com','bartender',16.88),('Edgar','Jensen','heavylion793','stewart',1,'(794)-808-6650','edgar.jensen@example.com','waiter',22.32),('Miodrag','Emde','heavysnake692','dharma',2,'0405-3228813','miodrag.emde@example.com','',0),('Erik','Velde','heavytiger736','luv2epus',0,'62278705','erik.velde@example.com','waiter',19.69),('Jaxon','Cooper','heavytiger899','honda1',2,'(319)-441-3450','jaxon.cooper@example.com','',0),('Louis','Lavigne','heavyzebra990','1948',0,'789-923-2044','louis.lavigne@example.com','cook',19.09),('Wilfriede','Lamprecht','lazybear473','ashleigh',0,'0032-9001225','wilfriede.lamprecht@examp','waiter',9.34),('Tony','Little','lazybear504','spankme',2,'019467 22310','tony.little@example.com','',0),('Nathan','Knight','lazybird163','amazon',0,'890-158-3171','nathan.knight@example.com','bartender',1.26),('William','Li','lazygoose746','garcia',1,'165-247-3581','william.li@example.com','janitor',8.47),('Tilje','Khan','lazylion908','cyclops',2,'54323060','tilje.khan@example.com','',0),('Sofia','Gutierrez','lazyrabbit306','moose',1,'960-261-926','sofia.gutierrez@example.c','greeter',12.48),('Fitzwilliam','Darcy','MrDarcy','password',0,'5592322222','FitzwilliamD@msn.com','Manager',15),('Fanny','Dumont','orangeelephant526','eight',2,'078 564 83 69','fanny.dumont@example.com','',0),('Ali','Koç','orangegoose802','senators',1,'(934)-033-0054','ali.koc@example.com','waiter',15.13),('Vilma','Perala','orangeladybug889','catcat',1,'06-244-526','vilma.perala@example.com','cook',22.96),('Johanne','Nielsen','organicrabbit197','zanzibar',1,'85920705','johanne.nielsen@example.c','waiter',14.38),('Oğuzhan','Kumcuoğlu','organicsnake716','submit',2,'(580)-756-5771','oguzhan.kumcuoglu@example','',0),('Danielle','May','organicwolf246','tennis',2,'0718-2233015','danielle.may@example.com','',0),('Mattheüs','Bierman','purplebear522','tazmania',1,'(157)-125-3141','mattheus.bierman@example.','greeter',18),('Marius','Møller','purplekoala987','discover',0,'59646285','marius.moller@example.com','cook',3.17),('Lindoro','da Mata','purplelion472','troy',1,'(42) 9620-6317','lindoro.damata@example.co','waiter',3.71),('Anna','Hall','purplelion937','grand',2,'(107)-007-7678','anna.hall@example.com','',0),('Kiomi','Duits','purplemeercat820','1235',2,'(794)-714-0126','kiomi.duits@example.com','',0),('Emmi','Lehtola','purplemouse860','jackoff',2,'05-387-964','emmi.lehtola@example.com','',0),('Shayan','Urstad','purpleostrich963','wanda',2,'58743497','shayan.urstad@example.com','',0),('Eduardo','Silva','purplepanda611','simmons',0,'(64) 2366-4132','eduardo.silva@example.com','greeter',8.37),('Lemuel','Teixeira','purplerabbit672','losers',2,'(75) 6837-3483','lemuel.teixeira@example.c','',0),('Sophie','King','purplerabbit966','nopass',2,'(797)-288-9352','sophie.king@example.com','',0),('Lily','Walker','purplezebra927','north',0,'952-619-4258','lily.walker@example.com','janitor',23.42),('Iwona','Hasse','redbear598','kissme',2,'0898-4503300','iwona.hasse@example.com','',0),('Esteban','Torres','reddog693','geronimo',1,'904-360-351','esteban.torres@example.co','janitor',7.27),('Anneleen','Stouthart','redgoose725','windmill',1,'(653)-833-7058','anneleen.stouthart@exampl','greeter',16.01),('Necati','Kutlay','redlion680','babylove',0,'(137)-069-2544','necati.kutlay@example.com','bartender',8.78),('Elijah','Walker','redmeercat303','mississi',0,'(415)-001-5266','elijah.walker@example.com','janitor',4.77),('Isabela','Pereira','redmouse893','radiohea',2,'(74) 3156-2559','isabela.pereira@example.c','',0),('Danijela','Ten Donkelaar','sadcat302','clancy',0,'(526)-577-5529','danijela.tendonkelaar@exa','waiter',17.18),('Tommy','Garcia','sadfish299','twat',1,'02-7818-8724','tommy.garcia@example.com','cook',13.1),('Simon','Pedersen','sadleopard507','salope',2,'89741734','simon.pedersen@example.co','',0),('Minea','Peltola','sadmouse944','nipper',0,'09-326-248','minea.peltola@example.com','greeter',14.83),('Isaiah','Nichols','sadostrich182','doggy1',1,'016973 00900','isaiah.nichols@example.co','waiter',4.74),('Carolijn','Juffermans','sadsnake239','enterme',1,'(471)-688-4294','carolijn.juffermans@examp','janitor',19.29),('Louis','Bjerknes','sadswan160','cobalt',0,'62130892','louis.bjerknes@example.co','bartender',20.97),('ایلیا','کامروا','sadswan288','hottie',2,'018-73928031','yly.khmrw@example.com','',0),('Jack','Daniels','sadswan289','77777',2,'051-061-4376','jack.daniels@example.com','',0),('Ayşe','Erez','sadswan427','trixie',1,'(069)-163-7634','ayse.erez@example.com','janitor',15.93),('Oskari','Wuollet','sadzebra301','gabber',1,'07-715-189','oskari.wuollet@example.co','bartender',15.26),('Charlie','Thomas','silverbutterfly869','fred',1,'021-370-9820','charlie.thomas@example.co','janitor',15.91),('Benjamin','Madsen','silverlion216','1a2b3c',1,'79235504','benjamin.madsen@example.c','cook',8.08),('Deniz','Kaya','silverpeacock483','trial',0,'(416)-774-8382','deniz.kaya@example.com','janitor',18.95),('Giulia','Adam','silversnake862','easy',1,'04-52-62-63-70','giulia.adam@example.com','bartender',17.13),('Emanuel','Freitas','smallbear610','nancy',2,'(58) 8392-0949','emanuel.freitas@example.c','',0),('Jose','Holt','smallfrog356','chacha',0,'017687 33568','jose.holt@example.com','waiter',15.74),('Maddison','Green','smallfrog532','1945',2,'(069)-834-6585','maddison.green@example.co','',0),('Florence','Singh','smallfrog986','jennie',0,'526-802-4073','florence.singh@example.co','cook',18.74),('Anna','Santana','smallgoose496','thongs',0,'957-568-591','anna.santana@example.com','cook',10.65),('Lidia','Romero','smallleopard126','virtual',2,'914-039-230','lidia.romero@example.com','',0),('Diana','Meyer','smalllion840','oooo',2,'041-966-0482','diana.meyer@example.com','',0),('Lucy','Chen','ticklishelephant745','jeep',1,'(519)-993-0918','lucy.chen@example.com','janitor',20.58),('Pasquale','Borgers','ticklishlion707','redeye',2,'(540)-573-0479','pasquale.borgers@example.','',0),('Kim','Stewart','ticklishlion748','spoons',0,'041-423-6989','kim.stewart@example.com','cook',5.07),('Sharon','Washington','ticklishmouse678','oyster',0,'016977 3411','sharon.washington@example','greeter',5.68),('Karl-Otto','Olschewski','ticklishpeacock921','katherine',0,'0179-1492728','karl-otto.olschewski@exam','bartender',1.84),('Hélèna','Bourgeois','ticklishswan953','billie',0,'01-76-75-87-67','helena.bourgeois@example.','janitor',24.03),('Oskari','Haapala','ticklishtiger443','deng',1,'08-219-500','oskari.haapala@example.co','cook',6),('Lucas','Calvo','ticklishzebra223','thecure',0,'989-826-917','lucas.calvo@example.com','janitor',20.28),('Marinalda','Porto','tinyelephant309','bestbuy',0,'(45) 3968-1994','marinalda.porto@example.c','janitor',13.93),('علیرضا','یاسمی','tinyfrog677','magic32',1,'057-31847227','aalyrd.ysmy@example.com','cook',14.98),('Tanya','Fowler','tinysnake878','252525',2,'04-2706-6200','tanya.fowler@example.com','',0),('Cristina','Saez','tinywolf341','maria1',0,'906-080-249','cristina.saez@example.com','janitor',6.73),('سوگند','مرادی','tinyzebra897','clovis',2,'033-29140745','swgnd.mrdy@example.com','',0),('Elise','Vatland','whitebear966','hollow',2,'50762789','elise.vatland@example.com','',0),('Thomas','Shelton','whitebird661','telephon',0,'0161 710 6274','thomas.shelton@example.co','greeter',9.74),('Celso','Gomes','whitedog632','314159',1,'(93) 5914-2544','celso.gomes@example.com','greeter',18.99),('Karen','Webb','whitedog745','willy',0,'061-419-8194','karen.webb@example.com','waiter',22.98),('Mille','Johansen','whiteelephant158','mark',0,'11241015','mille.johansen@example.co','bartender',1.45),('Olivia','Wilson','whitefish811','636363',2,'(918)-345-6634','olivia.wilson@example.com','',0),('Jenny','King','whitegoose627','silvia',0,'011-429-9826','jenny.king@example.com','greeter',20.09),('James','Green','whitelion915','people',1,'(403)-955-8859','james.green@example.com','bartender',18.4),('Miriam','Ferrer','whiteswan363','corolla',0,'998-155-458','miriam.ferrer@example.com','waiter',21.9),('Alissia','Boekhorst','yellowduck810','quincy',2,'(598)-505-1854','alissia.boekhorst@example','',0),('Friedrich','Rey','yellowpanda460','trout',0,'075 612 72 37','friedrich.rey@example.com','cook',15.8),('Molly','Gonzales','yellowpeacock835','budweise',1,'015396 55911','molly.gonzales@example.co','waiter',8.55);
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

-- Dump completed on 2021-11-11 14:09:27
