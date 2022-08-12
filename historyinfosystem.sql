-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2022 at 09:57 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `historyinfosystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `name`, `username`, `password`) VALUES
(1, 'admin', 'admin', '92668751');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentId` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentId`, `name`) VALUES
(1, 'Emergency'),
(2, 'Burn Unit'),
(3, 'Cardiology'),
(4, 'Critical Care'),
(5, 'Diagnostic Imaging');

-- --------------------------------------------------------

--
-- Table structure for table `dept_admin`
--

CREATE TABLE `dept_admin` (
  `adminId` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dept_admin`
--

INSERT INTO `dept_admin` (`adminId`, `name`, `departmentId`, `username`, `password`) VALUES
(1, 'Rolland Jinks', 1, 'rollandjinks', '1611327677'),
(2, 'Minta Eads', 2, 'mintaeads', '1122276074'),
(3, 'Harold Sargent', 3, 'haroldsargent', '-1720200102'),
(4, 'Angelina Morris', 4, 'angelinamorris', '895955975'),
(5, 'Sebastian Daniel', 5, 'sebastiandaniel', '-569567357');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorId` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialty` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isBlocked` tinyint(1) NOT NULL DEFAULT 0,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorId`, `name`, `specialty`, `departmentId`, `username`, `password`, `isBlocked`, `isDeleted`) VALUES
(1, 'Mikayla Akers', 'Disaster Medicine', 1, 'mikaylaakers', '-1230016512', 0, 0),
(2, 'Selby Garfield', 'Medical Toxicology', 1, 'selbygarfield', '907014739', 0, 0),
(3, 'Collin Webb', 'Burn Specialist', 2, 'collinwebb', '-1616551905', 0, 0),
(4, 'Nora Scrivener', 'Burn Specialist', 2, 'norascrivener', '-1087188299', 0, 0),
(7, 'Ulric Osbourne', 'Cardiac Electrophysiology', 3, 'ulricosbourne', '-1830894630', 0, 0),
(8, 'Olive Tracy', 'Echocardiography', 3, 'olivetracy', '690159710', 0, 0),
(9, 'Winona Sniders', 'Cardiovascular', 4, 'winonasniders', '-2085372630', 0, 0),
(10, 'Cyrus Young', 'Respiratory', 4, 'cyrusyoung', '-950473730', 0, 0),
(11, 'Gytha Rowbottom', 'Nuclear Radiology', 5, 'gytharowbottom', '2064950442', 0, 0),
(12, 'Marjory Bellamy', 'Diagnostic Ultrasound', 5, 'marjorybellamy', '-1656600064', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientId` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `number` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joinDate` date DEFAULT NULL,
  `ssn` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE `visit` (
  `visitId` int(11) NOT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `patientId` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reason` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prescription` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentId`);

--
-- Indexes for table `dept_admin`
--
ALTER TABLE `dept_admin`
  ADD PRIMARY KEY (`adminId`),
  ADD UNIQUE KEY `loginId_UNIQUE` (`username`),
  ADD KEY `departmentId_idx` (`departmentId`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorId`),
  ADD UNIQUE KEY `loginId_UNIQUE` (`username`),
  ADD KEY `departmetId_idx` (`departmentId`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientId`),
  ADD UNIQUE KEY `ssn_UNIQUE` (`ssn`);

--
-- Indexes for table `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`visitId`),
  ADD KEY `patientId_idx` (`patientId`),
  ADD KEY `doctorId_idx` (`doctorId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dept_admin`
--
ALTER TABLE `dept_admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visit`
--
ALTER TABLE `visit`
  MODIFY `visitId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dept_admin`
--
ALTER TABLE `dept_admin`
  ADD CONSTRAINT `departmentId` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentId`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `departmetId` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentId`);

--
-- Constraints for table `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `doctorId` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`),
  ADD CONSTRAINT `patientId` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
