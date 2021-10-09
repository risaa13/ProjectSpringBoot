-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2021 at 10:34 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `guest_id` int(11) NOT NULL,
  `guest_login` varchar(32) COLLATE utf8_bin NOT NULL,
  `guest_password` varchar(32) COLLATE utf8_bin NOT NULL,
  `guest_confirm` varchar(32) COLLATE utf8_bin NOT NULL,
  `guest_role` enum('ROLE_ADMIN','ROLE_GUEST') COLLATE utf8_bin NOT NULL DEFAULT 'ROLE_GUEST',
  `guest_firstname` varchar(60) COLLATE utf8_bin NOT NULL,
  `guest_lastname` varchar(60) COLLATE utf8_bin NOT NULL,
  `guest_version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `guests`
--

INSERT INTO `guests` (`guest_id`, `guest_login`, `guest_password`, `guest_confirm`, `guest_role`, `guest_firstname`, `guest_lastname`, `guest_version`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '21232f297a57a5a743894a0e4a801fc3', 'ROLE_ADMIN', 'Administrator', 'Hotel', 5),
(2, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'ee11cbb19052e40b07aac0ca060c23ee', 'ROLE_GUEST', 'Alex', 'Colt', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `hotel_id` int(11) NOT NULL,
  `hotel_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `hotel_address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `hotel_city` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `hotel_zip` int(6) DEFAULT NULL,
  `hotel_state` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `hotel_version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hotel''s Fullnames and Locations';

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`hotel_id`, `hotel_name`, `hotel_address`, `hotel_city`, `hotel_zip`, `hotel_state`, `hotel_version`) VALUES
(1, 'Hotel Grand Resort (*5)', 'Jl. Rajawali, No. 115', 'Palembang', 30113, 'Indonesia', 6);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `guest_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `reservation_from` date NOT NULL,
  `reservation_to` date NOT NULL,
  `reservation_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `reservation_version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`reservation_id`, `guest_id`, `room_id`, `reservation_from`, `reservation_to`, `reservation_cancelled`, `reservation_version`) VALUES
(25, 1, 1, '2016-05-31', '2016-06-03', 1, 1),
(26, 2, 2, '2016-05-31', '2016-06-03', 1, 1),
(35, 2, 1, '2021-10-08', '2021-10-27', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `room_number` varchar(4) COLLATE utf8_bin NOT NULL,
  `room_type` enum('StandardRoom','SpecialRoom','ExclusiveRoom') COLLATE utf8_bin NOT NULL DEFAULT 'StandardRoom',
  `room_direction` enum('NORTH','SOUTH','WEST','EAST') COLLATE utf8_bin NOT NULL DEFAULT 'NORTH',
  `room_version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hotel Rooms (number, type and window direction)';

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `hotel_id`, `room_number`, `room_type`, `room_direction`, `room_version`) VALUES
(1, 1, '101', 'StandardRoom', 'NORTH', 0),
(2, 1, '102', 'SpecialRoom', 'SOUTH', 0),
(3, 1, '103', 'ExclusiveRoom', 'WEST', 0),
(4, 1, '104', 'ExclusiveRoom', 'EAST', 0),
(5, 1, '105', 'StandardRoom', 'SOUTH', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`guest_id`),
  ADD UNIQUE KEY `guest_login` (`guest_login`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotel_id`),
  ADD UNIQUE KEY `hotel_name` (`hotel_name`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD UNIQUE KEY `guest_id` (`guest_id`,`room_id`,`reservation_from`,`reservation_to`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD UNIQUE KEY `hotel_id` (`hotel_id`,`room_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `guest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
