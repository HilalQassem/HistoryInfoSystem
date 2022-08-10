-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2022 at 07:53 PM
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
(2, 'Hilal Qassem', 'hilalqassem', '1653628292');

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
(2, 'Emergency');

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
(2, 'Hilal Qassem', 2, 'hilalqassem', '1653628292');

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
(1, 'Hilal Qassem', 'General', 2, 'hilalqassem', '1653628292', 0, 0);

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

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientId`, `name`, `dateOfBirth`, `number`, `joinDate`, `ssn`) VALUES
(2, 'Hilal Qassem', '2000-01-24', '0938677316', '2020-01-01', '10260007552'),
(3, 'Frank Joel', '1999-01-01', '099999999', '2022-05-15', '10260002145'),
(4, 'HH', '2000-01-01', '55555', '2022-05-16', '555555'),
(5, 'Hilal', '2000-05-05', '54646', '2022-05-16', '5645646'),
(6, 'Frank', '2000-01-01', '645463464', '2022-05-16', '564654564'),
(7, 'Hilal', '2022-06-23', '56298498', '2022-06-23', '10260002144'),
(9, 'Hilal Qasse', '2022-06-23', '55555', '2022-06-23', '566561564'),
(10, 'Frank Joel', '2020-07-06', '65156', '2022-06-23', '1584865121');

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
-- Dumping data for table `visit`
--

INSERT INTO `visit` (`visitId`, `doctorId`, `patientId`, `date`, `reason`, `prescription`, `test`, `notes`) VALUES
(2, 1, 2, '2022-01-01', 'aaaa', 'aaaa', 'aaaa', ''),
(7, 1, 3, '2021-02-02', '-', '-', '-', ''),
(8, 1, 3, '2022-02-02', '--', '--', '--', ''),
(10, 1, 4, '2021-01-01', '------------', '----------', '---------', ''),
(11, 1, 5, '2021-05-06', 'dnsjhfqhji', 'bdsdbjhsd', 'jbdjwh', ''),
(12, 1, 2, '2022-04-22', '------', '-------', '-------', 'dfjdsfnjkfn jfnierfer ijn '),
(13, 1, 2, '2021-02-02', '-------', NULL, NULL, 'ffs'),
(14, 1, 3, '2022-02-02', '+++-----', NULL, NULL, 'efewf'),
(15, 1, 3, '2022-02-02', '+6+6+6+', NULL, NULL, 'fewff'),
(16, 1, 3, '2022-02-02', 'sdsdfdsf', NULL, NULL, 'fsdfs'),
(17, 1, 2, '2022-02-02', 'sdfsfs', NULL, NULL, 'dsffs'),
(18, 1, 3, '2022-02-02', 'dwwe', NULL, NULL, ' dewfef'),
(19, 1, 3, '2022-02-02', 'dewfer', NULL, NULL, 'sdffgdsg'),
(20, 1, 3, '2022-05-04', 'dsfgd', NULL, NULL, 'fgdgfg'),
(21, 1, 3, '2022-06-05', 'fdsfsgds', NULL, NULL, 'sdgfsgsdfg'),
(22, 1, 3, '2022-02-22', 'dfggdfg', NULL, NULL, 'dsgs reg'),
(23, 1, 2, '2022-02-22', 'dsfgrgrd', NULL, NULL, 'dsgddfgdg'),
(24, 1, 3, '2022-02-22', 'dfbhdhb', NULL, NULL, 'dnbjhd'),
(25, 1, 3, '2022-02-22', 'wefwfew', NULL, NULL, 'fdgggdfg'),
(26, 1, 2, '2022-02-02', 'dgdfg', NULL, NULL, 'dsgdgr'),
(27, 1, 3, '2022-02-02', 'dfgfdg', '', '', 'dfgdgfdg'),
(28, 1, 3, '2022-02-02', 'fsdfsdf', NULL, NULL, 'dfgdfg'),
(29, 1, 3, '2022-02-02', 'fdfg', NULL, NULL, 'gdfhd'),
(30, 1, 2, '2022-02-02', 'dfssfsdf', 'c:\\upload\\prescription487493406.pdf', 'c:\\upload\\test422647911.pdf', 'fsdfsd'),
(31, 1, 3, '2022-02-02', 'aasfddfs', 'prescription1009279118.pdf', 'test941093843.pdf', 'sfdff'),
(32, 1, 4, '1985-02-24', 'efsfdgd', 'prescription108193950.pdf', 'test47398321.pdf', 'sdfsdgdrg'),
(33, 1, 2, '2022-02-02', 'dssfg', 'prescription1477837635.pdf', NULL, 'dsfdsf');

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
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `dept_admin`
--
ALTER TABLE `dept_admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `visit`
--
ALTER TABLE `visit`
  MODIFY `visitId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
