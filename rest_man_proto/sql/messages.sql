-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2021 at 11:38 PM
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
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `mes` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`name`, `email`, `subject`, `mes`, `time`) VALUES
('test', 'test', 'setset', 'setset', '2021-11-26 07:40:50'),
('gfhj', 'fghj', 'fghj', 'sdfhfghj sdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghj', '2021-11-26 07:40:50'),
('gfhjsdfhfghj', 'fghjsdfhfghj', 'fghjsdfhfghj', 'sdfhfghj sdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghjsdfhfghj', '2021-11-26 07:40:50'),
('dfgjghj', 'fghjfghj', 'fghj', 'fghjfghjfghjfghgj', '2021-11-26 07:41:25'),
('gfhjgf', 'fghj', 'fghj', 'lkjsdhfg kjhdfgh kljdhfkg klhg kk k dfkghkl dfhgi kjdfghk dhgidh iduhfglk jhdfg hlidfghiud iighl kdhgk dgerht ikdjf hkfdhg ie', '2021-11-26 08:09:53'),
('kjdsahfgsdhgdsfhgkjl', 'jjsldkfjghdsifgu', 'kljdshfglisdu', 'ldkuhfglkdjsuhflk gglkdfg kjdhfgk kdlk jkgljsd klgj jkdfhlk jhdskljfgksh djkfgkl hdsklfjgl dlkjfsghkl hdklfjg kldfhlk hkjdfgh dljk ldkuhfglkdjsuhflk gglkdfg kjdhfgk kdlk jkgljsd klgj jkdfhlk jhdskljfgksh djkfgkl hdsklfjgl dlkjfsghkl hdklfjg kldfhlk hkjdfgh dljkldkuhfglkdjsuhflk gglkdfg kjdhfgk kdlk jkgljsd klgj jkdfhlk jhdskljfgksh djkfgkl hdsklfjgl dlkjfsghkl hdklfjg kldfhlk hkjdfgh dljkldkuhfglkdjsuhflk gglkdfg kjdhfgk kdlk jkgljsd klgj jkdfhlk jhdskljfgksh djkfgkl hdsklfjgl dlkjfsghkl hdklfjg kldfhlk hkjdfgh dljkldkuhfglkdjsuhflk gglkdfg kjdhfgk kdlk jkgljsd klgj jkdfhlk jhdskljfgksh djkfgkl hdsklfjgl dlkjfsghkl hdklfjg kldfhlk hkjdfgh dljkldkuhfglkdjsuhflk gglkdfg kjdhfgk kdlk jkgljsd klgj jkdfhlk jhdskljfgksh djkfgkl hdsklfjgl dlkjfsghkl hdklfjg kldfhlk hkjdfgh dljkldkuhfglkdjsuhflk gglkdfg kjdhfgk kdlk jkgljsd klgj jkdfhlk jhdskljfgksh djkfgkl hdsklfjgl dlkjfsghkl hdklfjg kldfhlk hkjdfgh dljkldkuhfglkdjsuhflk gglkdfg kjdhfgk kdlk jkgljsd klgj jkdfhlk jhdskljfgksh djkfgkl hdsklfjgl dlkjfsghkl hdklfjg kldfhlk hkjdfgh dljkldkuhfglkdjsuhflk gglkdfg kjdhfgk kdlk jkgljsd klgj jkdfhlk jhdskljfgksh djkfgkl hdsklfjgl dlkjfsghkl hdklfjg kldfhlk hkjdfgh dljkldkuhfglkdjsuhflk gglkdfg kjdhfgk kdlk jkgljsd klgj jkdfhlk jhdskljfgksh djkfgkl hdsklfjgl dlkjfsghkl hdklfjg kldfhlk hkjdfgh dljk', '2021-11-26 08:10:51');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
