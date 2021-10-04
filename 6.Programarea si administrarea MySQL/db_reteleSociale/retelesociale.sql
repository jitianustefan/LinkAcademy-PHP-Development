-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: mart. 22, 2021 la 09:14 PM
-- Versiune server: 10.4.18-MariaDB
-- Versiune PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `retelesociale`
--
CREATE DATABASE IF NOT EXISTS `retelesociale` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `retelesociale`;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `prieten`
--

DROP TABLE IF EXISTS `prieten`;
CREATE TABLE `prieten` (
  `prieten_id` int(11) NOT NULL,
  `stare_prietenie` enum('in asteptare','acceptat','respins') NOT NULL,
  `utilizator_1_id` int(11) NOT NULL,
  `utilizator_2_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `utilizator_id` int(11) NOT NULL,
  `titlu` varchar(45) NOT NULL,
  `continut` text NOT NULL,
  `data_publicarii` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `utilizator`
--

DROP TABLE IF EXISTS `utilizator`;
CREATE TABLE `utilizator` (
  `utilizator_id` int(11) NOT NULL,
  `nume` varchar(45) NOT NULL,
  `prenume` varchar(45) NOT NULL,
  `data_nasterii` date NOT NULL,
  `locul_nasterii` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `numele_utilizatorului` varchar(45) NOT NULL,
  `cv` mediumtext NOT NULL,
  `fotografie` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `prieten`
--
ALTER TABLE `prieten`
  ADD PRIMARY KEY (`prieten_id`),
  ADD KEY `fk_utilizator_1_id_idx` (`utilizator_1_id`),
  ADD KEY `fk_utilizator_2_id_idx` (`utilizator_2_id`);

--
-- Indexuri pentru tabele `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`),
  ADD KEY `fk_utilizator_id_idx` (`utilizator_id`);

--
-- Indexuri pentru tabele `utilizator`
--
ALTER TABLE `utilizator`
  ADD PRIMARY KEY (`utilizator_id`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `prieten`
--
ALTER TABLE `prieten`
  MODIFY `prieten_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pentru tabele `utilizator`
--
ALTER TABLE `utilizator`
  MODIFY `utilizator_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `prieten`
--
ALTER TABLE `prieten`
  ADD CONSTRAINT `fk_utilizator_1_id` FOREIGN KEY (`utilizator_1_id`) REFERENCES `utilizator` (`utilizator_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_utilizator_2_id` FOREIGN KEY (`utilizator_2_id`) REFERENCES `utilizator` (`utilizator_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constrângeri pentru tabele `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `fk_utilizator_id` FOREIGN KEY (`utilizator_id`) REFERENCES `utilizator` (`utilizator_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
