-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2020 at 01:36 PM
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
    
    FROM `leave` NATURAL left join `employee` 
	WHERE `date` BETWEEN start_date and end_date
	and `dept_name` = dept
	order by `date`;
end$$

DROP PROCEDURE IF EXISTS `employee_leave_taken`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_leave_taken` (IN `emp_id` VARCHAR(50))  BEGIN

SELECT leave_type,`limit`,leaves_taken from (SELECT employee_id, leave_type, `limit` FROM employee NATURAL JOIN pay_grade_leave WHERE employee_id=emp_id) as s NATURAL LEFT JOIN (SELECT employee_id, leave_type, COUNT(*) as leaves_taken FROM `leave` WHERE state="approved" AND (date BETWEEN DATE(CONCAT(YEAR(CURRENT_DATE()),"-01-01"))  AND DATE(CONCAT(YEAR(CURRENT_DATE()),"-12-31"))) GROUP BY employee_id, leave_type) as t;

END$$

DROP PROCEDURE IF EXISTS `my_leave_types`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `my_leave_types` (IN `emp_id` VARCHAR(50))  BEGIN

select `pay_grade` into @pay_grade from `employee` where `employee_id` = emp_id;
select `leave_type` from `pay_grade_leave` where `pay_grade` = @pay_grade;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `access_level` varchar(20) NOT NULL DEFAULT 'Admin',
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `admin`:
--

--
-- Truncate table before insert `admin`
--

TRUNCATE TABLE `admin`;
--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `email`, `access_level`) VALUES
('username', '$2a$10$pgjhMKtzNvSQUPO/UpESWe5JcsHfQqcHi.GtiE/./KficLmXATl1K', 'nbn@jhkj.com', 'Admin');

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

--
-- Truncate table before insert `custom_attribute`
--

TRUNCATE TABLE `custom_attribute`;
--
-- Dumping data for table `custom_attribute`
--

INSERT INTO `custom_attribute` (`attribute`) VALUES
('Add.Words'),
('Bing Adds'),
('custom11'),
('Direct'),
('Email'),
('Google Adds'),
('Internet'),
('Newspaper'),
('Referral'),
('TV Adds'),
('Word of mouth');

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

--
-- Truncate table before insert `department`
--

TRUNCATE TABLE `department`;
--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_name`) VALUES
('Consultinggg'),
('Customer Support'),
('Executive'),
('Facilities'),
('Finance'),
('Human Resources'),
('Information Technology'),
('Manufacturing'),
('Marketing'),
('Operations'),
('Research and Development'),
('Sales');

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

--
-- Truncate table before insert `dependent`
--

TRUNCATE TABLE `dependent`;
--
-- Dumping data for table `dependent`
--

INSERT INTO `dependent` (`nic`, `employee_id`, `first_name`, `last_name`, `relationship`, `addr_house_no`, `addr_line_1`, `addr_line_2`, `addr_city`, `contact_no`, `email`) VALUES
('192145323949', '3Y5N8BZSOVN6762V', 'Bev', 'Livingston', 'Daughter', '4', '5th FL', 'Flats 3-7', 'Clarkson', '464-7096', 'JacquelyneCheek789@example.com'),
('192189822715', 'O4IOQ99O98112QSY', 'Eric', 'Howell', 'Son', '9', '5th Floor', 'Arch 1', 'Wildwood', '649-1062', 'ValarieRuby@nowhere.com'),
('192249863943', '8E9OC1RHN32B66D2', 'Jessie', 'Park', 'Mother', '946', '9th FL', 'Flats 3-6', 'Olmsted Falls', '126-4481', 'ymtk6233@example.com'),
('192527249312', 'I71OBPCY22W6UXAN', 'Kimiko', 'Culpepper', 'Father', '84', '4th Floor', 'Flat 12', 'Moose Lake', '082-1926', 'ShakitaBlackmon@example.com'),
('192598782869', '7LE8G725L9LQP734', 'Adriana', 'Houston', 'Daughter', '8', '8th FL', 'Railway Arch 99', 'Eveleth', '081-1355', 'Schneider@example.com'),
('192746264161', '78MXZEV1V21T3TJ3', 'Rachell', 'Chong', 'Father', '46', 'Plaza Building', 'Arch 5', 'Olive Hill', '122-6182', 'cqkx89@nowhere.com'),
('194326991971', 'FV537R9Z18HG8R2Q', 'Allen', 'Yarbrough', 'Father', '21', '51th FL', 'Railway Arch 68B', 'Wildomar', '631-5532', 'Velasquez2@nowhere.com'),
('194599313355', 'T43P3YU3Y1RW6E7V', 'Weston', 'Howe', 'Other', '038', '6th Floor', 'Railway Arch 7B', 'Clarksdale', '014-6668', 'Abbott@example.com'),
('194672471939', 'Z6B527Y4PPRXLR89', 'Laurence', 'Christian', 'Father', '629', '48th Floor', 'Suite 2', 'Le Sueur', '523-0369', 'Fitzgerald@example.com'),
('195129793355', '9665C2IB4K732V69', 'Kenton', 'Betts', 'Other', '561', '6th FL', 'Unit A3A, Ground Flo', 'Rio Rico', '918-9394', 'KristopherAbel@example.com'),
('195892237487', 'HPW5T88SD9466BLC', 'Allen', 'Betancourt', 'Mother', '985', '7th Floor', 'Railway Arch 83C', 'Mooseheart', '739-6193', 'MargaritoUAugust@nowhere.com'),
('195948228829', 'G27568IB58M3G4C3', 'Adela', 'Parker', 'Mother', '866', '91th Floor', 'Railway Arch 5', 'Hayfield', '888-2526', 'Vanesa_Chism314@nowhere.com'),
('196662242286', '86B6895497GRDG89', 'Catherina', 'Franklin', 'Son', '621', '9th FL', 'Railway Arch 8', 'Evarts', '116-5494', 'Jerold_Overstreet872@example.com'),
('197848137744', 'E3N43B9724H3QN82', 'Freddie', 'Best', 'Father', '4', '69th FL', 'Railway Arch 6', 'Rio Linda', '663-9257', 'BradleyX.Short89@example.com'),
('197961778136', '936JXYL4DZ8361ZF', 'Adam', 'Lively', 'Other', '514', '8th Floor', 'Railway Arch 7', 'Hayes Center', '036-3069', 'Martino@example.com'),
('198622636251', '4N96X1273H396KO7', 'Arthur', 'Beverly', 'Mother', '884', '2nd FL', 'Railway Arch 86', 'Clarksville', '133-3110', 'Tracey_Bunch429@example.com'),
('198737755476', 'NDJM378I15P3DO32', 'Pamila', 'Parish', 'Daughter', '050', '257 Towers Building', 'Railway Arch 7', 'Rio Hondo', '225-0832', 'zhmjzjpe.wssz@nowhere.com'),
('198916211789', 'IF9L1MOLI6P6KW3L', 'Kareem', 'Swift', 'Daughter', '725', '4th Floor', 'Railway Arch 3', 'Rio Oso', '213-2789', 'RaisaBooker@example.com'),
('199117853488', '4QQ7G1A6OSKTED6P', 'Tommy', 'Lloyd', 'Father', '03', '6th FL', 'Suite 76', 'Olivia', '200-1822', 'Christinia.Pritchard9@nowhere.com'),
('199375675724', 'LO5LBEA657JU5N53', 'Scottie', 'Sykes', 'Daughter', '8', '45th FL', 'Flat 24', 'Rio Verde', '513-7373', 'Gifford7@example.com'),
('199489685186', 'Z12P9717PZ582XBA', 'Vania', 'Culver', 'Other', '963', '3rd FL', 'Unit 34-39, Ground F', 'Olivet', '078-3755', 'CyrilCrawford372@example.com'),
('199922934155', 'L6TJZD8NV3M7L663', 'Harry', 'Mccrary', 'Father', '858', '62th FL', 'Railway Arch 6C', 'Oliver Springs', '576-3465', 'ksvr43@example.com'),
('201833559863', '3TD5KS12246CQ46H', 'Keely', 'Cummings', 'Son', '053', '6th FL', 'Railway Arch 81B', 'Susquehanna', '227-1563', 'NathanaelAntoine@example.com'),
('201887467276', '61H9S7T58G51773M', 'Bradly', 'Christenson', 'Other', '634', '97th FL', 'Flat 66', 'Clarkston', '232-8150', 'Henry18@example.com'),
('202712831379', 'W5ME5222K4542M1S', 'Harry', 'Howland', 'Other', '2', '6th FL', 'Arch 8', 'Everett', '614-7692', 'LaticiaEStarkey@nowhere.com'),
('202768376649', '7F9H619F7X7F4PIR', 'Reggie', 'Frantz', 'Father', '9', '4th Floor', 'Railway Arch 1', 'Susanville', '151-4100', 'AdrianYanez291@example.com'),
('203297538742', '16F601B1B7A39B', 'Lorrine', 'Littleton', 'Son', '5', '75th Floor', 'Railway Arch 7', 'Berkeley Springs', '800-1451', 'King@example.com'),
('203297538742', '1KX15NHS858JB6AI', 'Lorrine', 'Littleton', 'Son', '5', '75th Floor', 'Railway Arch 7', 'Berkeley Springs', '800-1451', 'King@example.com'),
('204179572156', 'JZ71BQ9BQ6DSITLI', 'Abigail', 'Bethel', 'Other', '99', '8th Floor', 'Railway Arch 2C', 'Everest', '170-1826', 'ChantelleAcevedo82@example.com'),
('204383728694', 'GPEQJ44M3AUG2JEB', 'Penney', 'Parkinson', 'Daughter', '327', '90th Floor', 'Railway Arch 8', 'Mora', '040-1058', 'Chung_B_Milner@example.com'),
('204879467166', '62B395L514SV47T9', 'Wayne', 'Betz', 'Father', '625', '6th Floor', 'Railway Arch 4', 'Lead Hill', '167-3904', 'Abbott392@example.com'),
('204951813594', '424S67R67E27T674', 'Isaac', 'Yates', 'Mother', '389', '8th FL', 'Flats A-E', 'Surry', '836-1449', 'obzfhvfe.dkgluf@example.com'),
('205113353114', 'GG7IQ4WH8692H4M7', 'Charlene', 'Franks', 'Father', '7', '5th FL', 'Railway Arch 69', 'Le Roy', '276-1734', 'Guzman698@example.com'),
('205168267484', '6ZP9897561152PQI', 'Victoria', 'Mccreary', 'Father', '047', '5th FL', 'Railway Arch 60A', 'Berlin', '424-6951', 'IlanaAdkins@example.com'),
('205241616552', 'RQMJ9ZMYM8M4LM76', 'Jackson', 'Chow', 'Daughter', '823', '6th Floor', 'Railway Arch 4', 'Berkley', '554-7660', 'rsvme0@example.com'),
('205263916126', 'J736P11745XC4L26', 'Abel', 'Howard', 'Mother', '04', '7th FL', 'Railway Arch 3', 'Wildrose', '569-5773', 'AmosTijerina48@example.com'),
('205348426636', '3C1QR8BVP2759SM9', 'Etha', 'Swisher', 'Mother', '2', '42th FL', 'Railway Arch 5', 'Evensville', '692-8391', 'Abbott@example.com'),
('205729965118', '1T7E55W3J182SKW7', 'Carmelina', 'Swenson', 'Mother', '247', '4th FL', 'Railway Arch 24', 'Le Mars', '729-4206', 'CharissaJSchmid55@example.com'),
('206345214711', 'LH369XG252S83B9Z', 'Adalberto', 'Christianson', 'Daughter', '2', '6th Floor', 'Suite 7', 'Rio Vista', '940-7230', 'Burchett439@example.com'),
('206516619476', '9T989FXQWAC4HF86', 'Thresa', 'Bethea', 'Mother', '29', '7th FL', 'Suite 63', 'Hayesville', '405-4949', 'Nanette_Marble@example.com'),
('206612285745', '4B58H48K9XPQFC6M', 'Sandy', 'Yazzie', 'Daughter', '1', '7th Floor', 'Flats 4-6', 'Rio Rancho', '944-8255', 'Leigh_Saucedo429@example.com'),
('206628722992', '15R65GD75R3N5CTE', 'Mariann', 'Locke', 'Daughter', '832', '5th FL', 'Railway Arch 5', 'Olney', '797-6877', 'Christian8@example.com'),
('206683355573', 'B52R9SHW9F8X9XZR', 'Cheryle', 'Christiansen', 'Son', '104', '95th FL', 'Railway Arch 4', 'Wilkesboro', '800-4565', 'PenaO93@example.com'),
('206961199742', 'Z11Y39Q4NZ352XV9', 'Kenneth', 'Mccracken', 'Mother', '112', '3rd Floor', 'Suite 1', 'Hayes', '903-6769', 'Abney3@nowhere.com'),
('207136258486', '68886RHCW4CAW548', 'Ulrike', 'Mccray', 'Mother', '853', '4th FL', 'Flat 3', 'Moosic', '889-1664', 'Herrmann@example.com'),
('207215859577', '4KC15W1UYB1BY214', 'Randal', 'Christensen', 'Daughter', '8', 'APT 993', 'Flat 1', 'Berkshire', '750-1955', 'Chaya_O.Abel751@nowhere.com'),
('207366627371', '22K546KA3941FL24', 'Emilio', 'Houser', 'Father', '975', '77th Floor', 'Railway Arch 1', 'Zuni', '248-0473', 'ArndtY74@nowhere.com'),
('208183938446', '1G11JXS77ZUD362Z', 'Christian', 'Ybarra', 'Mother', '0', '80th Floor', 'Railway Arch 9', 'Moosup', '614-6215', 'Tobin55@nowhere.com'),
('208515832816', 'I7PV45RF6262MWV5', 'Nicolle', 'Switzer', 'Father', '35', '61th FL', 'Suite 29', 'Wilkes Barre', '057-3911', 'Marvel.Knott3@nowhere.com'),
('208852733124', '84641IS2VLEKG3D2', 'Delbert', 'Howerton', 'Son', '5', '9th FL', 'Railway Arch 2A', 'Lead', '256-7107', 'CarrollWhelan@example.com'),
('208983428542', 'OOPH853V758R6X34', 'Tobias', 'Littlejohn', 'Mother', '4', '72th Floor', 'Railway Arch 97A', 'Surrey', '921-2095', 'Cushman@nowhere.com');

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

--
-- Truncate table before insert `emergency_contact`
--

TRUNCATE TABLE `emergency_contact`;
--
-- Dumping data for table `emergency_contact`
--

INSERT INTO `emergency_contact` (`nic`, `name`, `contact_no`, `employee_id`) VALUES
('191266954499', 'Askanja ockenhaupt', '281-3572', '4B58H48K9XPQFC6M'),
('191289661664', 'Erkhild Abich', '131-5771', '22K546KA3941FL24'),
('191339553227', 'Balian  einhold', '178-1141', '6ZP9897561152PQI'),
('191797481425', 'Berngar Glasenap', '801-4021', 'JZ71BQ9BQ6DSITLI'),
('193353286414', 'Phöbe Kauer', '091-4076', 'IF9L1MOLI6P6KW3L'),
('193593452272', 'Peider icolai', '067-6637', '1G11JXS77ZUD362Z'),
('193942234411', 'Tamija Lerch', '518-5038', 'NDJM378I15P3DO32'),
('193998351846', 'Elimar Blumentahl', '062-7348', '3Y5N8BZSOVN6762V'),
('194419678878', 'Gunde Bering', '458-1159', 'Z11Y39Q4NZ352XV9'),
('195385226978', 'Purple orgen', '903-9625', '424S67R67E27T674'),
('195566222537', 'Thankmar otmann', '521-9449', 'J736P11745XC4L26'),
('195584334233', 'Adolina  Ulbricht', '826-9243', 'LH369XG252S83B9Z'),
('195695765454', 'Vishna Albrecht', '853-9496', 'T43P3YU3Y1RW6E7V'),
('195698468889', 'Mareke Metzger', '762-4406', '4KC15W1UYB1BY214'),
('195826976557', 'Christl abst', '381-1336', '1T7E55W3J182SKW7'),
('196466483762', 'Wilfried Bülow', '433-0574', '68886RHCW4CAW548'),
('196627719517', 'Marlena Hirschmann', '121-1496', '9665C2IB4K732V69'),
('196782819765', 'Heico Lamprecht', '026-8104', 'I7PV45RF6262MWV5'),
('197771648368', 'Otger Bruner', '649-6981', 'RQMJ9ZMYM8M4LM76'),
('198257984179', 'Thaddäus Kittel', '792-0479', 'L6TJZD8NV3M7L663'),
('198583924191', 'Priska Wolf', '279-7946', '8E9OC1RHN32B66D2'),
('198632358633', 'Freimuth Heckler', '262-3212', 'GG7IQ4WH8692H4M7'),
('199388287818', 'Annalisa Engelke', '157-9998', 'I71OBPCY22W6UXAN'),
('199622343669', 'Burkhart Köstlin', '732-7156', 'E3N43B9724H3QN82'),
('201299716688', 'Merwin Stuchenberg', '589-8954', 'FV537R9Z18HG8R2Q'),
('201879365381', 'Annalise Abich', '526-8014', 'B52R9SHW9F8X9XZR'),
('202498213979', 'Hadewin Kesselhut', '094-6232', 'OOPH853V758R6X34'),
('202518642454', 'Alejna  Stackelberg', '611-8590', '3TD5KS12246CQ46H'),
('202625256152', 'Abbeygail  chlechter', '288-2903', 'W5ME5222K4542M1S'),
('203449753388', 'Felipa Heitsch', '070-6579', '61H9S7T58G51773M'),
('203573829237', 'Rolanda Horkheimer', '350-8177', 'O4IOQ99O98112QSY'),
('203886219586', 'Seraja Siegel', '405-1899', 'G27568IB58M3G4C3'),
('204675713415', 'Merisa Zenner', '976-1526', '7F9H619F7X7F4PIR'),
('204748824777', 'Dörk Drechsler', '782-5588', '15R65GD75R3N5CTE'),
('206229967435', 'Plektrudis Heidemann', '279-5487', '78MXZEV1V21T3TJ3'),
('206385743236', 'Walther Feldkamp', '731-4399', 'GPEQJ44M3AUG2JEB'),
('206938489846', 'Erwald Felder', '564-8202', '936JXYL4DZ8361ZF'),
('207292319986', 'Christl Kantor', '893-9379', 'Z12P9717PZ582XBA'),
('207438797667', 'Freda Dörner', '144-3838', '62B395L514SV47T9'),
('207728445494', 'Wigand Abert', '047-1993', 'LO5LBEA657JU5N53'),
('208657643415', 'Winfried John', '968-9310', 'HPW5T88SD9466BLC'),
('208813515624', 'Baldur  Simmel', '933-9293', 'Z6B527Y4PPRXLR89'),
('208828977191', 'Briska Lichtenstein', '851-9906', '3C1QR8BVP2759SM9'),
('208866987372', 'Herward Manstein', '497-7307', '7LE8G725L9LQP734'),
('208951326589', 'Brisko Kleinermann', '087-0968', '16F601B1B7A39B'),
('208951326589', 'Brisko Kleinermann', '087-0968', '1KX15NHS858JB6AI'),
('209179526659', 'Kensie ack', '971-3624', '84641IS2VLEKG3D2'),
('209561339368', 'Felipa Dahrendorf', '144-6968', '4N96X1273H396KO7'),
('209748696764', 'Hademar Brandt', '968-7333', '86B6895497GRDG89'),
('209826691242', 'Neidhart Felder', '852-6050', '4QQ7G1A6OSKTED6P'),
('209832484559', 'Berenike Eichenwald', '860-6999', '9T989FXQWAC4HF86');

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
  `gender` varchar(20) NOT NULL DEFAULT 'Prefer not to say',
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
  `supervisor_id` varchar(50) DEFAULT NULL,
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

