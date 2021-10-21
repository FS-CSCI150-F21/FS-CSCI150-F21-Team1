-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2021 at 12:27 AM
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
  `date_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `people_count`
--

INSERT INTO `people_count` (`num_people_inside`, `date_time`) VALUES
(2, '2021-10-20 11:56:45'),
(0, '2021-10-20 11:58:04'),
(0, '2021-10-20 11:58:26'),
(1, '2021-10-20 11:58:27'),
(2, '2021-10-20 11:58:28'),
(3, '2021-10-20 11:58:29'),
(4, '2021-10-20 11:58:30'),
(5, '2021-10-20 11:58:31'),
(6, '2021-10-20 11:58:32'),
(7, '2021-10-20 11:58:33'),
(8, '2021-10-20 11:58:34'),
(9, '2021-10-20 11:58:35'),
(0, '2021-10-21 15:23:58'),
(1, '2021-10-21 15:23:59'),
(2, '2021-10-21 15:24:00'),
(3, '2021-10-21 15:24:01'),
(4, '2021-10-21 15:24:02');

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
-- Indexes for table `user_test`
--
ALTER TABLE `user_test`
  ADD PRIMARY KEY (`username`,`password`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
