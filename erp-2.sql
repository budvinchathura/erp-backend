-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2019 at 10:07 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET FOREIGN_KEY_CHECKS=0;
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
CREATE DATABASE IF NOT EXISTS `erp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `erp`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `department_leave`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `department_leave` (IN `dept` VARCHAR(20), IN `start_date` DATE, IN `end_date` DATE)  BEGIN
	SELECT employee.employee_id,`date`,`leave_type`,`reason`,`dept_name` 
    
    FROM `leave`,`employee` 
	WHERE `date` BETWEEN start_date and end_date
	and `dept_name` = dept
	order by `date`;
end$$

DROP PROCEDURE IF EXISTS `employee_leave_taken`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_leave_taken` (IN `emp_id` VARCHAR(15))  BEGIN

SELECT leave_type,`limit`,leaves_taken from (SELECT employee_id, leave_type, `limit` FROM employee NATURAL JOIN pay_grade_leave WHERE employee_id=emp_id) as s NATURAL LEFT JOIN (SELECT employee_id, leave_type, COUNT(*) as leaves_taken FROM `leave` WHERE state="approved" AND (date BETWEEN DATE(CONCAT(YEAR(CURRENT_DATE()),"-01-01"))  AND CURRENT_DATE) GROUP BY employee_id, leave_type) as t;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_attribute`
--

DROP TABLE IF EXISTS `custom_attribute`;
CREATE TABLE `custom_attribute` (
  `attribute` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `custom_attribute`
--

INSERT INTO `custom_attribute` (`attribute`) VALUES
('ADih'),
('anRDy'),
('ccrBw'),
('cunZYklDh'),
('cVbHAHfmskzqsykakhaVOZXpPxTpyPEFMBpZlGWof'),
('DAScJrAw'),
('dMYx'),
('eDdl'),
('EISZMQZZMKQvUmsA'),
('EOHVBmiOuDTjZkLbvjCHgBcAsBlZIMXBBVUislzgShjVfNSqlM'),
('fQwJUXGNsgxbRnkN'),
('FvOGIFcIdTt'),
('GAaSWYkwu'),
('GG'),
('i'),
('iCyGkUXPdcrGkucwDdFXVmukypCeayxSXekMe'),
('JnaImCtMIo'),
('jqoVUxaIxDMQpQQguRjTShnYnBusvdcueLGUyQkczdGVyGnNOP'),
('lULgACABvKTfBHucSpsTXc'),
('MqXQXcYKCEZIyJeWwPrhccJmNPYgJp'),
('OEUgoefQisqayiSGrePppZNBEkMtpSpwFaRR'),
('OjLncJEGHkXMd'),
('PcLWjdQvuGLM'),
('PEXsBBAR'),
('PQgsx'),
('pXQIFS'),
('qBvpsZmNIcxtA'),
('qeaxGPehSZRmdlGhlSgLIkQctYFhaXaMDtwKfOztdhHCsIbZFC'),
('qHQ'),
('RJmfUzGXoA'),
('RnoGQjexHlqO'),
('RU'),
('siFQeOBTLiPQDtrR'),
('sXUiWDNrADCmOjEljJWznBUDpa'),
('syTnbYruGvxgeHSQ'),
('sZPBTuqSqLYxSkTnbZsOQ'),
('t'),
('txtQP'),
('tZLKoXhVRIFPqc'),
('ugDyKUAoGbZAAAYZ'),
('uSBODmESdxaiAvBEglTn'),
('UvFkclTVnufoUf'),
('uzAnNgFSDMcliuMMmXaAixY'),
('vNIvEDSnJUMjc'),
('VVjytCTYHJxQJMAaoj'),
('WfLLljqNlM'),
('wRQAjtGGcmZdEVXrzHhd'),
('XFmdSwqEvUQjvfppFQBHmkjQiYvYYUQcVMkQE'),
('ytA'),
('ZWPAYwYDhnVDSNYWAmK');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dept_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_name`) VALUES
('Consulting'),
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
CREATE TABLE `dependent` (
  `nic` varchar(15) NOT NULL,
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

--
-- Dumping data for table `dependent`
--

INSERT INTO `dependent` (`nic`, `employee_id`, `first_name`, `last_name`, `relationship`, `addr_house_no`, `addr_line_1`, `addr_line_2`, `addr_city`, `contact_no`, `email`) VALUES
('004069830712', '39782', 'Roland', 'Wilbur', 'other', '66063', '75th Floor', 'Ellesmere Port', 'Kiowa', '0684168736', 'AbbieAbel@example.com'),
('004194855154', '75243', 'Arthur', 'Hanes', 'daughter', '92216', '8th Floor', 'Harpenden', 'Mendocino', '0075211292', 'SteinerK@example.com'),
('037264762v', '53178', 'Felicia', 'Haney', 'son', '16684', 'Nipper Building', 'Kirkby-in-Furness', 'Strong City', '0767813851', 'Jewel.Albers24@nowhere.com'),
('043167250569', '19450', 'Freeman', 'Stanton', 'mother', '73683', '5th Floor', 'Bucknall', 'Highgate Center', '0265666363', 'rfgxqoso9811@example.com'),
('081967643534', '49252', 'Carlita', 'Mckeever', 'daughter', '08208', '4th Floor', 'Penicuik', 'Kinzers', '0213324274', 'oxdngcmz8118@example.com'),
('098974109v', '91853', 'Ellis', 'Starkey', 'mother', '99120', '9th Floor', 'Shotts', 'Bigler', '0224866526', 'SeeleyJ@example.com'),
('126196225v', '25316', 'Margherita', 'Wiggins', 'other', '78811', '8th Floor', 'Budleigh Salterton', 'Highland', '0665329443', 'KimberlieCrocker@nowhere.com'),
('165688918278', '12554', 'Abraham', 'Mckee', 'daughter', '61407', '6th Floor', 'Margate', 'Kinsley', '0806175530', 'AbrahamAcevedo@example.com'),
('195130827v', '87829', 'Albertina', 'Wilburn', 'son', '02871', '69th Floor', 'Wellingborough', 'Coal City', '0726476219', 'Caballero313@example.com'),
('198062257890', '91427', 'Blair', 'Stapleton', 'daughter', '47753', '7th FL', 'Welling', 'Biggsville', '0958096443', 'Myrtle_Bernard@example.com'),
('224866526v', '65934', 'Jewel', 'Evans', 'mother', '05878', '6th Floor', 'Buckley', 'Ferrum', '0488319438', 'gndd9978@example.com'),
('233424239v', '95191', 'Josh', 'Hutchings', 'son', '84759', '9th FL', 'Bude', 'Okanogan', '0882279314', 'Killian@nowhere.com'),
('234958767v', '12831', 'Harley', 'Bowie', 'son', '73570', '97th FL', 'Eltham', 'Highland Park', '0603059784', 'AllenDupree@example.com'),
('310747444714', '11796', 'Darcey', 'Lowry', 'other', '58410', '64th Floor', 'Kington', 'Clymer', '0770936040', 'mxwygtmf_ahjpwboxdy@example.com'),
('315281793v', '97695', 'Yasmine', 'Everett', 'mother', '56582', '4th FL', 'Stoke-sub-Hamdon', 'Westland', '0133242615', 'Shayne_Britton589@example.com'),
('321963833v', '73086', 'Desirae', 'Abrams', 'other', '22491', '7th FL', 'Kinlochleven', 'Okahumpka', '0024118542', 'Dennis@example.com'),
('353173549052', '57980', 'Fritz', 'Wilbanks', 'son', '77180', '50th FL', 'Stone', 'Highland Falls', '0435340921', 'Raynor8@example.com'),
('389360407975', '98918', 'Cornell', 'Hanks', 'father', '76493', '7th Floor', 'Shrewsbury', 'Westminster Station', '0192634551', 'Rudolph_Abel@nowhere.com'),
('414273437357', '91981', 'Glenn', 'Wilcox', 'son', '43874', '9th FL', 'Cleckheaton', 'Stronghurst', '0216795751', 'Diehl764@nowhere.com'),
('427887987v', '11427', 'Maddie', 'Pemberton', 'mother', '32716', '4th FL', 'Kinross', 'Westley', '0956668959', 'Sipes449@example.com'),
('430747496v', '73979', 'Latoya', 'Abraham', 'son', '91577', '7th FL', 'Ellesmere', 'Menard', '0818979421', 'Ivan.Southern98@example.com'),
('450817360v', '37873', 'Patience', 'Wiese', 'other', '78567', '5th Floor', 'Harlow', 'Mendenhall', '0618350147', 'AlessandraNMckenzie72@example.com'),
('463011450082', '96821', 'Rebecka', 'Mckenney', 'mother', '61584', '4th FL', 'Penrhyndeudraeth', 'Fessenden', '0040737879', 'Daily37@example.com'),
('466248744v', '49673', 'Aurelia', 'Hutcheson', 'mother', '81524', '74th Floor', 'Kingussie', 'Coachella', '0898640240', 'GregoryMurrell@example.com'),
('516973559v', '80270', 'Mittie', 'Hutchins', 'daughter', '88425', '6th Floor', 'Builth Wells', 'Richland Center', '0923083970', 'ReaReyna391@nowhere.com'),
('518390448440', '48708', 'Olimpia', 'Bower', 'other', '65033', '61th FL', 'Cleadon', 'Richgrove', '0679286411', 'Shanta.Beaver89@nowhere.com'),
('545915210v', '78096', 'Brent', 'Handy', 'daughter', '79788', '9th Floor', 'Market Drayton', 'Kinta', '0846140004', 'Violette_Maxey368@example.com'),
('578434389613', '27381', 'Tanner', 'Abney', 'other', '69679', '64th FL', 'Ballymoney', 'Zuni', '0470523426', 'Alarcon@example.com'),
('583016361v', '83937', 'Alfonso', 'Bowens', 'mother', '79736', '7th Floor', 'Wedmore', 'Kinsman', '0058534473', 'Palmer_Lofton@example.com'),
('601259949v', '65154', 'Rico', 'Handley', 'mother', '38626', '79th Floor', 'Ballynahinch', 'Bigfork', '0520879879', 'Adaline_Abbott@example.com'),
('650229927226', '48851', 'Selena', 'Pena', 'father', '85777', '41th Floor', 'Bungay', 'Westminster', '0171424510', 'AddieTrice329@example.com'),
('674294361v', '27438', 'Wally', 'Ewing', 'father', '32006', '95th Floor', 'Ellon', 'Okarche', '0106623449', 'Oliva_Caskey572@example.com'),
('687443188498', '12641', 'Jason', 'Stanley', 'daughter', '04644', '79th FL', 'Shipley', 'Menahga', '0113695257', 'Abernathy@example.com'),
('701292229v', '49031', 'Adrianne', 'Loyd', 'other', '78119', '96th FL', 'Penmaenmawr', 'Coal Center', '0897410903', 'Batson@example.com'),
('729086995v', '69351', 'Cristobal', 'Ezell', 'other', '71766', '9th Floor', 'Buntingford', 'Festus', '0938351633', 'Mcnamara616@example.com'),
('751607055610', '03179', 'Dong', 'Hankins', 'mother', '54144', '4th FL', 'Banff', 'Biglerville', '0870924114', 'mcvgy02@example.com'),
('751687363v', '23539', 'Clint', 'Abreu', 'mother', '59445', '41th FL', 'Wednesbury', 'Kintnersville', '0903450954', 'Abbie.Watts@example.com'),
('757092411460', '61469', 'Anglea', 'Everhart', 'daughter', '11888', '42th Floor', 'Bamburgh', 'Menasha', '0758644647', 'Sanderson@example.com'),
('781370829v', '92568', 'Kelley', 'Evers', 'father', '34808', '7th FL', 'Cleator', 'Kirbyville', '0297229927', 'uvrguf247@nowhere.com'),
('813851167749', '18486', 'Oren', 'Starling', 'daughter', '57360', '7th Floor', 'Cleator Moor', 'Highland Mills', '0307800197', 'Nannie_Farr@nowhere.com'),
('837560210956', '99830', 'Jesus', 'Pelletier', 'daughter', '94604', '96th FL', 'Marianglas', 'Biggs', '0122742126', 'Darell_Centeno27@example.com'),
('871118274751', '22638', 'Cleo', 'Bowers', 'son', '93779', '62th FL', 'Shipston-on-Stour', 'Ferrysburg', '0967184483', 'Shifflett@example.com'),
('903450954236', '51365', 'Samuel', 'Starks', 'father', '28231', '84th Floor', 'Banchory', 'Strong', '0900184657', 'Monty.Swan5@nowhere.com'),
('912055105223', '52663', 'Elijah', 'Hand', 'son', '29568', '6th FL', 'Buckingham', 'Clyde', '0444670349', 'Bauer@example.com'),
('915365279v', '03179', 'Adolph', 'Peltier', 'son', '26041', '9th FL', 'Banbury', 'Mendham', '0092076979', 'Tiffanie.Romero27@nowhere.com'),
('921269680v', '74078', 'Britt', 'Mckenna', 'daughter', '06419', '9th FL', 'Shoreham-by-Sea', 'Fertile', '0842809051', 'Gable@example.com'),
('930498944v', '67589', 'Reinaldo', 'Eubanks', 'son', '68850', '5th FL', 'Ystrad Meurig', 'Mena', '0443196961', 'Jude_High169@example.com'),
('933579084v', '48685', 'Rodney', 'Wicks', 'son', '45926', '6th Floor', 'Pencader', 'Kinston', '0329149249', 'Steve.A.Pape@nowhere.com'),
('992212558v', '60676', 'Agustin', 'Loy', 'son', '15252', '7th FL', 'Stoke Newington', 'Richland', '0555405341', 'mivxztrm_txjxxsw@example.com'),
('993997484053', '15938', 'Ada', 'Staples', 'son', '28252', '93th Floor', 'Banbridge', 'Stringtown', '0662487448', 'Maness@nowhere.com');

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contact`
--

DROP TABLE IF EXISTS `emergency_contact`;
CREATE TABLE `emergency_contact` (
  `nic` varchar(15) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `employee_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emergency_contact`
--

INSERT INTO `emergency_contact` (`nic`, `name`, `contact_no`, `employee_id`) VALUES
('055569615v', 'Mccloskey', '0964144424', '87829'),
('069258762709', 'Mcmahan', '0871721454', '15938'),
('083844850v', 'Shepherd', '0788169493', '48851'),
('117077059574', 'Vanburen', '0414576220', '96821'),
('136137355v', 'Mcmahon', '0594054433', '74078'),
('153856628v', 'Vallejo', '0511003845', '99830'),
('184598085v', 'Perales', '0165069258', '83937'),
('194143734662', 'Ambrose', '0615858074', '11427'),
('212628756v', 'Perreault', '0347542651', '18486'),
('236753403057', 'Perez', '0241844969', '09929'),
('270950423v', 'Gracia', '0459587490', '78096'),
('323831270622', 'Perrin', '0556961507', '91981'),
('324117214v', 'Mcclendon', '0967501035', '49673'),
('327387365115', 'Mcclintock', '0586829356', '80270'),
('328877675671', 'Mclendon', '0081226513', '48708'),
('331039992v', 'Kirkland', '0787706837', '97695'),
('349689707v', 'Perdue', '0644531868', '19450'),
('381280064526', 'Mcmanus', '0810209234', '49031'),
('387706837v', 'Ames', '0167647164', '27438'),
('419244516590', 'Mclemore', '0430372933', '12641'),
('425421261207', 'Mcmaster', '0582148579', '12831'),
('426483541885', 'Graf', '0385326373', '37873'),
('442003251825', 'Mclaurin', '0580787909', '12554'),
('442690459v', 'Peralta', '0102527476', '48685'),
('474873108v', 'Shelley', '0586495832', '73979'),
('477511003v', 'Shelton', '0002562140', '60676'),
('487449837v', 'Dukes', '0578409264', '69351'),
('492982753641', 'Grady', '0084074512', '22638'),
('514706558736', 'Mccloud', '0288140693', '03179'),
('549843739v', 'Shephard', '0508841186', '51365'),
('579986158v', 'Vance', '0974371061', '53178'),
('580740382v', 'Van', '0404699251', '91853'),
('602856870405', 'Kirkpatrick', '0070827536', '25316'),
('615243899593', 'Valle', '0067034699', '11796'),
('617227789000', 'Kirkwood', '0617381703', '39782'),
('642014134v', 'Mclean', '0070767940', '27381'),
('708288140693', 'Dugger', '0766408150', '61469'),
('709949678v', 'Mcleod', '0709504234', '73086'),
('717381703v', 'Duke', '0043456959', '23539'),
('750103587v', 'Brooks', '0305753812', '75243'),
('767183724266', 'Mcclelland', '0799409825', '65934'),
('768100256v', 'Pepper', '0059547291', '52663'),
('838149415586', 'Bronson', '0143734662', '65154'),
('863219850000', 'Perkins', '0947645651', '91427'),
('894925868v', 'Kiser', '0710297208', '92568'),
('899971821v', 'Sheppard', '0300368826', '98918'),
('905686406918', 'Shepard', '0078677745', '57980'),
('951276957189', 'Kirk', '0022522451', '67589'),
('957645651762', 'Valles', '0139974984', '49252'),
('995658307509', 'Pereira', '0581925030', '95191');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_id` varchar(15) NOT NULL,
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
  `supervisor_id` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `nic`, `addr_house_no`, `addr_line_1`, `addr_line_2`, `addr_city`, `dob`, `marital_status`, `employment_status`, `active_status`, `job_title`, `dept_name`, `pay_grade`, `supervisor_id`) VALUES
