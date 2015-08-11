-- Adminer 4.2.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `maestro`;
CREATE DATABASE `maestro` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `maestro`;

CREATE TABLE `tbl_auth_assignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` int(11) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  KEY `fk_auth_assignment_userid` (`userid`),
  CONSTRAINT `fk_auth_assignment_itemname` FOREIGN KEY (`itemname`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_assignment_userid` FOREIGN KEY (`userid`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_auth_item` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('createIssue',	0,	'create a new issue',	NULL,	'N;'),
('createProject',	0,	'create a new project',	NULL,	'N;'),
('createUser',	0,	'create a new user',	NULL,	'N;'),
('deleteIssue',	0,	'delete an issue from a project',	NULL,	'N;'),
('deleteProject',	0,	'delete a project',	NULL,	'N;'),
('deleteUser',	0,	'remove a user from a project',	NULL,	'N;'),
('member',	2,	'',	NULL,	'N;'),
('owner',	2,	'',	NULL,	'N;'),
('reader',	2,	'',	NULL,	'N;'),
('readIssue',	0,	'read issue information',	NULL,	'N;'),
('readProject',	0,	'read project information',	NULL,	'N;'),
('readUser',	0,	'read user profile information',	NULL,	'N;'),
('updateIssue',	0,	'update issue information',	NULL,	'N;'),
('updateProject',	0,	'update project information',	NULL,	'N;'),
('updateUser',	0,	'update a users in-formation',	NULL,	'N;');

CREATE TABLE `tbl_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `fk_auth_item_child_child` (`child`),
  CONSTRAINT `fk_auth_item_child_child` FOREIGN KEY (`child`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_item_child_parent` FOREIGN KEY (`parent`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_auth_item_child` (`parent`, `child`) VALUES
('member',	'createIssue'),
('owner',	'createProject'),
('owner',	'createUser'),
('member',	'deleteIssue'),
('owner',	'deleteProject'),
('owner',	'deleteUser'),
('owner',	'member'),
('member',	'reader'),
('owner',	'reader'),
('reader',	'readIssue'),
('reader',	'readProject'),
('reader',	'readUser'),
('member',	'updateIssue'),
('owner',	'updateProject'),
('owner',	'updateUser');

CREATE TABLE `tbl_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CURCurrencyName` varchar(50) DEFAULT NULL,
  `CURExchangeRate` double DEFAULT '0',
  `CURCurrencyChar` varchar(4) DEFAULT NULL,
  `CURFormat` varchar(35) DEFAULT NULL,
  `CURFormatExt` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_currency` (`id`, `CURCurrencyName`, `CURExchangeRate`, `CURCurrencyChar`, `CURFormat`, `CURFormatExt`) VALUES
(1,	'$ USD',	1,	'$',	'$#,##0.000;($#,##0.000)',	'$#,##0.00;($#,##0.00)');

CREATE TABLE `tbl_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CUCustomer` varchar(255) DEFAULT NULL,
  `CUAddress` varchar(255) DEFAULT NULL,
  `CUShipAddress` varchar(255) DEFAULT NULL,
  `CUPhone1` varchar(20) DEFAULT NULL,
  `CUPhone2` varchar(20) DEFAULT NULL,
  `CUContact1` varchar(50) DEFAULT NULL,
  `CUContact2` varchar(50) DEFAULT NULL,
  `CUFax` varchar(20) DEFAULT NULL,
  `CUEmail1` varchar(50) DEFAULT NULL,
  `CUEmail2` varchar(50) DEFAULT NULL,
  `CUNotes` longtext,
  `CUWeb` varchar(100) DEFAULT NULL,
  `CUCode` varchar(20) DEFAULT NULL,
  `CUAccount` varchar(20) DEFAULT NULL,
  `CUTerms` varchar(20) DEFAULT NULL,
  `CUFedTaxID` varchar(20) DEFAULT NULL,
  `CUStateTaxID` varchar(20) DEFAULT NULL,
  `CUNoPhonePrefix` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_customer` (`id`, `CUCustomer`, `CUAddress`, `CUShipAddress`, `CUPhone1`, `CUPhone2`, `CUContact1`, `CUContact2`, `CUFax`, `CUEmail1`, `CUEmail2`, `CUNotes`, `CUWeb`, `CUCode`, `CUAccount`, `CUTerms`, `CUFedTaxID`, `CUStateTaxID`, `CUNoPhonePrefix`) VALUES
(1,	'B&E Submarines',	'Penn\'s Landing, 211 South Columbus Blvd. & Walnut St., Philadelphia, PA 19106, USA',	'Penn\'s Landing, 211 South Columbus Blvd. & Walnut St., Philadelphia, PA 19106, USA',	'1-215-413-8655',	'',	'Edward Bentley, Principal',	'',	'1-315-345-6789',	'bentley@besub.com',	'',	'Diving equipment',	'http://en.wikipedia.org/wiki/Submarine',	'BANDE',	'C0001',	'CA',	'20-1234568',	'12-124',	0),
(2,	'Hosmer Engineering',	'1700 West Montgomery Avenue, Philadelphia, PA 19121, USA',	'1700 West Montgomery Avenue, Philadelphia, PA 19121, USA',	'1-215-763-6529',	'',	'Fenwick Hosmer, Principal',	'',	'1-315-456-7890',	'hosmer@hosmer.com',	'',	'Aviation engineering services',	'http://en.wikipedia.org/wiki/Aviation',	'HOSMER',	'C0002',	'90',	'20-1234569',	'12-125',	0),
(3,	'Universal Flying Machine Company',	'One Charles Lindbergh Blvd., Garden City, NY 11530, USA',	'One Charles Lindbergh Blvd., Garden City, NY 11530, USA',	'1-516-572-4111',	'',	'Peton Gale, President',	'',	'1-315-567-8901',	'pgale@ufmc.com',	'',	'Aviation electronics',	'http://en.wikipedia.org/wiki/Avionics',	'UFMC',	'C0003',	'30',	'20-1234570',	'12-126',	0),
(4,	'Titus Bro. Construction Co.',	'26-15 Ulmer Street College Point, NY 11354, USA',	'26-15 Ulmer Street College Point, NY 11354, USA',	'1-718-554-2320',	'',	'Job Titus, Principal',	'',	'1-315-678-9012',	'job@titusbros.com',	'',	'Earth tunneling equipment',	'http://en.wikipedia.org/wiki/Tunnel',	'TITUS',	'C0004',	'NG',	'20-1234571',	'12-127',	0),
(5,	'Swift Construction Company',	'1 Swift Way\r\nShopton, NY 13054, USA',	'',	'1-315-123-4567\r\n',	'',	'Miquel DeLazes\r\n',	'',	'',	'mdelazes@swiftconstructioncompany.net\r\n',	'',	'SCC Internal (build-to-stock)',	'http://www.swiftconstructioncompany.net',	'SCC-INV',	'',	'',	'',	'',	0);

CREATE TABLE `tbl_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FILPNPartNumber` varchar(50) DEFAULT NULL,
  `FILFilePath` varchar(255) DEFAULT NULL,
  `FILFileName` varchar(255) DEFAULT NULL,
  `FILView` tinyint(1) DEFAULT '0',
  `FILNotes` varchar(50) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_file_to_part` (`part_id`),
  CONSTRAINT `fk_file_to_part` FOREIGN KEY (`part_id`) REFERENCES `tbl_part` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_file` (`id`, `FILPNPartNumber`, `FILFilePath`, `FILFileName`, `FILView`, `FILNotes`, `part_id`) VALUES
(1,	'',	'',	'Z:\\parts\\20000001\\20000001_WI-00_graphics.odg',	0,	'graphics used in WI-00',	3),
(4,	'',	'',	'Z:\\parts\\20000002\\20000002_QUO-00-APC-2004-12-23.pdf',	0,	'Quote',	15),
(9,	'',	'',	'Z:\\parts\\10000001\\10000001_WI-02.pdf',	0,	'Work Instruction - PDF',	1),
(10,	'',	'',	'Z:\\parts\\10000001\\10000001_PBS-02.odg',	0,	'Product Breakdown Structure - Source',	1),
(11,	'',	'',	'Z:\\parts\\10000001\\10000001_PBS-02.pdf',	0,	'Product Breakdown Structure - PDF',	1),
(12,	'',	'',	'Z:\\parts\\10000001\\10000001_WI-02.odt',	0,	'Work Instruction - Source',	1),
(13,	'',	'',	'Z:\\parts\\90000001\\Belden-8085.pdf',	0,	'Datasheet',	16),
(14,	'',	'',	'Z:\\parts\\90000002\\CWS-ByteMark-ferrite-datasheet.pdf',	0,	'Datasheet',	17),
(15,	'',	'',	'Z:\\parts\\90000002\\CWS-ByteMark-2009-12-04.pdf',	0,	'Quote',	17),
(16,	'',	'',	'Z:\\parts\\90000002\\CWS-ByteMark-ferrite-appnote.pdf',	0,	'App note',	17),
(17,	'',	'',	'Z:\\parts\\90000003\\Scotch-Vinyl-Electrical-Tape.pdf',	0,	'Datasheet',	18),
(18,	'',	'',	'Z:\\parts\\90000003\\MSDS-Scotch-Vinyl-Electrical-Tape-2007-01-05.pdf',	0,	'MSDS',	18),
(19,	'',	'',	'Z:\\parts\\90000004\\DS-CUI-MJ-3536NG.pdf',	0,	'Datasheet',	14),
(20,	'',	'',	'Z:\\parts\\90000005\\Sprague-Goodman-GM-Series.pdf',	0,	'Datasheet',	13),
(21,	'',	'',	'Z:\\parts\\90000006\\Magnatec-OA95.pdf',	0,	'Datasheet',	12),
(22,	'',	'',	'Z:\\parts\\90000007\\Panasonic-RadLead-KS.pdf',	0,	'Datasheet',	11),
(23,	'',	'',	'Z:\\parts\\90000008\\AVX-Radial-SkyCap.pdf',	0,	'Datasheet',	10),
(24,	'',	'',	'Z:\\parts\\90000009\\Kemet-Ceramic.pdf',	0,	'Datasheet',	9),
(25,	'',	'',	'Z:\\parts\\90000010\\Vishay-5063JD-Spacemiser.pdf',	0,	'Datasheet',	8),
(26,	'',	'',	'Z:\\parts\\90000011\\Vishay-5063JD-Spacemiser.pdf',	0,	'Datasheet',	7),
(27,	'',	'',	'Z:\\parts\\90000012\\Maplin-crystal-earph-LB25C.pdf',	0,	'Datasheet',	5),
(28,	'',	'',	'Z:\\parts\\50000001\\50000001_DSN-01.pdf',	0,	'Design Output - PDF',	6),
(29,	'',	'',	'Z:\\parts\\50000001\\50000001_DSN-01.odt',	0,	'Design Source',	6),
(30,	'',	'',	'Z:\\parts\\20000001\\20000001_WI-01.pdf',	0,	'Work Instruction - PDF',	3),
(31,	'',	'',	'Z:\\parts\\20000001\\20000001_WI-01.odt',	0,	'Work Instruction - Source',	3),
(32,	'',	'',	'Z:\\parts\\20000002\\20000002_MA-00.pdf',	0,	'Master Drawing - PDF',	15),
(33,	'',	'',	'Z:\\parts\\20000002\\20000002_CAM-01.pdf',	0,	'CAM plot',	15),
(34,	'',	'',	'Z:\\parts\\20000002\\20000002_CAM-01.zip',	0,	'CAM archive',	15),
(35,	'',	'',	'Z:\\parts\\20000002\\20000002_MA-00.odg',	0,	'Master Drawing - Source',	15),
(36,	'',	'',	'Z:\\parts\\20000003\\20000003_WI-01.pdf',	0,	'Work Instruction - PDF',	2),
(37,	'',	'',	'Z:\\parts\\20000003\\20000003_ASSY-01.odg',	0,	'Assembly drawing - Source',	2),
(38,	'',	'',	'Z:\\parts\\20000003\\20000003_ASSY-01.pdf',	0,	'Assembly drawing - PDF',	2),
(39,	'',	'',	'Z:\\parts\\20000003\\20000003_DSN-01.zip',	0,	'Design archive',	2),
(40,	'',	'',	'Z:\\parts\\20000003\\20000003_SCH-01.pdf',	0,	'Schematic',	2),
(41,	'',	'',	'Z:\\parts\\20000003\\20000003_WI-01.odt',	0,	'Work Instruction - Source',	2),
(42,	'',	'',	'Z:\\parts\\10000002\\10000002_ART-01.odg',	0,	'Artwork source',	20),
(43,	'',	'',	'Z:\\parts\\10000002\\10000002_ART-01.pdf',	0,	'Artwork PDF',	20),
(44,	'',	'',	'Z:\\parts\\10000002\\10000002_FAB-01.odg',	0,	'Fab source',	20),
(45,	'',	'',	'Z:\\parts\\10000002\\10000002_FAB-01.pdf',	0,	'Fab PDF',	20),
(46,	'',	'',	'Z:\\parts\\10000003\\10000003_PBS-00.odg',	0,	'Product Breakdown Structure diagram source',	19),
(47,	'',	'',	'Z:\\parts\\10000003\\10000003_PBS-00.pdf',	0,	'Product Breakdown Structure diagram PDF',	19),
(48,	'',	'',	'Z:\\parts\\10000003\\10000003_WI-00.odt',	0,	'Work Instruction source',	19),
(49,	'',	'',	'Z:\\parts\\10000003\\10000003_WI-00.pdf',	0,	'Work Instruction PDF',	19),
(50,	'',	'',	'Z:\\parts\\10000001\\10000001_ASSY-01.odg',	0,	'Assembly drawing source',	1),
(51,	'',	'',	'Z:\\parts\\10000001\\10000001_ASSY-01.pdf',	0,	'Assembly drawing PDF',	1),
(52,	'',	'',	'Z:\\parts\\80000001\\Hammond-9c2pg42-43.pdf',	0,	'Application note',	22),
(53,	'',	'',	'Z:\\parts\\80000001\\Hammond-1590T.dwg',	0,	'Datasheet drawing',	22),
(54,	'',	'',	'Z:\\parts\\80000001\\Hammond-1590T.pdf',	0,	'Datasheet',	22),
(55,	'',	'',	'Z:\\parts\\80000002\\Keystone-M55-prod31.pdf',	0,	'Datasheet',	27),
(56,	'',	'',	'Z:\\parts\\80000003\\Machinepancombo.pdf',	0,	'Datasheet',	28),
(57,	'',	'',	'Z:\\parts\\80000004\\TYCO-ENG_CD_5205820_O.pdf',	0,	'Datasheet',	29),
(58,	'',	'',	'Z:\\parts\\80000005\\IS-435.PDF',	0,	'Application',	21),
(59,	'',	'',	'Z:\\parts\\80000005\\MSDS-MS-4040.pdf',	0,	'MSDS',	21),
(60,	'',	'',	'Z:\\parts\\80000005\\Quote-ULINE-S-463.pdf',	0,	'Quote',	21),
(61,	'',	'',	'Z:\\parts\\80000005\\ULINE-S463.pdf',	0,	'Catalogue',	21),
(62,	'',	'',	'Z:\\parts\\80000006\\Keystone-M55-prod31.pdf',	0,	'Datasheet',	32),
(63,	'',	'',	'Z:\\parts\\80000007\\INT LWZ 004.jpg',	0,	'Drawing',	26),
(64,	'',	'',	'Z:\\parts\\90000013\\BICC-General-Carol-Hookup-Wire.pdf',	0,	'Datasheet',	4),
(65,	'',	'',	'Z:\\parts\\90000014\\1110104001.pdf',	0,	'Datasheet',	30),
(66,	'',	'',	'Z:\\parts\\90000015\\1110107001.pdf',	0,	'Datasheet',	31),
(67,	'',	'',	'Z:\\parts\\90000016\\ENG_CD_330648_F1.pdf',	0,	'Datasheet',	23),
(68,	'',	'',	'Z:\\parts\\90000017\\Hookup.pdf',	0,	'Datasheet',	24),
(69,	'',	'',	'Z:\\parts\\90000018\\Hookup.pdf',	0,	'Datasheet',	25),
(70,	'',	'',	'Z:\\parts\\50000001\\50000001_DSN-01-graphics.zip',	0,	'Design Source (graphic files)',	6),
(71,	'',	'',	'Z:\\parts\\60000001\\60000001_PBS-00.odg',	0,	'Product Breakdown Structure',	33),
(72,	'',	'',	'Z:\\parts\\60000001\\60000001_PBS-00.pdf',	0,	'Product Breakdown Structure - PDF',	33),
(73,	'',	'',	'Z:\\parts\\60000001\\60000001_WI-00.odt',	0,	'Work Instruction',	33),
(74,	'',	'',	'Z:\\parts\\60000001\\60000001_WI-00.pdf',	0,	'Work Instruction  - PDF',	33);

CREATE TABLE `tbl_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `shipping` float DEFAULT NULL,
  `amount_due` float DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `update_time` datetime NOT NULL,
  `update_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_to_order` (`order_id`),
  KEY `fk_invoice_to_create_user` (`create_user_id`),
  KEY `fk_invoice_to_update_user` (`update_user_id`),
  CONSTRAINT `fk_invoice_to_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_invoice_to_order` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_invoice_to_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `completion` float DEFAULT NULL,
  `outline_number` varchar(255) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `web_link` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `requester_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_issue_to_owner` (`owner_id`),
  KEY `fk_issue_to_project` (`project_id`),
  KEY `fk_issue_to_requester` (`requester_id`),
  KEY `fk_issue_to_create_user` (`create_user_id`),
  KEY `fk_issue_to_update_user` (`update_user_id`),
  CONSTRAINT `fk_issue_to_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_issue_to_owner` FOREIGN KEY (`owner_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_issue_to_project` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_issue_to_requester` FOREIGN KEY (`requester_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_issue_to_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_issue` (`id`, `name`, `description`, `begin_date`, `end_date`, `duration`, `completion`, `outline_number`, `cost`, `web_link`, `owner_id`, `project_id`, `requester_id`, `status_id`, `type_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1,	'Incorrect PCB layout',	'Connectivity of PCB-type inductor is incorrect.',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	3,	2,	15,	1,	0,	'2014-09-17 00:00:00',	22,	'2014-09-17 00:00:00',	22),
(2,	'Difficult assembly procedure',	'Manufacturing staff report assembly of wireless unit is difficult to assemble and test due to copper-side-up orientation of PCA. Suggestion is to orient PCA component-side up providing for full access to components for more effective visual inspection and easier troubleshooting after assembly.',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	3,	2,	1,	1,	1,	'2014-09-17 00:00:00',	22,	'2014-09-17 00:00:00',	22),
(3,	'No field spares kit.',	'Customers are requesting we provide a field spares kit with most-commonly used repair items for convenience of repair technicians.',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	6,	2,	NULL,	1,	1,	'2014-09-17 00:00:00',	11,	'2014-09-17 00:00:00',	11),
(4,	'prototype 1',	'Release of PN 20000004 Rev 00 Parts List with child parts and assemblies for building a small number of prototype units. Assembly includes an earphone, wire for a stubby antenna and preliminary user manual, but no enclosure. Manufacturing process documentation includes a product part breakdown structure diagram, a work instruction for packing beta test units and a work instruction for fabricating PN 20000001 (custom inductor).',	'2015-01-01 00:00:00',	'2015-01-28 00:00:00',	20,	100,	'1.1',	280,	'',	6,	2,	NULL,	1,	2,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(5,	'design gate 1',	'',	'2015-01-29 00:00:00',	'2015-01-29 00:00:00',	0,	0,	'1.2',	0,	'',	20,	2,	NULL,	1,	2,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(6,	'prototype 2',	'Revise electrical schematic to correct connectivity of PCB-type inductor, revise PCB design to correct inductor layout, and generate new PCB CAM files. Correct mechanical dimensions of the PCB, create Master Drawing for the PCB, create assembly drawing and work instruction for circuit board assembly. Update work instruction for custom inductor PN 20000001 for clarity (primarily formatting changes,  the rev level was not changed as no changes affected the part itself - fit, form or function).',	'2015-01-29 00:00:00',	'2015-02-25 00:00:00',	20,	20,	'1.3',	280,	'',	6,	2,	NULL,	1,	2,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(7,	'design gate 2',	'',	'2015-02-26 00:00:00',	'2015-02-26 00:00:00',	0,	0,	'1.4',	0,	'',	20,	2,	NULL,	1,	2,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(8,	'product release',	'Restructuring of parts lists for product release, including creation of a new top-level marketing assembly part number. An enclosure with hardware was added, the manual and earphone were moved to the marketing assembly, and the stubby antenna was removed and the user manual was updated.',	'2015-02-26 00:00:00',	'2015-03-25 00:00:00',	20,	0,	'1.5',	490,	'',	6,	2,	NULL,	1,	2,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(9,	'mfg gate 1',	'',	'2015-03-26 00:00:00',	'2015-03-26 00:00:00',	0,	0,	'1.6',	0,	'',	20,	2,	NULL,	1,	2,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(10,	'cost/quality improvements',	'Circuit board orientation in enclosure was inverted to aid assembly and test (mounted PCA component-side-up in enclosure changed to copper-side-up, allowing direct access to circuit board components and off-board wiring while mounted in the enclosure). Location of holes in the enclosure base and lid were adjusted for the new circuit board orientation, and enclosure artwork modified accordingly. To document the changes, the PCA assembly diagram and work instruction were updated for the tuning capacitor being mounted on the opposite side of the PCB, and the enclosure-level assembly diagram and work instruction were updated for PCA mounting change (orientation and new shorter standoffs).',	'2015-03-26 00:00:00',	'2015-04-22 00:00:00',	20,	0,	'1.7',	630,	'',	18,	2,	NULL,	1,	2,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(11,	'mfg gate 2',	'',	'2015-04-23 00:00:00',	'2015-04-23 00:00:00',	0,	0,	'1.8',	0,	'',	20,	2,	NULL,	1,	2,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(12,	'field service kit',	'A kit of parts useful for field service was released. The service kit and contents was created in response to requests from field service technicians to provide more effective and efficient field service.',	'2015-04-23 00:00:00',	'2015-05-20 00:00:00',	20,	0,	'1.9',	160,	'',	14,	2,	NULL,	1,	2,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(13,	'mfg gate 3',	'',	'2015-05-21 00:00:00',	'2015-05-21 00:00:00',	0,	0,	'1.1',	0,	'',	20,	2,	NULL,	1,	2,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(14,	'DEFAULT ISSUE',	'This is the DEFAULT issue for the DEFAULT project.',	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	NULL,	NULL,	'',	NULL,	'',	NULL,	1,	NULL,	0,	0,	'2015-06-26 10:17:38',	1,	'2015-06-26 10:17:38',	1);

CREATE TABLE `tbl_issue_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_issue_list_to_parent` (`issue_id`),
  KEY `fk_issue_list_to_child` (`related_id`),
  CONSTRAINT `fk_issue_list_to_child` FOREIGN KEY (`related_id`) REFERENCES `tbl_issue` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_issue_list_to_parent` FOREIGN KEY (`issue_id`) REFERENCES `tbl_issue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_issue_part_assignment` (
  `issue_id` int(11) NOT NULL DEFAULT '0',
  `part_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`issue_id`,`part_id`),
  KEY `fk_part_to_issue` (`part_id`),
  CONSTRAINT `fk_issue_to_part` FOREIGN KEY (`issue_id`) REFERENCES `tbl_issue` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_part_to_issue` FOREIGN KEY (`part_id`) REFERENCES `tbl_part` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_issue_predecessor_assignment` (
  `issue_id` int(11) NOT NULL DEFAULT '0',
  `predecessor_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`issue_id`,`predecessor_id`),
  KEY `fk_predecessor_to_issue` (`predecessor_id`),
  CONSTRAINT `fk_issue_to_predecessor` FOREIGN KEY (`issue_id`) REFERENCES `tbl_issue` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_predecessor_to_issue` FOREIGN KEY (`predecessor_id`) REFERENCES `tbl_issue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_issue_predecessor_assignment` (`issue_id`, `predecessor_id`) VALUES
(5,	4),
(6,	4),
(7,	6),
(8,	6),
(9,	8),
(10,	8),
(11,	10),
(12,	10),
(13,	12);

CREATE TABLE `tbl_issue_stock_assignment` (
  `issue_id` int(11) NOT NULL DEFAULT '0',
  `stock_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`issue_id`,`stock_id`),
  KEY `fk_stock_to_issue` (`stock_id`),
  CONSTRAINT `fk_issue_to_stock` FOREIGN KEY (`issue_id`) REFERENCES `tbl_issue` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_stock_to_issue` FOREIGN KEY (`stock_id`) REFERENCES `tbl_stock_serial` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_issue_user_assignment` (
  `issue_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`issue_id`,`user_id`),
  KEY `fk_user_to_issue` (`user_id`),
  CONSTRAINT `fk_issue_to_user` FOREIGN KEY (`issue_id`) REFERENCES `tbl_issue` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_to_issue` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_issue_user_assignment` (`issue_id`, `user_id`) VALUES
(4,	6),
(6,	6),
(10,	6),
(10,	8),
(4,	9),
(6,	9),
(8,	9),
(10,	9),
(10,	10),
(4,	14),
(8,	17),
(10,	17),
(12,	17),
(8,	21),
(10,	21),
(12,	21),
(8,	22),
(5,	23),
(7,	23),
(8,	23),
(9,	23),
(11,	23),
(12,	23),
(13,	23),
(4,	25),
(6,	26),
(8,	26),
(10,	26),
(12,	26);

CREATE TABLE `tbl_manufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MFRMfrName` varchar(50) NOT NULL,
  `MFRAddress` varchar(255) DEFAULT NULL,
  `MFRCountry` varchar(50) DEFAULT NULL,
  `MFRContact1` varchar(50) DEFAULT NULL,
  `MFRContact2` varchar(50) DEFAULT NULL,
  `MFRPhone1` varchar(20) DEFAULT NULL,
  `MFRPhone2` varchar(20) DEFAULT NULL,
  `MFRFax` varchar(20) DEFAULT NULL,
  `MFRWeb` varchar(255) DEFAULT NULL,
  `MFRNotes` longtext,
  `MFRCode` varchar(20) DEFAULT NULL,
  `MFREMail1` varchar(50) DEFAULT NULL,
  `MFREMail2` varchar(50) DEFAULT NULL,
  `MFRNoPhonePrefix` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_manufacturer` (`id`, `MFRMfrName`, `MFRAddress`, `MFRCountry`, `MFRContact1`, `MFRContact2`, `MFRPhone1`, `MFRPhone2`, `MFRFax`, `MFRWeb`, `MFRNotes`, `MFRCode`, `MFREMail1`, `MFREMail2`, `MFRNoPhonePrefix`) VALUES
(1,	'General Cable (Carol Brand)',	'4 Tesseneer Drive, Highland Heights, KY 41076, USA',	'USA',	'',	'',	'1-859-572-8000',	'',	'1-859-572-8458',	'http://www.generalcable.com/',	'',	'CAROL',	'',	'',	0),
(2,	'Vishay (BC Components)',	'One Greenwich Place, Shelton, CT 06484, USA',	'USA',	'',	'',	'1-402-563-6866',	'',	'1-402-563-6296',	'http://www.vishay.com/',	'',	'VISHAY',	'',	'',	0),
(3,	'Kemet',	'P.O. Box 5928, Greenville, SC 29606, USA',	'USA',	'',	'Tech Svces (8am - 5pm ET)',	'1-864-963-6300',	'1-877-695-3638',	'',	'http://www.kemet.com/',	'',	'KEMET',	'',	'',	0),
(4,	'AVX Corporation',	'801 17th Avenue South, Box 867, Myrtle Beach, SC 29578-0687 USA',	'USA',	'',	'',	'1-843-448-9411',	'',	'',	'http://www.avx.com/',	'',	'AVX',	'',	'',	0),
(5,	'Panasonic (Industrial)',	'Three Panasonic Way, M/S: 7H-2, Secaucus, NJ 07094, USA',	'USA',	'',	'',	'1-800-344-2112',	'',	'',	'http://www.panasonic.com/industrial/electronic-components/',	'',	'PANA',	'',	'',	0),
(6,	'Semelab',	'Coventry Road, Lutterworth, Leicestershire LE17 4JB',	'Great Britain',	'',	'',	'011-44-0-1455-552505',	'',	'',	'http://www.semelab.com/',	'',	'SEMI',	'',	'',	0),
(7,	'Sprague-Goodman',	'1700 Shames Drive, Westbury, NY 11590, USA',	'USA',	'',	'',	'1-516-334-8700',	'',	'1-516-334-8771',	'http://www.spraguegoodman.com/',	'',	'SPRAG',	'',	'',	0),
(8,	'CUI Inc.',	'20050 SW 112th Avenue, Tualatin, OR 97062, USA',	'USA',	'',	'',	'1-800-275-4899',	'',	'1-503-612-2383',	'http://www.cui.com/',	'',	'CUI',	'',	'',	0),
(9,	'AP Circuits',	'Unit 3, 1112-40th Ave. NE, Calgary, AB T2E5T8, Canada',	'Canada',	'',	'',	'1-403-250-3406',	'',	'',	'http://www.apcircuits.com/',	'',	'APC',	'',	'',	0),
(10,	'Belden',	'7733 Forsyth Boulevard, Suite 800, St. Louis, MO 63105, USA',	'USA',	'',	'Customer Svces',	'1-314-854-8000',	'1-800-235-3361',	'',	'http://www.belden.com/',	'',	'BLDN',	'',	'',	0),
(11,	'3M',	'300 Tartan Drive, London, Ontario N5V 4M9, Canada',	'Canada',	'',	'',	'1-888-364-3577',	'',	'1-800-479-4453',	'http://www.3m.com/',	'',	'THREEM',	'',	'',	0),
(12,	'B&F Fastener Supply',	'2827 Anthony Lane South, Minneapolis, MN 55418, USA',	'USA',	'',	'',	'1-612-788-7468',	'1-800-964-8241',	'1-612-788-1914',	'http://www.buildingfasteners.com/',	'',	'BANDF',	'',	'',	0),
(13,	'Hammond Manufacturing',	'394 Edinburgh Rd North, Guelph , ON N1H 1E5, Canada',	'Canada',	'',	'',	'1-519-822-2960',	'1-905-456-3770',	'1-519-822-0715',	'http://www.hammondmfg.com/',	'',	'HAMMOND',	'sales@hammfg.com',	'',	0),
(14,	'Keystone Electronics',	'31-07 20th Road, Astoria, NY 11105, USA',	'USA',	'',	'',	'1-718-956-8900',	'1-800-221-5510',	'1-718-956-9040',	'http://www.keyelco.com/',	'',	'KEYSTONE',	'',	'',	0),
(15,	'Tyco Electronics',	'',	'',	'Canada Support',	'',	'1-905-475-6222',	'',	'',	'http://www.tycoelectronics.com/',	'',	'TYCO',	'',	'',	0),
(16,	'Emerson',	'3000 Lakeside Drive, Suite 308N, Bannockburn, IL 60015, USA',	'USA',	'',	'',	'1-847-739-0300',	'',	'1-847-739-0301',	'http://emersonconnectivity.com/',	'',	'EMERSON',	'',	'',	0),
(17,	'Emerson Network Power Connectivity Solutions',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0);

CREATE TABLE `tbl_manufacturer_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) DEFAULT '0',
  `MFRPNPart` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mfrpn_mfr` (`manufacturer_id`),
  CONSTRAINT `fk_mfrpn_mfr` FOREIGN KEY (`manufacturer_id`) REFERENCES `tbl_manufacturer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_manufacturer_part` (`id`, `manufacturer_id`, `MFRPNPart`) VALUES
(1,	1,	'C2119A-12-02'),
(2,	2,	'MBA02040C5604FRP00'),
(3,	2,	'MBA02040C2004FRP00'),
(4,	3,	'C317C332K1R5TA'),
(5,	4,	'SR151A330KAA'),
(6,	5,	'ECE-A1CKK100'),
(7,	6,	'OA95/05'),
(8,	7,	'GM-C-3-06-00'),
(9,	8,	'MJ-3536NG'),
(10,	10,	'8085'),
(11,	11,	'35 BLUE (3/4\"X66\')'),
(12,	13,	'1590TBK'),
(13,	15,	'330648'),
(14,	1,	'C2065A.12.06'),
(15,	1,	'C2065A.12.05'),
(16,	12,	'INT LWZ 004'),
(17,	14,	'8440E'),
(18,	12,	'PMSSS 440 0025 PH'),
(19,	15,	'5205820-3'),
(20,	17,	'111-0104-001'),
(21,	17,	'111-0107-001'),
(22,	14,	'2203K-ND');

CREATE TABLE `tbl_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base',	1433014854),
('m131105_025331_initial_schema',	1433014915),
('m150515_162243_create_rbac_tables',	1433014915);

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `parts_list_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_to_create_user` (`create_user_id`),
  KEY `fk_order_to_project` (`project_id`),
  KEY `fk_order_to_part` (`parts_list_id`),
  KEY `fk_order_to_update_user` (`update_user_id`),
  CONSTRAINT `fk_order_to_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_to_part` FOREIGN KEY (`parts_list_id`) REFERENCES `tbl_part` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_to_project` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_to_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_order` (`id`, `name`, `type`, `status`, `project_id`, `parts_list_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(8,	'ORDER-001',	'INTERNAL',	'PROTOTYPE',	2,	33,	'2015-08-11 14:02:10',	1,	'2015-08-11 14:02:10',	1),
(9,	'ORDER-002',	'INTERNAL',	'PROTOTYPE',	2,	33,	'2015-08-11 14:05:00',	1,	'2015-08-11 14:05:00',	1);

CREATE TABLE `tbl_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `desired_qty` int(11) DEFAULT '0',
  `shipped_qty` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_order_item_to_order` (`order_id`),
  KEY `fk_order_item_to_part` (`part_id`),
  CONSTRAINT `fk_order_item_to_order` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_item_to_part` FOREIGN KEY (`part_id`) REFERENCES `tbl_part` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_order_item` (`id`, `order_id`, `part_id`, `desired_qty`, `shipped_qty`) VALUES
(23,	8,	20,	1,	0),
(24,	8,	5,	1,	0),
(25,	8,	2,	1,	0),
(26,	8,	6,	1,	0),
(27,	9,	20,	1,	0),
(28,	9,	5,	1,	0),
(29,	9,	2,	1,	0),
(30,	9,	6,	1,	0);

CREATE TABLE `tbl_order_item_sn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_item_id` int(11) DEFAULT NULL,
  `stock_serial_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_item_sn_to_order_item` (`order_item_id`),
  KEY `fk_order_item_sn_to_stock_serial` (`stock_serial_id`),
  CONSTRAINT `fk_order_item_sn_to_order_item` FOREIGN KEY (`order_item_id`) REFERENCES `tbl_order_item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_item_sn_to_stock_serial` FOREIGN KEY (`stock_serial_id`) REFERENCES `tbl_stock_serial` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PNIDToLNK` int(11) DEFAULT NULL,
  `PNUNID` int(11) DEFAULT '1',
  `PNTabParentID` int(11) DEFAULT NULL,
  `PNPrefix` varchar(50) DEFAULT NULL,
  `PNPartNumber` varchar(50) NOT NULL,
  `PNSuffix` varchar(50) DEFAULT NULL,
  `type_id` varchar(5) DEFAULT NULL,
  `PNRevision` varchar(10) DEFAULT NULL,
  `PNTitle` varchar(255) DEFAULT NULL,
  `PNDetail` varchar(255) DEFAULT NULL,
  `status_id` varchar(1) DEFAULT NULL,
  `PNReqBy` varchar(10) DEFAULT NULL,
  `PNNotes` longtext,
  `PNUser1` varchar(100) DEFAULT NULL,
  `PNUser2` varchar(100) DEFAULT NULL,
  `PNUser3` varchar(100) DEFAULT NULL,
  `PNUser4` varchar(100) DEFAULT NULL,
  `PNUser5` varchar(100) DEFAULT NULL,
  `PNUser6` varchar(100) DEFAULT NULL,
  `PNUser7` varchar(100) DEFAULT NULL,
  `PNUser8` varchar(100) DEFAULT NULL,
  `PNUser9` varchar(100) DEFAULT NULL,
  `PNUser10` varchar(100) DEFAULT NULL,
  `PNDate` datetime DEFAULT NULL,
  `PNTab` tinyint(1) DEFAULT '0',
  `PNControlled` tinyint(1) DEFAULT '0',
  `PNAux1` varchar(50) DEFAULT NULL,
  `PNQty` float DEFAULT '0',
  `PNQty2` float DEFAULT '0',
  `PNCostChanged` tinyint(1) DEFAULT '0',
  `PNParentCost` tinyint(1) DEFAULT '0',
  `PNExpandList` tinyint(1) DEFAULT '0',
  `PNAssyCostOption` int(11) DEFAULT '3',
  `PNInclAssyOnPurchList` tinyint(1) DEFAULT '-1',
  `PNMadeFrom` tinyint(1) DEFAULT '0',
  `PNMinStockQty` float DEFAULT '0',
  `PNOrderToMaintain` tinyint(1) DEFAULT '0',
  `PNOnECO` tinyint(1) DEFAULT '0',
  `PNOverKit` tinyint(1) DEFAULT '0',
  `PNOverKitQty` float DEFAULT '0',
  `PNOverKitBy` int(11) DEFAULT '0',
  `PNOverKitFor` int(11) DEFAULT '0',
  `PNCurrentCost` double DEFAULT '0',
  `PNLastRollupCost` double DEFAULT '0',
  `PNUSRID` int(11) DEFAULT '0',
  `PNUserLock` tinyint(1) DEFAULT '0',
  `is_serialized` tinyint(1) DEFAULT NULL,
  `requester_id` int(11) DEFAULT NULL,
  `stock_location_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_part_to_units` (`PNUNID`),
  KEY `fk_part_to_tab_parent` (`PNTabParentID`),
  KEY `fk_part_to_stock_location` (`stock_location_id`),
  KEY `fk_part_to_requestor` (`requester_id`),
  KEY `fk_part_to_create_user` (`create_user_id`),
  KEY `fk_part_to_update_user` (`update_user_id`),
  CONSTRAINT `fk_part_to_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_part_to_requestor` FOREIGN KEY (`requester_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_part_to_stock_location` FOREIGN KEY (`stock_location_id`) REFERENCES `tbl_stock_location` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_part_to_tab_parent` FOREIGN KEY (`PNTabParentID`) REFERENCES `tbl_part` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_part_to_units` FOREIGN KEY (`PNUNID`) REFERENCES `tbl_unit` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_part_to_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_part` (`id`, `PNIDToLNK`, `PNUNID`, `PNTabParentID`, `PNPrefix`, `PNPartNumber`, `PNSuffix`, `type_id`, `PNRevision`, `PNTitle`, `PNDetail`, `status_id`, `PNReqBy`, `PNNotes`, `PNUser1`, `PNUser2`, `PNUser3`, `PNUser4`, `PNUser5`, `PNUser6`, `PNUser7`, `PNUser8`, `PNUser9`, `PNUser10`, `PNDate`, `PNTab`, `PNControlled`, `PNAux1`, `PNQty`, `PNQty2`, `PNCostChanged`, `PNParentCost`, `PNExpandList`, `PNAssyCostOption`, `PNInclAssyOnPurchList`, `PNMadeFrom`, `PNMinStockQty`, `PNOrderToMaintain`, `PNOnECO`, `PNOverKit`, `PNOverKitQty`, `PNOverKitBy`, `PNOverKitFor`, `PNCurrentCost`, `PNLastRollupCost`, `PNUSRID`, `PNUserLock`, `is_serialized`, `requester_id`, `stock_location_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1,	0,	1,	NULL,	'',	'10000001',	'',	'PL',	'3',	'ASSY,AIRCRAFT WIRELESS',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'FIN',	'',	'',	'FINGOODS',	'0002',	'2013-01-04 00:00:00',	0,	0,	'',	0,	0,	0,	0,	1,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	7.5,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(2,	0,	1,	NULL,	'',	'20000003',	'',	'PL',	'2',	'PCA,AIRCRAFT WIRELESS',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'ASSY',	'',	'',	'ELEC-PCB',	'0001',	'2013-01-04 00:00:00',	0,	0,	'',	15,	0,	0,	0,	1,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	5,	378.34,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(3,	0,	1,	NULL,	'',	'20000001',	'',	'PL',	'0',	'IND,830UH,AIRCRAFT WIRELESS',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'ASSY',	'',	'',	'ELEC-COMPS',	'0010',	'2013-01-01 00:00:00',	0,	0,	'',	5,	0,	0,	0,	1,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	7.5,	7.5,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(4,	0,	23,	NULL,	'',	'90000013',	'',	'PS',	'0',	'WIRE,SOLID,18AWG,WHITE,POLY',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'RAW',	'',	'',	'ELEC-WIRE',	'0001',	'2013-01-01 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0.007684,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(5,	0,	1,	NULL,	'',	'90000012',	'',	'PS',	'0',	'EARPH,MONO,HI-Z,3.5MM',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'ELEC-COMPS',	'0001',	'2013-01-01 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	3.3432,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(6,	0,	1,	NULL,	'',	'50000001',	'',	'DWG',	'1',	'DOC,USER,AIRCRAFT WIRELESS',	'',	'R',	'J. Sharp',	'',	'',	'',	'',	'',	'',	'FIN',	'',	'',	'DOCS',	'0001',	'2013-01-03 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(7,	0,	1,	NULL,	'',	'90000011',	'',	'PS',	'0',	'RES,AXIAL,5.6M,0.4W,1%,MF,ROHS',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'ELEC-COMPS',	'0002',	'2013-01-01 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0.075,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(8,	0,	1,	NULL,	'',	'90000010',	'',	'PS',	'0',	'RES,AXIAL,2.0M,0.4W,1%,MF,ROHS',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'ELEC-COMPS',	'0003',	'2013-01-01 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0.06188,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(9,	0,	1,	NULL,	'',	'90000009',	'',	'PS',	'0',	'CAP,CER,3300PF,100V,10%,RADIAL,ROHS',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'ELEC-COMPS',	'0004',	'2013-01-01 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0.05148,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(10,	0,	1,	NULL,	'',	'90000008',	'',	'PS',	'0',	'CAP,CER,33PF,100V,10%,RADIAL,ROHS',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'ELEC-COMPS',	'0005',	'2013-01-01 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0.11375,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(11,	0,	1,	NULL,	'',	'90000007',	'',	'PS',	'0',	'CAP,ELEC,10UF,16V,20%,RADIAL,ROHS',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'ELEC-COMPS',	'0006',	'2013-01-01 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0.059,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(12,	0,	1,	NULL,	'',	'90000006',	'',	'PS',	'0',	'DIO,SIG,GERM,0A95,AXIAL,D0-7,GLASS',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'ELEC-COMPS',	'0007',	'2013-01-01 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0.567,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(13,	0,	1,	NULL,	'',	'90000005',	'',	'PS',	'0',	'CAPV,150-230PF,TOP ADJUST,PCB',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'ELEC-COMPS',	'0008',	'2013-01-01 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	11.74,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(14,	0,	1,	NULL,	'',	'90000004',	'',	'PS',	'0',	'CONN,PHONE,F,MONO,PCB,3.5MM',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'ELEC-COMPS',	'0009',	'2013-01-01 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0.2324,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(15,	0,	1,	NULL,	'',	'20000002',	'',	'DWG',	'1',	'PCB,AIRCRAFT WIRELESS',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'ELEC-PCB',	'0002',	'2013-01-02 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	354.1,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(16,	0,	23,	NULL,	'',	'90000001',	'',	'PS',	'0',	'WIRE,MAGNET,38AWG,POLY',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'RAW',	'',	'',	'ELEC-WIRE',	'0004',	'2013-01-01 00:00:00',	0,	0,	'',	575574,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0.000263,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(17,	0,	1,	NULL,	'',	'90000002',	'',	'PS',	'0',	'MAG,FERRITE ROD,1/4IN X 4IN,MATL=61',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'DETAIL',	'',	'',	'ELEC-COMPS',	'0011',	'2013-01-01 00:00:00',	0,	0,	'',	0.5,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	6,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(18,	0,	22,	NULL,	'',	'90000003',	'',	'PS',	'0',	'TAPE,ELECTRICAL,3/4\",BLUE,VINYL',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'RAW',	'',	'',	'SHOPSUP',	'0001',	'2013-01-01 00:00:00',	0,	1,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	5.62,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(19,	0,	1,	NULL,	'',	'10000003',	'',	'CAT',	'1',	'ASSY,MKTG,AIRCRAFT WIRELESS',	'',	'R',	'J. Sharp',	'',	'',	'',	'',	'',	'',	'FIN',	'',	'',	'FINGOODS',	'0001',	'2013-01-04 00:00:00',	0,	0,	'',	0,	0,	0,	0,	1,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	3.34,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(20,	0,	1,	NULL,	'',	'10000002',	'',	'PL',	'1',	'ENCL,AIRCRAFT WIRELESS',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'DETAIL',	'',	'',	'MECH',	'0001',	'2013-01-04 00:00:00',	0,	0,	'',	0,	0,	0,	0,	1,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	5,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(21,	0,	1,	NULL,	'',	'80000005',	'',	'PS',	'0',	'BOX,SHIPPING,5X4X2,CARDBOARD,WHITE',	'',	'R',	'J. Sharp',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'SHIPPING',	'0001',	'2013-01-03 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0.5,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(22,	0,	1,	NULL,	'',	'80000001',	'',	'PS',	'0',	'BOX,IP54,4.74X3.13X2.17\",ALUM,BLK,SCREWS',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'RAW',	'',	'',	'MECH',	'0002',	'2013-01-03 00:00:00',	0,	0,	'',	0,	0,	0,	0,	1,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	14.9,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(23,	0,	1,	NULL,	'',	'90000016',	'',	'PS',	'0',	'CONN,RING,16-22AWG,#4,RED',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'ELEC-CONNS',	'0001',	'2013-01-03 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	6.21,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(24,	0,	1,	NULL,	'',	'90000017',	'',	'PS',	'0',	'WIRE,STRANDED,16AWG,GREEN,POLY',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'RAW',	'',	'',	'ELEC-WIRE',	'0002',	'2013-01-03 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	35.5,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(25,	0,	1,	NULL,	'',	'90000018',	'',	'PS',	'0',	'WIRE,STRANDED,16AWG,YELLOW,POLY',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'RAW',	'',	'',	'ELEC-WIRE',	'0003',	'2013-01-03 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	35.5,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(26,	0,	1,	NULL,	'',	'80000007',	'',	'PS',	'0',	'WASHER,LOCK,#4,INTERNAL TOOTH',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'MECH-HW',	'0001',	'2013-01-03 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0.97,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(27,	0,	1,	NULL,	'',	'80000002',	'',	'PS',	'0',	'STANDOFF,HEX,4-40,0.75\"L,NYLON',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'MECH-HW',	'0002',	'2013-01-03 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	1.016,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(28,	0,	1,	NULL,	'',	'80000003',	'',	'PS',	'0',	'SCREW,MACHINE,PHIL,4-40X1/4,SS',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'MECH-HW',	'0004',	'2013-01-03 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	4.13,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(29,	0,	1,	NULL,	'',	'80000004',	'',	'PS',	'0',	'WASHER,FLAT,4-40',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'MECH-HW',	'0005',	'2013-01-03 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0.0125,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(30,	0,	1,	NULL,	'',	'90000014',	'',	'PS',	'0',	'CONN,BINDING POST BANANA,INSUL,GRN',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'ELEC-CONNS',	'0002',	'2013-01-03 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	2.59,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(31,	0,	1,	NULL,	'',	'90000015',	'',	'PS',	'0',	'CONN,BINDING POST BANANA,INSUL,YEL',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'ELEC-CONNS',	'0003',	'2013-01-03 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	2.4,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(32,	0,	1,	NULL,	'',	'80000006',	'',	'PS',	'0',	'STANDOFF,HEX,4-40,0.5\"L,ALUM',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'BOF',	'',	'',	'MECH-HW',	'0003',	'2013-01-04 00:00:00',	0,	0,	'',	0,	0,	0,	0,	0,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0.419,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(33,	0,	1,	NULL,	'',	'60000001',	'',	'PL',	'1',	'ASSY,FIELD SPARES,AIRCRAFT WIRELESS',	'',	'R',	'B. Jenks',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'2013-05-01 00:00:00',	0,	0,	'',	0,	0,	0,	0,	1,	3,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

CREATE TABLE `tbl_part_cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `COSTLNKID` int(11) NOT NULL,
  `COSTAtQty` float DEFAULT '1',
  `COSTLeadtime` int(11) DEFAULT '0',
  `COSTCost` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_part_cost_to_part_source` (`COSTLNKID`),
  CONSTRAINT `fk_part_cost_to_part_source` FOREIGN KEY (`COSTLNKID`) REFERENCES `tbl_part_source_assignment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_part_cost` (`id`, `COSTLNKID`, `COSTAtQty`, `COSTLeadtime`, `COSTCost`) VALUES
(1,	1,	1,	0,	23.42),
(2,	2,	1,	0,	3.3432),
(3,	3,	10,	0,	5),
(4,	4,	5000,	0,	0.075),
(5,	5,	5000,	0,	0.06188),
(6,	6,	5000,	0,	0.05148),
(7,	7,	1000,	0,	0.11375),
(8,	8,	1000,	0,	0.059),
(9,	9,	1000,	0,	0.567),
(10,	10,	1,	0,	11.74),
(11,	11,	500,	0,	0.2324),
(12,	12,	1,	0,	354.1),
(13,	13,	1,	0,	154.83),
(14,	14,	1,	0,	6),
(15,	15,	1,	0,	5.62),
(17,	17,	1,	0,	5),
(18,	18,	1,	0,	14.9),
(19,	19,	1,	0,	6.21),
(20,	20,	1,	0,	35.5),
(21,	21,	1,	0,	35.5),
(22,	22,	1,	0,	0.97),
(23,	23,	10,	0,	1.016),
(24,	24,	100,	0,	4.13),
(25,	25,	100,	0,	0.0125),
(26,	26,	1,	0,	2.59),
(27,	27,	1,	0,	2.4),
(28,	28,	10,	0,	0.419),
(29,	29,	100,	0,	0.5);

CREATE TABLE `tbl_part_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PLListID` int(11) NOT NULL DEFAULT '0',
  `PLPartID` int(11) NOT NULL DEFAULT '0',
  `PLItem` int(11) DEFAULT '0',
  `PLQty` varchar(10) DEFAULT NULL,
  `PLRefMemo` longtext,
  `PLRefText` varchar(255) DEFAULT NULL,
  `PLAssyOrder` float DEFAULT NULL,
  `PLAssySpec` varchar(255) DEFAULT NULL,
  `PLMFRPNID` int(11) DEFAULT NULL,
  `PLMFRID` int(11) DEFAULT NULL,
  `PLSUID` int(11) DEFAULT NULL,
  `PLLNKID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_part_list_to_parent` (`PLListID`),
  KEY `fk_part_list_to_child` (`PLPartID`),
  KEY `fk_part_list_to_mfr_part` (`PLMFRPNID`),
  KEY `fk_part_list_to_mfr` (`PLMFRID`),
  KEY `fk_part_list_to_supplier` (`PLSUID`),
  KEY `fk_part_list_to_part_source_assignment` (`PLLNKID`),
  CONSTRAINT `fk_part_list_to_child` FOREIGN KEY (`PLPartID`) REFERENCES `tbl_part` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_part_list_to_mfr` FOREIGN KEY (`PLMFRID`) REFERENCES `tbl_manufacturer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_part_list_to_mfr_part` FOREIGN KEY (`PLMFRPNID`) REFERENCES `tbl_manufacturer_part` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_part_list_to_parent` FOREIGN KEY (`PLListID`) REFERENCES `tbl_part` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_part_list_to_part_source_assignment` FOREIGN KEY (`PLLNKID`) REFERENCES `tbl_part_source_assignment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_part_list_to_supplier` FOREIGN KEY (`PLSUID`) REFERENCES `tbl_supplier` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_part_list` (`id`, `PLListID`, `PLPartID`, `PLItem`, `PLQty`, `PLRefMemo`, `PLRefText`, `PLAssyOrder`, `PLAssySpec`, `PLMFRPNID`, `PLMFRID`, `PLSUID`, `PLLNKID`) VALUES
(4,	1,	2,	2,	'1',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(5,	2,	7,	10,	'1',	'R1',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(6,	2,	8,	9,	'1',	'R2',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(7,	2,	9,	8,	'1',	'C1',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(8,	2,	10,	7,	'1',	'C2',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(9,	2,	11,	6,	'1',	'C3',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(10,	2,	12,	5,	'1',	'D1',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(11,	2,	13,	4,	'1',	'VC1',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(12,	2,	14,	3,	'1',	'J1',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(13,	2,	15,	2,	'1',	'PCB',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(14,	2,	3,	1,	'1',	'L1',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(15,	3,	16,	1,	'846',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(16,	3,	17,	2,	'0.5',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(17,	3,	18,	3,	'2',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(18,	19,	5,	1,	'1',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(19,	19,	6,	1,	'1',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(20,	19,	21,	1,	'1',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(21,	19,	1,	1,	'0',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(22,	1,	20,	1,	'1',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(23,	20,	22,	1,	'1',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(24,	1,	23,	9,	'2',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(25,	1,	24,	10,	'5',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(26,	1,	25,	11,	'5',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(27,	1,	26,	6,	'1',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(29,	1,	28,	3,	'4',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(30,	1,	29,	4,	'6',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(31,	1,	30,	7,	'1',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(32,	1,	31,	8,	'1',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(33,	1,	32,	5,	'3',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(34,	33,	20,	1,	'1',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(35,	33,	5,	2,	'1',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(36,	33,	2,	3,	'1',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL),
(37,	33,	6,	4,	'1',	'',	'',	0,	'',	NULL,	NULL,	NULL,	NULL);

CREATE TABLE `tbl_part_source_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LNKSUID` int(11) DEFAULT NULL,
  `LNKMFRPNID` int(11) DEFAULT NULL,
  `LNKMFRID` int(11) DEFAULT NULL,
  `LNKUNID` int(11) DEFAULT '1',
  `LNKPNID` int(11) DEFAULT '0',
  `LNKToPNID` int(11) DEFAULT '0',
  `LNKUse` tinyint(1) DEFAULT '0',
  `LNKLeadtime` varchar(20) DEFAULT NULL,
  `LNKChoice` int(11) DEFAULT '0',
  `LNKVendorPN` varchar(50) DEFAULT NULL,
  `LNKVendorDesc` varchar(50) DEFAULT NULL,
  `LNKAtQty` float DEFAULT '0',
  `LNKRFQDate` datetime DEFAULT NULL,
  `LNKMinIncrement` float DEFAULT '0',
  `LNKCurrentCost` double DEFAULT '0',
  `LNKSetupCost` double DEFAULT '0',
  `LNKRoHS` tinyint(1) DEFAULT '0',
  `LNKRoHSDoc` varchar(50) DEFAULT NULL,
  `LNKRoHSNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pv_lnk_supplier` (`LNKSUID`),
  KEY `fk_pv_lnk_mfr_part` (`LNKMFRPNID`),
  KEY `fk_pv_lnk_mfr` (`LNKMFRID`),
  KEY `fk_pv_lnk_units` (`LNKUNID`),
  KEY `fk_pv_lnk_part` (`LNKPNID`),
  CONSTRAINT `fk_pv_lnk_mfr` FOREIGN KEY (`LNKMFRID`) REFERENCES `tbl_manufacturer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pv_lnk_mfr_part` FOREIGN KEY (`LNKMFRPNID`) REFERENCES `tbl_manufacturer_part` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pv_lnk_part` FOREIGN KEY (`LNKPNID`) REFERENCES `tbl_part` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pv_lnk_supplier` FOREIGN KEY (`LNKSUID`) REFERENCES `tbl_supplier` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pv_lnk_units` FOREIGN KEY (`LNKUNID`) REFERENCES `tbl_unit` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_part_source_assignment` (`id`, `LNKSUID`, `LNKMFRPNID`, `LNKMFRID`, `LNKUNID`, `LNKPNID`, `LNKToPNID`, `LNKUse`, `LNKLeadtime`, `LNKChoice`, `LNKVendorPN`, `LNKVendorDesc`, `LNKAtQty`, `LNKRFQDate`, `LNKMinIncrement`, `LNKCurrentCost`, `LNKSetupCost`, `LNKRoHS`, `LNKRoHSDoc`, `LNKRoHSNote`) VALUES
(1,	3,	1,	1,	23,	4,	0,	1,	'',	0,	'C2119W-100-ND',	'WHITE 18AWG HOOKUP WIRE SOLID',	1,	'0000-00-00 00:00:00',	0,	23.42,	0,	0,	'',	''),
(2,	5,	0,	0,	1,	5,	0,	1,	'',	0,	'LB25C',	'Crystal Earpiece, Hi-z, 1m lead, 3.5mm plug',	1,	'0000-00-00 00:00:00',	0,	3.3432,	0,	0,	'',	''),
(3,	9,	0,	0,	1,	2,	0,	1,	'',	0,	'SCC:20000003',	'PCA,AIRCRAFT WIRELESS',	10,	'0000-00-00 00:00:00',	0,	5,	0,	0,	'',	''),
(4,	3,	2,	2,	1,	7,	0,	1,	'',	0,	'5063JD5M600F12AF5-ND',	'RES 5.60MEG OHM MTLFLM.40W 1% TR',	5000,	'0000-00-00 00:00:00',	0,	0.075,	0,	0,	'',	''),
(5,	3,	3,	2,	1,	8,	0,	1,	'',	0,	'BC2.00MXTR-ND',	'RES 2.00M OHM MTL FILM .40W 1% T',	5000,	'0000-00-00 00:00:00',	0,	0.06188,	0,	0,	'',	''),
(6,	3,	4,	3,	1,	9,	0,	1,	'',	0,	'399-4233-ND',	'CAP 3300PF 100V 10% CER RADIAL',	5000,	'0000-00-00 00:00:00',	0,	0.05148,	0,	0,	'',	''),
(7,	3,	5,	4,	1,	10,	0,	1,	'',	0,	'SR151A330KAA-ND',	'CAP CER 33PF 100V 10% NP0 RADIAL',	1000,	'0000-00-00 00:00:00',	0,	0.11375,	0,	0,	'',	''),
(8,	3,	6,	5,	1,	11,	0,	1,	'',	0,	'P965-ND',	'CAP ELECT 10UF 16V KK RADIAL',	1000,	'0000-00-00 00:00:00',	0,	0.059,	0,	0,	'',	''),
(9,	7,	7,	6,	1,	12,	0,	1,	'',	0,	'97K6768',	'SEMELAB - OA95/05 - DIODE, GERMANIUM, DO-7',	1000,	'0000-00-00 00:00:00',	0,	0.567,	0,	0,	'',	''),
(10,	3,	8,	7,	1,	13,	0,	1,	'',	0,	'GMC30600-ND',	'CAP TRIM 56-250PF TOP ADJUST PCB',	1,	'0000-00-00 00:00:00',	0,	11.74,	0,	0,	'',	''),
(11,	3,	9,	8,	1,	14,	0,	1,	'',	0,	'CP-3536NG-ND',	'CONN AUDIO JACK 3.5MM MONO',	500,	'0000-00-00 00:00:00',	0,	0.2324,	0,	0,	'',	''),
(12,	1,	0,	9,	1,	15,	0,	1,	'',	0,	'SCC:20000002',	'PCB,AIRCRAFT WIRELESS',	1,	'0000-00-00 00:00:00',	0,	354.1,	0,	0,	'',	''),
(13,	7,	10,	10,	24,	16,	0,	1,	'',	0,	'36F779',	'BELDEN - 8085 - Hook-Up Wire',	1,	'0000-00-00 00:00:00',	0,	154.83,	0,	0,	'',	''),
(14,	2,	0,	0,	1,	17,	0,	1,	'',	0,	'R-025400-61',	'FERRITE ROD 1/4-INCH X 4IN MATL=61',	1,	'0000-00-00 00:00:00',	0,	6,	0,	0,	'',	''),
(15,	3,	11,	11,	1,	18,	0,	1,	'',	0,	'3M35-BL-ND',	'TAPE ELECTRICAL VINYL 3/4\" BLUE',	1,	'0000-00-00 00:00:00',	0,	5.62,	0,	0,	'',	''),
(17,	11,	0,	0,	1,	20,	0,	1,	'',	0,	'SCC:10000001',	'ENCL,AIRCRAFT WIRELESS',	1,	'0000-00-00 00:00:00',	0,	5,	0,	0,	'',	''),
(18,	3,	12,	13,	1,	22,	0,	1,	'',	0,	'1590TBK-ND',	'BOX ALUM BLACK 4.74X3.13X2.17\"',	1,	'0000-00-00 00:00:00',	0,	14.9,	0,	0,	'',	''),
(19,	3,	13,	15,	1,	23,	0,	1,	'',	0,	'A27230-ND',	'CONN RING 16-22 AWG #4 RED PIDG',	1,	'0000-00-00 00:00:00',	0,	6.21,	0,	0,	'',	''),
(20,	3,	14,	1,	1,	24,	0,	1,	'',	0,	'C2065G-100-ND',	'GREEN STRANDED-HOOKUP WIRE-16AWG',	1,	'0000-00-00 00:00:00',	0,	35.5,	0,	0,	'',	''),
(21,	3,	15,	1,	1,	25,	0,	1,	'',	0,	'C2065Y-100-ND',	'HOOK-UP WIRE YEL STRANDED 16 AWG',	1,	'0000-00-00 00:00:00',	0,	35.5,	0,	0,	'',	''),
(22,	3,	16,	12,	1,	26,	0,	1,	'',	0,	'H236-ND',	'WASHER LOCK INT TOOTH #4 ZINC',	1,	'0000-00-00 00:00:00',	0,	0.97,	0,	0,	'',	''),
(23,	3,	17,	14,	1,	27,	0,	1,	'',	0,	'8440EK-ND',	'STDOFF HEX FLA-RET 4-40 .750\"L',	10,	'0000-00-00 00:00:00',	0,	1.016,	0,	0,	'',	''),
(24,	3,	18,	12,	1,	28,	0,	1,	'',	0,	'H703-ND',	'SCREW MACHINE PHIL 4-40X1/4 SS',	100,	'0000-00-00 00:00:00',	0,	4.13,	0,	0,	'',	''),
(25,	3,	19,	15,	1,	29,	0,	1,	'',	0,	'5205820-3-ND',	'CONN HARDWARE FLAT WASHER 4-40',	100,	'0000-00-00 00:00:00',	0,	0.0125,	0,	0,	'',	''),
(26,	3,	20,	17,	1,	30,	0,	1,	'',	0,	'J371-ND',	'POST BINDING BANANA INSULATED GR',	1,	'0000-00-00 00:00:00',	0,	2.59,	0,	0,	'',	''),
(27,	3,	21,	17,	1,	31,	0,	1,	'',	0,	'J372-ND',	'POST BINDING BANANA INSULATED YE',	1,	'0000-00-00 00:00:00',	0,	2.4,	0,	0,	'',	''),
(28,	3,	22,	14,	1,	32,	0,	1,	'',	0,	'2203K-ND',	'STANDOFF HEX 4-40THR ALUM .500\"L',	10,	'0000-00-00 00:00:00',	0,	0.419,	0,	0,	'',	''),
(29,	10,	0,	0,	1,	21,	0,	1,	'',	0,	'S-463',	'5 x 4 x 2\" Indestructo Mailers',	100,	'0000-00-00 00:00:00',	0,	0.5,	0,	0,	'',	'');

CREATE TABLE `tbl_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `phase_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_project_to_customer` (`customer_id`),
  KEY `fk_project_to_owner` (`owner_id`),
  KEY `fk_project_to_create_user` (`create_user_id`),
  KEY `fk_project_to_update_user` (`update_user_id`),
  CONSTRAINT `fk_project_to_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_project_to_customer` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_project_to_owner` FOREIGN KEY (`owner_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_project_to_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_project` (`id`, `name`, `code`, `description`, `customer_id`, `owner_id`, `phase_id`, `status_id`, `type_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1,	'Default',	'DEFAULT',	'Not within scope of another project.',	0,	0,	0,	0,	0,	'0000-00-00 00:00:00',	0,	'0000-00-00 00:00:00',	0),
(2,	'Aircraft Wireless',	'P2015-001',	'2-seat racing monoplanes are a popular new sport, and the wireless set allows air crews to receive messages from their ground crew while in-flight. The wireless will be smaller and weigh significantly less than comparable sets. The project is sponsored by the Universal Flying Machine Company.',	3,	6,	6,	1,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(3,	'Target Finder',	'P2015-002',	'The Target Finder will provide the means for accurately placing fire extinguisher bombs launched from Lucifer - the aerial fire-fighting platform designed by Tom Swift. Factors the Target Finder will take into account include the speed and altitude of Lucifer, the wind velocity and the weight of the fire-fighting grenades.',	0,	22,	1,	0,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(4,	'Aero-Dirigable',	'P2015-003',	'The Aero-Dirigible will combine conventional biplane wings and twin control rudders, with a rigid, multi-cell aluminum \"gas bag\" for vertical takeoff and landing. The lifting gas will be party hydrogen, and generated on board. Forward power will be generated by a 20-cylinder air-cooled engine invented by Barton Swift, driving two 8-foot diameter airscrews in a push-pull configuration. The crusing speed of the Aero-Dirigible will be 30 mph, with a top speed of 80 mph (in a moderate wind). Amenities will include an observation car with pilot gear, floor-mounted windows and easy chairs, sleeping for 5, and an electric stove and furnace in the galley.',	0,	22,	1,	0,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(5,	'Submarine',	'P2015-004',	'The Submarine will be designed by Barton Swift, and will be 100 ft long with a 20 ft beam. The hull will be triple layered, and include a secret inner material for added strength. The Submarine will be able to remain submerged for 30 days, and will have a cruising speed of 14mph. Propulsion will come from a gasolene engine driving motor dynamos, which then power a new electrical hydrodynamic drive. Two electric cannons firing 25 pound solid shots will be provided for repelling sea monsters. The Submarine will carry all-metal diving suits of a type requiring no air hoses or safety lines, and will use a new automatic air tank technology instead.',	0,	22,	1,	0,	1,	'2015-01-01 00:00:00',	6,	'2015-06-25 11:53:48',	1),
(6,	'Rechargeable Battery',	'P2015-005',	'The Rechargeable Batter will be based on a new technology using nickle oxide, ferric oxide and steel tubes, and use a lithium hydrate (wet) electrolyte. It is expected that cells will recharge in half the time compared as traditional wet cells, and with a quantum increase in energy density. The Rechargeable Battery is required for a new 4-seat electric runabout being considered, where the batteries will be charged from a charging station, or by connection to a trolley line or street lamp.',	0,	22,	1,	0,	1,	'2015-01-01 00:00:00',	6,	'2015-06-26 08:46:07',	1),
(7,	'Electric Rifle',	'P2015-006',	'The Electric Rifle will be a personal protection device based on throwing electric charge. The range as well as the force of the discharge will be adjustable, and the charge will to travel through walls without loss of energy. The Electric Rifle is expected to resemble a convention heavy-game rifle, but weigh significantly less. Operating controls (various dials, levers, gears and wheels) will be provided on the shoulder stock. Power will be provided by a charge storage cylinder in the butt-stock, charged by a small hand-operated dynamo.',	0,	22,	1,	0,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(8,	'Photo-Telephone',	'P2015-007',	'The Photo-Telephone will be based on a standard telephone, but will use a three-wire interface instead of the typical two, with the third wire carrying picture data. A pair of charged selenium plates connected to an audio amplifier will be used in both the transmit and receive path. The picture will be fixed by a kilo-volt charge, and the plate developed using a continuous wet chemical process. It will be possible to make a permanent recording of both picture and voice at the receiving station.',	0,	22,	1,	0,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(9,	'Hercules 0001',	'P2015-008',	'Hercules 0001 will be a 285-ton electric-drive locomotive in a 4-12-4 configuration. The 12 main driving wheels will be 70 inches in diameter, and will be powered by six dual-motor DC motors providing 4400 total horsepower. Power will be provided from a twin overhead pantograph, connecting to 3000 volt DC distribution line. The Hercules will be 90 ft overall, 10 ft wide, and 14 ft tall, and have a top speed of 120 mph on level track.',	0,	22,	1,	0,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6);

CREATE TABLE `tbl_project_user_assignment` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `fk_user_to_project` (`user_id`),
  CONSTRAINT `fk_project_to_user` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_to_project` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_purchase_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `POMNumber` varchar(20) NOT NULL,
  `POMDatePrinted` datetime DEFAULT NULL,
  `POMSupplier` varchar(50) NOT NULL,
  `POMSUID` int(11) DEFAULT '0',
  `POMAccount` varchar(20) DEFAULT NULL,
  `POMNotes` longtext,
  `POMAttnTo` varchar(50) DEFAULT NULL,
  `POMFromBuyer` varchar(50) DEFAULT NULL,
  `POMEngrgContact` varchar(50) DEFAULT NULL,
  `POMDateReq` varchar(20) DEFAULT NULL,
  `POMDateClosed` datetime DEFAULT NULL,
  `POMFOB` varchar(20) DEFAULT NULL,
  `POMTerms` varchar(20) DEFAULT NULL,
  `POMInsurance` tinyint(1) DEFAULT '0',
  `POMUseOurShpngAcct` tinyint(1) DEFAULT '0',
  `POMShippingAcct` varchar(25) DEFAULT NULL,
  `POMThisIsRFQ` tinyint(1) DEFAULT '0',
  `POMPendingPrint` tinyint(1) DEFAULT '0',
  `POMTaxRate` float DEFAULT '0',
  `POMShipMethod` varchar(20) DEFAULT NULL,
  `POMShipTo` longtext,
  `POMTaxRate2` float DEFAULT '0',
  `POMTaxTotal2` float DEFAULT '0',
  `POMTax2OnTax1` int(11) DEFAULT '0',
  `POMTotalCost` double DEFAULT '0',
  `POMTotalTax` double DEFAULT '0',
  `POMSubTotal` double DEFAULT '0',
  `POMCURID` int(11) DEFAULT '0',
  `POMCurName` varchar(20) DEFAULT NULL,
  `POMCurExRate` double DEFAULT '1',
  `POMDateReqDate` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_purchase_order_to_supplier` (`POMSUID`),
  KEY `fk_purchase_order_to_currency` (`POMCURID`),
  KEY `fk_purchase_order_to_create_user` (`create_user_id`),
  KEY `fk_purchase_order_to_update_user` (`update_user_id`),
  CONSTRAINT `fk_purchase_order_to_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_purchase_order_to_currency` FOREIGN KEY (`POMCURID`) REFERENCES `tbl_currency` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_purchase_order_to_supplier` FOREIGN KEY (`POMSUID`) REFERENCES `tbl_supplier` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_purchase_order_to_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_purchase_order` (`id`, `POMNumber`, `POMDatePrinted`, `POMSupplier`, `POMSUID`, `POMAccount`, `POMNotes`, `POMAttnTo`, `POMFromBuyer`, `POMEngrgContact`, `POMDateReq`, `POMDateClosed`, `POMFOB`, `POMTerms`, `POMInsurance`, `POMUseOurShpngAcct`, `POMShippingAcct`, `POMThisIsRFQ`, `POMPendingPrint`, `POMTaxRate`, `POMShipMethod`, `POMShipTo`, `POMTaxRate2`, `POMTaxTotal2`, `POMTax2OnTax1`, `POMTotalCost`, `POMTotalTax`, `POMSubTotal`, `POMCURID`, `POMCurName`, `POMCurExRate`, `POMDateReqDate`, `status_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1,	'PO-00001',	'2015-04-16 00:00:00',	'CWS ByteMark',	0,	'S0008',	'',	'Sales',	'jhaddon',	'bjenks',	'ASAP',	'2015-04-16 00:00:00',	'Dest',	'CREDITCARD',	0,	0,	'',	0,	0,	7.25,	'',	'Swift Construction Company\r\n1 Swift Way\r\nShopton, NY 13054, USA',	0,	0,	0,	48,	0,	0,	0,	'',	1,	'0000-00-00 00:00:00',	NULL,	NULL,	NULL,	NULL,	NULL),
(2,	'PO-00002',	'2015-04-16 00:00:00',	'Digi-Key',	0,	'S0005',	'',	'Sales',	'jhaddon',	'bjenks',	'ASAP',	'2015-04-16 00:00:00',	'Dest',	'CREDITCARD',	0,	0,	'',	0,	0,	7.25,	'',	'Swift Construction Company\r\n1 Swift Way\r\nShopton, NY 13054, USA',	0,	0,	0,	168.6,	0,	0,	0,	'',	1,	'0000-00-00 00:00:00',	NULL,	NULL,	NULL,	NULL,	NULL),
(3,	'PO-00003',	'2015-04-16 00:00:00',	'Newark',	0,	'S0006',	'',	'Sales & Service',	'jhaddon',	'bjenks',	'ASAP',	'2015-04-16 00:00:00',	'Dest',	'CREDITCARD',	0,	0,	'',	0,	0,	7.25,	'',	'',	0,	0,	0,	154.83,	0,	0,	0,	'',	1,	'0000-00-00 00:00:00',	NULL,	NULL,	NULL,	NULL,	NULL),
(4,	'PO-00004',	'2015-04-16 00:00:00',	'AP Circuits',	0,	'S0007',	'',	'Sales',	'jhaddon',	'bjenks',	'ASAP',	'2015-04-16 00:00:00',	'Dest',	'30DAY',	0,	0,	'',	0,	0,	7.25,	'',	'Swift Construction Company\r\n1 Swift Way\r\nShopton, NY 13054, USA',	0,	0,	0,	3541,	0,	0,	0,	'',	1,	'0000-00-00 00:00:00',	NULL,	NULL,	NULL,	NULL,	NULL),
(5,	'PO-00005',	'2015-04-16 00:00:00',	'Digi-Key',	0,	'S0005',	'',	'Sales',	'jhaddon',	'bjenks',	'ASAP',	'2015-04-16 00:00:00',	'Dest',	'CREDITCARD',	0,	0,	'',	0,	0,	7.25,	'',	'Swift Construction Company\r\n1 Swift Way\r\nShopton, NY 13054, USA',	0,	0,	0,	117.4,	0,	0,	0,	'',	1,	'0000-00-00 00:00:00',	NULL,	NULL,	NULL,	NULL,	NULL),
(6,	'PO-00006',	'2015-04-16 00:00:00',	'Newark',	0,	'S0006',	'',	'Sales & Service',	'jhaddon',	'bjenks',	'ASAP',	'2015-04-16 00:00:00',	'Dest',	'CREDITCARD',	0,	0,	'',	0,	0,	7.25,	'',	'Swift Construction Company\r\n1 Swift Way\r\nShopton, NY 13054, USA',	0,	0,	0,	0,	0,	0,	0,	'',	1,	'0000-00-00 00:00:00',	NULL,	NULL,	NULL,	NULL,	NULL),
(7,	'PO-00007',	'2015-04-16 00:00:00',	'Trilogy-Net',	0,	'S0009',	'',	'Sales',	'jhaddon',	'bjenks',	'ASAP',	'2015-04-16 00:00:00',	'Dest',	'30DAY',	0,	0,	'',	0,	0,	7.25,	'',	'Swift Construction Company\r\n1 Swift Way\r\nShopton, NY 13054, USA',	0,	0,	0,	50,	0,	0,	0,	'',	1,	'0000-00-00 00:00:00',	NULL,	NULL,	NULL,	NULL,	NULL);

CREATE TABLE `tbl_purchase_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `POPOMID` int(11) DEFAULT '0',
  `POLNKID` int(11) DEFAULT NULL,
  `POItem` int(11) DEFAULT '0',
  `POPart` varchar(50) DEFAULT NULL,
  `PORev` varchar(10) DEFAULT NULL,
  `PODescription` longtext,
  `POReceived` tinyint(1) DEFAULT '0',
  `POPurchUnits` varchar(20) DEFAULT NULL,
  `POUseUnits` varchar(20) DEFAULT NULL,
  `POConvUnits` float DEFAULT '1',
  `PORFQQty` varchar(255) DEFAULT NULL,
  `POAcct` varchar(20) DEFAULT NULL,
  `POIHPart` varchar(50) DEFAULT NULL,
  `POSchedule` varchar(255) DEFAULT NULL,
  `POTaxable` tinyint(1) DEFAULT '0',
  `POTaxable2` tinyint(1) DEFAULT '0',
  `POExtension` double DEFAULT '0',
  `POExtPlusTax` double DEFAULT '0',
  `POCost` double DEFAULT '0',
  `POQty` double DEFAULT '0',
  `POItemQtyEntry` double DEFAULT NULL,
  `POItemQtyReceived` double DEFAULT '0',
  `POItemQtyBackordered` double DEFAULT '0',
  `POTax1` double DEFAULT '0',
  `POTax2` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_purchase_order_item_to_purchase_order` (`POPOMID`),
  KEY `fk_purchase_order_item_to_part_source` (`POLNKID`),
  CONSTRAINT `fk_purchase_order_item_to_part_source` FOREIGN KEY (`POLNKID`) REFERENCES `tbl_part_source_assignment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_purchase_order_item_to_purchase_order` FOREIGN KEY (`POPOMID`) REFERENCES `tbl_purchase_order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_purchase_order_item` (`id`, `POPOMID`, `POLNKID`, `POItem`, `POPart`, `PORev`, `PODescription`, `POReceived`, `POPurchUnits`, `POUseUnits`, `POConvUnits`, `PORFQQty`, `POAcct`, `POIHPart`, `POSchedule`, `POTaxable`, `POTaxable2`, `POExtension`, `POExtPlusTax`, `POCost`, `POQty`, `POItemQtyEntry`, `POItemQtyReceived`, `POItemQtyBackordered`, `POTax1`, `POTax2`) VALUES
(1,	1,	14,	1,	'90000002',	'0',	'MAG,FERRITE ROD,1/4IN X 4IN,MATL=61\r\nVendor P/N: R-025400-61',	1,	'each',	'each',	1,	'',	'JOB-00001',	'90000002',	'',	0,	0,	48,	48,	6,	8,	0,	8,	0,	0,	0),
(2,	2,	15,	1,	'90000003',	'0',	'TAPE,ELECTRICAL,3/4\",BLUE,VINYL\r\nVendor P/N: 3M35-BL-ND\r\nMfr: 3M,  Mfr P/N: 35 BLUE (3/4\"X66\')',	1,	'each',	'each',	1,	'',	'JOB-00001',	'90000003',	'',	0,	0,	168.6,	168.6,	5.62,	30,	0,	30,	0,	0,	0),
(3,	3,	13,	1,	'90000001',	'0',	'WIRE,MAGNET,38AWG,POLY\r\nVendor P/N: 36F779\r\nMfr: Belden,  Mfr P/N: 8085',	1,	'spool19300FT',	'cm',	588264,	'',	'JOB-00001',	'90000001',	'',	0,	0,	154.83,	154.83,	154.83,	1,	0,	1,	0,	0,	0),
(4,	4,	12,	1,	'20000002',	'1',	'PCB,AIRCRAFT WIRELESS\r\nVendor P/N: SCC:20000002\r\nMfr: AP Circuits',	1,	'each',	'each',	1,	'',	'JOB-00002',	'20000002',	'',	0,	0,	3541,	3541,	354.1,	10,	0,	10,	0,	0,	0),
(5,	5,	11,	1,	'90000004',	'0',	'CONN,PHONE,F,MONO,PCB,3.5MM\r\nVendor P/N: CP-3536NG-ND\r\nMfr: CUI Inc.,  Mfr P/N: MJ-3536NG',	1,	'each',	'each',	1,	'',	'JOB-00002',	'90000004',	'',	0,	0,	0,	0,	0,	10,	0,	10,	0,	0,	0),
(6,	5,	10,	2,	'90000005',	'0',	'CAPV,150-230PF,TOP ADJUST,PCB\r\nVendor P/N: GMC30600-ND\r\nMfr: Sprague-Goodman,  Mfr P/N: GM-C-3-06-00',	1,	'each',	'each',	1,	'',	'JOB-00002',	'90000005',	'',	0,	0,	117.4,	117.4,	11.74,	10,	0,	10,	0,	0,	0),
(7,	5,	8,	3,	'90000007',	'0',	'CAP,ELEC,10UF,16V,20%,RADIAL,ROHS\r\nVendor P/N: P965-ND\r\nMfr: Panasonic (Industrial),  Mfr P/N: ECE-A1CKK100',	1,	'each',	'each',	1,	'',	'JOB-00002',	'90000007',	'',	0,	0,	0,	0,	0,	10,	0,	10,	0,	0,	0),
(8,	5,	7,	4,	'90000008',	'0',	'CAP,CER,33PF,100V,10%,RADIAL,ROHS\r\nVendor P/N: SR151A330KAA-ND\r\nMfr: AVX Corporation,  Mfr P/N: SR151A330KAA',	1,	'each',	'each',	1,	'',	'JOB-00002',	'90000008',	'',	0,	0,	0,	0,	0,	10,	0,	10,	0,	0,	0),
(9,	5,	6,	5,	'90000009',	'0',	'CAP,CER,3300PF,100V,10%,RADIAL,ROHS\r\nVendor P/N: 399-4233-ND\r\nMfr: Kemet,  Mfr P/N: C317C332K1R5TA',	1,	'each',	'each',	1,	'',	'JOB-00002',	'90000009',	'',	0,	0,	0,	0,	0,	10,	0,	10,	0,	0,	0),
(10,	5,	5,	6,	'90000010',	'0',	'RES,AXIAL,2.0M,0.4W,1%,MF,ROHS\r\nVendor P/N: BC2.00MXTR-ND\r\nMfr: Vishay (BC Components),  Mfr P/N: MBA02040C2004FRP00',	1,	'each',	'each',	1,	'',	'JOB-00002',	'90000010',	'',	0,	0,	0,	0,	0,	10,	0,	10,	0,	0,	0),
(11,	5,	4,	7,	'90000011',	'0',	'RES,AXIAL,5.6M,0.4W,1%,MF,ROHS\r\nVendor P/N: 5063JD5M600F12AF5-ND\r\nMfr: Vishay (BC Components),  Mfr P/N: MBA02040C5604FRP00',	1,	'each',	'each',	1,	'',	'JOB-00002',	'90000011',	'',	0,	0,	0,	0,	0,	10,	0,	10,	0,	0,	0),
(12,	6,	9,	1,	'90000006',	'0',	'DIO,SIG,GERM,0A95,AXIAL,D0-7,GLASS\r\nVendor P/N: 97K6768\r\nMfr: Semelab,  Mfr P/N: OA95/05',	1,	'each',	'each',	1,	'',	'JOB-00002',	'90000006',	'',	0,	0,	0,	0,	0,	10,	0,	10,	0,	0,	0),
(13,	7,	3,	1,	'20000003',	'2',	'PCA,AIRCRAFT WIRELESS\r\nVendor P/N: SCC:20000003',	1,	'each',	'each',	1,	'',	'JOB-00002',	'20000003',	'',	0,	0,	50,	50,	5,	10,	0,	10,	0,	0,	0);

CREATE TABLE `tbl_pv_al` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ALPNID` int(11) DEFAULT '0',
  `ALJOBID` int(11) DEFAULT '0',
  `ALTASKID` int(11) DEFAULT '0',
  `ALJOBNumber` varchar(50) DEFAULT NULL,
  `ALJOBNumberLine` varchar(50) DEFAULT NULL,
  `ALQty` float DEFAULT '0',
  `ALQtyShort` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_pv_cnv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CNVLNKID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_pv_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `HISTWho` varchar(20) DEFAULT NULL,
  `HISTWhat` varchar(255) DEFAULT NULL,
  `HISTWhen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `HISTWhy` varchar(255) DEFAULT NULL,
  `HISTHowMany` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_pv_hist` (`id`, `HISTWho`, `HISTWhat`, `HISTWhen`, `HISTWhy`, `HISTHowMany`) VALUES
(1,	'gjackson',	'Kit for All rows of items for 15 units of assy 20000001',	'2015-04-16 06:00:00',	'',	15),
(2,	'gjackson',	'Increase  inventory by 15 units of assy 20000001',	'2015-04-16 06:00:00',	'',	15),
(3,	'gjackson',	'Kit for All rows of items for 10 units of assy 20000003',	'2015-04-16 06:00:00',	'',	10),
(4,	'gjackson',	'Increase  inventory by 10 units of assy 20000003',	'2015-04-16 06:00:00',	'',	10),
(5,	'gjackson',	'Reduce  inventory by -5 units of assy 20000003',	'2015-04-16 06:00:00',	'',	-5);

CREATE TABLE `tbl_pv_hpref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `GPREFKey` varchar(50) NOT NULL,
  `GPREFText1` varchar(50) DEFAULT NULL,
  `GPREFText2` varchar(50) DEFAULT NULL,
  `GPREFText3` varchar(50) DEFAULT NULL,
  `GPREFText4` varchar(50) DEFAULT NULL,
  `GPREFText5` varchar(50) DEFAULT NULL,
  `GPREFBool1` tinyint(1) DEFAULT '0',
  `GPREFBool2` tinyint(1) DEFAULT '0',
  `GPREFBool3` tinyint(1) DEFAULT '0',
  `GPREFBool4` tinyint(1) DEFAULT '0',
  `GPREFInt1` int(11) DEFAULT '0',
  `GPREFText6` varchar(50) DEFAULT NULL,
  `GPREFText7` varchar(50) DEFAULT NULL,
  `GPREFText8` varchar(50) DEFAULT NULL,
  `GPREFText9` varchar(50) DEFAULT NULL,
  `GPREFText10` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_pv_hpref` (`id`, `GPREFKey`, `GPREFText1`, `GPREFText2`, `GPREFText3`, `GPREFText4`, `GPREFText5`, `GPREFBool1`, `GPREFBool2`, `GPREFBool3`, `GPREFBool4`, `GPREFInt1`, `GPREFText6`, `GPREFText7`, `GPREFText8`, `GPREFText9`, `GPREFText10`) VALUES
(2,	'PLOptions',	'',	'',	'',	'',	'',	0,	0,	0,	1,	1,	'',	'',	'',	'',	''),
(3,	'PNOptions',	'',	'',	'',	'',	'',	1,	1,	0,	0,	0,	'',	'',	'',	'',	''),
(4,	'POOptions',	'ASAP',	'Destination',	'',	'ASAP',	'Net 30',	1,	1,	0,	1,	2,	'',	'',	'',	'',	''),
(6,	'UserFields',	'User 1',	'User 2',	'User 3',	'User 4',	'User 5',	0,	0,	0,	1,	2,	'Stk Class',	'User 7',	'User 8',	'Stk Loc',	'Stk Bin'),
(7,	'Version',	'6.0.140',	'',	'',	'',	'',	0,	0,	0,	0,	0,	'',	'',	'',	'',	''),
(22,	'JOBTBL',	'',	'',	'',	'',	'',	1,	0,	0,	0,	0,	'',	'',	'',	'',	''),
(23,	'JOBTBL2',	'',	'',	'',	'',	'',	0,	0,	0,	0,	0,	'',	'',	'',	'',	''),
(24,	'Lic',	'TDSN61021626213488025',	'active',	'',	'',	'',	0,	0,	0,	0,	0,	'',	'',	'',	'',	''),
(25,	'CustomerCaption',	'Customer',	'',	'',	'',	'',	0,	0,	0,	0,	0,	'',	'',	'',	'',	''),
(26,	'Lic',	'DEMO',	'',	'',	'',	'',	0,	0,	0,	0,	0,	'',	'',	'',	'',	'');

CREATE TABLE `tbl_pv_mf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MFPNIDParent` int(11) DEFAULT '0',
  `MFPNIDSub` int(11) DEFAULT '0',
  `MFQty` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_pv_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ORGKey` varchar(20) DEFAULT NULL,
  `ORGName` varchar(50) DEFAULT NULL,
  `ORGAddress` varchar(255) DEFAULT NULL,
  `ORGPhone` varchar(20) DEFAULT NULL,
  `ORGFaax` varchar(20) DEFAULT NULL,
  `ORGPOUseShpgAddr` tinyint(1) DEFAULT '0',
  `ORGRFQUseShpgAddr` tinyint(1) DEFAULT '0',
  `ORGListOrder` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_pv_org` (`id`, `ORGKey`, `ORGName`, `ORGAddress`, `ORGPhone`, `ORGFaax`, `ORGPOUseShpgAddr`, `ORGRFQUseShpgAddr`, `ORGListOrder`) VALUES
(1,	'Billing',	'Swift Construction Company',	'1 Swift Way\r\nShopton, NY 13054, USA',	'1-315-123-4567',	'1-315-123-4568',	0,	0,	0),
(6,	'Shipping',	'',	'Swift Construction Company\r\n1 Swift Way\r\nShopton, NY 13054, USA',	'',	'',	1,	1,	1);

CREATE TABLE `tbl_pv_pll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PLLParentListID` int(11) DEFAULT '0',
  `PLLSubListID` int(11) DEFAULT '0',
  `PLLQty` float DEFAULT '0',
  `PLLLevel` int(11) DEFAULT '0',
  `PLLCost` float DEFAULT '0',
  `PLLItemNumber` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_pv_pll` (`id`, `PLLParentListID`, `PLLSubListID`, `PLLQty`, `PLLLevel`, `PLLCost`, `PLLItemNumber`) VALUES
(1,	1,	2,	1,	0,	0,	2),
(2,	2,	3,	1,	0,	0,	1),
(3,	19,	1,	0,	0,	0,	1),
(4,	1,	20,	1,	0,	0,	1),
(5,	33,	20,	1,	0,	0,	1),
(6,	33,	2,	1,	0,	0,	3);

CREATE TABLE `tbl_pv_pod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PODField` varchar(50) DEFAULT NULL,
  `PODCaption` varchar(50) DEFAULT NULL,
  `PODOrder` int(11) DEFAULT '0',
  `PODUse` tinyint(1) DEFAULT '0',
  `PODNewLine` tinyint(1) DEFAULT '0',
  `PODUseCaption` tinyint(1) DEFAULT '0',
  `PODMode` int(11) DEFAULT '0',
  `PODOrderJOB` int(11) DEFAULT '0',
  `PODUseJOB` tinyint(1) DEFAULT '0',
  `PODNewLineJOB` tinyint(1) DEFAULT '0',
  `PODUseCaptionJOB` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_pv_pod` (`id`, `PODField`, `PODCaption`, `PODOrder`, `PODUse`, `PODNewLine`, `PODUseCaption`, `PODMode`, `PODOrderJOB`, `PODUseJOB`, `PODNewLineJOB`, `PODUseCaptionJOB`) VALUES
(1,	'POIHPart',	'InHouse P/N (always)',	1,	0,	1,	0,	0,	0,	0,	0,	0),
(2,	'POIHPart',	'InHouse P/N (if not above)',	2,	1,	1,	1,	0,	0,	0,	0,	0),
(3,	'PNTitle',	'Title',	3,	1,	1,	0,	1,	1,	1,	1,	0),
(4,	'PNDetail',	'Detail',	4,	1,	0,	0,	1,	2,	1,	1,	0),
(5,	'LNKVendorPN',	'Vendor P/N (always)',	5,	1,	1,	1,	0,	0,	0,	0,	0),
(6,	'LNKVendorPN',	'Vendor P/N (if not above)',	6,	0,	0,	0,	0,	0,	0,	0,	0),
(7,	'LNKVendorDesc',	'Vendor Desc',	7,	0,	0,	0,	0,	0,	0,	0,	0),
(8,	'MFRMfrName',	'Mfr',	8,	1,	1,	1,	0,	0,	0,	0,	0),
(9,	'MFRPNPart',	'Mfr P/N (always)',	9,	0,	0,	0,	0,	0,	0,	0,	0),
(10,	'MFRPNPart',	'Mfr P/N (if not above)',	10,	1,	0,	1,	0,	0,	0,	0,	0),
(11,	'PNUser1',	'User 1',	11,	1,	1,	1,	1,	3,	1,	1,	1),
(12,	'PNUser2',	'User 2',	12,	1,	1,	1,	1,	4,	1,	1,	1),
(13,	'PNUser3',	'User 3',	13,	1,	1,	1,	1,	5,	1,	1,	1),
(14,	'PNUser4',	'User 4',	14,	1,	1,	1,	1,	6,	1,	1,	1),
(15,	'PNUser5',	'User 5',	15,	1,	1,	1,	1,	7,	1,	1,	1),
(16,	'PNUser6',	'Stk Class',	16,	0,	1,	0,	1,	8,	1,	1,	1),
(17,	'PNUser7',	'User 7',	17,	0,	1,	0,	1,	9,	1,	1,	1),
(18,	'PNUser8',	'User 8',	18,	0,	1,	0,	1,	10,	1,	1,	1),
(19,	'PNUser9',	'Stk Loc',	19,	0,	1,	0,	1,	11,	1,	1,	1),
(20,	'PNUser10',	'Stk Bin',	20,	0,	1,	0,	1,	12,	1,	1,	1),
(21,	'Setting',	'',	2,	0,	0,	0,	0,	0,	0,	0,	0),
(22,	'LNKRoHS',	'RoHS',	21,	1,	1,	1,	0,	0,	0,	0,	0),
(23,	'LNKRoHSDoc',	'RoHS Doc',	22,	1,	0,	1,	0,	0,	0,	0,	0),
(24,	'LNKRoHSNote',	'RoHS Note',	23,	1,	1,	1,	0,	0,	0,	0,	0);

CREATE TABLE `tbl_pv_rpx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RPXGrid` varchar(50) NOT NULL,
  `RPXName` varchar(50) DEFAULT NULL,
  `RPXLayout` longtext,
  `RPXLabel` tinyint(1) DEFAULT '0',
  `RPXPrimary` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_pv_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TYPEType` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_pv_type` (`id`, `TYPEType`) VALUES
(1,	'AW'),
(2,	'DOC'),
(3,	'DWG'),
(4,	'PL'),
(5,	'PS'),
(6,	'CAT');

CREATE TABLE `tbl_shipper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SHIPMethod` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_shipper` (`id`, `SHIPMethod`) VALUES
(1,	'FEDX Overnight'),
(2,	'FEDX Economy'),
(3,	'UPS');

CREATE TABLE `tbl_stock_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `use_sublocation` int(11) DEFAULT NULL,
  `sublocation_min` int(11) DEFAULT NULL,
  `sublocation_max` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_stock_location` (`id`, `name`, `use_sublocation`, `sublocation_min`, `sublocation_max`) VALUES
(1,	'DOCS',	1,	1,	10),
(2,	'ELEC-COMPS',	1,	1,	20),
(3,	'ELEC-CONNS',	1,	1,	10),
(4,	'ELEC-PCB',	1,	1,	10),
(5,	'ELEC-WIRE',	1,	1,	10),
(6,	'FINGOODS',	1,	1,	10),
(7,	'MECH',	1,	1,	10),
(8,	'MECH-HW',	1,	1,	10),
(9,	'SHIPPING',	1,	1,	10),
(10,	'SHOPSUP',	1,	1,	10),
(11,	'YARD',	0,	0,	0);

CREATE TABLE `tbl_stock_serial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(255) DEFAULT NULL,
  `part_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_serial_to_part` (`part_id`),
  CONSTRAINT `fk_stock_serial_to_part` FOREIGN KEY (`part_id`) REFERENCES `tbl_part` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_stock_serial` (`id`, `serial_number`, `part_number`, `description`, `version`, `status`, `part_id`) VALUES
(1,	'A12345',	'20000003',	'PCA,AIRCRAFT WIRELESS',	'2',	'ACTIVE',	2),
(2,	'A12346',	'20000003',	'PCA,AIRCRAFT WIRELESS',	'2',	'ACTIVE',	2),
(3,	'A12347',	'20000003',	'PCA,AIRCRAFT WIRELESS',	'2',	'ACTIVE',	2),
(4,	'A12348',	'20000003',	'PCA,AIRCRAFT WIRELESS',	'2',	'ACTIVE',	2),
(5,	'A12349',	'20000003',	'PCA,AIRCRAFT WIRELESS',	'2',	'ACTIVE',	2),
(6,	'A12350',	'20000003',	'PCA,AIRCRAFT WIRELESS',	'2',	'ACTIVE',	2);

CREATE TABLE `tbl_stock_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) DEFAULT NULL,
  `quantity` float NOT NULL,
  `customer_order_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `purchase_order_id` int(11) DEFAULT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `update_time` datetime NOT NULL,
  `update_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_transaction_to_order` (`customer_order_id`),
  KEY `fk_stock_transaction_to_part` (`part_id`),
  KEY `fk_stock_transaction_to_purchase_order` (`purchase_order_id`),
  KEY `fk_stock_transaction_to_stock_item` (`stock_id`),
  CONSTRAINT `fk_stock_transaction_to_order` FOREIGN KEY (`customer_order_id`) REFERENCES `tbl_order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_stock_transaction_to_part` FOREIGN KEY (`part_id`) REFERENCES `tbl_part` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_stock_transaction_to_purchase_order` FOREIGN KEY (`purchase_order_id`) REFERENCES `tbl_purchase_order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_stock_transaction_to_stock_item` FOREIGN KEY (`stock_id`) REFERENCES `tbl_stock_serial` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbl_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SUSupplier` varchar(50) NOT NULL,
  `SUAddress` varchar(255) DEFAULT NULL,
  `SUCountry` varchar(50) DEFAULT NULL,
  `SUPhone1` varchar(20) DEFAULT NULL,
  `SUPhone2` varchar(20) DEFAULT NULL,
  `SUFAX` varchar(20) DEFAULT NULL,
  `SUWeb` varchar(255) DEFAULT NULL,
  `SUContact1` varchar(50) DEFAULT NULL,
  `SUContact2` varchar(50) DEFAULT NULL,
  `SUDateLast` datetime DEFAULT NULL,
  `SUFollowup` tinyint(1) DEFAULT '0',
  `SUNotes` longtext,
  `SUCode` varchar(20) DEFAULT NULL,
  `SUAccount` varchar(20) DEFAULT NULL,
  `SUTerms` varchar(20) DEFAULT NULL,
  `SUFedTaxID` varchar(20) DEFAULT NULL,
  `SUStateTaxID` varchar(20) DEFAULT NULL,
  `SUEMail1` varchar(50) DEFAULT NULL,
  `SUEMail2` varchar(50) DEFAULT NULL,
  `SUCurDedExRate` tinyint(1) DEFAULT '0',
  `SUCurExRate` double DEFAULT '0',
  `currency_id` int(11) DEFAULT '1',
  `SUCurReverse` tinyint(1) DEFAULT '0',
  `SUNoPhonePrefix` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SUSupplier` (`SUSupplier`),
  KEY `fk_supplier_to_currency` (`currency_id`),
  CONSTRAINT `fk_supplier_to_currency` FOREIGN KEY (`currency_id`) REFERENCES `tbl_currency` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_supplier` (`id`, `SUSupplier`, `SUAddress`, `SUCountry`, `SUPhone1`, `SUPhone2`, `SUFAX`, `SUWeb`, `SUContact1`, `SUContact2`, `SUDateLast`, `SUFollowup`, `SUNotes`, `SUCode`, `SUAccount`, `SUTerms`, `SUFedTaxID`, `SUStateTaxID`, `SUEMail1`, `SUEMail2`, `SUCurDedExRate`, `SUCurExRate`, `currency_id`, `SUCurReverse`, `SUNoPhonePrefix`) VALUES
(1,	'AP Circuits',	'Unit 3, 1112-40th Avenue NE, Calgary, AB T2E 5T8, Canada',	'Canada',	'1-403-250-3406',	'',	'1-403-250-3465',	'http://www.apcircuits.com',	'Sales',	'',	'0000-00-00 00:00:00',	0,	'Ftp: ftp://ftp.apcircuits.com. Tech Support 7am to 3pm (MTN)',	'APCKT',	'S0007',	'30DAY',	'20-1234578',	'12-134',	'staff@apcircuits.com',	'',	0,	0,	1,	0,	0),
(2,	'CWS ByteMark',	'353 West Grove Avenue, Orange, CA 92865, USA',	'USA',	'1-800-679-3184',	'',	'',	'http://www.cwsbytemark.com',	'Sales',	'',	'0000-00-00 00:00:00',	0,	'',	'CWSBM',	'S0008',	'CREDITCARD',	'20-1234579',	'12-135',	'sales@cwsbytemark.com',	'',	0,	0,	1,	0,	0),
(3,	'Digi-Key',	'701 Brooks Avenue South, Thief River Falls, MN 56701, USA',	'USA',	'1-800-344-4539',	'1-218-681-6674',	'1-218-681-3380',	'http://www.digikey.com',	'Sales',	'Sales',	'0000-00-00 00:00:00',	0,	'',	'DIGIKEY',	'S0005',	'CREDITCARD',	'20-1234576',	'12-132',	'',	'',	0,	0,	1,	0,	0),
(4,	'Eagle Park Machinery',	'605 Central Avenue, Albany, New York 12206, USA',	'USA',	'1-518-438-5854',	'',	'',	'http://en.wikipedia.org/wiki/Industrial_age',	'Frank Forker, Proprietor',	'',	'0000-00-00 00:00:00',	0,	'COTS mechanical equipment',	'EAGLE',	'S0001',	'45DAY',	'20-1234572',	'12-128',	'forker@eaglepark.com',	'',	0,	0,	1,	0,	0),
(5,	'Maplin',	'Brookfields Way, Manvers, Wath-upon-Dearne, Rotherham, South Yorkshire S63 5DL, Great Britain',	'Great Britain',	'011-44-0844-557-6000',	'',	'011-44-0844-557-6001',	'http://www.maplin.co.uk',	'Sales',	'',	'0000-00-00 00:00:00',	0,	'',	'MAPLIN',	'S0004',	'CREDITCARD',	'20-1234575',	'12-131',	'sales@maplin.co.uk',	'',	0,	0,	1,	0,	0),
(6,	'Merton\'s Machine Shop',	'85 South Main Street, Barre, Vermont 05641, USA',	'USA',	'1-802-479-5345',	'',	'',	'http://en.wikipedia.org/wiki/Machining',	'Thomas Merton, Proprietor',	'',	'0000-00-00 00:00:00',	0,	'Custom mechanical components',	'MERTON',	'S0003',	'45DAY',	'20-1234574',	'12-130',	'merton@mms.com',	'',	0,	0,	1,	0,	0),
(7,	'Newark',	'4801 N. Ravenswood, Chicago, IL 60640-4496, USA',	'USA',	'1-800-463-9275',	'1-800-639-2758',	'1-888-551-4801',	'http://www.newark.com',	'Sales & Service',	'Web Site Support',	'0000-00-00 00:00:00',	0,	'',	'NEWARK',	'S0006',	'CREDITCARD',	'20-1234577',	'12-133',	'',	'',	0,	0,	1,	0,	0),
(8,	'Shopton Hardware',	'6600 Germany Road, Shopton, NY 13054, USA',	'USA',	'1-315-363-6799',	'',	'',	'http://en.wikipedia.org/wiki/Nuts_and_Bolts_%28general_relativity%29',	'Henry Harrison, Proprietor',	'',	'0000-00-00 00:00:00',	0,	'COTS mechanical fasteners',	'SHPTHW',	'S0002',	'30DAY',	'20-1234573',	'12-129',	'harrison@shoptonhw.com',	'',	0,	0,	1,	0,	0),
(9,	'Trilogy-Net',	'#8, 3320-14th Avenue NE, Calgary, Alberta T2A 6J4, Canada',	'Canada',	'1-403-219-8868',	'',	'1-403-219-8860',	'http://www.trilogy-net.com/',	'Sales',	'',	'0000-00-00 00:00:00',	0,	'',	'TRLGYNT',	'S0009',	'30DAY',	'20-1234580',	'12-136',	'info@trilogy-net.com',	'',	0,	0,	1,	0,	0),
(10,	'Uline Canada',	'60 Hereford St., Brampton, ON L6Y-0N3, Canada',	'Canada',	'1-800-958-5463',	'',	'1-800-295-5571',	'http://www.uline.ca',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'ULINE',	'S0010',	'CREDITCARD',	'20-1234578',	'12-134',	'customer.service@uline.ca',	'',	0,	0,	1,	0,	0),
(11,	'Miracle Imprint',	'4019 - 4 Street S.E., Calgary T2G 2W4, AB, Canada',	'Canada',	'1-403-243-6306',	'1-877-369-9197',	'1-403-243-8029',	'http://www.miracleimprint.com/',	'',	'',	'0000-00-00 00:00:00',	0,	'',	'MIRACLE',	'S0011',	'30DAY',	'20-1234578',	'12-134',	'orders@miracleimprint.com',	'',	0,	0,	1,	0,	0),
(13,	'Swift Construction Company',	'1 Swift Way\r\nShopton, NY 13054, USA',	'',	'1-315-123-4567\r\n',	'',	'',	'http://www.swiftconstructioncompany.net',	'Miquel DeLazes\r\n',	'',	'0000-00-00 00:00:00',	0,	'SCC Internal (manufacturing)',	'SCC-MFG',	'',	'',	'',	'',	'mdelazes@swiftconstructioncompany.net\r\n',	'',	0,	1,	1,	0,	0);

CREATE TABLE `tbl_supplier_manufacturer_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LINSUID` int(11) NOT NULL DEFAULT '0',
  `LINMFRID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_supplier_manufacturer_assignment_to_supplier` (`LINSUID`),
  KEY `fk_supplier_manufacturer_assignment_to_manufacturer` (`LINMFRID`),
  CONSTRAINT `fk_supplier_manufacturer_assignment_to_manufacturer` FOREIGN KEY (`LINMFRID`) REFERENCES `tbl_manufacturer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_supplier_manufacturer_assignment_to_supplier` FOREIGN KEY (`LINSUID`) REFERENCES `tbl_supplier` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_supplier_manufacturer_assignment` (`id`, `LINSUID`, `LINMFRID`) VALUES
(1,	3,	1),
(2,	3,	2),
(3,	3,	3),
(4,	3,	4),
(5,	3,	5),
(6,	7,	6),
(7,	3,	7),
(8,	3,	8),
(9,	1,	9),
(10,	7,	10),
(11,	3,	11),
(12,	3,	13),
(13,	3,	15),
(14,	3,	12),
(15,	3,	14),
(16,	3,	17);

CREATE TABLE `tbl_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UNUseUnits` varchar(20) NOT NULL,
  `UNPurchUnits` varchar(20) NOT NULL,
  `UNConvUnits` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_unit` (`id`, `UNUseUnits`, `UNPurchUnits`, `UNConvUnits`) VALUES
(1,	'each',	'each',	1),
(20,	'each',	'Lot10',	10),
(21,	'each',	'Lot100',	100),
(22,	'inch',	'spool66FT',	792),
(23,	'cm',	'spool100FT',	3048),
(24,	'cm',	'spool19300FT',	588264);

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `initial` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tbl_user` (`id`, `username`, `email`, `password`, `nick`, `lname`, `fname`, `initial`, `status_id`, `profile_id`, `last_login_time`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1,	'admin',	'admin@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'AU',	'User',	'Admin',	'',	2,	1,	'2015-08-11 12:00:35',	NULL,	NULL,	NULL,	NULL),
(2,	'demo',	'admin@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'DU',	'User',	'Demo',	'',	2,	2,	NULL,	NULL,	NULL,	NULL,	NULL),
(3,	'bjenks',	'bjenks@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'BJ',	'Jenks',	'Barcoe',	'',	2,	3,	NULL,	NULL,	NULL,	NULL,	NULL),
(4,	'bswift',	'bswift@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'BS',	'Swift',	'Barton',	'',	2,	9,	NULL,	NULL,	NULL,	NULL,	NULL),
(5,	'barmstrong',	'barmstrong@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'BA',	'Armstrong',	'Bub',	'',	2,	3,	NULL,	NULL,	NULL,	NULL,	NULL),
(6,	'fmason',	'fmason@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'FM',	'Mason',	'Frank',	'',	2,	3,	NULL,	NULL,	NULL,	NULL,	NULL),
(7,	'gjackson',	'gjackson@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'GJ',	'Jackson',	'Garret',	'',	2,	5,	NULL,	NULL,	NULL,	NULL,	NULL),
(8,	'hbaldwin',	'hbaldwin@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'HB',	'Baldwin',	'Hank',	'',	2,	9,	NULL,	NULL,	NULL,	NULL,	NULL),
(9,	'hrandall',	'hrandall@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'HR',	'Randall',	'Helen',	'',	2,	4,	NULL,	NULL,	NULL,	NULL,	NULL),
(10,	'jwood',	'jwood@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'JW',	'Wood',	'Jacab',	'',	2,	8,	NULL,	NULL,	NULL,	NULL,	NULL),
(11,	'jperiod',	'jperiod@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'JP',	'Period',	'James',	'',	2,	9,	NULL,	NULL,	NULL,	NULL,	NULL),
(12,	'jhaddon',	'jhaddon@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'JH',	'Haddon',	'Jennie',	'',	2,	6,	NULL,	NULL,	NULL,	NULL,	NULL),
(13,	'jmorse',	'jmorse@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'JM',	'Morse',	'Jennie',	'',	2,	4,	NULL,	NULL,	NULL,	NULL,	NULL),
(14,	'jsharp',	'jsharp@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'JS',	'Sharp',	'John',	'',	2,	9,	NULL,	NULL,	NULL,	NULL,	NULL),
(15,	'mbaggert',	'mbaggert@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'MB',	'Baggert',	'Martha',	'',	2,	9,	NULL,	NULL,	NULL,	NULL,	NULL),
(16,	'mnestor',	'mnestor@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'MN',	'Nestor',	'Mary',	'',	2,	1,	NULL,	NULL,	NULL,	NULL,	NULL),
(17,	'mblair',	'mblair@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'MB',	'Blair',	'Minnie',	'',	2,	3,	NULL,	NULL,	NULL,	NULL,	NULL),
(18,	'mdelazes',	'mdelazes@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'MD',	'DeLazes',	'Miquel',	'',	2,	7,	NULL,	NULL,	NULL,	NULL,	NULL),
(19,	'nnewton',	'nnewton@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'NN',	'Newton',	'Ned',	'',	2,	9,	NULL,	NULL,	NULL,	NULL,	NULL),
(20,	'rsampson',	'rsampson@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'RS',	'Sampson',	'Rad',	'',	2,	9,	NULL,	NULL,	NULL,	NULL,	NULL),
(21,	'smalloy',	'smalloy@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'SM',	'Malloy',	'Sarah',	'',	2,	6,	NULL,	NULL,	NULL,	NULL,	NULL),
(22,	'tswift',	'tswift@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'TS',	'Swift',	'Tom',	'',	2,	9,	NULL,	NULL,	NULL,	NULL,	NULL),
(23,	'wdamon',	'wdamon@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'WD',	'Damon',	'Wakefield',	'',	2,	9,	NULL,	NULL,	NULL,	NULL,	NULL),
(24,	'wcrawford',	'wcrawford@swiftconstructioncompany.net',	'5c1f1ee8133c8c02e8e005461ac924fa',	'WC',	'Crawford',	'William',	'',	2,	9,	NULL,	NULL,	NULL,	NULL,	NULL);

-- 2015-08-11 21:43:21