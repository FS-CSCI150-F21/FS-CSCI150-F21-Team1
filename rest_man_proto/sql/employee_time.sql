-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2021 at 01:10 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

use rest_info;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rest_info`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee_time`
--

CREATE TABLE `employee_time` (
  `name` varchar(100) NOT NULL,
  `status` varchar(4) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp,
  `date_time` datetime NOT NULL DEFAULT current_timestamp,
  `time_loggedIn` time DEFAULT NULL,
  `time_loggedOut` time DEFAULT NULL,
  `total_hours_worked` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee_time`
--

INSERT INTO `employee_time` (`name`, `status`, `date`, `date_time`, `time_loggedIn`, `time_loggedOut`, `total_hours_worked`) VALUES
('Vi', 'in', '2021-11-23', '2021-11-23 14:58:59', '14:58:59', NULL, NULL),
('Vi', 'out', '2021-11-23', '2021-11-23 14:59:01', '14:58:59', '14:59:01', '00:00:02');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