--
-- Truncate table before insert `employee`
--

TRUNCATE TABLE `employee`;
--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `nic`, `gender`, `addr_house_no`, `addr_line_1`, `addr_line_2`, `addr_city`, `dob`, `marital_status`, `employment_status`, `active_status`, `job_title`, `dept_name`, `pay_grade`, `supervisor_id`) VALUES
('15R65GD75R3N5CTE', 'Alvin', 'Hernandez', '197453642452', 'Prefer not to say', '619', '9th FL', 'Railway Arch 4', 'Bloomfield', '1996-01-17', 'Married', 'Permanent-FullTime', 0, 'Director of Information Technology', 'Consultinggg', 'Grade-3', '15R65GD75R3N5CTE'),
('16F5CA3A90F68', 'Bucha', 'bucha', '1x418268x743', 'Male', '494', '6th Floor', 'Flat 5', 'Suttons Bay', '1988-12-08', 'Single', 'Permanent-PartTime', 1, 'Technician', 'Executive', 'Grade-3', '1KX15NHS858JB6AI'),
('16F601B1B7A39B', 'bucha', 'chaa', '205961353665', 'Prefer not to say', '494', '6th Floor', 'Flat 5', 'Suttons Bay', '1988-12-08', 'Single', 'Permanent-PartTime', 1, 'Technician', 'Executive', 'Grade-3', '1KX15NHS858JB6AI'),
('1G11JXS77ZUD362Z', 'Delmer', 'Blake', '202172666764', 'Prefer not to say', '3', '8th FL', 'Railway Arch 43', 'Colonial Heights', '2000-10-30', 'Married', 'Permanent-FullTime', 1, 'Technician', 'Information Technology', 'Grade-2', 'OOPH853V758R6X3'),
('1KX15NHS858JB6AI', 'Cleveland', 'Hanks', '205961353665', 'Prefer not to say', '494', '6th Floor', 'Flat 5', 'Suttons Bay', '1988-12-08', 'Single', 'Permanent-PartTime', 1, 'Human Resources Manager', 'Executive', 'Grade-3', '1KX15NHS858JB6AI'),
('1T7E55W3J182SKW7', 'Kim', 'Herbert', '205425127232', 'Prefer not to say', '81', '54th FL', 'Unit 2-7, First Floo', 'Porterville', '1979-09-28', 'Single', 'Permanent-FullTime', 1, 'Development Engineer', 'Facilities', 'Grade-2', 'Z6B527Y4PPRXLR8'),
('22K546KA3941FL24', 'Norbert', 'Clements', '199335411242', 'Prefer not to say', '3', '5th FL', 'Railway Arch 8', 'Coloma', '1995-02-18', 'Married', 'Trainee', 1, 'Senior Specialist', 'Human Resources', 'Grade-1', 'NDJM378I15P3DO3'),
('3C1QR8BVP2759SM9', 'Abbie', 'Hankins', '205347262458', 'Prefer not to say', '533', '8th Floor', 'Railway Arch 80', 'Elfers', '1969-01-01', 'Single', 'Freelance', 1, 'Business Analyst', 'Manufacturing', 'Grade-4', 'Z12P9717PZ582XB'),
('3TD5KS12246CQ46H', 'Consuelo', 'Faber', '205988222615', 'Prefer not to say', '660', '9th Floor', 'Flats 1-7', 'Williams Bay', '1969-01-10', 'Single', 'Permanent-PartTime', 1, 'Director of Customer Support', 'Consultinggg', 'Grade-4', 'GG7IQ4WH8692H4M'),
('3Y5N8BZSOVN6762V', 'Jerold', 'Fahey', '206189692283', 'Prefer not to say', '627', '84th Floor', 'Unit 31-47', 'Newbury', '1988-08-09', 'Married', 'Contract-PartTime', 1, 'Business Coordinator', 'Consultinggg', 'Grade-2', '4KC15W1UYB1BY21'),
('424S67R67E27T674', 'Miki', 'Hermann', '209256418853', 'Prefer not to say', '408', '7th FL', 'Railway Arch 32B', 'Lookeba', '1971-08-08', 'Divorced', 'Trainee', 1, 'Director of Consulting', 'Consultinggg', 'Grade-1', '1G11JXS77ZUD362'),
('4B58H48K9XPQFC6M', 'Alina', 'Pannell', '207612324475', 'Prefer not to say', '431', '70th FL', 'Railway Arch 50B', 'Bloomer', '1978-11-21', 'Single', 'Permanent-FullTime', 1, 'Senior Accountant', 'Executive', 'Grade-2', '4B58H48K9XPQFC6'),
('4KC15W1UYB1BY214', 'Jonas', 'Ewing', '204381543285', 'Prefer not to say', '503', '57th FL', 'Flat 4', 'Houma', '1986-04-20', 'Married', 'Trainee', 1, 'Assistant', 'Executive', 'Grade-3', '3Y5N8BZSOVN6762'),
('4N96X1273H396KO7', 'Ada', 'Haney', '196961726735', 'Prefer not to say', '150', '70th Floor', 'Suite 4', 'Zuni', '2000-01-30', 'Single', 'Permanent-FullTime', 1, 'Communication Analyst', 'Human Resources', 'Grade-1', '62B395L514SV47T'),
('4QQ7G1A6OSKTED6P', 'Jazmin', 'Shelley', '202532233395', 'Prefer not to say', '5', '56th Floor', 'Railway Arch 3', 'Block Island', '1979-04-12', 'Married', 'Freelance', 1, 'Assistant', 'Human Resources', 'Grade-2', 'NDJM378I15P3DO3'),
('61H9S7T58G51773M', 'Ambrose', 'Herman', '192832299871', 'Prefer not to say', '463', '67th Floor', 'Railway Arch 7', 'House Springs', '1981-08-27', 'Married', 'Freelance', 1, 'Senior Accountant', 'Sales', 'Grade-2', 'NDJM378I15P3DO3'),
('62B395L514SV47T9', 'Aiko', 'Lassiter', '193185847734', 'Prefer not to say', '573', 'Apartment 570', 'Railway Arch 2', 'Portland', '1990-04-26', 'Single', 'Contract-FullTime', 0, 'Director of Manufacturing', 'Human Resources', 'Grade-1', 'LH369XG252S83B9'),
('68886RHCW4CAW548', 'Sebastian', 'Blackwood', '198953513973', 'Prefer not to say', '042', '77th FL', 'Arch 7', 'Blomkest', '1969-01-06', 'Married', 'Contract-PartTime', 1, 'Chief Information Officer', 'Research and Development', 'Grade-1', 'L6TJZD8NV3M7L66'),
('6ZP9897561152PQI', 'Jacqulyn', 'Shephard', '197723161792', 'Prefer not to say', '2', '83th Floor', 'Railway Arch 9', 'Suwanee', '1969-01-06', 'Single', 'Trainee', 1, 'Training Manager', 'Consultinggg', 'Grade-4', 'IF9L1MOLI6P6KW3'),
('78MXZEV1V21T3TJ3', 'Deandre', 'Fairbanks', '198499736168', 'Prefer not to say', '302', '46th FL', 'Unit 2-9', 'Houtzdale', '1980-06-08', 'Married', 'Contract-FullTime', 1, 'Marketing Manager', 'Human Resources', 'Grade-3', 'W5ME5222K4542M1'),
('7F9H619F7X7F4PIR', 'Zetta', 'Hannah', '202551488647', 'Prefer not to say', '359', '45th FL', 'Suite 2', 'Newburyport', '1969-01-14', 'Married', 'Contract-FullTime', 1, 'Chief Information Officer', 'Customer Support', 'Grade-3', '3TD5KS12246CQ46'),
('7LE8G725L9LQP734', 'Santo', 'Blakely', '206349399439', 'Prefer not to say', '6', '6th Floor', 'Railway Arch 95A', 'Elizabeth', '1992-10-03', 'Single', 'Contract-PartTime', 1, 'Regional Manager', 'Information Technology', 'Grade-1', 'G27568IB58M3G4C'),
('84641IS2VLEKG3D2', 'Trent', 'Hanes', '192123281252', 'Prefer not to say', '382', '7th FL', 'Flats 3-8', 'Eleva', '1981-02-20', 'Married', 'Permanent-FullTime', 1, 'Technical Manager', 'Research and Development', 'Grade-1', '4N96X1273H396KO'),
('86B6895497GRDG89', 'Holli', 'Click', '191517132139', 'Prefer not to say', '01', '68th Floor', 'Railway Arch 3', 'Hadley', '1980-09-06', 'Married', 'Permanent-PartTime', 1, 'Finance Controller', 'Operations', 'Grade-1', 'G27568IB58M3G4C'),
('8E9OC1RHN32B66D2', 'Scott', 'Clemons', '208774972359', 'Prefer not to say', '615', '57th Floor', 'Railway Arch 45C', 'Porthill', '1998-09-10', 'Single', 'Contract-PartTime', 1, 'Finance Controller', 'Operations', 'Grade-1', '1KX15NHS858JB6A'),
('936JXYL4DZ8361ZF', 'Spencer', 'Valles', '209115347523', 'Prefer not to say', '80', 'First Security Build', 'Flats 3-6', 'Williams', '1984-05-23', 'Married', 'Contract-PartTime', 0, 'Application Engineer', 'Information Technology', 'Grade-4', '1KX15NHS858JB6A'),
('9665C2IB4K732V69', 'Claude', 'Blais', '209134724378', 'Prefer not to say', '36', '72th FL', 'Railway Arch 4', 'Eliot', '1972-10-29', 'Single', 'Contract-PartTime', 1, 'Director of Manufacturing', 'Finance', 'Grade-4', '4KC15W1UYB1BY21'),
('9T989FXQWAC4HF86', 'Melvin', 'Larson', '205826477547', 'Prefer not to say', '658', '80th Floor', 'Railway Arch 20', 'Haddam', '1998-10-21', 'Married', 'Freelance', 0, 'Finance Controller', 'Consultinggg', 'Grade-4', 'I71OBPCY22W6UXA'),
('B52R9SHW9F8X9XZR', 'Mitchell', 'Lash', '204145437349', 'Prefer not to say', '561', '8th Floor', 'Railway Arch 96C', 'Colon', '1989-10-09', 'Married', 'Permanent-FullTime', 1, 'Controller', 'Information Technology', 'Grade-4', '4B58H48K9XPQFC6'),
('E3N43B9724H3QN82', 'Korey', 'Ezell', '203468945243', 'Prefer not to say', '8', '8th FL', 'Unit 4-9', 'Colome', '1990-06-14', 'Single', 'Permanent-FullTime', 1, 'Technical  Manager', 'Finance', 'Grade-3', 'NDJM378I15P3DO3'),
('FV537R9Z18HG8R2Q', 'Adolfo', 'Vance', '198312154521', 'Prefer not to say', '3', '4th Floor', 'Unit 41-46, First Fl', 'Hagerman', '1976-07-29', 'Married', 'Contract-FullTime', 1, 'Director of Manufacturing', 'Facilities', 'Grade-3', 'T43P3YU3Y1RW6E7'),
('G27568IB58M3G4C3', 'Allan', 'Fagan', '203835638145', 'Prefer not to say', '9', 'STE 214', 'Railway Arch 9', 'Colonia', '1969-01-03', 'Single', 'Contract-PartTime', 1, 'Controller', 'Information Technology', 'Grade-4', 'Z11Y39Q4NZ352XV'),
('GG7IQ4WH8692H4M7', 'Jamaal', 'Mccollum', '201126623886', 'Prefer not to say', '53', '7th FL', 'Arch 90', 'Portola Valley', '1970-05-11', 'Single', 'Permanent-FullTime', 1, 'Lead Engineer', 'Manufacturing', 'Grade-2', 'RQMJ9ZMYM8M4LM7'),
('GPEQJ44M3AUG2JEB', 'Maragaret', 'Shelton', '204748847159', 'Prefer not to say', '4', '91th FL', 'Railway Arch 8', 'Hackettstown', '1969-01-04', 'Single', 'Freelance', 0, 'Communication Engineer', 'Consultinggg', 'Grade-1', '78MXZEV1V21T3TJ'),
('HPW5T88SD9466BLC', 'Adah', 'Blaine', '205418678498', 'Prefer not to say', '8', '65th FL', 'Suite 19', 'Newburg', '1969-01-04', 'Married', 'Freelance', 1, 'Director of Manufacturing', 'Customer Support', 'Grade-1', 'LO5LBEA657JU5N5'),
('I71OBPCY22W6UXAN', 'Ada', 'Clevenger', '194942786568', 'Prefer not to say', '751', '52th FL', 'Railway Arch 5', 'Bloomfield Hills', '1970-11-15', 'Single', 'Permanent-PartTime', 1, 'Contract Manager', 'Operations', 'Grade-1', '3TD5KS12246CQ46'),
('I7PV45RF6262MWV5', 'Celina', 'Hanley', '209167842975', 'Prefer not to say', '5', '71th FL', 'Arch 1', 'Houston', '1974-09-11', 'Single', 'Contract-FullTime', 1, 'Application Engineer', 'Manufacturing', 'Grade-2', 'NDJM378I15P3DO3'),
('IF9L1MOLI6P6KW3L', 'Zackary', 'Clemmons', '191886894677', 'Prefer not to say', '40', '8th Floor', 'Railway Arch 23C', 'Haddon Heights', '1975-11-08', 'Single', 'Trainee', 1, 'Technical  Manager', 'Facilities', 'Grade-3', 'L6TJZD8NV3M7L66'),
('J736P11745XC4L26', 'Graig', 'Heredia', '204897177253', 'Prefer not to say', '1', '65th FL', 'Flats 4-6', 'Elgin', '1985-01-01', 'Married', 'Permanent-PartTime', 1, 'Vice President', 'Consultinggg', 'Grade-4', '68886RHCW4CAW54'),
('JZ71BQ9BQ6DSITLI', 'Erwin', 'Mcclure', '207575434684', 'Prefer not to say', '513', '88th Floor', 'Arch 23', 'Bloomdale', '1990-10-02', 'Single', 'Freelance', 1, 'Director of Manufacturing', 'Finance', 'Grade-4', '7LE8G725L9LQP73'),
('L6TJZD8NV3M7L663', 'Allen', 'Shepard', '206873648565', 'Prefer not to say', '900', '6th FL', 'Railway Arch 77', 'Housatonic', '1997-04-10', 'Married', 'Permanent-FullTime', 1, 'Communication Manager', 'Information Technology', 'Grade-1', 'W5ME5222K4542M1'),
('LH369XG252S83B9Z', 'Tilda', 'Hanlon', '192771695882', 'Prefer not to say', '727', '6th FL', 'Railway Arch 90', 'Colonial Beach', '1998-03-09', 'Married', 'Permanent-PartTime', 1, 'Product Manager', 'Consultinggg', 'Grade-4', '22K546KA3941FL2'),
('LO5LBEA657JU5N53', 'Christen', 'Vallejo', '203766256424', 'Prefer not to say', '575', '5th Floor', 'Suite 56', 'Lonsdale', '1974-03-28', 'Married', 'Trainee', 0, 'Product Manager', 'Human Resources', 'Grade-4', 'NDJM378I15P3DO3'),
('NDJM378I15P3DO32', 'Myron', 'Van', '191493657139', 'Prefer not to say', '754', '53th FL', 'Railway Arch 86B', 'Newburgh', '1969-02-21', 'Divorced', 'Contract-PartTime', 1, 'QA Engineer', 'Manufacturing', 'Grade-1', 'NDJM378I15P3DO3'),
('O4IOQ99O98112QSY', 'Myrtis', 'Cleveland', '203515876835', 'Prefer not to say', '21', 'Bartlett Bldg', 'Railway Arch 99', 'Haddonfield', '1980-04-12', 'Single', 'Permanent-FullTime', 1, 'Regional Manager', 'Executive', 'Grade-3', 'LO5LBEA657JU5N5'),
('OOPH853V758R6X34', 'Adolph', 'Vanburen', '206269722761', 'Prefer not to say', '5', '62th FL', 'Unit 23-39, Level 2', 'Lookout', '1981-07-08', 'Married', 'Trainee', 1, 'Finance Controller', 'Customer Support', 'Grade-2', 'FV537R9Z18HG8R2'),
('RQMJ9ZMYM8M4LM76', 'Omega', 'Shepherd', '201669197998', 'Prefer not to say', '728', '9th Floor', 'Railway Arch 7', 'Lookout Mountain', '1983-04-07', 'Married', 'Contract-PartTime', 1, 'Communication Engineer', 'Research and Development', 'Grade-3', 'OOPH853V758R6X3'),
('T43P3YU3Y1RW6E7V', 'Suzi', 'Fain', '204819782392', 'Prefer not to say', '31', '7th Floor', 'Unit 32-36, Ground F', 'Newbury Park', '1970-10-06', 'Single', 'Permanent-PartTime', 1, 'Technical  Manager', 'Consultinggg', 'Grade-1', 'L6TJZD8NV3M7L66'),
('W5ME5222K4542M1S', 'Camila', 'Evers', '202797495372', 'Prefer not to say', '300', '60th FL', 'Railway Arch 5', 'Lonoke', '1969-03-23', 'Married', 'Freelance', 1, 'Technical Manager', 'Executive', 'Grade-3', 'J736P11745XC4L2'),
('Z11Y39Q4NZ352XV9', 'Millie', 'Blair', '202474851873', 'Prefer not to say', '2', '94th Floor', 'Railway Arch 97', 'Elida', '1969-02-04', 'Married', 'Permanent-PartTime', 1, 'Senior Designer', 'Human Resources', 'Grade-2', '1T7E55W3J182SKW'),
('Z12P9717PZ582XBA', 'Adalberto', 'Larue', '195726889741', 'Prefer not to say', '435', '69th FL', 'Railway Arch 71', 'Loogootee', '1969-02-07', 'Married', 'Freelance', 1, 'Business Coordinator', 'Consultinggg', 'Grade-3', 'NDJM378I15P3DO3'),
('Z6B527Y4PPRXLR89', 'Donnie', 'Hanna', '208969167197', 'Prefer not to say', '435', '81th FL', 'Flats 1-7', 'Portola', '1997-10-26', 'Divorced', 'Permanent-PartTime', 0, 'Development Manager', 'Information Technology', 'Grade-3', 'I7PV45RF6262MWV');

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

