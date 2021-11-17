-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2021 at 12:28 AM
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
-- Table structure for table `people_count`
--

CREATE TABLE `people_count` (
  `num_people_inside` int(11) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp(),
  `num_people_in_line` int(11) DEFAULT NULL,
  `wait_time` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `people_count`
--

INSERT INTO `people_count` (`num_people_inside`, `date_time`, `num_people_in_line`, `wait_time`, `id`) VALUES
(1, '2021-11-15 09:01:47', -2, 0, 33),
(2, '2021-11-15 09:01:51', -1, 0, 34),
(1, '2021-11-15 09:01:53', -2, 0, 35),
(2, '2021-11-15 09:01:55', -1, 0, 36),
(3, '2021-11-15 09:02:08', 0, 0, 37),
(4, '2021-11-15 09:02:08', 1, 0, 38),
(1, '2021-11-15 09:09:26', -2, 70, 39),
(2, '2021-11-15 09:09:30', -1, 70, 40),
(3, '2021-11-15 09:09:32', 0, 70, 41),
(4, '2021-11-15 09:09:32', 1, 70, 42),
(5, '2021-11-15 09:09:33', 2, 70, 43),
(6, '2021-11-15 09:09:36', 3, 70, 44);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `people_count`
--
ALTER TABLE `people_count`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `people_count`
--
ALTER TABLE `people_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
