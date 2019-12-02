--mysql -h sql12.freesqldatabase.com -P 3306 -D sql12313982 -u sql12313982 -p

-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2019 at 08:38 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `erp`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` varchar(15) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `name`) VALUES
('1', 'Finance'),
('2', 'HR');

-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

CREATE TABLE `dependent` (
  `NIC` varchar(15) NOT NULL,
  `employee_id` varchar(15) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `relationship` varchar(20) DEFAULT NULL,
  `addr_house_no` varchar(20) DEFAULT NULL,
  `addr_line_1` varchar(20) DEFAULT NULL,
  `addr_line_2` varchar(20) DEFAULT NULL,
  `addr_city` varchar(20) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contact`
--

CREATE TABLE `emergency_contact` (
  `NIC` varchar(15) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `employee_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` varchar(15) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `NIC` varchar(15) DEFAULT NULL,
  `addr_house_no` varchar(20) DEFAULT NULL,
  `addr_line_1` varchar(20) DEFAULT NULL,
  `addr_line_2` varchar(20) DEFAULT NULL,
  `addr_city` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `marital_status` varchar(20) DEFAULT NULL,
  `employment_status` varchar(20) DEFAULT NULL,
  `active_status` tinyint(1) DEFAULT NULL,
  `job_title` varchar(20) DEFAULT NULL,
  `dept_id` varchar(15) DEFAULT NULL,
  `pay_grade` varchar(20) DEFAULT NULL,
  `supervisor_id` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `NIC`, `addr_house_no`, `addr_line_1`, `addr_line_2`, `addr_city`, `dob`, `marital_status`, `employment_status`, `active_status`, `job_title`, `dept_id`, `pay_grade`, `supervisor_id`) VALUES