--
-- Truncate table before insert `employee_contact_no`
--

TRUNCATE TABLE `employee_contact_no`;
--
-- Dumping data for table `employee_contact_no`
--

INSERT INTO `employee_contact_no` (`employee_id`, `contact_no`) VALUES
('15R65GD75R3N5CTE', '801-8939'),
('16F601B1B7A39B', '553-7687'),
('1G11JXS77ZUD362Z', '465-4132'),
('1KX15NHS858JB6AI', '553-7687'),
('1T7E55W3J182SKW7', '454-9619'),
('22K546KA3941FL24', '114-3354'),
('3C1QR8BVP2759SM9', '325-5419'),
('3TD5KS12246CQ46H', '507-2550'),
('3Y5N8BZSOVN6762V', '234-6593'),
('424S67R67E27T674', '214-4430'),
('4B58H48K9XPQFC6M', '167-9233'),
('4KC15W1UYB1BY214', '115-6697'),
('4N96X1273H396KO7', '865-0016'),
('4QQ7G1A6OSKTED6P', '403-1635'),
('61H9S7T58G51773M', '092-4894'),
('62B395L514SV47T9', '217-0859'),
('68886RHCW4CAW548', '499-0083'),
('6ZP9897561152PQI', '277-1782'),
('78MXZEV1V21T3TJ3', '227-8522'),
('7F9H619F7X7F4PIR', '558-1507'),
('7LE8G725L9LQP734', '669-7824'),
('84641IS2VLEKG3D2', '279-3549'),
('86B6895497GRDG89', '370-0353'),
('8E9OC1RHN32B66D2', '049-6701'),
('936JXYL4DZ8361ZF', '465-8552'),
('9665C2IB4K732V69', '296-5606'),
('9T989FXQWAC4HF86', '536-5066'),
('B52R9SHW9F8X9XZR', '385-9877'),
('E3N43B9724H3QN82', '891-7658'),
('FV537R9Z18HG8R2Q', '957-5240'),
('G27568IB58M3G4C3', '896-9475'),
('GG7IQ4WH8692H4M7', '113-9638'),
('GPEQJ44M3AUG2JEB', '410-3386'),
('HPW5T88SD9466BLC', '035-4145'),
('I71OBPCY22W6UXAN', '074-1873'),
('I7PV45RF6262MWV5', '499-2172'),
('IF9L1MOLI6P6KW3L', '886-9435'),
('J736P11745XC4L26', '216-3541'),
('JZ71BQ9BQ6DSITLI', '850-7746'),
('L6TJZD8NV3M7L663', '118-0398'),
('LH369XG252S83B9Z', '788-8668'),
('LO5LBEA657JU5N53', '693-4038'),
('NDJM378I15P3DO32', '359-6149'),
('O4IOQ99O98112QSY', '290-2811'),
('OOPH853V758R6X34', '403-3974'),
('RQMJ9ZMYM8M4LM76', '805-3747'),
('T43P3YU3Y1RW6E7V', '012-0217'),
('W5ME5222K4542M1S', '721-5108'),
('Z11Y39Q4NZ352XV9', '998-2002'),
('Z12P9717PZ582XBA', '483-5632'),
('Z6B527Y4PPRXLR89', '468-1747');

