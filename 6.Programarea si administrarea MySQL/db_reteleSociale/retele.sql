-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 12, 2021 at 03:13 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `retele`
--
CREATE DATABASE IF NOT EXISTS `retele` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `retele`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `delete_user_by_id`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user_by_id` (`userID` INT)  BEGIN
DELETE FROM users WHERE utilizator_id=userID;
END$$

DROP PROCEDURE IF EXISTS `insert_user`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user` (`id` INT, `prenume` VARCHAR(45), `nume` VARCHAR(45), `locul_nasterii` VARCHAR(45), `nume_utilizator` VARCHAR(45))  BEGIN
INSERT INTO users (utilizator_id, prenume, nume, locul_nasterii, nume_de_utilizator) VALUES (id, prenume, nume, locul_nasterii, nume_utilizator);
END$$

DROP PROCEDURE IF EXISTS `update_user`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user` (`id` INT, `prenume` VARCHAR(45), `nume` VARCHAR(45), `locul_nasterii` VARCHAR(45), `nume_utilizator` VARCHAR(45))  BEGIN
UPDATE users SET utilizator_id=id, prenume=prenume, nume=nume, locul_nasterii=locul_nasterii, nume_de_utilizator=nume_utilizator WHERE utilizator_id=id;
END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `nr_friends`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `nr_friends` (`id` INT) RETURNS INT(11) BEGIN
SET @nr_prieteni = 0;
SELECT count(id_prietenie) FROM prietenii WHERE id_utilizator_2=id INTO @nr_prieteni;
RETURN @nr_prieteni;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prietenii`
--

DROP TABLE IF EXISTS `prietenii`;
CREATE TABLE IF NOT EXISTS `prietenii` (
  `id_prietenie` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_utilizator_1` int(10) UNSIGNED NOT NULL,
  `id_utilizator_2` int(10) UNSIGNED NOT NULL,
  `data_prietenie` datetime NOT NULL,
  `stare_prietenie` enum('In_asteptare','acceptat','respins') NOT NULL,
  PRIMARY KEY (`id_prietenie`),
  KEY `id_utilizator_1` (`id_utilizator_1`),
  KEY `id_utilizator_2` (`id_utilizator_2`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prietenii`
--

INSERT INTO `prietenii` (`id_prietenie`, `id_utilizator_1`, `id_utilizator_2`, `data_prietenie`, `stare_prietenie`) VALUES
(1, 1, 1, '0000-00-00 00:00:00', 'In_asteptare'),
(2, 2, 2, '0000-00-00 00:00:00', 'In_asteptare'),
(3, 2, 2, '0000-00-00 00:00:00', 'In_asteptare'),
(4, 1, 1, '0000-00-00 00:00:00', 'In_asteptare'),
(5, 1, 1, '0000-00-00 00:00:00', 'In_asteptare');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id_status` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `titlu` varchar(45) NOT NULL,
  `continut` text NOT NULL,
  `data_publicarii` datetime NOT NULL,
  `utilizator_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_status`),
  KEY `utilizator_id` (`utilizator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `utilizator_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `prenume` varchar(45) NOT NULL,
  `nume` varchar(45) NOT NULL,
  `data_nasterii` date NOT NULL,
  `locul_nasterii` varchar(45) NOT NULL,
  `e-mail` varchar(45) DEFAULT NULL,
  `nume_de_utilizator` varchar(45) NOT NULL,
  `cv` mediumtext,
  `fotografie` blob,
  PRIMARY KEY (`utilizator_id`),
  UNIQUE KEY `nume_de_utilizator` (`nume_de_utilizator`),
  KEY `idx_nume_prenume` (`nume`,`prenume`),
  KEY `idx_nume_de_utilizator` (`nume_de_utilizator`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`utilizator_id`, `prenume`, `nume`, `data_nasterii`, `locul_nasterii`, `e-mail`, `nume_de_utilizator`, `cv`, `fotografie`) VALUES
(1, 'Vasile', 'Ion', '1999-04-07', 'Bucuresti', 'Vasile@ion.com', 'VasileIon', NULL, NULL),
(2, 'Maria', 'Cristina', '1995-04-09', 'Constanta', 'maria@cristina.com', 'MariaCristina', NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `utilizator_view`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `utilizator_view`;
CREATE TABLE IF NOT EXISTS `utilizator_view` (
`nume` varchar(45)
,`prenume` varchar(45)
,`data_nasterii` date
,`locul_nasterii` varchar(45)
);

-- --------------------------------------------------------

--
-- Structure for view `utilizator_view`
--
DROP TABLE IF EXISTS `utilizator_view`;

DROP VIEW IF EXISTS `utilizator_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `utilizator_view`  AS  select `users`.`nume` AS `nume`,`users`.`prenume` AS `prenume`,`users`.`data_nasterii` AS `data_nasterii`,`users`.`locul_nasterii` AS `locul_nasterii` from `users` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `status`
--
ALTER TABLE `status` ADD FULLTEXT KEY `idx_continut` (`continut`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prietenii`
--
ALTER TABLE `prietenii`
  ADD CONSTRAINT `prietenii_ibfk_1` FOREIGN KEY (`id_utilizator_1`) REFERENCES `users` (`utilizator_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prietenii_ibfk_2` FOREIGN KEY (`id_utilizator_2`) REFERENCES `users` (`utilizator_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `status_ibfk_1` FOREIGN KEY (`utilizator_id`) REFERENCES `users` (`utilizator_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