('1', 'Bu', 'Cha', '972247878V', '555', 'Molpe Rd', 'Katubedda', 'Moratuwa', '1997-02-07', 'unmarried', 'permanent', 1, 'QA Engineer', '1', 'grade 1', '1'),
('2', 'An', 'Jala', '978883365V', '67', 'Temple Rd', 'Dehiwala', NULL, '1997-12-03', 'unmarried', 'permanent', 1, 'QA Engineer', '2', 'grade 2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `employee_contact_no`
--

CREATE TABLE `employee_contact_no` (
  `employee_id` varchar(15) NOT NULL,
  `contact_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_contact_no`
--

INSERT INTO `employee_contact_no` (`employee_id`, `contact_no`) VALUES
('1', '0719715561');

-- --------------------------------------------------------

--
-- Table structure for table `employee_email`
--

CREATE TABLE `employee_email` (
  `employee_id` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_email`
--

INSERT INTO `employee_email` (`employee_id`, `email`) VALUES
('1', 'bucha@abc.com');

-- --------------------------------------------------------

--
-- Table structure for table `employment_status`
--

CREATE TABLE `employment_status` (
  `employment_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employment_status`
--

INSERT INTO `employment_status` (`employment_status`) VALUES
('permanent');

-- --------------------------------------------------------

--
-- Table structure for table `job_title`
--

CREATE TABLE `job_title` (
  `job_title` varchar(20) NOT NULL,
  `access_level` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_title`
--

INSERT INTO `job_title` (`job_title`, `access_level`) VALUES
('QA Engineer', '1');

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--

CREATE TABLE `leave` (
  `employee_id` varchar(15) NOT NULL,
  `date` date DEFAULT NULL,
  `leave_type` varchar(20) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leave_type`
--

CREATE TABLE `leave_type` (
  `leave_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave_type`
--

INSERT INTO `leave_type` (`leave_type`) VALUES
('annual'),
('casual');

-- --------------------------------------------------------

--
-- Table structure for table `organization_info`
--

CREATE TABLE `organization_info` (
  `Key` varchar(20) NOT NULL,
  `Value` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization_info`
--

INSERT INTO `organization_info` (`Key`, `Value`) VALUES
('Email', 'company@company.com'),
('Name', 'Jupiter'),
('Reg. No.', '0123xxx');

-- --------------------------------------------------------

--
-- Table structure for table `pay_grade`
--

CREATE TABLE `pay_grade` (
  `pay_grade` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pay_grade`
--

INSERT INTO `pay_grade` (`pay_grade`) VALUES
('grade 1'),
('grade 2');

-- --------------------------------------------------------

--
-- Table structure for table `pay_grade_leave`
--

CREATE TABLE `pay_grade_leave` (
  `pay_grade` varchar(20) NOT NULL,
  `leave_type` varchar(20) NOT NULL,
  `limit` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pay_grade_leave`
--

INSERT INTO `pay_grade_leave` (`pay_grade`, `leave_type`, `limit`) VALUES
('grade 1', 'annual', 40),
('grade 2', 'annual', 50);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `employee_id` varchar(15) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`employee_id`, `username`, `password`) VALUES
('1', 'username', 'password');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `dependent`
--
ALTER TABLE `dependent`
  ADD PRIMARY KEY (`NIC`,`employee_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD PRIMARY KEY (`NIC`,`employee_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `job_title` (`job_title`),
  ADD KEY `employment_status` (`employment_status`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `pay_grade` (`pay_grade`),
  ADD KEY `supervisor_id` (`supervisor_id`);

--
-- Indexes for table `employee_contact_no`
--
ALTER TABLE `employee_contact_no`
  ADD PRIMARY KEY (`employee_id`,`contact_no`);

--
-- Indexes for table `employee_email`
--
ALTER TABLE `employee_email`
  ADD PRIMARY KEY (`employee_id`,`email`);

--
-- Indexes for table `employment_status`
--
ALTER TABLE `employment_status`
  ADD PRIMARY KEY (`employment_status`);

--
-- Indexes for table `job_title`
--
ALTER TABLE `job_title`
  ADD PRIMARY KEY (`job_title`);

--
-- Indexes for table `leave`
--
ALTER TABLE `leave`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `leave_type` (`leave_type`);

--
-- Indexes for table `leave_type`
--
ALTER TABLE `leave_type`
  ADD PRIMARY KEY (`leave_type`);

--
-- Indexes for table `organization_info`
--
ALTER TABLE `organization_info`
  ADD PRIMARY KEY (`Key`);

--
-- Indexes for table `pay_grade`
--
ALTER TABLE `pay_grade`
  ADD PRIMARY KEY (`pay_grade`);

--
-- Indexes for table `pay_grade_leave`
--
ALTER TABLE `pay_grade_leave`
  ADD PRIMARY KEY (`pay_grade`,`leave_type`),
  ADD KEY `leave_type` (`leave_type`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD CONSTRAINT `emergency_contact_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`job_title`) REFERENCES `job_title` (`job_title`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`employment_status`) REFERENCES `employment_status` (`employment_status`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`),
  ADD CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`pay_grade`) REFERENCES `pay_grade` (`pay_grade`),
  ADD CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`supervisor_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `employee_contact_no`
--
ALTER TABLE `employee_contact_no`
  ADD CONSTRAINT `employee_contact_no_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `employee_email`
--
ALTER TABLE `employee_email`
  ADD CONSTRAINT `employee_email_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `leave`
--
ALTER TABLE `leave`
  ADD CONSTRAINT `leave_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `leave_ibfk_2` FOREIGN KEY (`leave_type`) REFERENCES `leave_type` (`leave_type`);

--
-- Constraints for table `pay_grade_leave`
--
ALTER TABLE `pay_grade_leave`
  ADD CONSTRAINT `pay_grade_leave_ibfk_1` FOREIGN KEY (`pay_grade`) REFERENCES `pay_grade` (`pay_grade`),
  ADD CONSTRAINT `pay_grade_leave_ibfk_2` FOREIGN KEY (`leave_type`) REFERENCES `leave_type` (`leave_type`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;