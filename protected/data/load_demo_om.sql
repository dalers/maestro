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
-- Table structure for table `tbl_om_client`
--

DROP TABLE IF EXISTS `tbl_om_client`;
CREATE TABLE IF NOT EXISTS `tbl_om_client` (
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
-- Dumping data for table `tbl_om_client`
--

INSERT INTO `tbl_om_client` (`id`, `name`, `phone_no`, `notes`, `create_time`, `create_user_id`) VALUES
(1, 'Alliance', NULL, NULL, NULL, NULL),
(2, 'Alyeska', NULL, NULL, NULL, NULL),
(3, 'Boardwalk', NULL, 'USA', NULL, NULL),
(4, 'BP Alaska', NULL, NULL, NULL, NULL),
(5, 'BP Canada', NULL, NULL, NULL, NULL),
(6, 'Centerpoint', NULL, NULL, NULL, NULL),
(7, 'Centerpoint Energy', NULL, NULL, NULL, NULL),
(8, 'Colonial', NULL, 'USA', NULL, NULL),
(9, 'Dakota Gas', NULL, NULL, NULL, NULL),
(10, 'El Paso', NULL, NULL, NULL, NULL),
(11, 'Enbridge', '403-8956554', 'local', NULL, NULL),
(12, 'Energy Transfer', NULL, NULL, NULL, NULL),
(13, 'ENI Petroleum', NULL, NULL, NULL, NULL),
(14, 'Explorer', NULL, NULL, NULL, NULL),
(15, 'Fortis', NULL, NULL, NULL, NULL),
(16, 'Gas Unie', NULL, NULL, NULL, NULL),
(17, 'InterPipe', '403-698956', 'Canada', NULL, NULL),
(18, 'IOL', NULL, NULL, NULL, NULL),
(19, 'Kern River', NULL, NULL, NULL, NULL),
(20, 'Kinder Morgan', NULL, NULL, NULL, NULL),
(21, 'Marathon', NULL, NULL, NULL, NULL),
(22, 'Mirant', NULL, NULL, NULL, NULL),
(23, 'National Grid', NULL, NULL, NULL, NULL),
(24, 'Nippon Steel', NULL, NULL, NULL, NULL),
(25, 'Northern Natural', NULL, NULL, NULL, NULL),
(26, 'Nova Chemicals', NULL, NULL, NULL, NULL),
(27, 'Ocensa', NULL, NULL, NULL, NULL),
(28, 'Oneok', NULL, NULL, NULL, NULL),
(29, 'Pan Handle', NULL, 'USA', NULL, NULL),
(30, 'PB Energy', NULL, NULL, NULL, NULL),
(31, 'Pembina', NULL, NULL, NULL, NULL),
(32, 'Pemex', NULL, NULL, NULL, NULL),
(33, 'Petroperu', NULL, NULL, NULL, NULL),
(34, 'PG&E', NULL, NULL, NULL, NULL),
(35, 'Phillips', NULL, NULL, NULL, NULL),
(36, 'PPS', NULL, NULL, NULL, NULL),
(37, 'Sempra Energy', NULL, NULL, NULL, NULL),
(38, 'Shell', NULL, NULL, NULL, NULL),
(39, 'SNAM', '403-2733655', 'Italy', NULL, NULL),
(40, 'So Cal', NULL, 'USA', NULL, NULL),
(41, 'Spectra', NULL, NULL, NULL, NULL),
(42, 'Suncor', NULL, NULL, NULL, NULL),
(43, 'Syncrude', NULL, NULL, NULL, NULL),
(44, 'TCPL', '403-989-5236', 'Canada', NULL, NULL),
(45, 'Terasen Gas', NULL, NULL, NULL, NULL),
(46, 'TGN', NULL, NULL, NULL, NULL),
(47, 'Thunder Creek', NULL, NULL, NULL, NULL),
(48, 'TransGas', NULL, NULL, NULL, NULL);

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