-- --------------------------------------------------------

--
-- Table structure for table `employee_custom_attributes`
--

DROP TABLE IF EXISTS `employee_custom_attributes`;
CREATE TABLE IF NOT EXISTS `employee_custom_attributes` (
  `employee_id` varchar(50) NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `value` varchar(50) DEFAULT NULL,
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

--
-- Truncate table before insert `employee_custom_attributes`
--

TRUNCATE TABLE `employee_custom_attributes`;
--
-- Dumping data for table `employee_custom_attributes`
--

INSERT INTO `employee_custom_attributes` (`employee_id`, `attribute`, `value`) VALUES
('15R65GD75R3N5CTE', 'custom11', NULL),
('16F5CA3A90F68', 'custom11', NULL),
('16F601B1B7A39B', 'custom11', NULL),
('1G11JXS77ZUD362Z', 'custom11', NULL),
('1KX15NHS858JB6AI', 'custom11', NULL),
('1T7E55W3J182SKW7', 'custom11', NULL),
('1T7E55W3J182SKW7', 'Direct', 'Labore.'),
('1T7E55W3J182SKW7', 'Email', 'Omnis libero.'),
('1T7E55W3J182SKW7', 'Google Adds', 'Eligendi expedita.'),
('1T7E55W3J182SKW7', 'Internet', 'Sint.'),
('22K546KA3941FL24', 'Add.Words', 'Soluta eum.'),
('22K546KA3941FL24', 'custom11', NULL),
('22K546KA3941FL24', 'Newspaper', 'Magnam.'),
('22K546KA3941FL24', 'Referral', 'Nihil aliquam.'),
('22K546KA3941FL24', 'TV Adds', 'Libero.'),
('22K546KA3941FL24', 'Word of mouth', 'Sit fugit.'),
('3C1QR8BVP2759SM9', 'Add.Words', 'Recusandae.'),
('3C1QR8BVP2759SM9', 'Bing Adds', 'Et.'),
('3C1QR8BVP2759SM9', 'custom11', NULL),
('3C1QR8BVP2759SM9', 'Newspaper', 'Eum.'),
('3C1QR8BVP2759SM9', 'TV Adds', 'Ipsam amet.'),
('3C1QR8BVP2759SM9', 'Word of mouth', 'Perferendis unde.'),
('3TD5KS12246CQ46H', 'custom11', NULL),
('3Y5N8BZSOVN6762V', 'custom11', NULL),
('424S67R67E27T674', 'custom11', NULL),
('4B58H48K9XPQFC6M', 'custom11', NULL),
('4KC15W1UYB1BY214', 'custom11', NULL),
('4KC15W1UYB1BY214', 'Direct', 'Sit.'),
('4KC15W1UYB1BY214', 'Email', 'Veritatis nisi.'),
('4KC15W1UYB1BY214', 'Google Adds', 'Nostrum eum.'),
('4KC15W1UYB1BY214', 'Internet', 'Quia omnis...'),
('4KC15W1UYB1BY214', 'Referral', 'Quo.'),
('4N96X1273H396KO7', 'custom11', NULL),
('4N96X1273H396KO7', 'Direct', 'Natus cupiditate.'),
('4N96X1273H396KO7', 'Google Adds', 'Qui.'),
('4N96X1273H396KO7', 'Internet', 'Mollitia assumenda.'),
('4QQ7G1A6OSKTED6P', 'custom11', NULL),
('4QQ7G1A6OSKTED6P', 'Direct', 'Est...'),
('4QQ7G1A6OSKTED6P', 'Email', 'Omnis nobis.'),
('4QQ7G1A6OSKTED6P', 'Internet', 'Error aperiam.'),
('4QQ7G1A6OSKTED6P', 'Newspaper', 'Iure ut.'),
('4QQ7G1A6OSKTED6P', 'Referral', 'Rerum qui.'),
('61H9S7T58G51773M', 'custom11', NULL),
('62B395L514SV47T9', 'custom11', NULL),
('68886RHCW4CAW548', 'Add.Words', 'A et.'),
('68886RHCW4CAW548', 'Bing Adds', 'Repudiandae esse.'),
('68886RHCW4CAW548', 'custom11', NULL),
('68886RHCW4CAW548', 'TV Adds', 'Voluptatem.'),
('6ZP9897561152PQI', 'custom11', NULL),
('78MXZEV1V21T3TJ3', 'custom11', NULL),
('7F9H619F7X7F4PIR', 'custom11', NULL),
('7LE8G725L9LQP734', 'custom11', NULL),
('84641IS2VLEKG3D2', 'custom11', NULL),
('84641IS2VLEKG3D2', 'Google Adds', 'Beatae est.'),
('86B6895497GRDG89', 'custom11', NULL),
('8E9OC1RHN32B66D2', 'custom11', NULL),
('936JXYL4DZ8361ZF', 'custom11', NULL),
('9665C2IB4K732V69', 'custom11', NULL),
('9T989FXQWAC4HF86', 'Add.Words', 'Minima et...'),
('9T989FXQWAC4HF86', 'Bing Adds', 'Voluptate est.'),
('9T989FXQWAC4HF86', 'custom11', NULL),
('9T989FXQWAC4HF86', 'TV Adds', 'Rerum saepe.'),
('9T989FXQWAC4HF86', 'Word of mouth', 'Itaque.'),
('B52R9SHW9F8X9XZR', 'custom11', NULL),
('E3N43B9724H3QN82', 'Bing Adds', 'Et est.'),
('E3N43B9724H3QN82', 'custom11', NULL),
('FV537R9Z18HG8R2Q', 'custom11', NULL),
('G27568IB58M3G4C3', 'custom11', NULL),
('GG7IQ4WH8692H4M7', 'custom11', NULL),
('GPEQJ44M3AUG2JEB', 'Add.Words', 'Veniam veritatis.'),
('GPEQJ44M3AUG2JEB', 'custom11', NULL),
('GPEQJ44M3AUG2JEB', 'Email', 'Sed dignissimos.'),
('GPEQJ44M3AUG2JEB', 'Newspaper', 'Laboriosam veniam...'),
('GPEQJ44M3AUG2JEB', 'Referral', 'Voluptatem minima.'),
('GPEQJ44M3AUG2JEB', 'Word of mouth', 'Sint...'),
('HPW5T88SD9466BLC', 'custom11', NULL),
('I71OBPCY22W6UXAN', 'custom11', NULL),
('I7PV45RF6262MWV5', 'custom11', NULL),
('IF9L1MOLI6P6KW3L', 'custom11', NULL),
('J736P11745XC4L26', 'Bing Adds', 'Aspernatur sed...'),
('J736P11745XC4L26', 'custom11', NULL),
('J736P11745XC4L26', 'TV Adds', 'Sit.'),
('JZ71BQ9BQ6DSITLI', 'custom11', NULL),
('L6TJZD8NV3M7L663', 'custom11', NULL),
('LH369XG252S83B9Z', 'custom11', NULL),
('LO5LBEA657JU5N53', 'custom11', NULL),
('LO5LBEA657JU5N53', 'Direct', 'Ut animi.'),
('LO5LBEA657JU5N53', 'Email', 'Voluptatibus.'),
('LO5LBEA657JU5N53', 'Newspaper', 'Ut.'),
('LO5LBEA657JU5N53', 'Referral', 'Et iste.'),
('LO5LBEA657JU5N53', 'Word of mouth', 'Nisi cum.'),
('NDJM378I15P3DO32', 'custom11', NULL),
('O4IOQ99O98112QSY', 'custom11', NULL),
('OOPH853V758R6X34', 'custom11', NULL),
('RQMJ9ZMYM8M4LM76', 'custom11', NULL),
('T43P3YU3Y1RW6E7V', 'custom11', NULL),
('W5ME5222K4542M1S', 'custom11', NULL),
('W5ME5222K4542M1S', 'Google Adds', 'Ut.'),
('W5ME5222K4542M1S', 'Internet', 'Velit...'),
('Z11Y39Q4NZ352XV9', 'custom11', NULL),
('Z12P9717PZ582XBA', 'custom11', NULL),
('Z6B527Y4PPRXLR89', 'custom11', NULL);

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

--
-- Truncate table before insert `employee_email`
--

TRUNCATE TABLE `employee_email`;
--
-- Dumping data for table `employee_email`
--

INSERT INTO `employee_email` (`employee_id`, `email`) VALUES
('15R65GD75R3N5CTE', 'RosarioCanady462@nowhere.com'),
('16F601B1B7A39B', 'Conrad_Tomlin@example.com'),
('1G11JXS77ZUD362Z', 'Levy@example.com'),
('1KX15NHS858JB6AI', 'Conrad_Tomlin@example.com'),
('1T7E55W3J182SKW7', 'MildaMclain423@example.com'),
('22K546KA3941FL24', 'MatthewWeaver@nowhere.com'),
('3C1QR8BVP2759SM9', 'Luis_Whitfield@example.com'),
('3TD5KS12246CQ46H', 'ycdxhpaj_ivto@example.com'),
('3Y5N8BZSOVN6762V', 'IsmaelAbel@example.com'),
('424S67R67E27T674', 'Meade764@example.com'),
('4B58H48K9XPQFC6M', 'norxuneu_vgshuq@nowhere.com'),
('4KC15W1UYB1BY214', 'BradSilvia@example.com'),
('4N96X1273H396KO7', 'xrlh3903@nowhere.com'),
('4QQ7G1A6OSKTED6P', 'BeverlyN16@example.com'),
('61H9S7T58G51773M', 'Simpson@nowhere.com'),
('62B395L514SV47T9', 'llevh822@example.com'),
('68886RHCW4CAW548', 'Shandra.Harder4@nowhere.com'),
('6ZP9897561152PQI', 'ArchieFeliciano@example.com'),
('78MXZEV1V21T3TJ3', 'Afton.Rice421@example.com'),
('7F9H619F7X7F4PIR', 'RayAmaya@example.com'),
('7LE8G725L9LQP734', 'Abel69@example.com'),
('84641IS2VLEKG3D2', 'CarlenaHorner324@example.com'),
('86B6895497GRDG89', 'Stidham@example.com'),
('8E9OC1RHN32B66D2', 'KittyCoats92@nowhere.com'),
('936JXYL4DZ8361ZF', 'Ailene_Place215@nowhere.com'),
('9665C2IB4K732V69', 'qjebpn60@nowhere.com'),
('9T989FXQWAC4HF86', 'Valentine.Higdon3@nowhere.com'),
('B52R9SHW9F8X9XZR', 'Acker@example.com'),
('E3N43B9724H3QN82', 'Reuben_Palumbo@example.com'),
('FV537R9Z18HG8R2Q', 'Christenson@nowhere.com'),
('G27568IB58M3G4C3', 'Desirae_Schuster@example.com'),
('GG7IQ4WH8692H4M7', 'cglk1351@example.com'),
('GPEQJ44M3AUG2JEB', 'York@example.com'),
('HPW5T88SD9466BLC', 'mzffnfrp_oercays@nowhere.com'),
('I71OBPCY22W6UXAN', 'Liane.Burger@nowhere.com'),
('I7PV45RF6262MWV5', 'Franks@example.com'),
('IF9L1MOLI6P6KW3L', 'FranklynMMcgrath@example.com'),
('J736P11745XC4L26', 'RefugioDAbel@nowhere.com'),
('JZ71BQ9BQ6DSITLI', 'Ridgeway771@example.com'),
('L6TJZD8NV3M7L663', 'Margy.Weddle77@nowhere.com'),
('LH369XG252S83B9Z', 'OmerWeber@example.com'),
('LO5LBEA657JU5N53', 'Windham@example.com'),
('NDJM378I15P3DO32', 'Kim49@nowhere.com'),
('O4IOQ99O98112QSY', 'GavinKHanlon@example.com'),
('OOPH853V758R6X34', 'Byrne@example.com'),
('RQMJ9ZMYM8M4LM76', 'AlexisSoria@example.com'),
('T43P3YU3Y1RW6E7V', 'Zarate@example.com'),
('W5ME5222K4542M1S', 'Erwin@example.com'),
('Z11Y39Q4NZ352XV9', 'Alexander.Handley82@example.com'),
('Z12P9717PZ582XBA', 'BillyAbney@example.com'),
('Z6B527Y4PPRXLR89', 'xnwikrm7@example.com');

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

--
-- Truncate table before insert `employment_status`
--

TRUNCATE TABLE `employment_status`;
--
-- Dumping data for table `employment_status`
--

INSERT INTO `employment_status` (`employment_status`) VALUES
('Contract-FullTime'),
('Contract-PartTime'),
('Freelance'),
('Permanent-FullTime'),
('Permanent-PartTime'),
('Trainee');

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

--
-- Truncate table before insert `job_title`
--

TRUNCATE TABLE `job_title`;
--
-- Dumping data for table `job_title`
--

INSERT INTO `job_title` (`job_title`, `access_level`) VALUES
('Application Engineer', 'L1'),
('Assistant', 'L2'),
('Assistant Vice President', 'L2'),
('Board Member', 'L1'),
('Branch Manager', 'L2'),
('Business Analyst', 'L2'),
('Business Coordinator', 'L2'),
('Chief Financial Officer', 'L1'),
('Chief Information Officer', 'L2'),
('Chief Technology Officer', 'L1'),
('Communication Analyst', 'L1'),
('Communication Consultant', 'L2'),
('Communication Engineer', 'L2'),
('Communication Manager', 'L1'),
('Contract Manager', 'L2'),
('Controller', 'L1'),
('Developer/Programmer', 'L2'),
('Development Engineer', 'L1'),
('Development Manager', 'L2'),
('Director of Consulting', 'L1'),
('Director of Customer Support', 'L2'),
('Director of Information Technology', 'L1'),
('Director of Manufacturing', 'L2'),
('Finance Controller', 'L1'),
('Human Resources Manager', 'L3'),
('Lead Engineer', 'L1'),
('Logistics Manager', 'L2'),
('Marketing Manager', 'L1'),
('Network Administrator', 'L2'),
('Product Manager', 'L1'),
('Project Leader', 'L1'),
('Purchasing Agent', 'L1'),
('QA Engineer', 'L1'),
('Regional Manager', 'L1'),
('Revenue Manager', 'L2'),
('Secretary', 'L2'),
('Senior Accountant', 'L2'),
('Senior Consultant', 'L2'),
('Senior Designer', 'L2'),
('Senior Specialist', 'L1'),
('Service Engineer', 'L1'),
('Specialist', 'L1'),
('Support Engineer', 'L1'),
('Support Manager', 'L1'),
('Technical  Manager', 'L1'),
('Technical Director', 'L2'),
('Technical Manager', 'L2'),
('Technical Specialist', 'L2'),
('Technician', 'L1'),
('Training Manager', 'L1'),
('Vice President', 'L2');

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

--
-- Truncate table before insert `leave`
--

TRUNCATE TABLE `leave`;
--
-- Dumping data for table `leave`
--

INSERT INTO `leave` (`employee_id`, `date`, `leave_type`, `reason`, `state`) VALUES
('1KX15NHS858JB6AI', '2019-12-31', 'Annual', 'xxx', 'pending'),
('1KX15NHS858JB6AI', '2020-01-03', 'Casual', 'reason....', 'Approved'),
('1T7E55W3J182SKW7', '2018-10-07', 'Casual', 'Aperiam tempore qui sequi.', 'Approved'),
('1T7E55W3J182SKW7', '2019-04-30', 'Annual', 'Ad aspernatur est cupiditate similique totam qui. Autem facilis.', 'Rejected'),
('1T7E55W3J182SKW7', '2019-11-06', 'No-Pay', 'Expedita labore non nulla quae sit officiis qui.', 'Approved'),
('1T7E55W3J182SKW7', '2020-02-05', 'Sicks', 'Doloremque unde exercitationem cum quaerat alias; excepturi est aut.', 'Pending'),
('22K546KA3941FL24', '2018-10-07', 'Casual', 'Unde ut sit vero molestias. Voluptas doloremque cumque? Adipisci quia.', 'Rejected'),
('22K546KA3941FL24', '2019-04-30', 'Annual', 'Libero eum consequatur quidem. Voluptatem est sint est amet natus!', 'Pending'),
('22K546KA3941FL24', '2019-11-06', 'No-Pay', 'Aliquid rem omnis ullam rerum ipsam; amet ex fugit...', 'Pending'),
('22K546KA3941FL24', '2020-02-05', 'Sicks', 'Nihil sit animi excepturi quibusdam inventore omnis. Fuga facere;', 'Rejected'),
('3C1QR8BVP2759SM9', '2018-10-07', 'Casual', 'Nesciunt ut eligendi illo.', 'Approved'),
('3C1QR8BVP2759SM9', '2019-04-30', 'Annual', 'Molestias et ratione.', 'Approved'),
('3C1QR8BVP2759SM9', '2019-11-06', 'No-Pay', 'Iste assumenda eos qui sed aut a.', 'Approved'),
('3C1QR8BVP2759SM9', '2020-02-05', 'Sicks', 'Accusantium dolores ut quas eos iure quia officiis. Minus quo.', 'Approved'),
('4KC15W1UYB1BY214', '2018-10-07', 'Casual', 'Ut odit est reiciendis qui est vitae repudiandae. Corporis aliquam rem.', 'Pending'),
('4KC15W1UYB1BY214', '2019-04-30', 'Annual', 'Ipsa quasi quia saepe in a maxime eos ipsum...', 'Approved'),
('4KC15W1UYB1BY214', '2019-11-06', 'No-Pay', 'Consequatur animi et facere et animi. Ut sit rerum doloremque ipsa sit.', 'Rejected'),
('4KC15W1UYB1BY214', '2020-02-05', 'Sicks', 'Qui ipsum laboriosam in harum repellendus perspiciatis, aut asperiores...', 'Rejected'),
('4N96X1273H396KO7', '2018-10-07', 'Casual', 'Eius et neque sit nisi vitae corrupti dolorem nulla.', 'Rejected'),
('4N96X1273H396KO7', '2019-04-30', 'Annual', 'Blanditiis molestiae aut itaque eaque.', 'Pending'),
('4N96X1273H396KO7', '2019-11-06', 'No-Pay', 'Sint modi quasi incidunt; voluptatem sit magni. Aspernatur ullam ipsam.', 'Approved'),
('4QQ7G1A6OSKTED6P', '2018-10-07', 'Casual', 'Autem soluta eos. In aut voluptate voluptatibus id nulla modi sed!', 'Pending'),
('4QQ7G1A6OSKTED6P', '2019-04-30', 'Annual', 'Expedita corporis obcaecati sit sequi illo. Aliquid tenetur voluptatem.', 'Pending'),
('4QQ7G1A6OSKTED6P', '2019-11-06', 'No-Pay', 'Minima earum veritatis quis vel quos qui sed omnis suscipit...', 'Rejected'),
('4QQ7G1A6OSKTED6P', '2020-02-05', 'Sicks', 'Officiis dolores sint officiis culpa sunt sed voluptate repellendus;', 'Rejected'),
('68886RHCW4CAW548', '2018-10-07', 'Casual', 'Aliquam perferendis ad ipsam illo consectetur repellendus aut eos;', 'Approved'),
('68886RHCW4CAW548', '2019-04-30', 'Annual', 'Veniam ipsa in quia temporibus molestiae saepe ut numquam.', 'Pending'),
('68886RHCW4CAW548', '2019-11-06', 'No-Pay', 'In et illum aut rerum veritatis.', 'Pending'),
('68886RHCW4CAW548', '2020-02-05', 'Sicks', 'Dignissimos id distinctio consequuntur praesentium iusto; unde;', 'Pending'),
('84641IS2VLEKG3D2', '2019-11-06', 'No-Pay', 'Et non omnis ipsa qui sapiente iste error. Sed velit incidunt. Sint.', 'Approved'),
('9T989FXQWAC4HF86', '2018-10-07', 'Casual', 'Unde sint autem numquam necessitatibus nihil et. Omnis fugit voluptas...', 'Approved'),
('9T989FXQWAC4HF86', '2019-04-30', 'Annual', 'Hic sit nulla expedita quo unde autem, odit alias voluptatem. Id quia.', 'Rejected'),
('9T989FXQWAC4HF86', '2019-11-06', 'No-Pay', 'Mollitia autem quia. Voluptas beatae neque error? Fugit excepturi.', 'Approved'),
('9T989FXQWAC4HF86', '2020-02-05', 'Sicks', 'Maiores exercitationem error. Fuga a illo deleniti. Voluptas ab iste!', 'Rejected'),
('E3N43B9724H3QN82', '2018-10-07', 'Casual', 'Necessitatibus illo libero dolorem consequatur quam provident.', 'Approved'),
('E3N43B9724H3QN82', '2019-04-30', 'Annual', 'Ipsa minus eaque. Magnam autem veritatis aut aliquam repellat aperiam.', 'Approved'),
('E3N43B9724H3QN82', '2020-02-05', 'Sicks', 'Veritatis excepturi perferendis. Voluptates facilis omnis praesentium.', 'Pending'),
('GPEQJ44M3AUG2JEB', '2018-10-07', 'Casual', 'Sit qui quibusdam hic nulla ut odio sit nam;', 'Approved'),
('GPEQJ44M3AUG2JEB', '2019-04-30', 'Annual', 'Quae nam nesciunt quae suscipit ratione consectetur error omnis.', 'Rejected'),
('GPEQJ44M3AUG2JEB', '2019-11-06', 'No-Pay', 'Odio et impedit qui alias ut maxime. At quis at.', 'Approved'),
('GPEQJ44M3AUG2JEB', '2020-02-05', 'Sicks', 'Rerum quia facilis autem ut vitae molestiae officiis veritatis.', 'Approved'),
('IF9L1MOLI6P6KW3L', '2020-02-05', 'Sicks', 'Unde enim eligendi. Perspiciatis possimus itaque architecto quos iste!', 'Pending'),
('J736P11745XC4L26', '2018-10-07', 'Casual', 'Sapiente animi ducimus culpa unde.', 'Pending'),
('J736P11745XC4L26', '2019-04-30', 'Annual', 'Ipsum qui vitae velit molestiae sint.', 'Pending'),
('J736P11745XC4L26', '2019-11-06', 'No-Pay', 'Quo aut officiis voluptatum quo. Qui impedit eligendi rem.', 'Pending'),
('J736P11745XC4L26', '2020-02-05', 'Sicks', 'Qui voluptas quis a repellat quam cum quos. Illum perferendis est.', 'Rejected'),
('LO5LBEA657JU5N53', '2018-10-07', 'Casual', 'Voluptatem id voluptatem architecto et aut natus. Et unde ullam.', 'Rejected'),
('LO5LBEA657JU5N53', '2019-04-30', 'Annual', 'Quae voluptas obcaecati enim cupiditate corporis eum facilis et.', 'Pending'),
('LO5LBEA657JU5N53', '2019-11-06', 'No-Pay', 'Delectus maiores rerum et labore aperiam molestias minus temporibus.', 'Pending'),
('LO5LBEA657JU5N53', '2020-02-05', 'Sicks', 'Corporis rerum dolorem consequuntur accusantium asperiores rerum.', 'Approved'),
('W5ME5222K4542M1S', '2019-04-30', 'Annual', 'Qui ut iusto minima similique rerum est. Reprehenderit et cum.', 'Approved'),
('W5ME5222K4542M1S', '2019-11-06', 'No-Pay', 'Voluptate ea magnam minima ut. Neque quia suscipit amet quos.', 'Rejected');

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
,`gender` varchar(20)
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
,`supervisor_id` varchar(50)
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

--
-- Truncate table before insert `leave_type`
--

TRUNCATE TABLE `leave_type`;
--
-- Dumping data for table `leave_type`
--

INSERT INTO `leave_type` (`leave_type`) VALUES
('Annual'),
('Casual'),
('No-Pay'),
('Sicks');

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

--
-- Truncate table before insert `organization_info`
--

TRUNCATE TABLE `organization_info`;
--
-- Dumping data for table `organization_info`
--

INSERT INTO `organization_info` (`key`, `value`) VALUES
('Address Line 1', '5454'),
('Address Line 2', 'Union Place'),
('Address Line 3', 'Colombo'),
('Anu', 'Vyr'),
('Bqlo', 'Rt'),
('Cdokgw', 'Mbwj'),
('Contact No.', '876283763232'),
('Ctlnmrjj', 'Igqabrool'),
('Diqwq', 'Aazpo'),
('Dlxetrdc', 'Kqy'),
('Dno', 'Kffcdasuuatbprjhgz'),
('Dsnjeer', 'Gdy'),
('Fju', 'Tw'),
('Gfq', 'Ssbm'),
('Ghhvr', 'Qv'),
('Gn', 'Hrs'),
('Gwjyu', 'Lq'),
('Gy', 'Mj'),
('Gyo', 'Corkto'),
('Ij', 'Ralryry'),
('Jmk', 'Sa'),
('Jxbt', 'Zg'),
('Knvfggg', 'Sfmjaba'),
('Lbcf', 'Xx'),
('Lg', 'Hkcrvvj'),
('Lm', 'Uxt'),
('Mcfh', 'Bx'),
('Name', 'Jupyter'),
('Nyx', 'Hvt'),
('Ojie', 'Add'),
('Okvdivm', 'Ue'),
('Onay', 'Bxbs'),
('Orklc', 'Zoez'),
('Osmlx', 'Zrgh'),
('Pjljtsppdvq', 'Bf'),
('Qi', 'Qdyu'),
('Reg No.', '170UYIH'),
('Rgub', 'Mlbwnpo'),
('Rs', 'Vazvgqozte'),
('Svfs', 'Kql'),
('Uyrea', 'Sa'),
('Vxthns', 'Xye'),
('Wboeip', 'Kl'),
('Wdmcfhql', 'Uuaakwh'),
('Wy', 'Cic'),
('Wzv', 'Pi'),
('Xf', 'Vldct'),
('Xmocdbap', 'Efgaiw'),
('Xppuuceufgsxq', 'Lc'),
('Ydw', 'Smxwoashotiyspa'),
('Yhqoq', 'Cdsgaac'),
('Yk', 'Hb'),
('Yynf', 'Zsqq'),
('Zmtbi', 'Kwr'),
('Zpj', 'Tomngm'),
('Zxztvilu', 'Zbvfzjqlswces');

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

--
-- Truncate table before insert `pay_grade`
--

TRUNCATE TABLE `pay_grade`;
--
-- Dumping data for table `pay_grade`
--

INSERT INTO `pay_grade` (`pay_grade`) VALUES
('Grade-1'),
('Grade-2'),
('Grade-3'),
('Grade-4');

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

--
-- Truncate table before insert `pay_grade_leave`
--

TRUNCATE TABLE `pay_grade_leave`;
--
-- Dumping data for table `pay_grade_leave`
--

INSERT INTO `pay_grade_leave` (`pay_grade`, `leave_type`, `limit`) VALUES
('Grade-1', 'Annual', 50),
('Grade-1', 'Casual', 56),
('Grade-1', 'No-Pay', 28),
('Grade-1', 'Sicks', 16),
('Grade-2', 'Annual', 7),
('Grade-2', 'Casual', 4),
('Grade-2', 'No-Pay', 45),
('Grade-2', 'Sicks', 0),
('Grade-3', 'Annual', 21),
('Grade-3', 'Casual', 47),
('Grade-3', 'No-Pay', 27),
('Grade-3', 'Sicks', 7),
('Grade-4', 'Annual', 6),
('Grade-4', 'Casual', 23),
('Grade-4', 'No-Pay', 54),
('Grade-4', 'Sicks', 40);

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

--
-- Truncate table before insert `user`
--

TRUNCATE TABLE `user`;
--
-- Dumping data for table `user`
--

INSERT INTO `user` (`employee_id`, `username`, `password`) VALUES
('1KX15NHS858JB6AI', 'username', '$2a$10$2qSoWq73HHDK3NFPp6Krz.U2wZIkXsWVxyojJjbC82rE0ZSSi593K'),
('1T7E55W3J182SKW7', 'username4', '$2a$10$iMHxWBHws3nSV75vQpGrde6PWYu.tRQCtLE6JWpkyGe5.q0RF3ASu'),
('4B58H48K9XPQFC6M', 'username2', '$2a$10$yZbubEqCsJrd.nv2ozCVP.Z3XqpQkcqQhxGOCvoYaiYq0gy4aJUTq');

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `leave_full_details`  AS  select `leave`.`employee_id` AS `employee_id`,`leave`.`date` AS `date`,`leave`.`leave_type` AS `leave_type`,`leave`.`reason` AS `reason`,`leave`.`state` AS `state`,`employee`.`first_name` AS `first_name`,`employee`.`last_name` AS `last_name`,`employee`.`nic` AS `nic`,`employee`.`gender` AS `gender`,`employee`.`addr_house_no` AS `addr_house_no`,`employee`.`addr_line_1` AS `addr_line_1`,`employee`.`addr_line_2` AS `addr_line_2`,`employee`.`addr_city` AS `addr_city`,`employee`.`dob` AS `dob`,`employee`.`marital_status` AS `marital_status`,`employee`.`employment_status` AS `employment_status`,`employee`.`active_status` AS `active_status`,`employee`.`job_title` AS `job_title`,`employee`.`dept_name` AS `dept_name`,`employee`.`pay_grade` AS `pay_grade`,`employee`.`supervisor_id` AS `supervisor_id` from (`leave` left join `employee` on((`leave`.`employee_id` = `employee`.`employee_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `user_access`
--
DROP TABLE IF EXISTS `user_access`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_access`  AS  select `user`.`employee_id` AS `employee_id`,`user`.`username` AS `username`,`user`.`password` AS `password`,`job_title`.`access_level` AS `access_level` from ((`user` left join `employee` on((`user`.`employee_id` = `employee`.`employee_id`))) left join `job_title` on((`employee`.`job_title` = `job_title`.`job_title`))) where (`employee`.`active_status` = 1) ;

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
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`job_title`) REFERENCES `job_title` (`job_title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`employment_status`) REFERENCES `employment_status` (`employment_status`) ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`pay_grade`) REFERENCES `pay_grade` (`pay_grade`) ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`supervisor_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `employee_ibfk_6` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON UPDATE CASCADE;

--
-- Constraints for table `employee_contact_no`
--
ALTER TABLE `employee_contact_no`
  ADD CONSTRAINT `employee_contact_no_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `employee_custom_attributes`
--
ALTER TABLE `employee_custom_attributes`
  ADD CONSTRAINT `employee_custom_attributes_ibfk_1` FOREIGN KEY (`attribute`) REFERENCES `custom_attribute` (`attribute`) ON UPDATE CASCADE,
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
  ADD CONSTRAINT `leave_ibfk_2` FOREIGN KEY (`leave_type`) REFERENCES `leave_type` (`leave_type`) ON UPDATE CASCADE;

--
-- Constraints for table `pay_grade_leave`
--
ALTER TABLE `pay_grade_leave`
  ADD CONSTRAINT `pay_grade_leave_ibfk_1` FOREIGN KEY (`pay_grade`) REFERENCES `pay_grade` (`pay_grade`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pay_grade_leave_ibfk_2` FOREIGN KEY (`leave_type`) REFERENCES `leave_type` (`leave_type`) ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

DELIMITER $$
--
-- Events
--
DROP EVENT `auto_reject_expired_leave`$$
CREATE DEFINER=`root`@`localhost` EVENT `auto_reject_expired_leave` ON SCHEDULE EVERY 1 DAY STARTS '2019-12-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE `leave` SET state = 'Rejected' WHERE state = 'Pending' AND date < CURRENT_DATE$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
