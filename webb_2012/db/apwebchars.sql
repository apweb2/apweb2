-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 28, 2018 at 03:52 PM
-- Server version: 10.3.11-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apwebchars`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `name`) VALUES
(2, 'FlowerPhenotype'),
(3, 'FruitPhenotype'),
(1, 'LeafPhenotype'),
(4, 'StemPhenotype'),
(5, 'WholePlantPhenotype');

-- --------------------------------------------------------

--
-- Table structure for table `parse`
--

CREATE TABLE `parse` (
  `id` int(11) NOT NULL,
  `phenotypeID` int(11) NOT NULL,
  `phrase` varchar(200) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parse`
--

INSERT INTO `parse` (`id`, `phenotypeID`, `phrase`) VALUES
(1, 1, 'leaves opposite'),
(2, 2, 'leaves alternate'),
(3, 4, 'with sap'),
(4, 4, 'with exudate'),
(5, 6, 'Tree'),
(6, 7, 'leaves two-ranked'),
(7, 8, 'dioecious'),
(8, 9, 'stipules +'),
(9, 10, 'G inferior');

-- --------------------------------------------------------

--
-- Table structure for table `phenotype`
--

CREATE TABLE `phenotype` (
  `id` int(11) NOT NULL,
  `name` varchar(250) CHARACTER SET latin1 NOT NULL,
  `subclassID` int(11) NOT NULL,
  `desc` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `createdBy` enum('peter','cam') NOT NULL DEFAULT 'peter',
  `entityPO` int(11) DEFAULT NULL COMMENT 'strip leading zeros',
  `qualityPATO` int(11) DEFAULT NULL COMMENT 'strip leading zeros',
  `urlImage` varchar(250) DEFAULT NULL,
  `taxaID` int(11) NOT NULL DEFAULT 2 COMMENT 'Domain of char'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phenotype`
--

INSERT INTO `phenotype` (`id`, `name`, `subclassID`, `desc`, `createdBy`, `entityPO`, `qualityPATO`, `urlImage`, `taxaID`) VALUES
(1, 'LeavesOpposite', 3, NULL, 'cam', 25034, 1933, NULL, 2),
(2, 'LeavesAlternate', 3, NULL, 'cam', 25034, 1932, NULL, 2),
(4, 'ExudatePresent', 4, NULL, 'cam', -1, 467, NULL, 1),
(5, 'ExudateAbsent', 4, NULL, 'cam', -1, 462, NULL, 1),
(6, 'HabitTree', 5, NULL, 'cam', NULL, NULL, NULL, 2),
(7, 'LeavesTwoRanked', 6, NULL, 'cam', NULL, NULL, NULL, 2),
(8, 'Dioecious', 7, 'having the staminate and carpellate reproductive structures on separate plants', 'peter', NULL, NULL, NULL, 2),
(9, 'StipulesPresent', 8, NULL, 'peter', NULL, NULL, NULL, 2),
(10, 'GynoeciumInferior', 9, NULL, 'peter', NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `subclass`
--

CREATE TABLE `subclass` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `classID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subclass`
--

INSERT INTO `subclass` (`id`, `name`, `classID`) VALUES
(3, 'LeafArrangement', 1),
(4, 'ExudatePresence', 4),
(5, 'Habit', 5),
(6, 'Phyllotaxy', 1),
(7, 'Oecy', 5),
(8, 'StipulePresence', 1),
(9, 'GynoeciumPosition', 2);

-- --------------------------------------------------------

--
-- Table structure for table `taxa`
--

CREATE TABLE `taxa` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `taxa`
--

INSERT INTO `taxa` (`id`, `name`) VALUES
(2, 'angiosperms'),
(3, 'euphyllophytes'),
(1, 'seedplants');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class` (`name`);

--
-- Indexes for table `parse`
--
ALTER TABLE `parse`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phrase` (`phrase`),
  ADD KEY `phenotypeID` (`phenotypeID`);

--
-- Indexes for table `phenotype`
--
ALTER TABLE `phenotype`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `entityQualCombo` (`entityPO`,`qualityPATO`),
  ADD UNIQUE KEY `urlImage` (`urlImage`),
  ADD KEY `subClassOf` (`subclassID`),
  ADD KEY `taxaID` (`taxaID`);

--
-- Indexes for table `subclass`
--
ALTER TABLE `subclass`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `class` (`classID`);

--
-- Indexes for table `taxa`
--
ALTER TABLE `taxa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `parse`
--
ALTER TABLE `parse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `phenotype`
--
ALTER TABLE `phenotype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subclass`
--
ALTER TABLE `subclass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `taxa`
--
ALTER TABLE `taxa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `parse`
--
ALTER TABLE `parse`
  ADD CONSTRAINT `parse_ibfk_1` FOREIGN KEY (`phenotypeID`) REFERENCES `phenotype` (`id`);

--
-- Constraints for table `phenotype`
--
ALTER TABLE `phenotype`
  ADD CONSTRAINT `phenotype_ibfk_1` FOREIGN KEY (`subclassID`) REFERENCES `subclass` (`id`),
  ADD CONSTRAINT `phenotype_ibfk_2` FOREIGN KEY (`taxaID`) REFERENCES `taxa` (`id`);

--
-- Constraints for table `subclass`
--
ALTER TABLE `subclass`
  ADD CONSTRAINT `subclass_ibfk_1` FOREIGN KEY (`classID`) REFERENCES `class` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
