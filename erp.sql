-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2019 at 04:08 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+05:30";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `erp`
--
CREATE DATABASE IF NOT EXISTS `erp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `erp`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `department_leave`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `department_leave` (IN `dept` VARCHAR(20), IN `start_date` DATE, IN `end_date` DATE)  BEGIN
	SELECT employee.employee_id,employee.first_name,employee.last_name,employee.job_title,`date`,`leave_type`,`reason`,`state`,`dept_name` 
    
    FROM `leave`,`employee` 
	WHERE `date` BETWEEN start_date and end_date
	and `dept_name` = dept
	order by `date`;
end$$

DROP PROCEDURE IF EXISTS `employee_leave_taken`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_leave_taken` (IN `emp_id` VARCHAR(15))  BEGIN

SELECT leave_type,`limit`,leaves_taken from (SELECT employee_id, leave_type, `limit` FROM employee NATURAL JOIN pay_grade_leave WHERE employee_id=emp_id) as s NATURAL LEFT JOIN (SELECT employee_id, leave_type, COUNT(*) as leaves_taken FROM `leave` WHERE state="approved" AND (date BETWEEN DATE(CONCAT(YEAR(CURRENT_DATE()),"-01-01"))  AND CURRENT_DATE) GROUP BY employee_id, leave_type) as t;

END$$

DROP PROCEDURE IF EXISTS `my_leave_types`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `my_leave_types` (IN `emp_id` VARCHAR(15))  BEGIN

select `pay_grade` into @pay_grade from `employee` where `employee_id` = emp_id;
select `leave_type` from `pay_grade_leave` where `pay_grade` = @pay_grade;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_attribute`
--

DROP TABLE IF EXISTS `custom_attribute`;
CREATE TABLE IF NOT EXISTS `custom_attribute` (
  `attribute` varchar(50) NOT NULL,
  PRIMARY KEY (`attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `custom_attribute`:
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `dept_name` varchar(50) NOT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `department`:
--

