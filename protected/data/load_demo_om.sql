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

--UPDATE `maestro`.`tbl_project` SET `client`=NULL, `status`=NULL;

-- --------------------------------------------------------
--
-- Alter Table structure for table `tbl_project`
--
ALTER TABLE `tbl_project` 
CHANGE COLUMN `client` `client_id` INT(11) NULL DEFAULT NULL ,
CHANGE COLUMN `status` `status_id` INT(11) NULL DEFAULT NULL ,
ADD COLUMN `size_id` INT(11) NULL DEFAULT NULL AFTER `update_user_id`,
ADD COLUMN `location_id` INT(11) NULL DEFAULT NULL AFTER `size_id`,
ADD COLUMN `tool_type_id` INT(11) NULL DEFAULT NULL AFTER `location_id`,
ADD INDEX `fk_project_to_client_idx` (`client_id` ASC),
ADD INDEX `fk_project_to_status_idx` (`status_id` ASC),
ADD INDEX `fk_project_to_size_idx` (`size_id` ASC),
ADD INDEX `fk_project_to_location_idx` (`location_id` ASC),
ADD INDEX `fk_project_to_tool_type_idx` (`tool_type_id` ASC);
ALTER TABLE `maestro`.`tbl_project` 
ADD CONSTRAINT `fk_project_to_client`
  FOREIGN KEY (`client_id`)
  REFERENCES `maestro`.`tbl_client` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_project_to_status`
  FOREIGN KEY (`status_id`)
  REFERENCES `maestro`.`tbl_status` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_project_to_size`
  FOREIGN KEY (`size_id`)
  REFERENCES `maestro`.`tbl_om_size` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_project_to_location`
  FOREIGN KEY (`location_id`)
  REFERENCES `maestro`.`tbl_om_location` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_project_to_tool_type`
  FOREIGN KEY (`tool_type_id`)
  REFERENCES `maestro`.`tbl_om_tool_type` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- UPDATE `maestro`.`tbl_project` SET `client_id`='1', `status`='1' WHERE `id`='1';
-- UPDATE `maestro`.`tbl_project` SET `client_id`='1', `status`='1' WHERE `id`='2';

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_order`
--

DROP TABLE IF EXISTS `tbl_om_order`;
CREATE TABLE IF NOT EXISTS `tbl_om_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size_id` int(11) NOT NULL,
  `tool_type_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_to_size` (`size_id`),
  KEY `fk_order_to_tool_type` (`tool_type_id`),
  KEY `fk_order_to_location` (`location_id`),
  KEY `fk_order_to_create_user` (`create_user_id`),
  KEY `fk_order_to_update_user` (`update_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_om_order`:
--   `size_id`
--       `tbl_om_size` -> `id`
--   `tool_type_id`
--       `tbl_om_tool_type` -> `id`
--   `location_id`
--       `tbl_om_location` -> `id`
--   `update_user_id`
--       `tbl_person` -> `id`
--   `create_user_id`
--       `tbl_person` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_order_item`
--

DROP TABLE IF EXISTS `tbl_om_order_item`;
CREATE TABLE IF NOT EXISTS `tbl_om_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL, 
  PRIMARY KEY (`id`),
  KEY `fk_order_item_to_order` (`order_id`),
  KEY `fk_order_item_to_part` (`part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_om_order_item`:
--   `order_id`
--       `tbl_om_order` -> `id`
--   `part_id`
--       `tbl_pv_pn` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_project_order`
--

DROP TABLE IF EXISTS `tbl_om_project_order`;
CREATE TABLE IF NOT EXISTS `tbl_om_project_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_project_order_to_project` (`project_id`),
  KEY `fk_project_order_to_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_om_order_item`:
--   `project_id`
--       `tbl_project` -> `id`
--   `order_id`
--       `tbl_om_order` -> `id`
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
(1, '10in.'),
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
-- Table structure for table `tbl_client`
-- The tbl_project table will reference this table

DROP TABLE IF EXISTS `tbl_client`;
CREATE TABLE IF NOT EXISTS `tbl_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone_no` varchar(25) DEFAULT NULL,
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
-- Dumping data for table `tbl_client`
--

INSERT INTO `tbl_client` (`id`, `name`, `phone_no`, `notes`, `create_time`, `create_user_id`) VALUES
(1, 'Aircraft Wireless', NULL, NULL, NULL, NULL),
(2, 'Fire-fighting Bombsight', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_status`
--

DROP TABLE IF EXISTS `tbl_status`;
CREATE TABLE IF NOT EXISTS `tbl_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_status`
--

INSERT INTO `tbl_status` (`id`,`name`) VALUES
(1, 'Active'),
(2, 'In Field'),
(3, 'Delayed'),
(4, 'Completed'), 
(5, 'Cancelled');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_om_order`
--
  
ALTER TABLE `tbl_om_order`
  ADD CONSTRAINT `fk_order_to_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_to_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_to_size` FOREIGN KEY (`size_id`) REFERENCES `tbl_om_size` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_to_tool_type` FOREIGN KEY (`tool_type_id`) REFERENCES `tbl_om_tool_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_to_location` FOREIGN KEY (`location_id`) REFERENCES `tbl_om_location` (`id`) ON DELETE CASCADE;

  --
-- Constraints for table `tbl_om_order_item`
--
  
ALTER TABLE `tbl_om_order_item`
  ADD CONSTRAINT `fk_order_item_to_order` FOREIGN KEY (`order_id`) REFERENCES `tbl_om_order` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_item_to_part` FOREIGN KEY (`part_id`) REFERENCES `tbl_pv_part` (`id`) ON DELETE CASCADE;
  
--
-- Constraints for table `tbl_om_project_order`
--
  
ALTER TABLE `tbl_om_project_order`
  ADD CONSTRAINT `fk_project_order_to_project` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_project_order_to_order` FOREIGN KEY (`order_id`) REFERENCES `tbl_om_order` (`id`) ON DELETE CASCADE;


--
-- Constraints for table `tbl_client`
--
ALTER TABLE `tbl_client`
  ADD CONSTRAINT `fk_client_to_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_client_to_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE;