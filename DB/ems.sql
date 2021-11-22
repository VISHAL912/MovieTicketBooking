-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2021 at 05:17 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ems`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchmovie` (IN `movie` VARCHAR(1000))  NO SQL
SELECT * from movies where Movie_Name like CONCAT('%', movie, '%')$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('prathamesh', '123'),
('vishal', '6161');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theatre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seats` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie_time` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(200) NOT NULL,
  `thetre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `username`, `movie`, `theatre`, `seats`, `date`, `movie_time`, `location`, `amount`, `thetre_id`) VALUES
(11, 'bprathamesh41', 'Sui Dhaaga', 'INOX', 'B1', '21-11-2021', '20:00', 'Pimpri', 250, 1),
(12, 'bprathamesh41', 'Pataakha', 'INOX', 'B2 C2', '21-11-2021', '13:00', 'Pimpri', 600, 1),
(13, 'vishal', 'Sui Dhaaga', 'INOX', 'D3', '21-11-2021', '10:00', 'Pimpri', 150, 1),
(14, 'vishal', 'Pataakha', 'INOX', 'E8', '21-11-2021', '13:00', 'Pimpri', 300, 1);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `Movie_id` int(100) UNSIGNED NOT NULL,
  `Movie_Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Release_date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RunTime` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Genre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`Movie_id`, `Movie_Name`, `Release_date`, `poster`, `RunTime`, `Genre`) VALUES
(1, 'Dhadak', '2018-07-20', 'Double_hashing.png', '2 hr 20 min', 'Drama'),
(2, 'MI- Fallout (2018)', '2018-08-10', 'mi.jpeg', '2 hr 20 min', 'Action'),
(3, 'Stree', '2018-08-31', 'stree.jpeg', '2 hr 20 min', 'Comedy'),
(4, 'Gold', '2018-08-15', 'gold.jpeg', '2 hr 15 min', 'Drama'),
(5, 'Sui Dhaaga', '2018-10-05', 'sui.jpeg', '2 hr 15 min', 'Drama'),
(6, 'Pataakha', '2018-09-28', 'patakha.jfif', '2 hr 20 min', 'Comedy'),
(7, 'Badhaai Ho', '2018-10-19', 'badhai.jpeg', '2 hr 20 min', 'Comedy'),
(8, 'Venom', '2018-10-05', 'venom.jpeg', '2 hr 10 min', 'Horror/Thriller'),
(9, 'Boyz 2', '2018-10-05', 'boyz2.jpeg', '2 hr 35 min', 'Comedy'),
(10, 'U.R.I', '2019-01-11', 'uri.jpeg', '2 hr 20 min', 'Thriller'),
(11, 'Andhadhun', '2018-10-05', 'andholan.jpeg', '2 hr 18 min', 'Horror/Thriller');

-- --------------------------------------------------------

--
-- Table structure for table `theatres`
--

CREATE TABLE `theatres` (
  `Theatre_id` int(11) UNSIGNED NOT NULL,
  `Theatre_Name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Location` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Movie_Name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time1` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time2` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `theatres`
--

INSERT INTO `theatres` (`Theatre_id`, `Theatre_Name`, `Location`, `Movie_Name`, `time1`, `time2`) VALUES
(1, 'INOX', 'Pimpri', 'Sui Dhaaga', '10:00', '20:00'),
(2, 'Citypride', 'pimpri', 'Boyz 2', '13:00', '10:00'),
(3, 'E-Square', 'Shivajinagar', 'Venom', '22:00', '7:00'),
(4, 'E-Square', 'Shivajinagar', 'U.R.I', '17:00', '9:00'),
(5, 'INOX', 'Pimpri', 'Andhadhun', '21:00', '17:00'),
(6, 'INOX', 'pimpri', 'Pataakha', '13:00', '23:00'),
(7, 'E-Square', 'Shivajinagar', 'Badhaai Ho', '13:00', '10:00'),
(8, 'Citypride', 'Kothrud', 'Gold', '17:00', '23:00'),
(9, 'Citypride', 'Kothrud', 'Stree', '20:00', '12:00'),
(10, 'INOX', 'Kothrud', 'MI- Fallout (2018)', '19:00', '23:00'),
(11, 'E-Square', 'Kothrud', 'Dhadak', '17:00', '8:00');

-- --------------------------------------------------------

--
-- Table structure for table `timings`
--

CREATE TABLE `timings` (
  `id` int(200) UNSIGNED NOT NULL,
  `showtime` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Theatre_Name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_rate_Gold` int(50) NOT NULL,
  `ticket_rate_Silver` int(50) NOT NULL,
  `seats` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timings`
--

INSERT INTO `timings` (`id`, `showtime`, `Theatre_Name`, `ticket_rate_Gold`, `ticket_rate_Silver`, `seats`) VALUES
(10, '17:00', 'E-Square', 250, 200, 120),
(11, '10:00', 'INOX', 150, 100, 119),
(12, '20:00', 'INOX', 250, 220, 119),
(13, '22:00', 'E-Square', 200, 180, 120),
(14, '21:00', 'INOX', 200, 180, 120),
(15, '17:00', 'INOX', 250, 220, 120),
(16, '13:00', 'INOX', 300, 280, 117),
(17, '13:00', 'Citypride', 250, 220, 120),
(18, '20:00', 'Citypride', 250, 200, 120),
(19, '17:00', 'Citypride', 250, 210, 120),
(20, '23:00', 'INOX', 250, 220, 120),
(21, '13:00', 'E-Square', 250, 180, 120);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `email`, `password`) VALUES
('bprathamesh41', 'bprathamesh41@gmail.com', '$2y$10$htW.XFVnxVPxk8.1EvxHpe7p07/YC.XFejooiLxylYDpAr67Dcj.2'),
('vishal', 'vishal@gmail.com', '$2y$10$wx4wz/M4iP/Ot5Fz6fPx0ur6gvUgH6SNu7lSHLOLg9VIz9K9MBKa6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `movie` (`movie`),
  ADD KEY `theatre` (`theatre`),
  ADD KEY `thetre_id` (`thetre_id`),
  ADD KEY `thetre_id_2` (`thetre_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`Movie_id`),
  ADD KEY `Movie_Name` (`Movie_Name`);

--
-- Indexes for table `theatres`
--
ALTER TABLE `theatres`
  ADD PRIMARY KEY (`Theatre_id`),
  ADD KEY `Theatre_Name` (`Theatre_Name`),
  ADD KEY `Location` (`Location`),
  ADD KEY `Movie_Name` (`Movie_Name`);

--
-- Indexes for table `timings`
--
ALTER TABLE `timings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Theatre_Name` (`Theatre_Name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `Movie_id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `theatres`
--
ALTER TABLE `theatres`
  MODIFY `Theatre_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `timings`
--
ALTER TABLE `timings`
  MODIFY `id` int(200) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`theatre`) REFERENCES `theatres` (`Theatre_Name`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`movie`) REFERENCES `movies` (`Movie_Name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `timings`
--
ALTER TABLE `timings`
  ADD CONSTRAINT `timings_ibfk_1` FOREIGN KEY (`Theatre_Name`) REFERENCES `theatres` (`Theatre_Name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