('03179', 'Alanna', 'Russo', '615015491v', 'PO Box 288', '7th FL', 'Mannford', 'Oakhurst', '1949-02-27', 'Married', 'Permanent-FT', 1, 'Sales Agent', 'Facilities', 'Grade-1', '27381'),
('09929', 'Dwain', 'Costa', '114182682743', 'PO Box 5434', '78th Floor', 'Whitmire', 'Reese', '1951-06-04', 'Married', 'Contract-FT', 1, 'Communication Analyst', 'Information Technology', 'Grade-1', '74078'),
('11427', 'Hope', 'Seward', '828423408v', 'PO Box 40', '63th FL', 'Zuni', 'Ark', '1957-04-22', 'Married', 'Contract-PT', 1, 'Technical Consultant', 'Sales', 'Grade-4', '11427'),
('11796', 'Leif', 'Boisvert', '763112738225', 'P.O. Box 13', '85th FL', 'Jamestown', 'Eastpointe', '1990-03-12', 'Married', 'Contract-PT', 1, 'Revenue Manager', 'Manufacturing', 'Grade-2', '78096'),
('12554', 'Cody', 'Shackelford', '221138971553', 'PO Box 180', '48th FL', 'Pavillion', 'Cape Coral', '1998-01-16', 'Married', 'Permanent-PT', 1, 'QA Manager', 'Operations', 'Grade-1', '15938'),
('12641', 'Raven', 'Owens', '190319162v', 'PO Box 3', '52th FL', 'San Juan Bautista', 'Eastsound', '1949-09-01', 'Single', 'Permanent-PT', 1, 'Commercial Manager', 'Facilities', 'Grade-1', '27438'),
('12831', 'Lindsey', 'Fife', '127381159v', 'PO Box 1', '8th FL', 'Pauline', 'Zuni', '1969-07-09', 'Married', 'Contract-FT', 1, 'Developer/Programmer', 'Executive', 'Grade-2', '96821'),
('15938', 'Sonny', 'Mattox', '222531675v', 'P.O. Box 82881', '73th FL', 'Cuba', 'Greenbelt', '1988-10-24', 'Divorced', 'Trainee', 1, 'Channel Sales Manager', 'Facilities', 'Grade-4', '61469'),
('18486', 'Lester', 'Tyner', '210014305v', 'P.O. Box 16261', '52th FL', 'San Juan', 'Seligman', '1949-01-02', 'Married', 'Contract-FT', 1, 'Technology Manager', 'Research and Development', 'Grade-1', '91853'),
('19450', 'Jamel', 'Tyson', '969715350v', 'P.O. Box 3656', '4th FL', 'Manning', 'Trumbull County', '1954-07-23', 'Divorced', 'Contract-FT', 1, 'Contract Advisor', 'Consulting', 'Grade-1', '75243'),
('22638', 'Kent', 'Sexton', '125546515419', 'P.O. Box 6', '50th Floor', 'Bernardston', 'Greenbrae', '1971-05-21', 'Single', 'Contract-PT', 1, 'Chief Executive Officer', 'Sales', 'Grade-3', '91853'),
('23539', 'Maynard', 'Figueroa', '182958817v', 'PO Box 1', '84th Floor', 'San Jose', 'Oakham', '1955-12-01', 'Married', 'Permanent-FT', 1, 'Revenue Manager', 'Facilities', 'Grade-4', '65934'),
('25316', 'Jonah', 'Rushing', '982531724v', 'PO Box 25', '7th Floor', 'Bernard', 'Oakes', '1950-09-08', 'Divorced', 'Freelance', 1, 'Trainer/Consultant', 'Executive', 'Grade-1', '60676'),
('27381', 'Rayford', 'Turney', '038589566409', 'P.O. Box 24', '9th Floor', 'Forrest City', 'Canyonville', '1981-03-12', 'Married', 'Contract-PT', 1, 'Trainer/Consultant', 'Information Technology', 'Grade-3', '25316'),
('27438', 'Chandra', 'Turpin', '921969519151', 'P.O. Box 6283', '56th FL', 'Clawson', 'Eastpoint', '1950-07-21', 'Married', 'Contract-PT', 1, 'Secretary', 'Finance', 'Grade-1', '49673'),
('37873', 'Ferne', 'Costello', '100226955715', 'P.O. Box 892', '91th FL', 'Pavilion', 'Mosca', '1949-04-08', 'Married', 'Contract-FT', 1, 'Chief Financial Officer', 'Human Resources', 'Grade-2', '49673'),
('39782', 'Cordell', 'Russell', '760457285v', 'P.O. Box 128', '8th Floor', 'Bernardsville', 'Lehigh', '1950-09-15', 'Single', 'Freelance', 1, 'Revenue Manager', 'Consulting', 'Grade-4', '25316'),
('48685', 'Bernard', 'Bohn', '623712893v', 'P.O. Box 62320', '7th FL', 'Jamesport', 'Reedsburg', '1993-04-21', 'Married', 'Permanent-FT', 1, 'Engineer', 'Manufacturing', 'Grade-1', '11427'),
('48708', 'Antonia', 'Kelso', '379903139782', 'P.O. Box 59', '4th Floor', 'Sunapee', 'Morrow', '1954-03-12', 'Married', 'Contract-FT', 1, 'Technical Writer', 'Research and Development', 'Grade-4', '18486'),
('48851', 'Kelsi', 'Boland', '694479676672', 'P.O. Box 975', '9th Floor', 'Cudahy', 'Morton Grove', '1987-02-19', 'Single', 'Trainee', 1, 'Budget Analyst', 'Human Resources', 'Grade-2', '98918'),
('49031', 'Karine', 'Seymore', '880262321v', 'P.O. Box 26', '44th FL', 'Sunbury', 'Morton', '1978-09-06', 'Married', 'Permanent-FT', 1, 'Commercial Director', 'Marketing', 'Grade-2', '49673'),
('49252', 'Adan', 'Kemp', '769480516418', 'PO Box 46484', '8th FL', 'Clay Center', 'Cape Canaveral', '1950-10-09', 'Married', 'Freelance', 1, 'Budget Analyst', 'Research and Development', 'Grade-2', '12641'),
('49673', 'Bernardina', 'Tuttle', '663940219769', 'PO Box 78798', '86th Floor', 'Pauls Valley', 'Morse', '1958-04-08', 'Married', 'Trainee', 1, 'Computer Operator', 'Information Technology', 'Grade-3', '48851'),
('51365', 'Isaac', 'Russ', '620892081v', 'P.O. Box 4', '6th FL', 'San Jacinto', 'Oakfield', '1957-10-24', 'Divorced', 'Freelance', 1, 'Purchasing Agent', 'Human Resources', 'Grade-1', '73086'),
('52663', 'Terry', 'Coles', '935092102281', 'PO Box 961', '70th FL', 'Paullina', 'Trumann', '1952-05-24', 'Married', 'Contract-FT', 1, 'Budget Analyst', 'Manufacturing', 'Grade-2', '98918'),
('53178', 'Chana', 'Owen', '522915439515', 'P.O. Box 45125', '74th Floor', 'Paulsboro', 'Arkansas City', '1965-04-08', 'Single', 'Permanent-FT', 1, 'Revenue Manager', 'Customer Support', 'Grade-4', '98918'),
('57980', 'Jodee', 'Mauro', '247214899v', 'P.O. Box 2359', '9th FL', 'Whitney', 'Greenbush', '1950-01-18', 'Single', 'Trainee', 1, 'Director of Finance', 'Customer Support', 'Grade-2', '53178'),
('60676', 'Randolph', 'Overby', '638643937v', 'P.O. Box 225', '71th Floor', 'Forreston', 'Selden', '1979-01-09', 'Married', 'Permanent-FT', 1, 'Chief Executive Officer', 'Executive', 'Grade-2', '39782'),
('61469', 'David', 'Seymour', '619249406v', 'PO Box 495', '55th FL', 'Clay City', 'Lehigh Acres', '1982-02-02', 'Single', 'Contract-PT', 1, 'Business Analyst', 'Operations', 'Grade-2', '15938'),
('65154', 'Alex', 'Fincher', '183782620v', 'PO Box 713', '54th FL', 'Berne', 'Reform', '1983-11-28', 'Married', 'Contract-FT', 1, 'Technical Writer', 'Consulting', 'Grade-2', '48851'),
('65934', 'Adaline', 'Overton', '563838047655', 'PO Box 3880', '55th Floor', 'Forsyth', 'Trumansburg', '1971-07-12', 'Married', 'Permanent-FT', 1, 'Budget Analyst', 'Consulting', 'Grade-3', '48851'),
('67589', 'Kim', 'Mattson', '967322638v', 'PO Box 4054', '40th FL', 'Whitinsville', 'Leflore', '1977-02-26', 'Single', 'Permanent-FT', 1, 'Purchasing Agent', 'Finance', 'Grade-4', '91427'),
('69351', 'Adria', 'Finch', '550657906v', 'P.O. Box 7', '9th Floor', 'Forsyth County', 'Cape Charles', '1949-01-05', 'Divorced', 'Permanent-PT', 1, 'Budget Analyst', 'Manufacturing', 'Grade-1', '65934'),
('73086', 'Theron', 'Kendall', '490005154919', 'P.O. Box 528', '2nd FL', 'Suncook', 'Arlee', '1949-02-23', 'Single', 'Permanent-PT', 1, 'Sales Consultant', 'Information Technology', 'Grade-4', '99830'),
('73979', 'Gerry', 'Sewell', '617200670v', 'PO Box 59', '7th Floor', 'San Joaquin', 'Leggett', '1949-01-06', 'Divorced', 'Trainee', 1, 'Business Analyst', 'Human Resources', 'Grade-2', '65934'),
('74078', 'Kathey', 'Maupin', '240312618731', 'PO Box 35', '3rd Floor', 'Manly', 'Lehi', '1987-01-09', 'Married', 'Contract-FT', 1, 'Research Engineer', 'Executive', 'Grade-1', '60676'),
('75243', 'Adah', 'Cosgrove', '256620908v', 'PO Box 68', '74th Floor', 'Mankato', 'Arkadelphia', '1949-01-31', 'Married', 'Freelance', 0, 'Senior Business Analyst', 'Human Resources', 'Grade-3', '95191'),
('78096', 'Jean', 'Mauldin', '317848851184', 'P.O. Box 526', '50th FL', 'Whitman', 'Oakesdale', '1949-01-14', 'Married', 'Permanent-PT', 1, 'Commercial Manager', 'Facilities', 'Grade-1', '51365'),
('80270', 'Kent', 'Collado', '961642955v', 'PO Box 43', '60th FL', 'Whitmore Lake', 'Lehigh Valley', '1972-03-04', 'Married', 'Freelance', 1, 'Communication Manager', 'Manufacturing', 'Grade-4', '52663'),
('83937', 'Alfonzo', 'Bolden', '208931051v', 'P.O. Box 67', '4th FL', 'Claymont', 'Moses Lake', '1993-10-31', 'Married', 'Trainee', 1, 'Chief Technology Officer', 'Customer Support', 'Grade-4', '19450'),
('87829', 'Kizzy', 'Tyree', '912842586220', 'PO Box 49', '9th FL', 'Jamesville', 'Trumbull', '1987-11-30', 'Married', 'Permanent-FT', 0, 'Technical Editor', 'Research and Development', 'Grade-4', '11427'),
('91427', 'Adolph', 'Tyler', '508393709v', 'P.O. Box 334', '5th FL', 'Manlius', 'Selfridge', '1958-05-27', 'Single', 'Contract-FT', 1, 'Chief Financial Officer', 'Executive', 'Grade-4', '12641'),
('91853', 'Felisa', 'Coley', '396459050v', 'P.O. Box 8', 'Keith Building', 'Sunbright', 'Reedsville', '1994-01-18', 'Divorced', 'Contract-PT', 1, 'Director of Finance', 'Operations', 'Grade-3', '57980'),
('91981', 'Deedra', 'Severson', '280851871v', 'PO Box 7280', '61th Floor', 'Bernalillo', 'Truman', '1961-11-04', 'Single', 'Trainee', 1, 'Research Engineer', 'Information Technology', 'Grade-4', '97695'),
('92568', 'Rachele', 'Kemper', '323932030282', 'P.O. Box 7793', '8th Floor', 'Cuba City', 'Greenbrier', '1950-08-28', 'Married', 'Freelance', 0, 'Controller', 'Information Technology', 'Grade-2', '11427'),
('95191', 'Vincenzo', 'Overstreet', '669351614v', 'P.O. Box 946', '6th FL', 'Clay', 'Reedsport', '1986-11-30', 'Married', 'Contract-PT', 1, 'Communication Manager', 'Sales', 'Grade-1', '48685'),
('96821', 'Elwood', 'Coleman', '682112831919', 'PO Box 6309', '87th Floor', 'Manitowoc', 'Selbyville', '1993-10-22', 'Married', 'Contract-FT', 1, 'Human Resources Representative', 'Research and Development', 'Grade-2', '52663'),
('97695', 'Ronda', 'Rust', '609218512v', 'PO Box 23', '4th Floor', 'Cuero', 'Selinsgrove', '1987-02-19', 'Single', 'Contract-PT', 0, 'Human Resources Representative', 'Marketing', 'Grade-3', '52663'),
('98918', 'Charolette', 'Kelsey', '655266373979', 'PO Box 3412', '8th FL', 'Jameson', 'Capac', '1951-07-04', 'Divorced', 'Freelance', 0, 'Secretary', 'Executive', 'Grade-4', '49673'),
('99830', 'Reatha', 'Maurer', '476509382085', 'PO Box 75', '94th Floor', 'Jamison', 'Eastport', '1957-06-15', 'Single', 'Freelance', 1, 'Solution Engineer', 'Manufacturing', 'Grade-4', '91853');

