use maestro;

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_order`
--

DROP TABLE IF EXISTS `tbl_om_order`;
CREATE TABLE `tbl_om_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(255) DEFAULT NULL,
  `tool_type` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `order_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `iteration` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_to_create_user` (`create_user_id`),
  KEY `fk_order_to_update_user` (`update_user_id`),
  CONSTRAINT `fk_order_to_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_to_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_om_order`:
--   `update_user_id`
--       `tbl_person` -> `id`
--   `create_user_id`
--       `tbl_person` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_order_item`
--
DROP TABLE IF EXISTS `tbl_om_order_item`
CREATE TABLE `tbl_om_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `action` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_item_to_order` (`order_id`),
  KEY `fk_order_item_to_part` (`part_id`),
  CONSTRAINT `fk_order_item_to_order` FOREIGN KEY (`order_id`) REFERENCES `tbl_om_order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_item_to_part` FOREIGN KEY (`part_id`) REFERENCES `tbl_pv_pn` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- RELATIONS FOR TABLE `tbl_om_order_item`:
--   `order_id`
--       `tbl_om_order` -> `id`
--   `part_id`
--       `tbl_pv_pn` -> `id`
--

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_om_order`
--
  
ALTER TABLE `tbl_om_order`
  ADD CONSTRAINT `fk_order_to_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_to_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE;
  --
-- Constraints for table `tbl_om_order_item`
--
  
ALTER TABLE `tbl_om_order_item`
  ADD CONSTRAINT `fk_order_item_to_order` FOREIGN KEY (`order_id`) REFERENCES `tbl_om_order` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_item_to_part` FOREIGN KEY (`part_id`) REFERENCES `tbl_pv_part` (`id`) ON DELETE CASCADE;
  
--
-- Dumping data for table `tbl_person`
--

INSERT INTO `tbl_person` (`username`, `status`, `password`, `email`, `nick`, `lname`, `fname`, `initial`, `profile`, `last_login_time`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
('admin', 1, 'admin', 'admin@firefly.scc.loc', 'AA', 'Admin', 'Admin', 'AA', 1, NULL, NULL, NULL, NULL, NULL),
('demo', 1, 'demo', 'demo@firefly.scc.loc', 'DD', 'Demo', 'Demo', 'DD', 1, NULL, NULL, NULL, NULL, NULL);