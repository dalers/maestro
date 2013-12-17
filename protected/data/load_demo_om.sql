-- load demo data (Swift Construction Company pv-4.mdb)
--
-- > mysql -uroot -p --local-infile=1 --show-warnings --verbose < ./load_demo.sql
--

use maestro;

-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2013 at 06:00 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `maestro`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_order`
--

DROP TABLE IF EXISTS `tbl_om_order`;
CREATE TABLE IF NOT EXISTS `tbl_om_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `reman_no` varchar(255) DEFAULT NULL,
  `job_no` varchar(255) NOT NULL,
  `size_id` int(11) NOT NULL,
  `shipment_dt` datetime DEFAULT NULL,
  `person_id` int(11) NOT NULL,
  `tool_type_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `status_id` int(11) DEFAULT NULL,  
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_to_client` (`client_id`),
  KEY `fk_order_to_size` (`size_id`),
  KEY `fk_order_to_person` (`person_id`),
  KEY `fk_order_to_tool_type` (`tool_type_id`),
  KEY `fk_order_to_product` (`product_id`),
  KEY `fk_order_to_location` (`location_id`),
  KEY `fk_order_to_country` (`country_id`),
  KEY `fk_order_to_status` (`status_id`),
  KEY `fk_order_to_create_user` (`create_user_id`),
  KEY `fk_order_to_update_user` (`update_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_om_order`:
--   `client_id`
--       `tbl_om_client` -> `id`
--   `size_id`
--       `tbl_om_size` -> `id`
--   `person_id`
--       `tbl_person` -> `id`
--   `tool_type_id`
--       `tbl_om_tool_type` -> `id`
--   `product_id`
--       `tbl_om_product` -> `id`
--   `location_id`
--       `tbl_om_location` -> `id`
--   `country_id`
--       `tbl_om_country` -> `id`
--   `status_id`
--       `tbl_om_status` -> `id`
--   `update_user_id`
--       `tbl_person` -> `id`
--   `create_user_id`
--       `tbl_person` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_location`
--

DROP TABLE IF EXISTS `tbl_om_location`;
CREATE TABLE IF NOT EXISTS `tbl_om_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=3;

--
-- Dumping data for table `tbl_om_location`
--

INSERT INTO `tbl_om_location` (`id`, `name`) VALUES
(1, 'Local'),
(2, 'International');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_size`
--

DROP TABLE IF EXISTS `tbl_om_size`;
CREATE TABLE IF NOT EXISTS `tbl_om_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `tbl_om_size`
--

INSERT INTO `tbl_om_size` (`id`, `name`) VALUES
(1, '10in,'),
(2, '10NS'),
(3, '12in.'),
(4, '12inA'),
(5, '14in.'),
(6, '16in.'),
(7, '18in.'),
(8, '20in.'),
(9, '22in.'),
(10, '24in.'),
(11, '30in.'),
(12, '34in.'),
(13, '36in.'),
(14, '42in.'),
(15, '48in.'),
(16, '50in.'),
(17, '52in.'),
(18, '8in.'),
(19, '8NS'),
(20, 'G01'),
(21, 'G02'),
(22, 'Large Size'),
(23, 'M08'),
(24, 'Mid size'),
(25, 'NDKMLGA'),
(26, 'Small size');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_tool_type`
--

DROP TABLE IF EXISTS `tbl_om_tool_type`;
CREATE TABLE IF NOT EXISTS `tbl_om_tool_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tbl_om_size`
--

INSERT INTO `tbl_om_tool_type` (`id`, `name`) VALUES
(1, 'All Tools'),
(2, 'Caliper'),
(3, 'Combo'),
(4, 'Gemini'),
(5, 'Nakoda'),
(6, 'SEEC'),
(7, 'SMP'),
(8, 'SMP-Large-Tool-Combo'),
(9, 'SMP-Large-Tool-MFL'),
(10, 'Vectra');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_product`
--

DROP TABLE IF EXISTS `tbl_om_product`;
CREATE TABLE IF NOT EXISTS `tbl_om_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_om_product`
--

INSERT INTO `tbl_om_product` (`id`, `name`) VALUES
(1, 'Oil'),
(2, 'Gas'),
(3, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_country`
--

DROP TABLE IF EXISTS `tbl_om_country`;
CREATE TABLE IF NOT EXISTS `tbl_om_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=250 ;

--
-- Dumping data for table `tbl_om_country`
--

INSERT INTO `tbl_om_country` (`id`,`code`,`name`) VALUES
(1,'AD','Andorra'),
(2,'AE','United Arab Emirates'),
(3,'AF','Afghanistan'),
(4,'AG','Antigua and Barbuda'),
(5,'AI','Anguilla'),
(6,'AL','Albania'),
(7,'AM','Armenia'),
(8,'AO','Angola'),
(9,'AQ','Antarctica'),
(10,'AR','Argentina'),
(11,'AS','American Samoa'),
(12,'AT','Austria'),
(13,'AU','Australia'),
(14,'AW','Aruba'),
(15,'AX','Åland Islands'),
(16,'AZ','Azerbaijan'),
(17,'BA','Bosnia and Herzegovina'),
(18,'BB','Barbados'),
(19,'BD','Bangladesh'),
(20,'BE','Belgium'),
(21,'BF','Burkina Faso'),
(22,'BG','Bulgaria'),
(23,'BH','Bahrain'),
(24,'BI','Burundi'),
(25,'BJ','Benin'),
(26,'BL','Saint Barthélemy'),
(27,'BM','Bermuda'),
(28,'BN','Brunei Darussalam'),
(29,'BO','Bolivia'),
(30,'BQ','Caribbean Netherlands'),
(31,'BR','Brazil'),
(32,'BS','Bahamas'),
(33,'BT','Bhutan'),
(34,'BV','Bouvet Island'),
(35,'BW','Botswana'),
(36,'BY','Belarus'),
(37,'BZ','Belize'),
(38,'CA','Canada'),
(39,'CC','Cocos (Keeling) Islands'),
(40,'CD','Congo, Democratic Republic of'),
(41,'CF','Central African Republic'),
(42,'CG','Congo'),
(43,'CH','Switzerland'),
(44,'CI','Côte D’Ivoire'),
(45,'CK','Cook Islands'),
(46,'CL','Chile'),
(47,'CM','Cameroon'),
(48,'CN','China'),
(49,'CO','Colombia'),
(50,'CR','Costa Rica'),
(51,'CU','Cuba'),
(52,'CV','Cape Verde'),
(53,'CW','Curaçao'),
(54,'CX','Christmas Island'),
(55,'CY','Cyprus'),
(56,'CZ','Czech Republic'),
(57,'DE','Germany'),
(58,'DJ','Djibouti'),
(59,'DK','Denmark'),
(60,'DM','Dominica'),
(61,'DO','Dominican Republic'),
(62,'DZ','Algeria'),
(63,'EC','Ecuador'),
(64,'EE','Estonia'),
(65,'EG','Egypt'),
(66,'EH','Western Sahara'),
(67,'ER','Eritrea'),
(68,'ES','Spain'),
(69,'ET','Ethiopia'),
(70,'FI','Finland'),
(71,'FJ','Fiji'),
(72,'FK','Falkland Islands'),
(73,'FM','Micronesia, Federated States of'),
(74,'FO','Faroe Islands'),
(75,'FR','France'),
(76,'GA','Gabon'),
(77,'GB','United Kingdom'),
(78,'GD','Grenada'),
(79,'GE','Georgia'),
(80,'GF','French Guiana'),
(81,'GG','Guernsey'),
(82,'GH','Ghana'),
(83,'GI','Gibraltar'),
(84,'GL','Greenland'),
(85,'GM','Gambia'),
(86,'GN','Guinea'),
(87,'GP','Guadeloupe'),
(88,'GQ','Equatorial Guinea'),
(89,'GR','Greece'),
(90,'GS','South Georgia and the South Sandwich Islands'),
(91,'GT','Guatemala'),
(92,'GU','Guam'),
(93,'GW','Guinea-Bissau'),
(94,'GY','Guyana'),
(95,'HK','Hong Kong'),
(96,'HM','Heard and McDonald Islands'),
(97,'HN','Honduras'),
(98,'HR','Croatia'),
(99,'HT','Haiti'),
(100,'HU','Hungary'),
(101,'ID','Indonesia'),
(102,'IE','Ireland'),
(103,'IL','Israel'),
(104,'IM','Isle of Man'),
(105,'IN','India'),
(106,'IO','British Indian Ocean Territory'),
(107,'IQ','Iraq'),
(108,'IR','Iran'),
(109,'IS','Iceland'),
(110,'IT','Italy'),
(111,'JE','Jersey'),
(112,'JM','Jamaica'),
(113,'JO','Jordan'),
(114,'JP','Japan'),
(115,'KE','Kenya'),
(116,'KG','Kyrgyzstan'),
(117,'KH','Cambodia'),
(118,'KI','Kiribati'),
(119,'KM','Comoros'),
(120,'KN','Saint Kitts and Nevis'),
(121,'KP','North Korea'),
(122,'KR','South Korea'),
(123,'KW','Kuwait'),
(124,'KY','Cayman Islands'),
(125,'KZ','Kazakhstan'),
(126,'LA','Laos'),
(127,'LB','Lebanon'),
(128,'LC','Saint Lucia'),
(129,'LI','Liechtenstein'),
(130,'LK','Sri Lanka'),
(131,'LR','Liberia'),
(132,'LS','Lesotho'),
(133,'LT','Lithuania'),
(134,'LU','Luxembourg'),
(135,'LV','Latvia'),
(136,'LY','Libya'),
(137,'MA','Morocco'),
(138,'MC','Monaco'),
(139,'MD','Moldova'),
(140,'ME','Montenegro'),
(141,'MF','Saint-Martin'),
(142,'MG','Madagascar'),
(143,'MH','Marshall Islands'),
(144,'MK','Macedonia'),
(145,'ML','Mali'),
(146,'MM','Myanmar'),
(147,'MN','Mongolia'),
(148,'MO','Macau'),
(149,'MP','Northern Mariana Islands'),
(150,'MQ','Martinique'),
(151,'MR','Mauritania'),
(152,'MS','Montserrat'),
(153,'MT','Malta'),
(154,'MU','Mauritius'),
(155,'MV','Maldives'),
(156,'MW','Malawi'),
(157,'MX','Mexico'),
(158,'MY','Malaysia'),
(159,'MZ','Mozambique'),
(160,'NA','Namibia'),
(161,'NC','New Caledonia'),
(162,'NE','Niger'),
(163,'NF','Norfolk Island'),
(164,'NG','Nigeria'),
(165,'NI','Nicaragua'),
(166,'NL','The Netherlands'),
(167,'NO','Norway'),
(168,'NP','Nepal'),
(169,'NR','Nauru'),
(170,'NU','Niue'),
(171,'NZ','New Zealand'),
(172,'OM','Oman'),
(173,'PA','Panama'),
(174,'PE','Peru'),
(175,'PF','French Polynesia'),
(176,'PG','Papua New Guinea'),
(177,'PH','Philippines'),
(178,'PK','Pakistan'),
(179,'PL','Poland'),
(180,'PM','St. Pierre and Miquelon'),
(181,'PN','Pitcairn'),
(182,'PR','Puerto Rico'),
(183,'PS','Palestinian Territory, Occupied'),
(184,'PT','Portugal'),
(185,'PW','Palau'),
(186,'PY','Paraguay'),
(187,'QA','Qatar'),
(188,'RE','Reunion'),
(189,'RO','Romania'),
(190,'RS','Serbia'),
(191,'RU','Russian Federation'),
(192,'RW','Rwanda'),
(193,'SA','Saudi Azzzzrabia'),
(194,'SB','Solomon Islands'),
(195,'SC','Seychelles'),
(196,'SD','Sudan'),
(197,'SE','Sweden'),
(198,'SG','Singapore'),
(199,'SH','Saint Helena'),
(200,'SI','Slovenia'),
(201,'SJ','Svalbard and Jan Mayen Islands'),
(202,'SK','Slovakia (Slovak Republic)'),
(203,'SL','Sierra Leone'),
(204,'SM','San Marino'),
(205,'SN','Senegal'),
(206,'SO','Somalia'),
(207,'SR','Suriname'),
(208,'SS','South Sudan'),
(209,'ST','Sao Tome and Principe'),
(210,'SV','El Salvador'),
(211,'SX','Saint-Martin (Pays-Bas)'),
(212,'SY','Syria'),
(213,'SZ','Swaziland'),
(214,'TC','Turks and Caicos Islands'),
(215,'TD','Chad'),
(216,'TF','French Southern Territories'),
(217,'TG','Togo'),
(218,'TH','Thailand'),
(219,'TJ','Tajikistan'),
(220,'TK','Tokelau'),
(221,'TL','Timor-Leste'),
(222,'TM','Turkmenistan'),
(223,'TN','Tunisia'),
(224,'TO','Tonga'),
(225,'TR','Turkey'),
(226,'TT','Trinidad and Tobago'),
(227,'TV','Tuvalu'),
(228,'TW','Taiwan'),
(229,'TZ','Tanzania'),
(230,'UA','Ukraine'),
(231,'UG','Uganda'),
(232,'UM','United States Minor Outlying Islands'),
(233,'US','United States'),
(234,'UY','Uruguay'),
(235,'UZ','Uzbekistan'),
(236,'VA','Vatican'),
(237,'VC','Saint Vincent and the Grenadines'),
(238,'VE','Venezuela'),
(239,'VG','Virgin Islands (British)'),
(240,'VI','Virgin Islands (U.S.)'),
(241,'VN','Vietnam'),
(242,'VU','Vanuatu'),
(243,'WF','Wallis and Futuna Islands'),
(244,'WS','Samoa'),
(245,'YE','Yemen'),
(246,'YT','Mayotte'),
(247,'ZA','South Africa'),
(248,'ZM','Zambia'),
(249,'ZW','Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_client`
--

DROP TABLE IF EXISTS `tbl_om_client`;
CREATE TABLE IF NOT EXISTS `tbl_om_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone_no` varchar(25) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_to_create_user` (`create_user_id`),
  KEY `fk_client_to_update_user` (`update_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `tbl_om_client`
--

INSERT INTO `tbl_om_client` (`id`, `name`, `phone_no`, `country_id`, `notes`, `create_time`, `create_user_id`) VALUES
(1, 'Alliance', NULL, 38, NULL, NULL, NULL),
(2, 'Alyeska', NULL, 233, NULL, NULL, NULL),
(3, 'Boardwalk', NULL, 233, 'USA', NULL, NULL),
(4, 'BP Alaska', NULL, 233, NULL, NULL, NULL),
(5, 'BP Canada', NULL, 38, NULL, NULL, NULL),
(6, 'Centerpoint', NULL, 233, NULL, NULL, NULL),
(7, 'Centerpoint Energy', NULL, 233, NULL, NULL, NULL),
(8, 'Colonial', NULL, 233, 'USA', NULL, NULL),
(9, 'Dakota Gas', NULL, 233, NULL, NULL, NULL),
(10, 'El Paso', NULL, 233, NULL, NULL, NULL),
(11, 'Enbridge', '403-8956554', 38, 'local', NULL, NULL),
(12, 'Energy Transfer', NULL, 233, NULL, NULL, NULL),
(13, 'ENI Petroleum', NULL, 233, NULL, NULL, NULL),
(14, 'Explorer', NULL, 233, NULL, NULL, NULL),
(15, 'Fortis', NULL, 38, NULL, NULL, NULL),
(16, 'Gas Unie', NULL, 166, NULL, NULL, NULL),
(17, 'InterPipe', '403-698956', 38, 'Canada', NULL, NULL),
(18, 'IOL', NULL, NULL, NULL, NULL, NULL),
(19, 'Kern River', NULL, 233, NULL, NULL, NULL),
(20, 'Kinder Morgan', NULL, 233, NULL, NULL, NULL),
(21, 'Marathon', NULL, 233, NULL, NULL, NULL),
(22, 'Mirant', NULL, 38, NULL, NULL, NULL),
(23, 'National Grid', NULL, 233, NULL, NULL, NULL),
(24, 'Nippon Steel', NULL, 114, NULL, NULL, NULL),
(25, 'Northern Natural', NULL, 233, NULL, NULL, NULL),
(26, 'Nova Chemicals', NULL, 38, NULL, NULL, NULL),
(27, 'Ocensa', NULL, 49, NULL, NULL, NULL),
(28, 'Oneok', NULL, 233, NULL, NULL, NULL),
(29, 'Pan Handle', NULL, 233, 'USA', NULL, NULL),
(30, 'PB Energy', NULL, 233, NULL, NULL, NULL),
(31, 'Pembina', NULL, 38, NULL, NULL, NULL),
(32, 'Pemex', NULL, 157, NULL, NULL, NULL),
(33, 'Petroperu', NULL, 174, NULL, NULL, NULL),
(34, 'PG&E', NULL, 233, NULL, NULL, NULL),
(35, 'Phillips', NULL, 233, NULL, NULL, NULL),
(36, 'PPS', NULL, 218, NULL, NULL, NULL),
(37, 'Sempra Energy', NULL, 38, NULL, NULL, NULL),
(38, 'Shell', NULL, 233, NULL, NULL, NULL),
(39, 'SNAM', '403-2733655', 38, 'Italy', NULL, NULL),
(40, 'So Cal', NULL, 233, 'USA', NULL, NULL),
(41, 'Spectra', NULL, 38, NULL, NULL, NULL),
(42, 'Suncor', NULL, 38, NULL, NULL, NULL),
(43, 'Syncrude', NULL, NULL, NULL, NULL, NULL),
(44, 'TCPL', '403-989-5236', 38, 'Canada', NULL, NULL),
(45, 'Terasen Gas', NULL, 38, NULL, NULL, NULL),
(46, 'TGN', NULL, 10, NULL, NULL, NULL),
(47, 'Thunder Creek', NULL, 233, NULL, NULL, NULL),
(48, 'TransGas', NULL, 49, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_status`
--

DROP TABLE IF EXISTS `tbl_om_status`;
CREATE TABLE IF NOT EXISTS `tbl_om_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `prev_status_id` int(11) DEFAULT NULL,
  `next_status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_om_country`
--

INSERT INTO `tbl_om_status` (`id`,`name`,`prev_status_id`,`next_status_id`) VALUES
(1, 'Active', NULL, NULL),
(2, 'In Field', NULL, NULL),
(3, 'Delayed', NULL, NULL),
(4, 'Completed', NULL, NULL), 
(5, 'Cancelled', NULL, NULL);


--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_om_order`
--
  
ALTER TABLE `tbl_om_order`
  ADD CONSTRAINT `fk_order_to_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_to_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_to_client` FOREIGN KEY (`client_id`) REFERENCES `tbl_om_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_to_size` FOREIGN KEY (`size_id`) REFERENCES `tbl_om_size` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_to_person` FOREIGN KEY (`person_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_to_tool_type` FOREIGN KEY (`tool_type_id`) REFERENCES `tbl_om_tool_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_to_product` FOREIGN KEY (`product_id`) REFERENCES `tbl_om_product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_to_location` FOREIGN KEY (`location_id`) REFERENCES `tbl_om_location` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_to_country` FOREIGN KEY (`country_id`) REFERENCES `tbl_om_country` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_to_status` FOREIGN KEY (`status_id`) REFERENCES `tbl_om_status` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_om_client`
--
ALTER TABLE `tbl_om_client`
  ADD CONSTRAINT `fk_client_to_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_client_to_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE;