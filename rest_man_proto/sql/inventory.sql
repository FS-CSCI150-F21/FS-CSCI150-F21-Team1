-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2021 at 01:11 AM
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
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `name` varchar(100) NOT NULL,
  `currentQuantity` int(5) NOT NULL,
  `requiredQuantity` int(5) NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`name`, `currentQuantity`, `requiredQuantity`, `lastupdate`) VALUES
('baking powder', 12, 13, '2021-11-23 16:33:06'),
('beef', 51, 72, '2021-11-18 23:08:13'),
('buttermilk powder', 1, 6, '2021-11-18 23:08:13'),
('flour', 43, 89, '2021-11-18 23:08:13'),
('baking soda', 73, 75, '2021-11-18 23:08:13'),
('sugar', 33, 50, '2021-11-18 23:08:13'),
('pepper', 1, 5, '2021-11-18 23:08:13'),
('lime', 3, 7, '2021-11-18 23:08:13'),
('salt', 21, 88, '2021-11-18 23:08:13'),
('coke', 32, 77, '2021-11-18 23:08:13'),
('lemon', 13, 19, '2021-11-18 23:08:13'),
('pepsi', 27, 59, '2021-11-18 23:08:13'),
('fanta', 64, 93, '2021-11-18 23:08:13'),
('ginger', 20, 94, '2021-11-18 23:08:13'),
('water bottle', 18, 24, '2021-11-18 23:08:13'),
('orange juice', 14, 21, '2021-11-18 23:08:13'),
('chicken', 51, 89, '2021-11-18 23:08:13'),
('turkey', 6, 20, '2021-11-18 23:08:13'),
('a', 1, 2, '2021-11-18 23:08:30');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
