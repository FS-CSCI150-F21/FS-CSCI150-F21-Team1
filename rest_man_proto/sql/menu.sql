-- Need to turn off "Enable foreign key checks" on import because tables
-- are imported in the wrong order.


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
  PRIMARY KEY (`id`),
  KEY `fk_menuItems_1_idx` (`category`),
  KEY `fk_menuItems_2_idx` (`subcategory`),
  CONSTRAINT `fk_menuItems_1` FOREIGN KEY (`category`) REFERENCES `menuCategories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_menuItems_2` FOREIGN KEY (`subcategory`) REFERENCES `menuSubcategories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuItems`
--

LOCK TABLES `menuItems` WRITE;
/*!40000 ALTER TABLE `menuItems` DISABLE KEYS */;
INSERT INTO `menuItems` VALUES ('Smashing Pumpkin',0,1,'All Spice and Black Pepper Infused Real McCoy 5yr, Pumpkin Puree, Coconut Cream, Almond Milk, Nutmeg, OJ, Pineapple Juice,',10.00,0,0,0),('From Mexico with Love',1,1,'Vida Mezcal, Fiorente Elderflower, Lillet, Lime Shrub, Lemon Juice, Lime JuiceThis is a very unique cocktail with unique flavors. It is not for everyone!',13.00,0,0,0),('Fizzy Ginger Man',2,1,'Ginger Infused Gin, Triple Sec, Grapefruit Juice, Sparkling Wine',10.00,0,0,0),('Fall in Boulevardier',3,1,'Tin Cup Rye, Campari, Lazzaroni Maraschino, Cinnamon Infused Sweet Vermouth',12.00,0,0,0),('Caipirinha',4,1,'Cachaca, Lime, Simple, Sugar in the Raw',10.00,0,0,0),('Noah\'s Margarita',5,1,'Exotico Silver Tequila, Triple Sec, Fresh Citrus Juices, on the Rocks',10.00,0,0,0),('Magnificent Manhattan',6,1,'Sazerac Rye, Carpano Antica, Bitters',15.00,0,0,0),('House Made Sangria',7,1,'Red or White, Your Call...Made to Order',11.00,0,0,0),('IPA',8,1,'lorem ipsum',15.00,0,0,1),('Pale Lager',9,1,'lorem ipsum',12.00,0,0,1),('Wheat',10,1,'lorem ipsum',13.00,0,0,1),('Seasonal',11,1,'lorem ipsum',14.00,0,0,1),('Bud Light',12,1,'',4.00,0,0,2),('Cider Boys',13,1,'First Press Cider 16oz. [Gluten Free]',8.00,0,0,2),('Buckler',14,1,'Non-alcoholic',4.00,0,0,2),('Guinness Draft',15,1,'',6.00,0,0,2),('IPA of the Moment',16,1,'Seasonal, local, or hard to find.  Ask your server.',5.00,0,0,2),('Pinot Noir',17,1,'Angeline Reserve, Sonoma Coast',10.00,0,0,3),('Pinot Noir',18,1,'Straight Shooter Willamette Valley, Oregon',15.00,0,0,3),('Merlot',19,1,'Olelo, Paso Robles',10.00,0,0,3),('Garnacha',20,1,'Las Rocas, Calatayud, Spain',9.00,0,0,3),('Bordeaux Blend',21,1,'Vieux Chateau Brun, Pomerol, France',13.00,0,0,3),('Cabernet Sauvignon',22,1,'Montes, Colchagua Valley, Chile',8.00,0,0,3),('Prosecco',23,1,'La Marca, DOC, Italy',9.00,0,0,4),('Champagne',24,1,'Veuve Clicquot, Yellow Label, France',15.00,0,0,4),('Sauvignon Blanc',25,1,'Saint Clair, Marlborough, New Zealand',9.00,0,0,4),('Rose',26,1,'Famille Perrin, Cotes du Rhone, Reseve, France',8.00,0,0,4),('Dessert Wine',27,1,'Chateau Laribotte, Sauternes, France',11.00,0,0,4),('Vodka',28,1,'Absolut',8.00,0,0,5),('Gin',29,1,'Bombay',8.00,0,0,5),('Gin',30,1,'Tanqueray',9.00,0,0,5),('Rum',31,1,'Bacardi',8.00,0,0,5),('Tequila',32,1,'Patron Reposado',12.00,0,0,5),('Brandy',33,1,'Hennessy VS',9.00,0,0,5),('Whiskey',34,1,'Canadian Club',8.00,0,0,5),('Bourbon',35,1,'1792',11.00,0,0,5),('Coca Cola',36,1,'Coke, Sprite, Diet Coke, Fanta',3.00,0,0,6),('Nestea',37,1,'Lemon, Peach',4.00,0,0,6),('Coffee',38,1,'Espresso, Cappuccino, Latte Macchiato, Black',8.00,0,0,6),('Tea',39,1,'Milk, Lemon',3.00,0,0,6),('Sushi Rice and Tuna',40,1,'',9.00,0,1,7),('Hoisin Beef Swiss Roll with Baby Leek',41,1,'',11.00,0,1,7),('Mini Prawn Tacos',42,1,'',13.00,0,1,7),('Smoked Salmon Tartare Blini with Lime Mayo',43,1,'',9.00,0,1,7),('Smoke Duck with Enoki Mushroom and Thai Asparagus, Sweet Onion',44,1,'',6.00,0,1,7),('Goat’s Cheese Mousse and Fig Tart',45,1,'',8.00,0,1,7),('Beef Croquette with Paprika Sauce',46,1,'',13.00,0,1,7),('Brie Tomato Tart with Red Onion Marmalade',47,1,'',9.00,0,1,7),('Tofu Balls with Peanut Sauce',48,1,'',8.00,0,1,7),('Braised Ox Cheeks with Mini Yorkshire Pudding and Horseradish Mash',49,1,'',12.00,0,1,7),('Angels on Horseback',50,1,'Oysters wrapped in bacon, served hot.',19.00,0,1,8),('Bruschetta',51,1,'Grilled bread rubbed with garlic, and topped with olive oil, salt, pepper, and tomato.',15.00,0,1,8),('Buffalo Wings',52,1,'Deep-fried and unbreaded chicken wingettes coated in vinegar-based cayenne pepper, hot sauce, and butter.',13.00,0,1,8),('Caviar',53,1,'Wild Sturgeon Roe of Caspian and Black Seas.',33.00,0,1,8),('Mozzarella Sticks',54,1,'Elongated pieces of battered mozzarella.',8.00,0,1,8),('Nachos',55,1,'Tortilla chips covered in shredded cheese, salsa, and guacamole.',13.00,0,1,8),('Potato Skins',56,1,'Covered with bacon, cheddar cheese, green onions, and sour cream.',11.00,0,1,8),('Shrimp Cocktail',57,1,'Shelled prawns in mayonnaise and tomato dressing, served in a glass.',15.00,0,1,8),('Crudité Platter',58,1,'Fried asparagus and zucchini, baby arthichokes, kalamata olives, halved radishes, snap peas, cherry tomatoes, sliced cucumber, and carrot sticks with avocado ranch dressing or hummus on the side.',19.00,0,1,8),('Togarashi Chips with Toasted Sesame Onion Dip',59,1,'Flash fried Idaho potatoes, dusted with salt and chili-centric Japanese togarashi spice mix.  Paired with mayo-based dip made with slow roasted Spanish onion, toasted sesame oil, crispy garlic, and Canadian steak seasoning.',17.00,0,1,9),('Clarified Butter Fried Chips and Caviar',60,1,'Yukon gold potato chips fried in clarified butter served with whipped créme frâiche deced out with chives – plus Ossetra caviar.',18.00,0,1,9),('Deviled Crab Dip with Old Bay Chips',61,1,'Crab, cream cheese, aged white cheddar, yellow cheddar, and cayenne covered in breadcrumbs.  Old Bay spiced potato chips with pickled vegetables: chilies, onions, okra, cauliflower, and zucchini.',23.00,0,1,9),('Vegan Lentil with Ancient Grains Soup',62,1,'',13.00,0,2,10),('Piranha Pale Ale Chili',63,1,'Our original recipe, filled with beef, onions & signature blend of spices. Topped with shredded cheese & tortilla strips.',12.00,0,2,10),('Chicken Tortilla Soup',64,1,'',14.00,0,2,10),('Tuscan Tomato Bisque',65,1,'',8.00,0,2,10),('Broccoli Cheddar Soup',66,1,'',19.00,0,2,10),('Clam Chowder',67,1,'',23.00,0,2,10),('House Wedge Salad',68,1,'',7.00,0,2,11),('Southwest Chicken Caesar Salad',69,1,'Grilled chicken, tomatoes, queso fresco, tortilla strips with Caesar dressing.',15.00,0,2,11),('Fresh Mozzarella and Tomato Salad',70,1,'',17.00,0,2,11),('Caribbean Salad with Seared Shrimp',71,1,'Pineapple, mandarin oranges, dried cranberries, red bell peppers, green onions, cilantro, with honey-lime dressing.',18.00,0,2,11),('Santa Fe Chicken Salad',72,1,'Spicy grilled chicken, pico, avocado, cilantro, tortilla strips, house-made ranch & a drizzle of spicy Santa Fe sauce.',15.00,0,2,11),('Roadside Sliders',73,1,'Two bite-sized burgers on mini-buns. Served with fries or fresh fruit.',7.00,0,3,12),('Mini Corn Dogs',74,1,'Three all beef mini hot dogs.  Served with fries or fresh fruit.',7.00,0,3,12),('Flatbread Pizzas',75,1,'Cheese or Pepperoni',7.00,0,3,12),('Pasta',76,1,'Served with bowtie pasta.  Choose from butter and parmesan, marinara sauce, or Alfredo sauce.',7.00,0,3,12),('Spaghetti with Meatball',77,1,'The reliable classic.  Enough said.',7.00,0,3,12),('Macaroni and Cheese',78,1,'The original mac and cheese every kid loves.',7.00,0,3,12),('Fried Chicken Strips',79,1,'Served with fries or fresh fruit.',7.00,0,3,12),('Quessadilla',80,1,'Grilled flour tortilla filled with melted cheese.  Available with chicken.',7.00,0,3,12),('Cheesy Pizza',81,1,'6” four-cheese pizza',7.00,0,3,12),('Margherita',82,1,'Mozzarella, tomato sauce, basil',16.00,0,4,13),('Pepperoni',83,1,'Mozzarella, tomato sauce, oregano',18.00,0,4,13),('Mixed Mushroom',84,1,'Mozzarella, fontina, truffled cheese, thyme',18.00,0,4,13),('Smoke Prosciutto',85,1,'Mozzarella, fontina, goat cheese, caramelized onion',19.00,0,4,13),('Diavola',86,1,'Spicy tomato sauce, mozzarella, soppressata, sausage, bacon, roasted red pepper',20.00,0,4,13),('Carbonara',87,1,'Mozzarella, fontina, bacon, onions, baked egg, parmigiano',20.00,0,4,13),('Butternut Squash Agnolotti',88,1,'Crispy sage, aged balsamic, amaretti cookie',23.00,0,4,14),('Bucatini',89,1,'Spicy tomato sauce, pancetta, red onion, pecorino',23.00,0,4,14),('Mezzi Rigatoni',90,1,'Sausage ragu',24.00,0,4,14),('Tagliatelle',91,1,'Ribbon noodles, lamb ragu',24.00,0,4,14),('Fusilli',92,1,'Roasted chicken, pancetta, mushrooms, marsala, herbs',24.00,0,4,14),('Tagliolini',93,1,'Thin ribbon noodles, spicy tomato sauce, shrimp, crab, arugula',28.00,0,4,14),('Chicken Cacciatore',94,1,'Chicken breast sauteed with onions, mushrooms, and green peppers, served in a red sauce.',29.00,0,4,15),('Chicken Piccata',95,1,'Chicken breast in lemon butter sauce with mushrooms, fresh garlic and pimento',29.00,0,4,15),('Chicken Marsala',96,1,'Chicken breast sauteed with mushrooms, onions, carrots and celery, served in a brown sauce.',29.00,0,4,15),('Chicken Parmigiana',97,1,'Breaded chicken breast smothered with mozzarella cheese',28.00,0,4,15),('Chicken Cordon Blue',98,1,'Baked breaded chicken stuffed with ham and cheese, served with a mushroom cream sauce.',29.00,0,4,15),('Veal Cordon Blue',99,1,'Baked breaded veal stuffed with ham and cheese served with a mushroom cream sauce',30.00,0,4,16),('Veal Parmigiana',100,1,'Breaded veal smothered with mozzarella cheese',30.00,0,4,16),('Veal Piccata',101,1,'Served in a lemon butter sauce with mushrooms and garlic',30.00,0,4,16),('Veal Scallopini',102,1,'Veal sauteed with mushrooms and onions in a red sauce',30.00,0,4,16),('Veal Shoemaker',103,1,'Served in a lemon sauce with mushrooms, green olives, and capers.',30.00,0,4,16),('Veal Marsala',104,1,'Veal sauteed with mushrooms and onions, served in a brown sauce',30.00,0,4,16),('Sorrento',105,1,'Shrimp, calamari, clams, green olives, and capers with red sauce',27.00,0,4,14),('Baby Back Pork Ribs',106,1,'A full rack of slow-roasted overnight baby back ribs.  Choice of two sides.',28.00,0,4,17),('Mandarin Orange-Glazed Pork Chop',107,1,'Slow-roasted, double bone-in pork chop with mandarin orange glaze or bacon onion jam.',22.00,0,4,17),('Double Bone-In Pork Chop',108,1,'Slow-roasted, double bone-in pork chop.',21.00,0,4,17),('Big Shrimp',109,1,'Sauteed in a lemon butter sauce with  mostacciolli, aglio, and a touch of feta cheese.',29.00,0,4,18),('Atlantic Salmon',110,1,'Baked in light lemon butter sauce, served with mostacciollo primavera',27.00,0,4,18),('New Orleans Jambalaya',111,1,'Blackened chicken breasts sauteed shrimp, sausage, bell peppers, onions, tomatoes, cajun-spiced broth, and rice-pilaf.',22.00,0,4,18),('Enlightened Pacific Poke Soba Noodles',112,1,'Sashimi-grade ahi tuna, buckwheat soba noodles, poke sauce, carrots, pickled vegetables, soy ginger sauce, wasabi guacamole, crispy wonton strips, green onions, and sesame seeds.',18.00,0,4,18),('Blonde Fish ‘N’ Chips',113,1,'Lightly fried cod fillets, Blonde beer batter, fries, and housemade tartar sauce.',19.00,0,4,18),('Enlightened Cherry Chipotle Glazed Salmon',114,1,'Oven-roasted Atlantic salmon, sweet and savory cherry Chipotle glaze, roasted asparagus, fire-roasted red pepper, and tomato and spinach couscous.',19.00,0,4,18),('Bacon Jam Rib-Eye',115,1,'Juicy, well-marbled 14 oz rib-eye.',29.00,0,4,19),('Prime Rib',116,1,'15 oz prime rib slow-roasted over four hours, au jus, and creamy horseradish.',30.00,0,4,19),('Slow-Roasted Tri-tip',117,1,'8 oz slow-roasted sirloin tri-tip glazed with peppered BBQ sauce.',21.00,0,4,19),('Classic Rib-Eye',118,1,'Juicy, well-marbled 14 oz rib-eye.',28.00,0,4,19),('Tiramisu Cheesecake',119,1,'Mascarpone, cream cheese, chocolate, and ladyfinger crust.',9.00,0,5,21),('Italian Cheesecake',120,1,'With riccota cheese, lemon zest & Graham cracker crust.',9.00,0,5,21),('Tiramisu',121,1,'Mascarpone cheese, brandy & espresso layered with ladyfinger and dusted with chocolate',8.00,0,5,21),('Molten Chocolate Cake',122,1,'With a melted chocolate center.  Served with choice of ice cream.',13.00,0,5,21),('Red Velvet Cake',123,1,'A southern classic with cream cheese frosting',12.00,0,5,21),('“The Best” Carrot Cake',124,1,'Citrus cream cheese icing',8.00,0,5,21),('Deep Dark Fudge Cake',125,1,'Fudgy chocolate frosting',11.00,0,5,21),('Pineapple Upside-Down Cake',126,1,'Warm pineapple upside-down cake, on a bed of kahlúa cream sauce.  Topped with ice cream, whipped cream, and toasted coconut.',13.00,0,5,21),('Key Lime Pie',127,1,'Baked Fresh with a graham-pecan crust.  Topped with fresh whipped cream.',17.00,0,5,22),('Blueberry Pie',128,1,'',15.00,0,5,22),('Apple Pie',129,1,'',15.00,0,5,22),('Chocolate',130,1,'',15.00,0,5,22),('Chocolate Chip',131,1,'Drop cookie with chocolate chips.',5.00,0,5,23),('Snickerdoodle',132,1,'',5.00,0,5,23),('Peanut Butter',133,1,'',5.00,0,5,23),('Bakeshop Brownie',134,1,'A twist on a classic favorite, this rich fudge brownie holds a hidden surprise.  It’s center is filled with gourmet semisweet chocolate chips.  Topped with a white chocolate glaze.',19.00,0,5,24),('Fudge Walnut',135,1,'Made just like a regular brownie and jam-packed with walnuts.',12.00,0,5,24),('Fudge Iced Brownies',136,1,'Covered in rich, creamy, chocolate icing.',13.00,0,5,24),('Vanilla',137,1,'Classic',8.00,0,5,25),('Chocolate',138,1,'',8.00,0,5,25),('Cookies N’ Cream',139,1,'',8.00,0,5,25),('Buttered Pecan',140,1,'',8.00,0,5,25),('Strawberry',141,1,'',9.00,0,5,25);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-01 19:32:19