-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
CREATE TABLE IF NOT EXISTS `dependent` (
  `nic` varchar(15) NOT NULL,
  `employee_id` varchar(50) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `relationship` varchar(20) DEFAULT NULL,
  `addr_house_no` varchar(20) DEFAULT NULL,
  `addr_line_1` varchar(20) DEFAULT NULL,
  `addr_line_2` varchar(20) DEFAULT NULL,
  `addr_city` varchar(20) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nic`,`employee_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `dependent`:
--   `employee_id`
--       `employee` -> `employee_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contact`
--

DROP TABLE IF EXISTS `emergency_contact`;
CREATE TABLE IF NOT EXISTS `emergency_contact` (
  `nic` varchar(15) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `employee_id` varchar(50) NOT NULL,
  PRIMARY KEY (`nic`,`employee_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `emergency_contact`:
--   `employee_id`
--       `employee` -> `employee_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` varchar(50) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `nic` varchar(15) DEFAULT NULL,
  `addr_house_no` varchar(20) DEFAULT NULL,
  `addr_line_1` varchar(20) DEFAULT NULL,
  `addr_line_2` varchar(20) DEFAULT NULL,
  `addr_city` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `marital_status` varchar(20) DEFAULT NULL,
  `employment_status` varchar(20) DEFAULT NULL,
  `active_status` tinyint(1) DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `pay_grade` varchar(20) DEFAULT NULL,
  `supervisor_id` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `job_title` (`job_title`),
  KEY `employment_status` (`employment_status`),
  KEY `pay_grade` (`pay_grade`),
  KEY `supervisor_id` (`supervisor_id`),
  KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `employee`:
--   `job_title`
--       `job_title` -> `job_title`
--   `employment_status`
--       `employment_status` -> `employment_status`
--   `pay_grade`
--       `pay_grade` -> `pay_grade`
--   `supervisor_id`
--       `employee` -> `employee_id`
--   `dept_name`
--       `department` -> `dept_name`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee_contact_no`
--

DROP TABLE IF EXISTS `employee_contact_no`;
CREATE TABLE IF NOT EXISTS `employee_contact_no` (
  `employee_id` varchar(50) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  PRIMARY KEY (`employee_id`,`contact_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `employee_contact_no`:
--   `employee_id`
--       `employee` -> `employee_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee_custom_attributes`
--

DROP TABLE IF EXISTS `employee_custom_attributes`;
CREATE TABLE IF NOT EXISTS `employee_custom_attributes` (
  `employee_id` varchar(50) NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `value` varchar(50) ,
  PRIMARY KEY (`employee_id`,`attribute`),
  KEY `attribute` (`attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `employee_custom_attributes`:
--   `attribute`
--       `custom_attribute` -> `attribute`
--   `employee_id`
--       `employee` -> `employee_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee_email`
--

DROP TABLE IF EXISTS `employee_email`;
CREATE TABLE IF NOT EXISTS `employee_email` (
  `employee_id` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`employee_id`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `employee_email`:
--   `employee_id`
--       `employee` -> `employee_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `employment_status`
--

DROP TABLE IF EXISTS `employment_status`;
CREATE TABLE IF NOT EXISTS `employment_status` (
  `employment_status` varchar(20) NOT NULL,
  PRIMARY KEY (`employment_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `employment_status`:
--

-- --------------------------------------------------------

--
-- Table structure for table `job_title`
--

DROP TABLE IF EXISTS `job_title`;
CREATE TABLE IF NOT EXISTS `job_title` (
  `job_title` varchar(50) NOT NULL,
  `access_level` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`job_title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `job_title`:
--

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--

DROP TABLE IF EXISTS `leave`;
CREATE TABLE IF NOT EXISTS `leave` (
  `employee_id` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `leave_type` varchar(20) NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `state` varchar(20) NOT NULL,
  PRIMARY KEY (`employee_id`,`date`,`leave_type`),
  KEY `leave_type` (`leave_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `leave`:
--   `employee_id`
--       `employee` -> `employee_id`
--   `leave_type`
--       `leave_type` -> `leave_type`
--


-- --------------------------------------------------------

--
-- Stand-in structure for view `leave_full_details`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `leave_full_details`;
CREATE TABLE IF NOT EXISTS `leave_full_details` (
`employee_id` varchar(50)
,`date` date
,`leave_type` varchar(20)
,`reason` varchar(100)
,`state` varchar(20)
,`first_name` varchar(20)
,`last_name` varchar(20)
,`nic` varchar(15)
,`addr_house_no` varchar(20)
,`addr_line_1` varchar(20)
,`addr_line_2` varchar(20)
,`addr_city` varchar(20)
,`dob` date
,`marital_status` varchar(20)
,`employment_status` varchar(20)
,`active_status` tinyint(1)
,`job_title` varchar(50)
,`dept_name` varchar(50)
,`pay_grade` varchar(20)
,`supervisor_id` varchar(15)
);

-- --------------------------------------------------------

--
-- Table structure for table `leave_type`
--

DROP TABLE IF EXISTS `leave_type`;
CREATE TABLE IF NOT EXISTS `leave_type` (
  `leave_type` varchar(20) NOT NULL,
  PRIMARY KEY (`leave_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `leave_type`:
--

-- --------------------------------------------------------

--
-- Table structure for table `organization_info`
--

DROP TABLE IF EXISTS `organization_info`;
CREATE TABLE IF NOT EXISTS `organization_info` (
  `key` varchar(50) NOT NULL,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `organization_info`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pay_grade`
--

DROP TABLE IF EXISTS `pay_grade`;
CREATE TABLE IF NOT EXISTS `pay_grade` (
  `pay_grade` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_grade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `pay_grade`:
--

-- --------------------------------------------------------

--
-- Table structure for table `pay_grade_leave`
--

DROP TABLE IF EXISTS `pay_grade_leave`;
CREATE TABLE IF NOT EXISTS `pay_grade_leave` (
  `pay_grade` varchar(20) NOT NULL,
  `leave_type` varchar(20) NOT NULL,
  `limit` int(3) DEFAULT NULL,
  PRIMARY KEY (`pay_grade`,`leave_type`),
  KEY `leave_type` (`leave_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `pay_grade_leave`:
--   `pay_grade`
--       `pay_grade` -> `pay_grade`
--   `leave_type`
--       `leave_type` -> `leave_type`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `employee_id` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `user`:
--   `employee_id`
--       `employee` -> `employee_id`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_access`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `user_access`;
CREATE TABLE IF NOT EXISTS `user_access` (
`employee_id` varchar(50)
,`username` varchar(50)
,`password` varchar(100)
,`access_level` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `leave_full_details`
--
DROP TABLE IF EXISTS `leave_full_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `leave_full_details`  AS  select `leave`.`employee_id` AS `employee_id`,`leave`.`date` AS `date`,`leave`.`leave_type` AS `leave_type`,`leave`.`reason` AS `reason`,`leave`.`state` AS `state`,`employee`.`first_name` AS `first_name`,`employee`.`last_name` AS `last_name`,`employee`.`nic` AS `nic`,`employee`.`addr_house_no` AS `addr_house_no`,`employee`.`addr_line_1` AS `addr_line_1`,`employee`.`addr_line_2` AS `addr_line_2`,`employee`.`addr_city` AS `addr_city`,`employee`.`dob` AS `dob`,`employee`.`marital_status` AS `marital_status`,`employee`.`employment_status` AS `employment_status`,`employee`.`active_status` AS `active_status`,`employee`.`job_title` AS `job_title`,`employee`.`dept_name` AS `dept_name`,`employee`.`pay_grade` AS `pay_grade`,`employee`.`supervisor_id` AS `supervisor_id` from (`leave` left join `employee` on((`leave`.`employee_id` = `employee`.`employee_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `user_access`
--
DROP TABLE IF EXISTS `user_access`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_access`  AS  select `user`.`employee_id` AS `employee_id`,`user`.`username` AS `username`,`user`.`password` AS `password`,`job_title`.`access_level` AS `access_level` from ((`user` left join `employee` on((`user`.`employee_id` = `employee`.`employee_id`))) left join `job_title` on((`employee`.`job_title` = `job_title`.`job_title`))) ;

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
  ADD CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`pay_grade`) REFERENCES `pay_grade` (`pay_grade`),
  ADD CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`supervisor_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `employee_ibfk_6` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`);

--
-- Constraints for table `employee_contact_no`
--
ALTER TABLE `employee_contact_no`
  ADD CONSTRAINT `employee_contact_no_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `employee_custom_attributes`
--
ALTER TABLE `employee_custom_attributes`
  ADD CONSTRAINT `employee_custom_attributes_ibfk_1` FOREIGN KEY (`attribute`) REFERENCES `custom_attribute` (`attribute`),
  ADD CONSTRAINT `employee_custom_attributes_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

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