-- --------------------------------------------------------

--
-- Table structure for table `employee_contact_no`
--

DROP TABLE IF EXISTS `employee_contact_no`;
CREATE TABLE `employee_contact_no` (
  `employee_id` varchar(15) NOT NULL,
  `contact_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_contact_no`
--

INSERT INTO `employee_contact_no` (`employee_id`, `contact_no`) VALUES
('03179', '0272485069'),
('09929', '0162731579'),
('11427', '0104082334'),
('11796', '0420892912'),
('12554', '0928461241'),
('12641', '0263019517'),
('12831', '0096765387'),
('15938', '0459668013'),
('18486', '0229672464'),
('19450', '0253161339'),
('22638', '0158899567'),
('23539', '0170934015'),
('25316', '0869083368'),
('27381', '0545755371'),
('27438', '0462322395'),
('37873', '0170206081'),
('39782', '0361010898'),
('48685', '0977521719'),
('48708', '0362334161'),
('48851', '0008863920'),
('49031', '0829710577'),
('49252', '0173184366'),
('49673', '0911598312'),
('51365', '0509822077'),
('52663', '0412702664'),
('53178', '0922399441'),
('57980', '0419558861'),
('60676', '0816750813'),
('61469', '0519929452'),
('65154', '0947828148'),
('65934', '0527221778'),
('67589', '0926354476'),
('69351', '0520812404'),
('73086', '0697408422'),
('73979', '0193038327'),
('74078', '0071181319'),
('75243', '0865015179'),
('78096', '0777719958'),
('80270', '0876683082'),
('83937', '0680830021'),
('87829', '0596067381'),
('91427', '0322402463'),
('91853', '0799258456'),
('91981', '0896015727'),
('92568', '0602170032'),
('95191', '0120221155'),
('96821', '0246425785'),
('97695', '0421538791'),
('98918', '0816087596'),
('99830', '0359381772');

-- --------------------------------------------------------

--
-- Table structure for table `employee_custom_attributes`
--

DROP TABLE IF EXISTS `employee_custom_attributes`;
CREATE TABLE `employee_custom_attributes` (
  `employee_id` varchar(15) NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_email`
--

DROP TABLE IF EXISTS `employee_email`;
CREATE TABLE `employee_email` (
  `employee_id` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_email`
--

INSERT INTO `employee_email` (`employee_id`, `email`) VALUES
('03179', 'WilburnDiehl75@nowhere.com'),
('09929', 'HolderV@nowhere.com'),
('11427', 'ntsrxqve_lbqpg@example.com'),
('11796', 'BobetteBain@example.com'),
('12554', 'Natasha.IHomer@example.com'),
('12641', 'Theodora.Stock@example.com'),
('12831', 'Tempie_Means@nowhere.com'),
('15938', 'AllanOconner@example.com'),
('18486', 'ShizueCambell85@example.com'),
('19450', 'BereniceAbbott@example.com'),
('22638', 'Ezequiel.Cummings@example.com'),
('23539', 'BrunoAltman94@nowhere.com'),
('25316', 'Adalberto.Fox41@example.com'),
('27381', 'Varney@nowhere.com'),
('27438', 'Whitehead356@example.com'),
('37873', 'LouisGross396@example.com'),
('39782', 'AgnusAli@nowhere.com'),
('48685', 'Pennington494@example.com'),
('48708', 'KenethGee@example.com'),
('48851', 'Cornell255@example.com'),
('49031', 'JeannieAbney@nowhere.com'),
('49252', 'Criswell@nowhere.com'),
('49673', 'Lombardo@example.com'),
('51365', 'Valentin@example.com'),
('52663', 'Elrod67@nowhere.com'),
('53178', 'Shannon@nowhere.com'),
('57980', 'BeckyK_Gaddis@example.com'),
('60676', 'Lennon96@example.com'),
('61469', 'Carey@nowhere.com'),
('65154', 'Compton@example.com'),
('65934', 'rouqq3066@nowhere.com'),
('67589', 'tllnvs9090@example.com'),
('69351', 'Clair_Dorsey@example.com'),
('73086', 'RudolphDejesus593@nowhere.com'),
('73979', 'Adena.Flynn8@example.com'),
('74078', 'MilfordWBarbosa1@nowhere.com'),
('75243', 'Woodbury@example.com'),
('78096', 'Newton_Martins@example.com'),
('80270', 'Gagne@example.com'),
('83937', 'HathawayC825@nowhere.com'),
('87829', 'Bourne1@example.com'),
('91427', 'Lewandowski79@example.com'),
('91853', 'IleneBynum@example.com'),
('91981', 'Abbie_Kroll762@example.com'),
('92568', 'Abernathy@nowhere.com'),
('95191', 'bidysns0@example.com'),
('96821', 'Willett6@nowhere.com'),
('97695', 'Hilary.U_Andrus@nowhere.com'),
('98918', 'HurdE@example.com'),
('99830', 'DelmySchuler94@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `employment_status`
--

DROP TABLE IF EXISTS `employment_status`;
CREATE TABLE `employment_status` (
  `employment_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employment_status`
--

INSERT INTO `employment_status` (`employment_status`) VALUES
('Contract-FT'),
('Contract-PT'),
('Freelance'),
('Permanent-FT'),
('Permanent-PT'),
('Trainee');

-- --------------------------------------------------------

--
-- Table structure for table `job_title`
--

DROP TABLE IF EXISTS `job_title`;
CREATE TABLE `job_title` (
  `job_title` varchar(50) NOT NULL,
  `access_level` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_title`
--

INSERT INTO `job_title` (`job_title`, `access_level`) VALUES
('Assistant Vice President', 'L2'),
('Budget Analyst', 'L2'),
('Business Analyst', 'L2'),
('Channel Sales Manager', 'L2'),
('Chief Executive Officer', 'L2'),
('Chief Financial Officer', 'L2'),
('Chief Technology Officer', 'L2'),
('Commercial Director', 'L2'),
('Commercial Manager', 'L1'),
('Communication Analyst', 'L2'),
('Communication Manager', 'L2'),
('Computer Operator', 'L2'),
('Consultant', 'L1'),
('Contract Advisor', 'L2'),
('Contract Manager', 'L2'),
('Controller', 'L1'),
('Developer/Programmer', 'L2'),
('Director of Customer Support', 'L1'),
('Director of Finance', 'L2'),
('Engineer', 'L1'),
('Human Resources Representative', 'L2'),
('Lead Engineer', 'L2'),
('Marketing Consultant', 'L1'),
('Product Manager', 'L2'),
('Project Coordinator', 'L2'),
('Purchasing Agent', 'L2'),
('QA Manager', 'L1'),
('Regional Director', 'L2'),
('Research Engineer', 'L1'),
('Revenue Manager', 'L1'),
('Sales Administrator', 'L1'),
('Sales Agent', 'L1'),
('Sales Consultant', 'L2'),
('Secretary', 'L1'),
('Security Manager', 'L2'),
('Senior Business Analyst', 'L1'),
('Senior Consultant', 'L2'),
('Senior Specialist', 'L1'),
('Shop Assistant', 'L2'),
('Site Manager', 'L2'),
('Solution Engineer', 'L2'),
('Specialist', 'L2'),
('Support Manager', 'L2'),
('Technical Consultant', 'L1'),
('Technical Editor', 'L1'),
('Technical Writer', 'L1'),
('Technology Manager', 'L2'),
('Trainer/Consultant', 'L1'),
('Vice President', 'L2'),
('Web Designer', 'L2');

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--

DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave` (
  `employee_id` varchar(15) NOT NULL,
  `date` date NOT NULL,
  `leave_type` varchar(20) NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `state` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave`
--

INSERT INTO `leave` (`employee_id`, `date`, `leave_type`, `reason`, `state`) VALUES
('03179', '2019-02-02', 'Annual', 'Eum autem amet. Dolor illum ratione.', 'approved'),
('09929', '2018-02-06', 'Annual', 'Suscipit sed quidem. Ullam accusantium.', 'pending'),
('11427', '2018-02-11', 'No-Pay', 'Recusandae incidunt amet. Ipsa quo.', 'rejected'),
('11796', '2018-01-26', 'Sick', 'Enim iste et; nisi non ducimus.', 'pending'),
('12554', '2018-01-02', 'Casual', 'Voluptates cupiditate laborum.', 'approved'),
('12641', '2018-01-08', 'No-Pay', 'Ducimus qui minima. Aliquid numquam.', 'approved'),
('12831', '2018-02-19', 'Casual', 'Saepe deserunt neque. Est beatae!', 'pending'),
('15938', '2018-01-23', 'Annual', 'Voluptatem aliquam dolore. Voluptatem.', 'rejected'),
('18486', '2018-02-01', 'Sick', 'Error fuga aspernatur. Perspiciatis!', 'rejected'),
('19450', '2018-01-15', 'No-Pay', 'Alias magni autem laboriosam.', 'pending'),
('22638', '2018-02-18', 'No-Pay', 'Laudantium vel exercitationem. Ex.', 'approved'),
('23539', '2018-01-31', 'Annual', 'Autem non autem. Corporis qui natus.', 'rejected'),
('25316', '2018-01-28', 'Casual', 'Iste ipsa vitae. Ipsa obcaecati quas.', 'approved'),
('27381', '2018-01-18', 'Sick', 'Neque expedita suscipit. Possimus.', 'rejected'),
('27438', '2018-02-16', 'Annual', 'Consequatur quia aut. Voluptatem illo?', 'rejected'),
('37873', '2018-01-19', 'Casual', 'Quia maiores perspiciatis.', 'rejected'),
('39782', '2018-01-03', 'No-Pay', 'Tenetur eos minus. Sit incidunt est.', 'rejected'),
('48685', '2018-02-07', 'Annual', 'Error aut saepe.', 'pending'),
('48708', '2018-02-14', 'Annual', 'Omnis sit dolores. Sit nobis aut!', 'rejected'),
('48851', '2018-01-27', 'Annual', 'Consequatur sit amet. Dolorem.', 'pending'),
('49031', '2018-02-09', 'Casual', 'Rerum amet ut. Quod eligendi quibusdam.', 'pending'),
('49252', '2018-02-05', 'Sick', 'Quis blanditiis quia; eveniet voluptas.', 'approved'),
('49673', '2018-02-15', 'Casual', 'Dolor sit porro. Ducimus unde quo?', 'rejected'),
('51365', '2018-01-24', 'Annual', 'Quisquam quo soluta. Eveniet a nemo.', 'rejected'),
('52663', '2018-02-03', 'Sick', 'Et sunt nostrum; ducimus quae ut.', 'rejected'),
('53178', '2018-01-07', 'Annual', 'Modi quibusdam veritatis. Repellendus.', 'rejected'),
('57980', '2018-01-21', 'No-Pay', 'Quo eos natus. Harum sunt provident.', 'rejected'),
('60676', '2018-01-20', 'No-Pay', 'Perspiciatis labore dolore. Deleniti?', 'approved'),
('61469', '2018-01-10', 'Sick', 'Doloremque tenetur tempore; veniam est.', 'rejected'),
('65154', '2018-01-12', 'Annual', 'Officiis rerum nostrum. Laudantium!', 'pending'),
('65934', '2018-01-22', 'Annual', 'Aut tempora qui. Esse ut optio; nihil.', 'approved'),
('67589', '2018-01-17', 'Sick', 'Beatae sit minus qui.', 'pending'),
('69351', '2018-02-04', 'No-Pay', 'Aut qui deserunt. Veniam natus nemo?', 'rejected'),
('73086', '2018-01-11', 'Sick', 'Sit inventore error. Dolores et odio?', 'rejected'),
('73979', '2018-02-13', 'Sick', 'Eius rerum recusandae. Omnis.', 'pending'),
('74078', '2018-02-08', 'No-Pay', 'Cum fugit id. Hic ex vel! Quis ad quod.', 'pending'),
('75243', '2018-01-29', 'No-Pay', 'Culpa ut explicabo non omnis error.', 'rejected'),
('78096', '2018-02-17', 'Sick', 'Natus nesciunt consequatur. Ullam?', 'pending'),
('80270', '2018-01-25', 'No-Pay', 'Omnis sed sint; sint magni animi.', 'rejected'),
('83937', '2018-01-09', 'Sick', 'Est velit animi. Consectetur.', 'rejected'),
('87829', '2018-01-30', 'Annual', 'In magni distinctio. Et architecto!', 'approved'),
('91427', '2018-01-04', 'Sick', 'Dolor non sunt. Cum facere nulla! Et...', 'rejected'),
('91853', '2018-02-10', 'Annual', 'Aut magnam voluptate. Ut et aliquid.', 'pending'),
('91981', '2018-01-16', 'Sick', 'Accusamus repellendus aliquid. Eveniet!', 'pending'),
('92568', '2018-01-05', 'Sick', 'Ut hic labore. Eos rem rerum! In.', 'approved'),
('95191', '2018-01-01', 'Casual', 'Ipsum iste non. Velit voluptatem;', 'rejected'),
('96821', '2018-02-12', 'No-Pay', 'Dolorum et corporis. Autem et quis!', 'pending'),
('97695', '2018-01-13', 'Casual', 'Similique doloremque natus; asperiores?', 'approved'),
('98918', '2018-01-14', 'Casual', 'Ullam aspernatur voluptates; omnis.', 'pending'),
('99830', '2018-01-06', 'No-Pay', 'Suscipit tempora eius. Omnis qui quam.', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `leave_type`
--

DROP TABLE IF EXISTS `leave_type`;
CREATE TABLE `leave_type` (
  `leave_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave_type`
--

INSERT INTO `leave_type` (`leave_type`) VALUES
('Annual'),
('Casual'),
('No-Pay'),
('Sick');

-- --------------------------------------------------------

--
-- Table structure for table `organization_info`
--

DROP TABLE IF EXISTS `organization_info`;
CREATE TABLE `organization_info` (
  `key` varchar(50) NOT NULL,
  `value` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization_info`
--

INSERT INTO `organization_info` (`key`, `value`) VALUES
('1', '2)'),
('3', '4'),
('5', '6'),
('Address', 'cdrWAzGATxj'),
('Email', 'wCzmEWHKzXW'),
('Name', 'IgVQTGJJDNC'),
('Reg-No', 'JbxynIxyDw'),
('Telephone', 'JdkwYyPutRv');

-- --------------------------------------------------------

--
-- Table structure for table `pay_grade`
--

DROP TABLE IF EXISTS `pay_grade`;
CREATE TABLE `pay_grade` (
  `pay_grade` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
CREATE TABLE `pay_grade_leave` (
  `pay_grade` varchar(20) NOT NULL,
  `leave_type` varchar(20) NOT NULL,
  `limit` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pay_grade_leave`
--

INSERT INTO `pay_grade_leave` (`pay_grade`, `leave_type`, `limit`) VALUES
('Grade-1', 'Annual', 60),
('Grade-1', 'Casual', 11),
('Grade-1', 'No-Pay', 12),
('Grade-1', 'Sick', 85),
('Grade-2', 'Annual', 76),
('Grade-2', 'Casual', 57),
('Grade-2', 'No-Pay', 58),
('Grade-2', 'Sick', 41),
('Grade-3', 'Annual', 16),
('Grade-3', 'Casual', 86),
('Grade-3', 'No-Pay', 72),
('Grade-3', 'Sick', 43),
('Grade-4', 'Annual', 86),
('Grade-4', 'Casual', 80),
('Grade-4', 'No-Pay', 99),
('Grade-4', 'Sick', 56);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `employee_id` varchar(15) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`employee_id`, `username`, `password`) VALUES
('03179', 'username', '$2a$10$fnWe6eEdNUxK3FlzzS0AieJWrUlwGFJr0kAQZc3UqYQwAJvS6zb7e');

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_access`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `user_access`;
CREATE TABLE `user_access` (
`employee_id` varchar(15)
,`username` varchar(50)
,`password` varchar(100)
,`access_level` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `user_access`
--
DROP TABLE IF EXISTS `user_access`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_access`  AS  select `user`.`employee_id` AS `employee_id`,`user`.`username` AS `username`,`user`.`password` AS `password`,`job_title`.`access_level` AS `access_level` from ((`user` left join `employee` on((`user`.`employee_id` = `employee`.`employee_id`))) left join `job_title` on((`employee`.`job_title` = `job_title`.`job_title`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `custom_attribute`
--
ALTER TABLE `custom_attribute`
  ADD PRIMARY KEY (`attribute`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_name`);

--
-- Indexes for table `dependent`
--
ALTER TABLE `dependent`
  ADD PRIMARY KEY (`nic`,`employee_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD PRIMARY KEY (`nic`,`employee_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `job_title` (`job_title`),
  ADD KEY `employment_status` (`employment_status`),
  ADD KEY `pay_grade` (`pay_grade`),
  ADD KEY `supervisor_id` (`supervisor_id`),
  ADD KEY `dept_name` (`dept_name`);

--
-- Indexes for table `employee_contact_no`
--
ALTER TABLE `employee_contact_no`
  ADD PRIMARY KEY (`employee_id`,`contact_no`);

--
-- Indexes for table `employee_custom_attributes`
--
ALTER TABLE `employee_custom_attributes`
  ADD PRIMARY KEY (`employee_id`,`attribute`),
  ADD KEY `attribute` (`attribute`);

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
  ADD PRIMARY KEY (`employee_id`,`date`,`leave_type`),
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
  ADD PRIMARY KEY (`key`);

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
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
