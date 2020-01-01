-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2020 at 09:40 PM
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

--
-- Truncate table before insert `admin`
--

TRUNCATE TABLE `admin`;
--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `email`, `access_level`) VALUES
('username', '$2a$10$Vmgl57CY5MYI4fGrkog.COAgjZ9oB2QQOw8PEX2HqaEjO/Fm08Xzq', 'abc@example.com', 'Admin');

--
-- Truncate table before insert `custom_attribute`
--

TRUNCATE TABLE `custom_attribute`;
--
-- Dumping data for table `custom_attribute`
--

INSERT INTO `custom_attribute` (`attribute`) VALUES
('Group'),
('Nationality'),
('Sub Group');

--
-- Truncate table before insert `department`
--

TRUNCATE TABLE `department`;
--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_name`) VALUES
('Consulting'),
('Customer Support'),
('Executive'),
('Facilities'),
('Fashion Design'),
('Finance'),
('Human Resources'),
('Information Technology'),
('Manufacturing'),
('Marketing'),
('Operations'),
('Research and Development'),
('Sales');

--
-- Truncate table before insert `dependent`
--

TRUNCATE TABLE `dependent`;
--
-- Dumping data for table `dependent`
--

INSERT INTO `dependent` (`nic`, `employee_id`, `first_name`, `last_name`, `relationship`, `addr_house_no`, `addr_line_1`, `addr_line_2`, `addr_city`, `contact_no`, `email`) VALUES
('192145323949', 'D8M152S83B9ZI73', 'Bev', 'Livingston', 'Daughter', '4', '5th FL', 'Unit 34-39, Ground F', 'Clarkson', '218-0050475', 'JacquelyneCheek789@example.com'),
('192189822715', '6T4W68VJ38I2LWA', 'Eric', 'Howell', 'Son', '9', '5th Floor', 'Railway Arch 5', 'Wildwood', '+652568215800', 'ValarieRuby@nowhere.com'),
('192249863943', 'GZ619466BLC8E96', 'Jessie', 'Park', 'Mother', '946', '9th FL', 'Suite 29', 'Olmsted Falls', '9366745286', 'ymtk6233@example.com'),
('192527249312', 'GD75R3N5CTELH37', 'Kimiko', 'Culpepper', 'Father', '84', '4th Floor', 'Railway Arch 4', 'Moose Lake', '+600629448167', 'ShakitaBlackmon@example.com'),
('192598782869', '7GX4RNV3APTT3TO', 'Adriana', 'Houston', 'Daughter', '8', '8th FL', 'Railway Arch 68B', 'Eveleth', '3659293265', 'Schneider@example.com'),
('192746264161', 'JE1Z6215A16857', 'Rachell', 'Chong', 'Father', '46', 'Plaza Building', 'Railway Arch 97A', 'Olive Hill', '648-4126036', 'cqkx89@nowhere.com'),
('194326991971', 'JFE8G725L9LQP7', 'Allen', 'Yarbrough', 'Father', '21', '51th FL', '', 'Wildomar', '+809156182800', 'Velasquez2@nowhere.com'),
('194599313355', '3ZFX7WFD1WQ27IZ', 'Weston', 'Howe', 'Other', '038', '6th Floor', 'Railway Arch 3', 'Clarksdale', '5340784958', 'Abbott@example.com'),
('194672471939', 'KT46M89K7MAN3YZ', 'Laurence', 'Christian', 'Father', '629', '48th Floor', 'Railway Arch 2C', 'Le Sueur', '5464845648', 'Fitzgerald@example.com'),
('195129793355', '1ZUF9U4U3V45RF9', 'Kenton', 'Betts', 'Other', '561', '6th FL', 'Suite 76', 'Rio Rico', '635-4713033', 'KristopherAbel@example.com'),
('195892237487', '9R9NK99QD67PW5', 'Allen', 'Betancourt', 'Mother', '985', '7th Floor', 'Flats 3-7', 'Mooseheart', '8557520081', 'MargaritoUAugust@nowhere.com'),
('195948228829', 'H9TX2V6962B395', 'Adela', 'Parker', 'Mother', '866', '91th Floor', 'Unit A3A, Ground Flo', 'Hayfield', '392-3284072', 'Vanesa_Chism314@nowhere.com'),
('196662242286', 'XZ1VJ4ALT58R6XK', 'Catherina', 'Franklin', 'Son', '621', '9th FL', 'Railway Arch 8', 'Evarts', '163-4942485', 'Jerold_Overstreet872@example.com'),
('197848137744', 'E9F6BQA34REY2S7', 'Freddie', 'Best', 'Father', '4', '69th FL', 'Railway Arch 7', 'Rio Linda', '+881449464380', 'BradleyX.Short89@example.com'),
('197961778136', '31AF73Z352XV995', 'Adam', 'Lively', 'Other', '514', '8th Floor', 'Railway Arch 7', 'Hayes Center', '319-9226313', 'Martino@example.com'),
('198622636251', 'S4N96X1273H3961', 'Arthur', 'Beverly', 'Mother', '884', '2nd FL', 'Railway Arch 60A', 'Clarksville', '+260595525204', 'Tracey_Bunch429@example.com'),
('198737755476', '9WVPU49G7QHDIF8', 'Pamila', 'Parish', 'Daughter', '050', '257 Towers Building', 'Railway Arch 24', 'Rio Hondo', '4874568669', 'zhmjzjpe.wssz@nowhere.com'),
('198916211789', '24H3QN82IF9L1M', 'Kareem', 'Swift', 'Daughter', '725', '4th Floor', 'Railway Arch 6C', 'Rio Oso', '4059108660', 'RaisaBooker@example.com'),
('199117853488', '3WM9J7852F3T6PT', 'Tommy', 'Lloyd', 'Father', '03', '6th FL', 'Flats 4-6', 'Olivia', '4858133987', 'Christinia.Pritchard9@nowhere.com'),
('199375675724', 'ED6PLO5LBEA657N', 'Scottie', 'Sykes', 'Daughter', '8', '45th FL', 'Railway Arch 5', 'Rio Verde', '5574777092', 'Gifford7@example.com'),
('199489685186', '2DBVK1NSNM812OB', 'Vania', 'Culver', 'Other', '963', '3rd FL', 'Flat 12', 'Olivet', '0680615156', 'CyrilCrawford372@example.com'),
('199922934155', '6A657QRR764KF6K', 'Harry', 'Mccrary', 'Father', '858', '62th FL', 'Railway Arch 7B', 'Oliver Springs', '238-1426700', 'ksvr43@example.com'),
('201887467276', 'IO4IOQ99O981121', 'Bradly', 'Christenson', 'Other', '634', '97th FL', 'Flat 1', 'Clarkston', '453-2797587', 'Henry18@example.com'),
('202712831379', 'J39521A3D579IL1', 'Harry', 'Howland', 'Other', '2', '6th FL', 'Flat 24', 'Everett', '668-3385479', 'LaticiaEStarkey@nowhere.com'),
('202768376649', '49W85174RX1J6RO', 'Reggie', 'Frantz', 'Father', '9', '4th Floor', 'Arch 1', 'Susanville', '+932844643130', 'AdrianYanez291@example.com'),
('203297538742', 'JZ71BQ9BQ6DSITP', 'Lorrine', 'Littleton', 'Son', '5', '75th Floor', 'Railway Arch 99', 'Berkeley Springs', '337-2712966', 'King@example.com'),
('204179572156', 'L6WU531NGEKRPZ', 'Abigail', 'Bethel', 'Other', '99', '8th Floor', 'Suite 63', 'Everest', '4246202596', 'ChantelleAcevedo82@example.com'),
('204383728694', '73O2P6F76SIC9UO', 'Penney', 'Parkinson', 'Daughter', '327', '90th Floor', 'Railway Arch 5', 'Mora', '+742604978758', 'Chung_B_Milner@example.com'),
('204879467166', 'W9A4111U813717', 'Wayne', 'Betz', 'Father', '625', '6th Floor', 'Railway Arch 2A', 'Lead Hill', '2794960216', 'Abbott392@example.com'),
('204951813594', '2EPEKTL636A3QN9', 'Isaac', 'Yates', 'Mother', '389', '8th FL', 'Railway Arch 69', 'Surry', '875-7182205', 'obzfhvfe.dkgluf@example.com'),
('205113353114', 'P9897561152PQIM', 'Charlene', 'Franks', 'Father', '7', '5th FL', 'Railway Arch 3', 'Le Roy', '8196555017', 'Guzman698@example.com'),
('205168267484', '527Y4PPRXLR8916', 'Victoria', 'Mccreary', 'Father', '047', '5th FL', 'Railway Arch 4', 'Berlin', '+491686958166', 'IlanaAdkins@example.com'),
('205241616552', 'Y4YTBLD4M5V3DG4', 'Jackson', 'Chow', 'Daughter', '823', '6th Floor', 'Railway Arch 6', 'Berkley', '2021210142', 'rsvme0@example.com'),
('205263916126', '7MZGX7J3736P11U', 'Abel', 'Howard', 'Mother', '04', '7th FL', 'Arch 5', 'Wildrose', '6602136249', 'AmosTijerina48@example.com'),
('205348426636', '941FL243C1QR8BJ', 'Etha', 'Swisher', 'Mother', '2', '42th FL', 'Flats A-E', 'Evensville', '3649415639', 'Abbott@example.com'),
('205729965118', '71RGT1644NME7B', 'Carmelina', 'Swenson', 'Mother', '247', '4th FL', 'Suite 1', 'Le Mars', '4797553292', 'CharissaJSchmid55@example.com'),
('206345214711', 'ZV7E21396Q6YL8G', 'Adalberto', 'Christianson', 'Daughter', '2', '6th Floor', 'Railway Arch 4', 'Rio Vista', '081-5621758', 'Burchett439@example.com'),
('206516619476', 'SJ44S4C696PB7L4', 'Thresa', 'Bethea', 'Mother', '29', '7th FL', '', 'Hayesville', '5371078886', 'Nanette_Marble@example.com'),
('206612285745', 'R38M1MML8Y6W58', 'Sandy', 'Yazzie', 'Daughter', '1', '7th Floor', 'Railway Arch 83C', 'Rio Rancho', '+565167653398', 'Leigh_Saucedo429@example.com'),
('206628722992', 'MOU913Y9M68J753', 'Mariann', 'Locke', 'Daughter', '832', '5th FL', 'Railway Arch 9', 'Olney', '1248335249', 'Christian8@example.com'),
('206683355573', '3M3TD5KS12246C', 'Cheryle', 'Christiansen', 'Son', '104', '95th FL', 'Flat 3', 'Wilkesboro', '318-5124648', 'PenaO93@example.com'),
('206961199742', '71NZ6Y1CXW62Z1', 'Kenneth', 'Mccracken', 'Mother', '112', '3rd Floor', 'Railway Arch 1', 'Hayes', '960-5761804', 'Abney3@nowhere.com'),
('207136258486', 'B5JM3Y6RNQ2L9H2', 'Ulrike', 'Mccray', 'Mother', '853', '4th FL', 'Suite 2', 'Moosic', '9531949920', 'Herrmann@example.com'),
('207215859577', 'KW74KC15W1UYB1T', 'Randal', 'Christensen', 'Daughter', '8', 'APT 993', '', 'Berkshire', '5647682306', 'Chaya_O.Abel751@nowhere.com'),
('207366627371', 'RC3DB69N1TXCZS', 'Emilio', 'Houser', 'Father', '975', '77th Floor', '', 'Zuni', '+339033869729', 'ArndtY74@nowhere.com'),
('208183938446', 'WZNPE62G8MIFFOB', 'Christian', 'Ybarra', 'Mother', '0', '80th Floor', 'Flats 3-6', 'Moosup', '2370303574', 'Tobin55@nowhere.com'),
('208515832816', 'EGT6744B58H48K5', 'Nicolle', 'Switzer', 'Father', '35', '61th FL', 'Flat 66', 'Wilkes Barre', '860-0383678', 'Marvel.Knott3@nowhere.com'),
('208852733124', '84641IS2VLEKG3M', 'Delbert', 'Howerton', 'Son', '5', '9th FL', 'Railway Arch 81B', 'Lead', '+353181989479', 'CarrollWhelan@example.com'),
('208983428542', 'G219X6A6PN51Q5O', 'Tobias', 'Littlejohn', 'Mother', '4', '72th Floor', 'Railway Arch 7', 'Surrey', '228-9465773', 'Cushman@nowhere.com'),
('767887656', '193FC492I7P34C7', 'Chamika', 'Pasan', 'Son', '45', '2nd Floor', 'Sumanadasa Building', 'UoM', '08890905645', 'chamika@example.com');

--
-- Truncate table before insert `emergency_contact`
--

TRUNCATE TABLE `emergency_contact`;
--
-- Dumping data for table `emergency_contact`
--

INSERT INTO `emergency_contact` (`nic`, `name`, `contact_no`, `employee_id`) VALUES
('190262268524', 'Thaddäus Kittel', '8511848669', '6A657QRR764KF6K'),
('191636485565', 'Priska Wolf', '435-9715296', 'GZ619466BLC8E96'),
('192213054216', 'Marlena Hirschmann', '9411904430', '1ZUF9U4U3V45RF9'),
('192548164718', 'Mareke Metzger', '518-4429246', 'KW74KC15W1UYB1T'),
('193118125976', 'Peider icolai', '+941591142794', 'WZNPE62G8MIFFOB'),
('193673529967', 'Burkhart Köstlin', '9782531784', 'E9F6BQA34REY2S7'),
('193877012390', 'Thankmar otmann', '+710919223839', '7MZGX7J3736P11U'),
('193893554338', 'Phöbe Kauer', '817-9350921', '24H3QN82IF9L1M'),
('194385363585', 'Askanja ockenhaupt', '+849588178756', 'R38M1MML8Y6W58'),
('194396244976', 'Elimar Blumentahl', '+476311273822', 'D8M152S83B9ZI73'),
('194734266789', 'Balian  einhold', '7155321837', '527Y4PPRXLR8916'),
('194816452880', 'Vishna Albrecht', '+183692949031', '3ZFX7WFD1WQ27IZ'),
('194947352594', 'Purple orgen', '+819450839370', '2EPEKTL636A3QN9'),
('195601219734', 'Adolina  Ulbricht', '+189629697153', 'ZV7E21396Q6YL8G'),
('195722701623', 'Erkhild Abich', '+351584512687', 'RC3DB69N1TXCZS'),
('196033940604', 'Wilfried Bülow', '6429556766', 'B5JM3Y6RNQ2L9H2'),
('198094994928', 'Heico Lamprecht', '3455296766', 'EGT6744B58H48K5'),
('198648090058', 'Tamija Lerch', '6253167524', '9WVPU49G7QHDIF8'),
('199065070993', 'Gunde Bering', '1336518717', '71NZ6Y1CXW62Z1'),
('199295712361', 'Otger Bruner', '+580762620892', 'Y4YTBLD4M5V3DG4'),
('199504424849', 'Berngar Glasenap', '0262321982', 'L6WU531NGEKRPZ'),
('199626947398', 'Christl abst', '1867589606', '71RGT1644NME7B'),
('199793407668', 'Annalisa Engelke', '2281461720', 'GD75R3N5CTELH37'),
('199877313540', 'Freimuth Heckler', '670-5663940', 'P9897561152PQIM'),
('200584110517', 'Freda Dörner', '721-6530319', 'W9A4111U813717'),
('200604637644', 'Rolanda Horkheimer', '+823541476550', '6T4W68VJ38I2LWA'),
('201260603525', 'Seraja Siegel', '3421549106', 'H9TX2V6962B395'),
('201585247488', 'Wigand Abert', '+508245260921', 'ED6PLO5LBEA657N'),
('201630755042', 'Merisa Zenner', '137-5851747', '49W85174RX1J6RO'),
('202506954022', 'Herward Manstein', '552-7268401', '7GX4RNV3APTT3TO'),
('202675634589', 'Christl Kantor', '+199563412914', '2DBVK1NSNM812OB'),
('203452006462', 'Walther Feldkamp', '+435804892259', '73O2P6F76SIC9UO'),
('203619313720', 'Baldur  Simmel', '282-8506352', 'KT46M89K7MAN3YZ'),
('204431183610', 'Felipa Heitsch', '7168274328', 'IO4IOQ99O981121'),
('204751857028', 'Abbeygail  chlechter', '063-0893105', 'J39521A3D579IL1'),
('204763417842', 'Felipa Dahrendorf', '+692967189573', 'S4N96X1273H3961'),
('205484769931', 'Hademar Brandt', '682-3331314', 'XZ1VJ4ALT58R6XK'),
('205641283412', 'Merwin Stuchenberg', '4868548708', 'JFE8G725L9LQP7'),
('205704399430', 'Dörk Drechsler', '512-5221138', 'MOU913Y9M68J753'),
('205876060293', 'Briska Lichtenstein', '+603627918464', '941FL243C1QR8BJ'),
('206917919807', 'Neidhart Felder', '914-8016593', '3WM9J7852F3T6PT'),
('207300880035', 'Plektrudis Heidemann', '2718021767', 'JE1Z6215A16857'),
('208214392754', 'Kensie ack', '6427182172', '84641IS2VLEKG3M'),
('208248600576', 'Brisko Kleinermann', '369-1796492', 'JZ71BQ9BQ6DSITP'),
('208321064715', 'Erwald Felder', '5686593423', '31AF73Z352XV995'),
('209196894105', 'Berenike Eichenwald', '+166746253919', 'SJ44S4C696PB7L4'),
('209401105417', 'Winfried John', '+705749716764', '9R9NK99QD67PW5'),
('209455053600', 'Annalise Abich', '915-0711902', '3M3TD5KS12246C'),
('209672865626', 'Hadewin Kesselhut', '+196852191513', 'G219X6A6PN51Q5O'),
('87687686', 'Anjala Dilhara', '6633887766', '193FC492I7P34C7');

--
-- Truncate table before insert `employee`
--

TRUNCATE TABLE `employee`;
--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `nic`, `gender`, `addr_house_no`, `addr_line_1`, `addr_line_2`, `addr_city`, `dob`, `marital_status`, `employment_status`, `active_status`, `job_title`, `dept_name`, `pay_grade`, `supervisor_id`) VALUES
('16F626FE5B0219', 'John', 'Doe', '87674523V', 'Male', '555', 'Temple Rd', 'Katubedda', 'Moratuwa', '1950-06-01', 'Married', 'Contract - FullTime', 1, 'Human Resources Manager', 'Human Resources', 'Grade-4', '16F626FE5B0219'),
('193FC492I7P34C7', 'Consuelo', 'Faber', '207951497493', 'Male', '660', '9th Floor', 'Railway Arch 99', 'Williams Bay', '1960-01-10', 'Married', 'Permanent-PartTime', 1, 'Logistics Manager', 'Consulting', 'Grade-4', '16F626FE5B0219'),
('1ZUF9U4U3V45RF9', 'Claude', 'Blais', '203605581256', 'Male', '36', '72th FL', 'Railway Arch 50B', 'Eliot', '1976-09-13', 'Single', 'Contract-PartTime', 1, 'Director of Manufacturing', 'Finance', 'Grade-4', 'KW74KC15W1UYB1T'),
('24H3QN82IF9L1M', 'Zackary', 'Clemmons', '194807942769', 'Male', '40', '8th Floor', 'Flats 4-6', 'Haddon Heights', '1996-03-03', 'Single', 'Trainee', 1, 'Technical  Manager', 'Facilities', 'Grade-3', '6A657QRR764KF6K'),
('2DBVK1NSNM812OB', 'Adalberto', 'Larue', '190385825204', 'Female', '435', '69th FL', 'Flats 3-6', 'Loogootee', '1960-02-07', 'Married', 'Freelance', 1, 'Business Coordinator', 'Consulting', 'Grade-3', '9WVPU49G7QHDIF8'),
('2EPEKTL636A3QN9', 'Miki', 'Hermann', '207510315029', 'Female', '408', '7th FL', 'Railway Arch 96C', 'Lookeba', '1998-12-21', 'Single', 'Trainee', 1, 'Director of Consulting', 'Consulting', 'Grade-1', 'WZNPE62G8MIFFOB'),
('31AF73Z352XV995', 'Spencer', 'Valles', '201094356645', 'Male', '80', 'First Security Build', 'Railway Arch 45C', 'Williams', '1975-05-23', 'Married', 'Contract-PartTime', 1, 'App. Engineer', 'Information Technology', 'Grade-4', '16F626FE5B0219'),
('3M3TD5KS12246C', 'Mitchell', 'Lash', '203654652011', 'Female', '561', '8th Floor', 'Railway Arch 7', 'Colon', '2002-11-20', 'Married', 'Permanent-FullTime', 1, 'Controller', 'Information Technology', 'Grade-4', 'R38M1MML8Y6W58'),
('3WM9J7852F3T6PT', 'Jazmin', 'Shelley', '201890464753', 'Male', '5', '56th Floor', 'Flat 4', 'Block Island', '1967-01-07', 'Married', 'Freelance', 1, 'Assistant', 'Human Resources', 'Grade-2', '9WVPU49G7QHDIF8'),
('3ZFX7WFD1WQ27IZ', 'Suzi', 'Fain', '201274575103', 'Male', '31', '7th Floor', 'Flats 1-7', 'Newbury Park', '1993-06-28', 'Single', 'Permanent-PartTime', 1, 'Technical  Manager', 'Consulting', 'Grade-1', '6A657QRR764KF6K'),
('49W85174RX1J6RO', 'Zetta', 'Hannah', '206259431248', 'Male', '359', '45th FL', 'Railway Arch 9', 'Newburyport', '1960-01-14', 'Married', 'Contract - FullTime', 1, 'Chief Information Officer', 'Customer Support', 'Grade-3', '193FC492I7P34C7'),
('527Y4PPRXLR8916', 'Jacqulyn', 'Shephard', '193620519999', 'Female', '2', '83th Floor', 'Unit 31-47', 'Suwanee', '1960-01-06', 'Single', 'Trainee', 1, 'Training Manager', 'Consulting', 'Grade-4', '24H3QN82IF9L1M'),
('6A657QRR764KF6K', 'Allen', 'Shepard', '200993687023', 'Female', '900', '6th FL', 'Railway Arch 97', 'Housatonic', '2001-07-06', 'Married', 'Permanent-FullTime', 1, 'Communication Manager', 'Information Technology', 'Grade-1', 'J39521A3D579IL1'),
('6T4W68VJ38I2LWA', 'Myrtis', 'Cleveland', '200887447160', 'Male', '21', 'Bartlett Bldg', 'Arch 23', 'Haddonfield', '2000-07-12', 'Single', 'Permanent-FullTime', 1, 'Regional Manager', 'Executive', 'Grade-3', 'ED6PLO5LBEA657N'),
('71NZ6Y1CXW62Z1', 'Millie', 'Blair', '208784630475', 'Female', '2', '94th Floor', 'Suite 19', 'Elida', '1961-04-09', 'Married', 'Permanent-PartTime', 1, 'Senior Designer', 'Human Resources', 'Grade-2', '71RGT1644NME7B'),
('71RGT1644NME7B', 'Kim', 'Herbert', '205800216083', 'Female', '81', '54th FL', '', 'Porterville', '1991-01-16', 'Single', 'Permanent-FullTime', 1, 'Development Engineer', 'Facilities', 'Grade-2', 'KT46M89K7MAN3YZ'),
('73O2P6F76SIC9UO', 'Maragaret', 'Shelton', '203313593577', 'Female', '4', '91th FL', 'Suite 56', 'Hackettstown', '1960-01-04', 'Single', 'Freelance', 0, 'Communication Engineer', 'Consulting', 'Grade-1', 'JE1Z6215A16857'),
('7GX4RNV3APTT3TO', 'Santo', 'Blakely', '207251333804', 'Female', '6', '6th Floor', 'Unit 23-39, Level 2', 'Elizabeth', '1961-09-13', 'Single', 'Contract-PartTime', 1, 'Regional Manager', 'Information Technology', 'Grade-1', 'H9TX2V6962B395'),
('7MZGX7J3736P11U', 'Graig', 'Heredia', '207558071962', 'Male', '1', '65th FL', '', 'Elgin', '1977-12-16', 'Married', 'Permanent-PartTime', 1, 'Vice President', 'Consulting', 'Grade-4', 'B5JM3Y6RNQ2L9H2'),
('84641IS2VLEKG3M', 'Trent', 'Hanes', '196683280238', 'Male', '382', '7th FL', 'Flats 3-8', 'Eleva', '1997-04-02', 'Married', 'Permanent-FullTime', 1, 'Technical Manager', 'Research and Development', 'Grade-1', 'S4N96X1273H3961'),
('941FL243C1QR8BJ', 'Abbie', 'Hankins', '206231433959', 'Male', '533', '8th Floor', 'Railway Arch 8', 'Elfers', '1960-01-01', 'Single', 'Freelance', 1, 'Business Analyst', 'Manufacturing', 'Grade-4', '2DBVK1NSNM812OB'),
('9R9NK99QD67PW5', 'Adah', 'Blaine', '209212883892', 'Male', '8', '65th FL', 'Unit 4-9', 'Newburg', '1960-01-04', 'Married', 'Freelance', 1, 'Director of Manufacturing', 'Customer Support', 'Grade-1', 'ED6PLO5LBEA657N'),
('9WVPU49G7QHDIF8', 'Myron', 'Van', '195065411619', 'Male', '754', '53th FL', 'Flats 1-7', 'Newburgh', '1960-02-21', 'Divorced', 'Contract-PartTime', 1, 'QA Engineer', 'Manufacturing', 'Grade-1', '9WVPU49G7QHDIF8'),
('B5JM3Y6RNQ2L9H2', 'Sebastian', 'Blackwood', '191962857175', 'Male', '042', '77th FL', 'Railway Arch 20', 'Blomkest', '1960-01-06', 'Married', 'Contract-PartTime', 1, 'Chief Information Officer', 'Research and Development', 'Grade-1', '6A657QRR764KF6K'),
('D8M152S83B9ZI73', 'Jerold', 'Fahey', '205539577915', 'Female', '627', '84th Floor', '', 'Newbury', '1979-08-09', 'Single', 'Contract-PartTime', 1, 'Business Coordinator', 'Consulting', 'Grade-2', 'KW74KC15W1UYB1T'),
('E9F6BQA34REY2S7', 'Korey', 'Ezell', '202863873600', 'Female', '8', '8th FL', 'Arch 7', 'Colome', '1999-07-12', 'Single', 'Permanent-FullTime', 1, 'Technical  Manager', 'Finance', 'Grade-3', '9WVPU49G7QHDIF8'),
('ED6PLO5LBEA657N', 'Christen', 'Vallejo', '204878518354', 'Male', '575', '5th Floor', 'Railway Arch 3', 'Lonsdale', '1967-09-17', 'Married', 'Trainee', 0, 'Product Manager', 'Human Resources', 'Grade-4', '9WVPU49G7QHDIF8'),
('EGT6744B58H48K5', 'Celina', 'Hanley', '205291198557', 'Female', '5', '71th FL', 'Railway Arch 32B', 'Houston', '1965-09-10', 'Married', 'Contract - FullTime', 1, 'App. Engineer', 'Manufacturing', 'Grade-2', '9WVPU49G7QHDIF8'),
('G219X6A6PN51Q5O', 'Adolph', 'Vanburen', '206916580767', 'Female', '5', '62th FL', 'Unit 32-36, Ground F', 'Lookout', '1974-03-08', 'Married', 'Trainee', 1, 'Finance Controller', 'Customer Support', 'Grade-2', 'JFE8G725L9LQP7'),
('GD75R3N5CTELH37', 'Ada', 'Clevenger', '199474104218', 'Male', '751', '52th FL', 'Railway Arch 4', 'Bloomfield Hills', '1961-11-14', 'Divorced', 'Permanent-PartTime', 1, 'Contract Manager', 'Operations', 'Grade-1', '193FC492I7P34C7'),
('GZ619466BLC8E96', 'Scott', 'Clemons', '208299055482', 'Male', '615', '57th Floor', 'Railway Arch 23C', 'Porthill', '1961-03-10', 'Single', 'Contract-PartTime', 1, 'Finance Controller', 'Operations', 'Grade-1', 'JZ71BQ9BQ6DSITP'),
('H9TX2V6962B395', 'Allan', 'Fagan', '201745019376', 'Male', '9', 'STE 214', 'Railway Arch 4', 'Colonia', '1960-01-03', 'Single', 'Contract-PartTime', 1, 'Controller', 'Information Technology', 'Grade-4', '71NZ6Y1CXW62Z1'),
('IO4IOQ99O981121', 'Ambrose', 'Herman', '196449054023', 'Male', '463', '67th Floor', 'Flat 5', 'House Springs', '1970-08-16', 'Married', 'Freelance', 1, 'Senior Accountant', 'Sales', 'Grade-2', '9WVPU49G7QHDIF8'),
('J39521A3D579IL1', 'Camila', 'Evers', '203517193901', 'Male', '300', '60th FL', 'Railway Arch 5', 'Lonoke', '1960-03-22', 'Married', 'Freelance', 1, 'Technical Manager', 'Executive', 'Grade-3', '7MZGX7J3736P11U'),
('JE1Z6215A16857', 'Deandre', 'Fairbanks', '190458184156', 'Female', '302', '46th FL', 'Arch 90', 'Houtzdale', '1971-06-08', 'Married', 'Contract - FullTime', 1, 'Marketing Manager', 'Human Resources', 'Grade-3', 'J39521A3D579IL1'),
('JFE8G725L9LQP7', 'Adolfo', 'Vance', '190501612898', 'Male', '3', '4th Floor', 'Railway Arch 3', 'Hagerman', '1975-12-23', 'Married', 'Contract - FullTime', 1, 'Director of Manufacturing', 'Facilities', 'Grade-3', '3ZFX7WFD1WQ27IZ'),
('JZ71BQ9BQ6DSITP', 'Cleveland', 'Hanks', '200277553015', 'Female', '494', '6th Floor', 'Railway Arch 71', 'Suttons Bay', '1987-03-01', 'Single', 'Permanent-PartTime', 1, 'Development Engineer', 'Executive', 'Grade-3', '1ZUF9U4U3V45RF9'),
('KT46M89K7MAN3YZ', 'Donnie', 'Hanna', '200385532592', 'Male', '435', '81th FL', 'Railway Arch 90', 'Portola', '1961-12-14', 'Divorced', 'Permanent-PartTime', 0, 'Development Manager', 'Information Technology', 'Grade-3', 'EGT6744B58H48K5'),
('KW74KC15W1UYB1T', 'Jonas', 'Ewing', '204471635980', 'Male', '503', '57th FL', 'Unit 2-7, First Floo', 'Houma', '1969-06-30', 'Married', 'Trainee', 1, 'Assistant', 'Executive', 'Grade-3', 'D8M152S83B9ZI73'),
('L6WU531NGEKRPZ', 'Erwin', 'Mcclure', '205238154788', 'Male', '513', '88th Floor', 'Railway Arch 77', 'Bloomdale', '1986-03-28', 'Single', 'Freelance', 1, 'Director of Manufacturing', 'Finance', 'Grade-4', '7GX4RNV3APTT3TO'),
('MOU913Y9M68J753', 'Alvin', 'Hernandez', '199404699905', 'Male', '619', '9th FL', 'Railway Arch 2', 'Bloomfield', '2000-02-06', 'Single', 'Permanent-FullTime', 1, 'Product Manager', 'Consulting', 'Grade-3', 'GZ619466BLC8E96'),
('P9897561152PQIM', 'Jamaal', 'Mccollum', '205440375775', 'Female', '53', '7th FL', 'Railway Arch 43', 'Portola Valley', '1961-05-10', 'Single', 'Permanent-FullTime', 1, 'Lead Engineer', 'Manufacturing', 'Grade-2', 'Y4YTBLD4M5V3DG4'),
('R38M1MML8Y6W58', 'Alina', 'Pannell', '204344116486', 'Male', '431', '70th FL', 'Railway Arch 86B', 'Bloomer', '1969-10-18', 'Single', 'Permanent-FullTime', 1, 'Senior Accountant', 'Executive', 'Grade-2', 'R38M1MML8Y6W58'),
('RC3DB69N1TXCZS', 'Norbert', 'Clements', '197135661298', 'Male', '3', '5th FL', 'Railway Arch 8', 'Coloma', '1986-02-17', 'Married', 'Trainee', 1, 'Senior Specialist', 'Human Resources', 'Grade-1', '9WVPU49G7QHDIF8'),
('S4N96X1273H3961', 'Ada', 'Haney', '193822109864', 'Female', '150', '70th Floor', 'Suite 4', 'Zuni', '1967-05-10', 'Single', 'Permanent-FullTime', 1, 'Communication Analyst', 'Human Resources', 'Grade-1', 'W9A4111U813717'),
('SJ44S4C696PB7L4', 'Melvin', 'Larson', '209124609631', 'Female', '658', '80th Floor', 'Railway Arch 80', 'Haddam', '1982-12-25', 'Married', 'Freelance', 0, 'Finance Controller', 'Consulting', 'Grade-4', 'GD75R3N5CTELH37'),
('W9A4111U813717', 'Aiko', 'Lassiter', '190599333736', 'Male', '573', 'Apartment 570', 'Arch 1', 'Portland', '1988-02-20', 'Single', 'Contract - FullTime', 0, 'Director of Manufacturing', 'Human Resources', 'Grade-1', 'ZV7E21396Q6YL8G'),
('WZNPE62G8MIFFOB', 'Delmer', 'Blake', '206824520636', 'Female', '3', '8th FL', 'Railway Arch 5', 'Colonial Heights', '1979-02-28', 'Married', 'Permanent-FullTime', 1, 'Technician', 'Information Technology', 'Grade-2', 'G219X6A6PN51Q5O'),
('XZ1VJ4ALT58R6XK', 'Holli', 'Click', '196376010014', 'Male', '01', '68th Floor', 'Suite 2', 'Hadley', '1973-09-28', 'Married', 'Permanent-PartTime', 1, 'Finance Controller', 'Operations', 'Grade-1', 'H9TX2V6962B395'),
('Y4YTBLD4M5V3DG4', 'Omega', 'Shepherd', '205328598717', 'Male', '728', '9th Floor', 'Unit 2-9', 'Lookout Mountain', '1978-12-22', 'Married', 'Contract-PartTime', 1, 'Communication Engineer', 'Research and Development', 'Grade-3', 'G219X6A6PN51Q5O'),
('ZV7E21396Q6YL8G', 'Tilda', 'Hanlon', '191008298564', 'Male', '727', '6th FL', 'Railway Arch 9', 'Colonial Beach', '1960-02-23', 'Divorced', 'Permanent-PartTime', 1, 'Product Manager', 'Consulting', 'Grade-4', 'RC3DB69N1TXCZS');

--
-- Truncate table before insert `employee_contact_no`
--

TRUNCATE TABLE `employee_contact_no`;
--
-- Dumping data for table `employee_contact_no`
--

INSERT INTO `employee_contact_no` (`employee_id`, `contact_no`) VALUES
('193FC492I7P34C7', '0099887766'),
('193FC492I7P34C7', '0879067546'),
('1ZUF9U4U3V45RF9', '+394446101481'),
('24H3QN82IF9L1M', '3923286575'),
('2DBVK1NSNM812OB', '024-7815440'),
('2EPEKTL636A3QN9', '405-2237067'),
('31AF73Z352XV995', '1732734994'),
('3M3TD5KS12246C', '+911377885583'),
('3WM9J7852F3T6PT', '8389998639'),
('3ZFX7WFD1WQ27IZ', '107-3162680'),
('49W85174RX1J6RO', '+210526047984'),
('527Y4PPRXLR8916', '294-8841049'),
('6A657QRR764KF6K', '+922964577921'),
('6T4W68VJ38I2LWA', '4004052112'),
('71NZ6Y1CXW62Z1', '+861988429446'),
('71RGT1644NME7B', '+870929163569'),
('73O2P6F76SIC9UO', '9964267161'),
('7GX4RNV3APTT3TO', '996-5244765'),
('7MZGX7J3736P11U', '632-5970043'),
('84641IS2VLEKG3M', '7992415785'),
('941FL243C1QR8BJ', '+210316342214'),
('9R9NK99QD67PW5', '8944894507'),
('9WVPU49G7QHDIF8', '355-8805022'),
('B5JM3Y6RNQ2L9H2', '+143656207931'),
('D8M152S83B9ZI73', '146-8225633'),
('E9F6BQA34REY2S7', '541-0646830'),
('ED6PLO5LBEA657N', '+443853587066'),
('EGT6744B58H48K5', '3747957351'),
('G219X6A6PN51Q5O', '3293855803'),
('GD75R3N5CTELH37', '+764483247774'),
('GZ619466BLC8E96', '+347751228856'),
('H9TX2V6962B395', '453-0076494'),
('IO4IOQ99O981121', '011-3736322'),
('J39521A3D579IL1', '510-7845541'),
('JE1Z6215A16857', '9604501543'),
('JFE8G725L9LQP7', '2659633021'),
('JZ71BQ9BQ6DSITP', '+328721231656'),
('KT46M89K7MAN3YZ', '831-8595687'),
('KW74KC15W1UYB1T', '1997710706'),
('L6WU531NGEKRPZ', '641-5939788'),
('MOU913Y9M68J753', '658-0845997'),
('P9897561152PQIM', '0467130164'),
('R38M1MML8Y6W58', '+309948646122'),
('RC3DB69N1TXCZS', '+518912557416'),
('S4N96X1273H3961', '+191816329271'),
('SJ44S4C696PB7L4', '0657019983'),
('W9A4111U813717', '+134862676927'),
('WZNPE62G8MIFFOB', '+702884256153'),
('XZ1VJ4ALT58R6XK', '486-1066114'),
('Y4YTBLD4M5V3DG4', '862-0246301'),
('ZV7E21396Q6YL8G', '4613798358');

--
-- Truncate table before insert `employee_custom_attributes`
--

TRUNCATE TABLE `employee_custom_attributes`;
--
-- Dumping data for table `employee_custom_attributes`
--

INSERT INTO `employee_custom_attributes` (`employee_id`, `attribute`, `value`) VALUES
('16F626FE5B0219', 'Sub Group', NULL),
('193FC492I7P34C7', 'Group', 'E1'),
('193FC492I7P34C7', 'Sub Group', NULL),
('1ZUF9U4U3V45RF9', 'Sub Group', NULL),
('24H3QN82IF9L1M', 'Group', 'brown I Easter story they and The if the'),
('24H3QN82IF9L1M', 'Nationality', 'brown told over persons'),
('24H3QN82IF9L1M', 'Sub Group', NULL),
('2DBVK1NSNM812OB', 'Group', 'the a and I lazy lazy exciting if am'),
('2DBVK1NSNM812OB', 'Nationality', 'song A on a never He make a ruin'),
('2DBVK1NSNM812OB', 'Sub Group', NULL),
('2EPEKTL636A3QN9', 'Sub Group', NULL),
('31AF73Z352XV995', 'Group', 'at would and'),
('31AF73Z352XV995', 'Nationality', 'them very brown Sundays Easter dog'),
('31AF73Z352XV995', 'Sub Group', NULL),
('3M3TD5KS12246C', 'Sub Group', NULL),
('3WM9J7852F3T6PT', 'Group', 'very they the had it Sundays I them take get'),
('3WM9J7852F3T6PT', 'Nationality', 'never quick and for the can and if for take to'),
('3WM9J7852F3T6PT', 'Sub Group', NULL),
('3ZFX7WFD1WQ27IZ', 'Sub Group', NULL),
('49W85174RX1J6RO', 'Sub Group', NULL),
('527Y4PPRXLR8916', 'Sub Group', NULL),
('6A657QRR764KF6K', 'Group', 'teeth your Bunny and a at chocolate'),
('6A657QRR764KF6K', 'Nationality', 'would'),
('6A657QRR764KF6K', 'Sub Group', NULL),
('6T4W68VJ38I2LWA', 'Group', 'Easter Tooth a if you leave'),
('6T4W68VJ38I2LWA', 'Nationality', 'had if The would never He'),
('6T4W68VJ38I2LWA', 'Sub Group', NULL),
('71NZ6Y1CXW62Z1', 'Group', 'Fairy make a the them exciting the'),
('71NZ6Y1CXW62Z1', 'Nationality', 'the let story chocolate'),
('71NZ6Y1CXW62Z1', 'Sub Group', NULL),
('71RGT1644NME7B', 'Group', 'on teeth If A for make they Easter day'),
('71RGT1644NME7B', 'Nationality', 'if would and'),
('71RGT1644NME7B', 'Sub Group', NULL),
('73O2P6F76SIC9UO', 'Group', 'if at on it exciting they Bunny the day Fairy'),
('73O2P6F76SIC9UO', 'Nationality', 'and it the can babies day ruin'),
('73O2P6F76SIC9UO', 'Sub Group', NULL),
('7GX4RNV3APTT3TO', 'Sub Group', NULL),
('7MZGX7J3736P11U', 'Group', 'they The'),
('7MZGX7J3736P11U', 'Nationality', 'leave the'),
('7MZGX7J3736P11U', 'Sub Group', NULL),
('84641IS2VLEKG3M', 'Nationality', 'us I told A or let I can A story the the had'),
('84641IS2VLEKG3M', 'Sub Group', NULL),
('941FL243C1QR8BJ', 'Group', 'A babies over day your'),
('941FL243C1QR8BJ', 'Nationality', 'He'),
('941FL243C1QR8BJ', 'Sub Group', NULL),
('9R9NK99QD67PW5', 'Group', 'home'),
('9R9NK99QD67PW5', 'Nationality', 'your at at or Sundays brown The'),
('9R9NK99QD67PW5', 'Sub Group', NULL),
('9WVPU49G7QHDIF8', 'Sub Group', NULL),
('B5JM3Y6RNQ2L9H2', 'Group', 'a A a day the and teeth if A song persons make'),
('B5JM3Y6RNQ2L9H2', 'Nationality', 'at make fox it a your day a babies exciting'),
('B5JM3Y6RNQ2L9H2', 'Sub Group', NULL),
('D8M152S83B9ZI73', 'Sub Group', NULL),
('E9F6BQA34REY2S7', 'Group', 'Fairy day us and had Tooth the never had us ruin'),
('E9F6BQA34REY2S7', 'Nationality', 'you and or ruin dog Easter teeth told and'),
('E9F6BQA34REY2S7', 'Sub Group', NULL),
('ED6PLO5LBEA657N', 'Group', 'story the'),
('ED6PLO5LBEA657N', 'Nationality', 'fox'),
('ED6PLO5LBEA657N', 'Sub Group', NULL),
('EGT6744B58H48K5', 'Sub Group', NULL),
('G219X6A6PN51Q5O', 'Sub Group', NULL),
('GD75R3N5CTELH37', 'Sub Group', NULL),
('GZ619466BLC8E96', 'Group', 'let or chocolate for A you a very make'),
('GZ619466BLC8E96', 'Nationality', 'they brown for on'),
('GZ619466BLC8E96', 'Sub Group', NULL),
('H9TX2V6962B395', 'Sub Group', NULL),
('IO4IOQ99O981121', 'Group', 'if adventure Tooth'),
('IO4IOQ99O981121', 'Nationality', 'I chocolate us'),
('IO4IOQ99O981121', 'Sub Group', NULL),
('J39521A3D579IL1', 'Group', 'it very it jumps to for'),
('J39521A3D579IL1', 'Nationality', 'and brown day fox told ruin fox can babies If had'),
('J39521A3D579IL1', 'Sub Group', NULL),
('JE1Z6215A16857', 'Sub Group', NULL),
('JFE8G725L9LQP7', 'Sub Group', NULL),
('JZ71BQ9BQ6DSITP', 'Group', 'a or a them Fairy Sundays your the The if'),
('JZ71BQ9BQ6DSITP', 'Nationality', 'get He am'),
('JZ71BQ9BQ6DSITP', 'Sub Group', NULL),
('KT46M89K7MAN3YZ', 'Sub Group', NULL),
('KW74KC15W1UYB1T', 'Group', 'at exciting chocolate take take story'),
('KW74KC15W1UYB1T', 'Nationality', 'day'),
('KW74KC15W1UYB1T', 'Sub Group', NULL),
('L6WU531NGEKRPZ', 'Group', 'make a'),
('L6WU531NGEKRPZ', 'Nationality', 'brown it leave'),
('L6WU531NGEKRPZ', 'Sub Group', NULL),
('MOU913Y9M68J753', 'Sub Group', NULL),
('P9897561152PQIM', 'Sub Group', NULL),
('R38M1MML8Y6W58', 'Sub Group', NULL),
('RC3DB69N1TXCZS', 'Group', 'chocolate Fairy'),
('RC3DB69N1TXCZS', 'Nationality', 'Fairy very persons exciting quick'),
('RC3DB69N1TXCZS', 'Sub Group', NULL),
('S4N96X1273H3961', 'Group', 'never persons'),
('S4N96X1273H3961', 'Nationality', 'had teeth would A He take ruin'),
('S4N96X1273H3961', 'Sub Group', NULL),
('SJ44S4C696PB7L4', 'Group', 'persons at told your babies never'),
('SJ44S4C696PB7L4', 'Nationality', 'you dog and let would get can I told'),
('SJ44S4C696PB7L4', 'Sub Group', NULL),
('W9A4111U813717', 'Sub Group', NULL),
('WZNPE62G8MIFFOB', 'Sub Group', NULL),
('XZ1VJ4ALT58R6XK', 'Sub Group', NULL),
('Y4YTBLD4M5V3DG4', 'Sub Group', NULL),
('ZV7E21396Q6YL8G', 'Sub Group', NULL);

--
-- Truncate table before insert `employee_email`
--

TRUNCATE TABLE `employee_email`;
--
-- Dumping data for table `employee_email`
--

INSERT INTO `employee_email` (`employee_id`, `email`) VALUES
('193FC492I7P34C7', 'abc_123@wer.com'),
('193FC492I7P34C7', 'ycdxhpaj_ivto_op@example.com'),
('1ZUF9U4U3V45RF9', 'qjebpn60@nowhere.com'),
('24H3QN82IF9L1M', 'FranklynMMcgrath@example.com'),
('2DBVK1NSNM812OB', 'BillyAbney@example.com'),
('2EPEKTL636A3QN9', 'Meade764@example.com'),
('31AF73Z352XV995', 'Ailene_Place215@nowhere.com'),
('3M3TD5KS12246C', 'Acker@example.com'),
('3WM9J7852F3T6PT', 'BeverlyN16@example.com'),
('3ZFX7WFD1WQ27IZ', 'Zarate@example.com'),
('49W85174RX1J6RO', 'RayAmaya@example.com'),
('527Y4PPRXLR8916', 'ArchieFeliciano@example.com'),
('6A657QRR764KF6K', 'Margy.Weddle77@nowhere.com'),
('6T4W68VJ38I2LWA', 'GavinKHanlon@example.com'),
('71NZ6Y1CXW62Z1', 'Alexander.Handley82@example.com'),
('71RGT1644NME7B', 'MildaMclain423@example.com'),
('73O2P6F76SIC9UO', 'York@example.com'),
('7GX4RNV3APTT3TO', 'Abel69@example.com'),
('7MZGX7J3736P11U', 'RefugioDAbel@nowhere.com'),
('84641IS2VLEKG3M', 'CarlenaHorner324@example.com'),
('941FL243C1QR8BJ', 'Luis_Whitfield@example.com'),
('9R9NK99QD67PW5', 'mzffnfrp_oercays@nowhere.com'),
('9WVPU49G7QHDIF8', 'Kim49@nowhere.com'),
('B5JM3Y6RNQ2L9H2', 'Shandra.Harder4@nowhere.com'),
('D8M152S83B9ZI73', 'IsmaelAbel@example.com'),
('E9F6BQA34REY2S7', 'Reuben_Palumbo@example.com'),
('ED6PLO5LBEA657N', 'Windham@example.com'),
('EGT6744B58H48K5', 'Franks@example.com'),
('G219X6A6PN51Q5O', 'Byrne@example.com'),
('GD75R3N5CTELH37', 'Liane.Burger@nowhere.com'),
('GZ619466BLC8E96', 'KittyCoats92@nowhere.com'),
('H9TX2V6962B395', 'Desirae_Schuster@example.com'),
('IO4IOQ99O981121', 'Simpson@nowhere.com'),
('J39521A3D579IL1', 'Erwin@example.com'),
('JE1Z6215A16857', 'Afton.Rice421@example.com'),
('JFE8G725L9LQP7', 'Christenson@nowhere.com'),
('JZ71BQ9BQ6DSITP', 'Conrad_Tomlin@example.com'),
('KT46M89K7MAN3YZ', 'xnwikrm7@example.com'),
('KW74KC15W1UYB1T', 'BradSilvia@example.com'),
('L6WU531NGEKRPZ', 'Ridgeway771@example.com'),
('MOU913Y9M68J753', 'RosarioCanady462@nowhere.com'),
('P9897561152PQIM', 'cglk1351@example.com'),
('R38M1MML8Y6W58', 'norxuneu_vgshuq@nowhere.com'),
('RC3DB69N1TXCZS', 'MatthewWeaver@nowhere.com'),
('S4N96X1273H3961', 'xrlh3903@nowhere.com'),
('SJ44S4C696PB7L4', 'Valentine.Higdon3@nowhere.com'),
('W9A4111U813717', 'llevh822@example.com'),
('WZNPE62G8MIFFOB', 'Levy@example.com'),
('XZ1VJ4ALT58R6XK', 'Stidham@example.com'),
('Y4YTBLD4M5V3DG4', 'AlexisSoria@example.com'),
('ZV7E21396Q6YL8G', 'OmerWeber@example.com');

--
-- Truncate table before insert `employment_status`
--

TRUNCATE TABLE `employment_status`;
--
-- Dumping data for table `employment_status`
--

INSERT INTO `employment_status` (`employment_status`) VALUES
('Contract - FullTime'),
('Contract-PartTime'),
('Freelance'),
('Intern'),
('Permanent-FullTime'),
('Permanent-PartTime'),
('Trainee');

--
-- Truncate table before insert `job_title`
--

TRUNCATE TABLE `job_title`;
--
-- Dumping data for table `job_title`
--

INSERT INTO `job_title` (`job_title`, `access_level`) VALUES
('App. Engineer', 'L1'),
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
('Designer', 'L2'),
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

--
-- Truncate table before insert `leave`
--

TRUNCATE TABLE `leave`;
--
-- Dumping data for table `leave`
--

INSERT INTO `leave` (`employee_id`, `date`, `leave_type`, `reason`, `state`) VALUES
('16F626FE5B0219', '2020-01-03', 'Annual', 'Pvt', 'Pending'),
('193FC492I7P34C7', '2020-01-05', 'Casual', 'Pvt.', 'Approved'),
('193FC492I7P34C7', '2020-01-22', 'No-Pay', 'Other', 'Approved'),
('24H3QN82IF9L1M', '2020-03-07', 'Sick', 'Impedit quis et amet est.', 'Pending'),
('31AF73Z352XV995', '2020-01-14', 'No-Pay', 'Pvt.', 'Approved'),
('3WM9J7852F3T6PT', '2019-05-29', 'Casual', 'Sit quidem numquam accusantium laborum a suscipit rem nihil...', 'Rejected'),
('3WM9J7852F3T6PT', '2019-07-05', 'No-Pay', 'Excepturi deserunt unde perferendis quia esse. Facilis sed ut doloremque sed.', 'Rejected'),
('3WM9J7852F3T6PT', '2019-08-14', 'Annual', 'Aut sit sequi, maiores quam aliquid tenetur voluptatem autem et.', 'Rejected'),
('3WM9J7852F3T6PT', '2020-03-07', 'Sick', 'Impedit ad consectetur nisi. Error soluta reiciendis itaque minima? Voluptas.', 'Rejected'),
('71RGT1644NME7B', '2019-05-29', 'Casual', 'Ut aliquid rem. Tempora in est aut amet ex.', 'Approved'),
('71RGT1644NME7B', '2019-07-05', 'No-Pay', 'Qui sit officiis qui doloribus perspiciatis laboriosam rerum vitae voluptatem.', 'Approved'),
('71RGT1644NME7B', '2019-08-14', 'Annual', 'Unde iure ea.', 'Rejected'),
('71RGT1644NME7B', '2020-03-07', 'Sick', 'Temporibus molestias ut deleniti perspiciatis est. Exercitationem cum qui.', 'Pending'),
('73O2P6F76SIC9UO', '2019-05-29', 'Casual', 'Sed omnis non velit fugit ratione id. Adipisci et soluta?', 'Approved'),
('73O2P6F76SIC9UO', '2019-07-05', 'No-Pay', 'Excepturi voluptatem, et impedit qui alias ut maxime fugiat a.', 'Approved'),
('73O2P6F76SIC9UO', '2019-08-14', 'Annual', 'Vitae quas nesciunt.', 'Rejected'),
('73O2P6F76SIC9UO', '2020-03-07', 'Sick', 'Exercitationem odit voluptatem.', 'Approved'),
('7MZGX7J3736P11U', '2019-05-29', 'Casual', 'Itaque temporibus perspiciatis natus velit et tenetur porro. Asperiores!', 'Rejected'),
('7MZGX7J3736P11U', '2019-07-05', 'No-Pay', 'Excepturi cumque perspiciatis. Sed officiis veritatis; recusandae eveniet.', 'Rejected'),
('7MZGX7J3736P11U', '2019-08-14', 'Annual', 'Quisquam nisi ea tenetur ipsum non est in perspiciatis; ratione expedita.', 'Rejected'),
('7MZGX7J3736P11U', '2020-03-07', 'Sick', 'Sed velit incidunt et voluptas ut ipsum dignissimos et. A voluptatem sed!', 'Rejected'),
('84641IS2VLEKG3M', '2019-07-05', 'No-Pay', 'Nam fugiat omnis culpa voluptatem unde illo doloremque id. Iste labore nostrum;', 'Approved'),
('941FL243C1QR8BJ', '2019-05-29', 'Casual', 'Eos quaerat itaque earum ut eligendi illo ducimus ut.', 'Approved'),
('941FL243C1QR8BJ', '2019-07-05', 'No-Pay', 'Sed eos officia, voluptatem aut voluptate voluptatibus id nulla modi;', 'Approved'),
('941FL243C1QR8BJ', '2019-08-14', 'Annual', 'Sed non labore.', 'Approved'),
('941FL243C1QR8BJ', '2020-03-07', 'Sick', 'Minus sapiente laudantium et recusandae.', 'Approved'),
('B5JM3Y6RNQ2L9H2', '2019-05-29', 'Casual', 'Sequi minima ut labore perspiciatis.', 'Approved'),
('B5JM3Y6RNQ2L9H2', '2019-07-05', 'No-Pay', 'Aliquam repellat aperiam in voluptatem. Eius in et illum aut rerum!', 'Rejected'),
('B5JM3Y6RNQ2L9H2', '2019-08-14', 'Annual', 'Eius ex deserunt nemo quidem voluptates.', 'Rejected'),
('B5JM3Y6RNQ2L9H2', '2020-03-07', 'Sick', 'Vel impedit molestiae non porro excepturi aut saepe.', 'Pending'),
('E9F6BQA34REY2S7', '2019-05-29', 'Casual', 'Necessitatibus illo libero dolorem consequatur quam provident accusamus.', 'Approved'),
('E9F6BQA34REY2S7', '2019-08-14', 'Annual', 'Dolorem et minus. Perspiciatis libero deserunt.', 'Approved'),
('E9F6BQA34REY2S7', '2020-03-07', 'Sick', 'Fuga nemo molestias. Et quis consequatur? Consectetur omnis id et asperiores.', 'Pending'),
('ED6PLO5LBEA657N', '2019-05-29', 'Casual', 'Rerum et unde.', 'Rejected'),
('ED6PLO5LBEA657N', '2019-07-05', 'No-Pay', 'Dolores autem omnis impedit est laboriosam praesentium fuga.', 'Rejected'),
('ED6PLO5LBEA657N', '2019-08-14', 'Annual', 'Quos culpa quia. Culpa nisi harum. Neque similique officiis laborum a sed.', 'Rejected'),
('ED6PLO5LBEA657N', '2020-03-07', 'Sick', 'Cupiditate similique totam; ad autem facilis voluptate blanditiis aut eum.', 'Approved'),
('J39521A3D579IL1', '2019-07-05', 'No-Pay', 'Nemo eveniet corrupti distinctio vitae.', 'Rejected'),
('J39521A3D579IL1', '2019-08-14', 'Annual', 'Soluta a nam fugiat tempora est rerum. Totam labore vel.', 'Approved'),
('KW74KC15W1UYB1T', '2019-05-29', 'Casual', 'Officia ratione excepturi dolores ut labore nesciunt. Et laboriosam ut error.', 'Rejected'),
('KW74KC15W1UYB1T', '2019-07-05', 'No-Pay', 'Numquam et nihil unde laboriosam quam suscipit.', 'Rejected'),
('KW74KC15W1UYB1T', '2019-08-14', 'Annual', 'Perspiciatis quis, eos sit nobis est quia officia aliquid dolorem.', 'Approved'),
('KW74KC15W1UYB1T', '2020-03-07', 'Sick', 'Et ut reprehenderit et cum est...', 'Rejected'),
('RC3DB69N1TXCZS', '2019-05-29', 'Casual', 'Alias atque numquam dolorum nesciunt sit laborum laudantium nisi. Quos esse.', 'Rejected'),
('RC3DB69N1TXCZS', '2019-07-05', 'No-Pay', 'Sint ut aut iste nisi. Aspernatur consequatur error neque, est odit quia.', 'Rejected'),
('RC3DB69N1TXCZS', '2019-08-14', 'Annual', 'Sit dolor dolore velit provident quaerat officia eum. Provident molestiae.', 'Rejected'),
('RC3DB69N1TXCZS', '2020-03-07', 'Sick', 'Ut odit est reiciendis qui est.', 'Rejected'),
('S4N96X1273H3961', '2019-05-29', 'Casual', 'Tempora vitae deserunt quo omnis consequatur cupiditate. Sed nesciunt velit.', 'Rejected'),
('S4N96X1273H3961', '2019-07-05', 'No-Pay', 'Dolorem aspernatur incidunt quae dolore repellat vel in, et nulla.', 'Approved'),
('S4N96X1273H3961', '2019-08-14', 'Annual', 'Excepturi perferendis dolores esse adipisci excepturi. Laudantium eos quia.', 'Rejected'),
('SJ44S4C696PB7L4', '2019-05-29', 'Casual', 'Et ipsa tempore qui sequi. Rerum sit molestiae error culpa ut.', 'Approved'),
('SJ44S4C696PB7L4', '2019-07-05', 'No-Pay', 'Voluptas labore ipsum dolorem ipsam. Itaque mollitia autem quia rerum non!', 'Approved'),
('SJ44S4C696PB7L4', '2019-08-14', 'Annual', 'Vero hic sit voluptatem quasi quaerat quo perspiciatis modi. Alias voluptatem.', 'Rejected'),
('SJ44S4C696PB7L4', '2020-03-07', 'Sick', 'Cum reprehenderit iste. Omnis consequatur unde et accusantium ut voluptatum.', 'Rejected');

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
('Sick'),
('Vacation');

--
-- Truncate table before insert `organization_info`
--

TRUNCATE TABLE `organization_info`;
--
-- Dumping data for table `organization_info`
--

INSERT INTO `organization_info` (`key`, `value`) VALUES
('Address Line 1', '777'),
('Address Line 2', 'Union Place'),
('Address Line 3', 'Colombo'),
('Contact No.', '011-23456545'),
('Country', 'Sri Lanka'),
('Name', 'Jupyter'),
('Reg No.', '8768A7dD6876');

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
('Grade-4'),
('Grade-5');

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
('Grade-1', 'No-Pay', 50),
('Grade-1', 'Sick', 16),
('Grade-2', 'Annual', 7),
('Grade-2', 'Casual', 4),
('Grade-2', 'No-Pay', 50),
('Grade-2', 'Sick', 0),
('Grade-3', 'Annual', 21),
('Grade-3', 'Casual', 47),
('Grade-3', 'No-Pay', 50),
('Grade-3', 'Sick', 7),
('Grade-4', 'Annual', 6),
('Grade-4', 'Casual', 23),
('Grade-4', 'No-Pay', 54),
('Grade-4', 'Sick', 40),
('Grade-5', 'No-Pay', 50),
('Grade-5', 'Sick', 22);

--
-- Truncate table before insert `user`
--

TRUNCATE TABLE `user`;
--
-- Dumping data for table `user`
--

INSERT INTO `user` (`employee_id`, `username`, `password`) VALUES
('16F626FE5B0219', 'usernamehrm', '$2a$10$H6WOPwT85oW8t4ljdaVW2.wJQPnKRTY6/1F1nmGQrOLREKSahfveK'),
('193FC492I7P34C7', 'username4', '$2a$10$LnlWSJCg9988IqauuVnIKug1KoaaePvZkXaYFZGSAGo2vzBWcwoSq'),
('31AF73Z352XV995', 'username7', '$2a$10$FGXCVzhe9sCNvfgNS1J2geXacFvuQ5uOgcM1Et.NfQ/KXw2y0yLMy');

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
