-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2021 at 07:17 PM
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
-- Table structure for table `employee_test`
--

CREATE TABLE `employee_test` (
  `id` int(6) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `people_count`
--

CREATE TABLE `people_count` (
  `num_people_inside` int(11) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp(),
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `people_count`
--

INSERT INTO `people_count` (`num_people_inside`, `date_time`, `id`) VALUES
(1, '2021-10-26 10:12:45', 1),
(2, '2021-10-26 10:12:45', 2),
(3, '2021-10-26 10:12:46', 3),
(2, '2021-10-26 10:12:49', 4),
(3, '2021-10-26 10:12:51', 5),
(2, '2021-10-26 10:12:52', 6),
(3, '2021-10-26 10:12:53', 7),
(1, '2021-10-26 10:16:38', 8),
(2, '2021-10-26 10:16:38', 9),
(1, '2021-10-26 10:16:41', 10),
(2, '2021-10-26 10:16:42', 11),
(3, '2021-10-26 10:16:42', 12),
(4, '2021-10-26 10:16:45', 13);

-- --------------------------------------------------------

--
-- Table structure for table `user_test`
--

CREATE TABLE `user_test` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_test`
--

INSERT INTO `user_test` (`username`, `password`) VALUES
('fgh', 'ghjfghj'),
('fghfdghdfg', 'ghjjjjjjj'),
('fghj', 'hjkghj'),
('ghghjkk', 'hjkghj'),
('ghjghjghj', 'yyyyy'),
('iksdhf', 'sdkljfh'),
('jjjjjjjjj', 'jhgjghjghj'),
('kjhdfgkjsd', 'kdjsfhgksjdfg'),
('sddfgsdf', 'fghfgdhdfgh'),
('sdfs', 'dfgdfg'),
('test', 'asdasd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `people_count`
--
ALTER TABLE `people_count`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_test`
--
ALTER TABLE `user_test`
  ADD PRIMARY KEY (`username`,`password`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `people_count`
--
ALTER TABLE `people_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
