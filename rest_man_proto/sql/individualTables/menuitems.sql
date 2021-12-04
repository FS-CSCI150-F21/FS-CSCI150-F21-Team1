-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2021 at 12:17 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rest_info`
--

-- --------------------------------------------------------

--
-- Table structure for table `menuitems`
--

CREATE TABLE `menuitems` (
  `name` varchar(127) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `available` tinyint(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `timesOrdered` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcategory` int(11) DEFAULT NULL,
  `prep_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menuitems`
--

INSERT INTO `menuitems` (`name`, `id`, `available`, `description`, `price`, `timesOrdered`, `category`, `subcategory`, `prep_time`) VALUES
('Smashing Pumpkin', 0, 1, 'All Spice and Black Pepper Infused Real McCoy 5yr, Pumpkin Puree, Coconut Cream, Almond Milk, Nutmeg, OJ, Pineapple Juice,', '10.00', 0, 0, 0, 0),
('From Mexico with Love', 1, 1, 'Vida Mezcal, Fiorente Elderflower, Lillet, Lime Shrub, Lemon Juice, Lime JuiceThis is a very unique cocktail with unique flavors. It is not for everyone!', '13.00', 0, 0, 0, 0),
('Fizzy Ginger Man', 2, 1, 'Ginger Infused Gin, Triple Sec, Grapefruit Juice, Sparkling Wine', '10.00', 0, 0, 0, 0),
('Fall in Boulevardier', 3, 1, 'Tin Cup Rye, Campari, Lazzaroni Maraschino, Cinnamon Infused Sweet Vermouth', '12.00', 0, 0, 0, 0),
('Caipirinha', 4, 1, 'Cachaca, Lime, Simple, Sugar in the Raw', '10.00', 0, 0, 0, 0),
('Noah\'s Margarita', 5, 1, 'Exotico Silver Tequila, Triple Sec, Fresh Citrus Juices, on the Rocks', '10.00', 0, 0, 0, 0),
('Magnificent Manhattan', 6, 1, 'Sazerac Rye, Carpano Antica, Bitters', '15.00', 0, 0, 0, 0),
('House Made Sangria', 7, 1, 'Red or White, Your Call...Made to Order', '11.00', 0, 0, 0, 0),
('IPA', 8, 1, 'lorem ipsum', '15.00', 0, 0, 1, 0),
('Pale Lager', 9, 1, 'lorem ipsum', '12.00', 0, 0, 1, 0),
('Wheat', 10, 1, 'lorem ipsum', '13.00', 0, 0, 1, 0),
('Seasonal', 11, 1, 'lorem ipsum', '14.00', 0, 0, 1, 0),
('Bud Light', 12, 1, '', '4.00', 0, 0, 2, 0),
('Cider Boys', 13, 1, 'First Press Cider 16oz. [Gluten Free]', '8.00', 0, 0, 2, 0),
('Buckler', 14, 1, 'Non-alcoholic', '4.00', 0, 0, 2, 0),
('Guinness Draft', 15, 1, '', '6.00', 0, 0, 2, 0),
('IPA of the Moment', 16, 1, 'Seasonal, local, or hard to find.  Ask your server.', '5.00', 0, 0, 2, 0),
('Pinot Noir', 17, 1, 'Angeline Reserve, Sonoma Coast', '10.00', 0, 0, 3, 0),
('Pinot Noir', 18, 1, 'Straight Shooter Willamette Valley, Oregon', '15.00', 0, 0, 3, 0),
('Merlot', 19, 1, 'Olelo, Paso Robles', '10.00', 0, 0, 3, 0),
('Garnacha', 20, 1, 'Las Rocas, Calatayud, Spain', '9.00', 0, 0, 3, 0),
('Bordeaux Blend', 21, 1, 'Vieux Chateau Brun, Pomerol, France', '13.00', 0, 0, 3, 0),
('Cabernet Sauvignon', 22, 1, 'Montes, Colchagua Valley, Chile', '8.00', 0, 0, 3, 0),
('Prosecco', 23, 1, 'La Marca, DOC, Italy', '9.00', 0, 0, 4, 0),
('Champagne', 24, 1, 'Veuve Clicquot, Yellow Label, France', '15.00', 0, 0, 4, 0),
('Sauvignon Blanc', 25, 1, 'Saint Clair, Marlborough, New Zealand', '9.00', 0, 0, 4, 0),
('Rose', 26, 1, 'Famille Perrin, Cotes du Rhone, Reseve, France', '8.00', 0, 0, 4, 0),
('Dessert Wine', 27, 1, 'Chateau Laribotte, Sauternes, France', '11.00', 0, 0, 4, 0),
('Vodka', 28, 1, 'Absolut', '8.00', 0, 0, 5, 0),
('Gin', 29, 1, 'Bombay', '8.00', 0, 0, 5, 0),
('Gin', 30, 1, 'Tanqueray', '9.00', 0, 0, 5, 0),
('Rum', 31, 1, 'Bacardi', '8.00', 0, 0, 5, 0),
('Tequila', 32, 1, 'Patron Reposado', '12.00', 0, 0, 5, 0),
('Brandy', 33, 1, 'Hennessy VS', '9.00', 0, 0, 5, 0),
('Whiskey', 34, 1, 'Canadian Club', '8.00', 0, 0, 5, 0),
('Bourbon', 35, 1, '1792', '11.00', 0, 0, 5, 0),
('Coca Cola', 36, 1, 'Coke, Sprite, Diet Coke, Fanta', '3.00', 0, 0, 6, 0),
('Nestea', 37, 1, 'Lemon, Peach', '4.00', 0, 0, 6, 0),
('Coffee', 38, 1, 'Espresso, Cappuccino, Latte Macchiato, Black', '8.00', 0, 0, 6, 0),
('Tea', 39, 1, 'Milk, Lemon', '3.00', 0, 0, 6, 0),
('Sushi Rice and Tuna', 40, 1, '', '9.00', 0, 1, 7, 0),
('Hoisin Beef Swiss Roll with Baby Leek', 41, 1, '', '11.00', 0, 1, 7, 0),
('Mini Prawn Tacos', 42, 1, '', '13.00', 0, 1, 7, 0),
('Smoked Salmon Tartare Blini with Lime Mayo', 43, 1, '', '9.00', 0, 1, 7, 0),
('Smoke Duck with Enoki Mushroom and Thai Asparagus, Sweet Onion', 44, 1, '', '6.00', 0, 1, 7, 0),
('Goat’s Cheese Mousse and Fig Tart', 45, 1, '', '8.00', 0, 1, 7, 0),
('Beef Croquette with Paprika Sauce', 46, 1, '', '13.00', 0, 1, 7, 0),
('Brie Tomato Tart with Red Onion Marmalade', 47, 1, '', '9.00', 0, 1, 7, 0),
('Tofu Balls with Peanut Sauce', 48, 1, '', '8.00', 0, 1, 7, 0),
('Braised Ox Cheeks with Mini Yorkshire Pudding and Horseradish Mash', 49, 1, '', '12.00', 0, 1, 7, 0),
('Angels on Horseback', 50, 1, 'Oysters wrapped in bacon, served hot.', '19.00', 0, 1, 8, 0),
('Bruschetta', 51, 1, 'Grilled bread rubbed with garlic, and topped with olive oil, salt, pepper, and tomato.', '15.00', 0, 1, 8, 0),
('Buffalo Wings', 52, 1, 'Deep-fried and unbreaded chicken wingettes coated in vinegar-based cayenne pepper, hot sauce, and butter.', '13.00', 0, 1, 8, 0),
('Caviar', 53, 1, 'Wild Sturgeon Roe of Caspian and Black Seas.', '33.00', 0, 1, 8, 0),
('Mozzarella Sticks', 54, 1, 'Elongated pieces of battered mozzarella.', '8.00', 0, 1, 8, 0),
('Nachos', 55, 1, 'Tortilla chips covered in shredded cheese, salsa, and guacamole.', '13.00', 0, 1, 8, 0),
('Potato Skins', 56, 1, 'Covered with bacon, cheddar cheese, green onions, and sour cream.', '11.00', 0, 1, 8, 0),
('Shrimp Cocktail', 57, 1, 'Shelled prawns in mayonnaise and tomato dressing, served in a glass.', '15.00', 0, 1, 8, 0),
('Crudité Platter', 58, 1, 'Fried asparagus and zucchini, baby arthichokes, kalamata olives, halved radishes, snap peas, cherry tomatoes, sliced cucumber, and carrot sticks with avocado ranch dressing or hummus on the side.', '19.00', 0, 1, 8, 0),
('Togarashi Chips with Toasted Sesame Onion Dip', 59, 1, 'Flash fried Idaho potatoes, dusted with salt and chili-centric Japanese togarashi spice mix.  Paired with mayo-based dip made with slow roasted Spanish onion, toasted sesame oil, crispy garlic, and Canadian steak seasoning.', '17.00', 0, 1, 9, 0),
('Clarified Butter Fried Chips and Caviar', 60, 1, 'Yukon gold potato chips fried in clarified butter served with whipped créme frâiche deced out with chives – plus Ossetra caviar.', '18.00', 0, 1, 9, 0),
('Deviled Crab Dip with Old Bay Chips', 61, 1, 'Crab, cream cheese, aged white cheddar, yellow cheddar, and cayenne covered in breadcrumbs.  Old Bay spiced potato chips with pickled vegetables: chilies, onions, okra, cauliflower, and zucchini.', '23.00', 0, 1, 9, 0),
('Vegan Lentil with Ancient Grains Soup', 62, 1, '', '13.00', 0, 2, 10, 0),
('Piranha Pale Ale Chili', 63, 1, 'Our original recipe, filled with beef, onions & signature blend of spices. Topped with shredded cheese & tortilla strips.', '12.00', 0, 2, 10, 0),
('Chicken Tortilla Soup', 64, 1, '', '14.00', 0, 2, 10, 0),
('Tuscan Tomato Bisque', 65, 1, '', '8.00', 0, 2, 10, 0),
('Broccoli Cheddar Soup', 66, 1, '', '19.00', 0, 2, 10, 0),
('Clam Chowder', 67, 1, '', '23.00', 0, 2, 10, 0),
('House Wedge Salad', 68, 1, '', '7.00', 0, 2, 11, 0),
('Southwest Chicken Caesar Salad', 69, 1, 'Grilled chicken, tomatoes, queso fresco, tortilla strips with Caesar dressing.', '15.00', 0, 2, 11, 0),
('Fresh Mozzarella and Tomato Salad', 70, 1, '', '17.00', 0, 2, 11, 0),
('Caribbean Salad with Seared Shrimp', 71, 1, 'Pineapple, mandarin oranges, dried cranberries, red bell peppers, green onions, cilantro, with honey-lime dressing.', '18.00', 0, 2, 11, 0),
('Santa Fe Chicken Salad', 72, 1, 'Spicy grilled chicken, pico, avocado, cilantro, tortilla strips, house-made ranch & a drizzle of spicy Santa Fe sauce.', '15.00', 0, 2, 11, 0),
('Roadside Sliders', 73, 1, 'Two bite-sized burgers on mini-buns. Served with fries or fresh fruit.', '7.00', 0, 3, 12, 0),
('Mini Corn Dogs', 74, 1, 'Three all beef mini hot dogs.  Served with fries or fresh fruit.', '7.00', 0, 3, 12, 0),
('Flatbread Pizzas', 75, 1, 'Cheese or Pepperoni', '7.00', 0, 3, 12, 0),
('Pasta', 76, 1, 'Served with bowtie pasta.  Choose from butter and parmesan, marinara sauce, or Alfredo sauce.', '7.00', 0, 3, 12, 0),
('Spaghetti with Meatball', 77, 1, 'The reliable classic.  Enough said.', '7.00', 0, 3, 12, 0),
('Macaroni and Cheese', 78, 1, 'The original mac and cheese every kid loves.', '7.00', 0, 3, 12, 0),
('Fried Chicken Strips', 79, 1, 'Served with fries or fresh fruit.', '7.00', 0, 3, 12, 0),
('Quessadilla', 80, 1, 'Grilled flour tortilla filled with melted cheese.  Available with chicken.', '7.00', 0, 3, 12, 0),
('Cheesy Pizza', 81, 1, '6” four-cheese pizza', '7.00', 0, 3, 12, 0),
('Margherita', 82, 1, 'Mozzarella, tomato sauce, basil', '16.00', 0, 4, 13, 0),
('Pepperoni', 83, 1, 'Mozzarella, tomato sauce, oregano', '18.00', 0, 4, 13, 0),
('Mixed Mushroom', 84, 1, 'Mozzarella, fontina, truffled cheese, thyme', '18.00', 0, 4, 13, 0),
('Smoke Prosciutto', 85, 1, 'Mozzarella, fontina, goat cheese, caramelized onion', '19.00', 0, 4, 13, 0),
('Diavola', 86, 1, 'Spicy tomato sauce, mozzarella, soppressata, sausage, bacon, roasted red pepper', '20.00', 0, 4, 13, 0),
('Carbonara', 87, 1, 'Mozzarella, fontina, bacon, onions, baked egg, parmigiano', '20.00', 0, 4, 13, 0),
('Butternut Squash Agnolotti', 88, 1, 'Crispy sage, aged balsamic, amaretti cookie', '23.00', 0, 4, 14, 0),
('Bucatini', 89, 1, 'Spicy tomato sauce, pancetta, red onion, pecorino', '23.00', 0, 4, 14, 0),
('Mezzi Rigatoni', 90, 1, 'Sausage ragu', '24.00', 0, 4, 14, 0),
('Tagliatelle', 91, 1, 'Ribbon noodles, lamb ragu', '24.00', 0, 4, 14, 0),
('Fusilli', 92, 1, 'Roasted chicken, pancetta, mushrooms, marsala, herbs', '24.00', 0, 4, 14, 0),
('Tagliolini', 93, 1, 'Thin ribbon noodles, spicy tomato sauce, shrimp, crab, arugula', '28.00', 0, 4, 14, 0),
('Chicken Cacciatore', 94, 1, 'Chicken breast sauteed with onions, mushrooms, and green peppers, served in a red sauce.', '29.00', 0, 4, 15, 0),
('Chicken Piccata', 95, 1, 'Chicken breast in lemon butter sauce with mushrooms, fresh garlic and pimento', '29.00', 0, 4, 15, 0),
('Chicken Marsala', 96, 1, 'Chicken breast sauteed with mushrooms, onions, carrots and celery, served in a brown sauce.', '29.00', 0, 4, 15, 0),
('Chicken Parmigiana', 97, 1, 'Breaded chicken breast smothered with mozzarella cheese', '28.00', 0, 4, 15, 0),
('Chicken Cordon Blue', 98, 1, 'Baked breaded chicken stuffed with ham and cheese, served with a mushroom cream sauce.', '29.00', 0, 4, 15, 0),
('Veal Cordon Blue', 99, 1, 'Baked breaded veal stuffed with ham and cheese served with a mushroom cream sauce', '30.00', 0, 4, 16, 0),
('Veal Parmigiana', 100, 1, 'Breaded veal smothered with mozzarella cheese', '30.00', 0, 4, 16, 0),
('Veal Piccata', 101, 1, 'Served in a lemon butter sauce with mushrooms and garlic', '30.00', 0, 4, 16, 0),
('Veal Scallopini', 102, 1, 'Veal sauteed with mushrooms and onions in a red sauce', '30.00', 0, 4, 16, 0),
('Veal Shoemaker', 103, 1, 'Served in a lemon sauce with mushrooms, green olives, and capers.', '30.00', 0, 4, 16, 0),
('Veal Marsala', 104, 1, 'Veal sauteed with mushrooms and onions, served in a brown sauce', '30.00', 0, 4, 16, 0),
('Sorrento', 105, 1, 'Shrimp, calamari, clams, green olives, and capers with red sauce', '27.00', 0, 4, 14, 0),
('Baby Back Pork Ribs', 106, 1, 'A full rack of slow-roasted overnight baby back ribs.  Choice of two sides.', '28.00', 0, 4, 17, 0),
('Mandarin Orange-Glazed Pork Chop', 107, 1, 'Slow-roasted, double bone-in pork chop with mandarin orange glaze or bacon onion jam.', '22.00', 0, 4, 17, 0),
('Double Bone-In Pork Chop', 108, 1, 'Slow-roasted, double bone-in pork chop.', '21.00', 0, 4, 17, 0),
('Big Shrimp', 109, 1, 'Sauteed in a lemon butter sauce with  mostacciolli, aglio, and a touch of feta cheese.', '29.00', 0, 4, 18, 0),
('Atlantic Salmon', 110, 1, 'Baked in light lemon butter sauce, served with mostacciollo primavera', '27.00', 0, 4, 18, 0),
('New Orleans Jambalaya', 111, 1, 'Blackened chicken breasts sauteed shrimp, sausage, bell peppers, onions, tomatoes, cajun-spiced broth, and rice-pilaf.', '22.00', 0, 4, 18, 0),
('Enlightened Pacific Poke Soba Noodles', 112, 1, 'Sashimi-grade ahi tuna, buckwheat soba noodles, poke sauce, carrots, pickled vegetables, soy ginger sauce, wasabi guacamole, crispy wonton strips, green onions, and sesame seeds.', '18.00', 0, 4, 18, 0),
('Blonde Fish ‘N’ Chips', 113, 1, 'Lightly fried cod fillets, Blonde beer batter, fries, and housemade tartar sauce.', '19.00', 0, 4, 18, 0),
('Enlightened Cherry Chipotle Glazed Salmon', 114, 1, 'Oven-roasted Atlantic salmon, sweet and savory cherry Chipotle glaze, roasted asparagus, fire-roasted red pepper, and tomato and spinach couscous.', '19.00', 0, 4, 18, 0),
('Bacon Jam Rib-Eye', 115, 1, 'Juicy, well-marbled 14 oz rib-eye.', '29.00', 0, 4, 19, 0),
('Prime Rib', 116, 1, '15 oz prime rib slow-roasted over four hours, au jus, and creamy horseradish.', '30.00', 0, 4, 19, 0),
('Slow-Roasted Tri-tip', 117, 1, '8 oz slow-roasted sirloin tri-tip glazed with peppered BBQ sauce.', '21.00', 0, 4, 19, 0),
('Classic Rib-Eye', 118, 1, 'Juicy, well-marbled 14 oz rib-eye.', '28.00', 0, 4, 19, 0),
('Tiramisu Cheesecake', 119, 1, 'Mascarpone, cream cheese, chocolate, and ladyfinger crust.', '9.00', 0, 5, 21, 0),
('Italian Cheesecake', 120, 1, 'With riccota cheese, lemon zest & Graham cracker crust.', '9.00', 0, 5, 21, 0),
('Tiramisu', 121, 1, 'Mascarpone cheese, brandy & espresso layered with ladyfinger and dusted with chocolate', '8.00', 0, 5, 21, 0),
('Molten Chocolate Cake', 122, 1, 'With a melted chocolate center.  Served with choice of ice cream.', '13.00', 0, 5, 21, 0),
('Red Velvet Cake', 123, 1, 'A southern classic with cream cheese frosting', '12.00', 0, 5, 21, 0),
('“The Best” Carrot Cake', 124, 1, 'Citrus cream cheese icing', '8.00', 0, 5, 21, 0),
('Deep Dark Fudge Cake', 125, 1, 'Fudgy chocolate frosting', '11.00', 0, 5, 21, 0),
('Pineapple Upside-Down Cake', 126, 1, 'Warm pineapple upside-down cake, on a bed of kahlúa cream sauce.  Topped with ice cream, whipped cream, and toasted coconut.', '13.00', 0, 5, 21, 0),
('Key Lime Pie', 127, 1, 'Baked Fresh with a graham-pecan crust.  Topped with fresh whipped cream.', '17.00', 0, 5, 22, 0),
('Blueberry Pie', 128, 1, '', '15.00', 0, 5, 22, 0),
('Apple Pie', 129, 1, '', '15.00', 0, 5, 22, 0),
('Chocolate', 130, 1, '', '15.00', 0, 5, 22, 0),
('Chocolate Chip', 131, 1, 'Drop cookie with chocolate chips.', '5.00', 0, 5, 23, 0),
('Snickerdoodle', 132, 1, '', '5.00', 0, 5, 23, 0),
('Peanut Butter', 133, 1, '', '5.00', 0, 5, 23, 0),
('Bakeshop Brownie', 134, 1, 'A twist on a classic favorite, this rich fudge brownie holds a hidden surprise.  It’s center is filled with gourmet semisweet chocolate chips.  Topped with a white chocolate glaze.', '19.00', 0, 5, 24, 0),
('Fudge Walnut', 135, 1, 'Made just like a regular brownie and jam-packed with walnuts.', '12.00', 0, 5, 24, 0),
('Fudge Iced Brownies', 136, 1, 'Covered in rich, creamy, chocolate icing.', '13.00', 0, 5, 24, 0),
('Vanilla', 137, 1, 'Classic', '8.00', 0, 5, 25, 0),
('Chocolate', 138, 1, '', '8.00', 0, 5, 25, 0),
('Cookies N’ Cream', 139, 1, '', '8.00', 0, 5, 25, 0),
('Buttered Pecan', 140, 1, '', '8.00', 0, 5, 25, 0),
('Strawberry', 141, 1, '', '9.00', 0, 5, 25, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menuitems`
--
ALTER TABLE `menuitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_menuItems_1_idx` (`category`),
  ADD KEY `fk_menuItems_2_idx` (`subcategory`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menuitems`
--
ALTER TABLE `menuitems`
  ADD CONSTRAINT `fk_menuItems_1` FOREIGN KEY (`category`) REFERENCES `menucategories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_menuItems_2` FOREIGN KEY (`subcategory`) REFERENCES `menusubcategories` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
