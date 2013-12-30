use maestro;

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Alter table structure for table `tbl_project`
-- Add user defined fields

ALTER TABLE `maestro`.`tbl_project` 
ADD COLUMN `user1` VARCHAR(255) NULL DEFAULT NULL AFTER `milestone_date`,
ADD COLUMN `user2` VARCHAR(255) NULL DEFAULT NULL AFTER `user1`,
ADD COLUMN `user3` VARCHAR(255) NULL DEFAULT NULL AFTER `user2`,
ADD COLUMN `user4` VARCHAR(255) NULL DEFAULT NULL AFTER `user3`,
ADD COLUMN `user5` VARCHAR(255) NULL DEFAULT NULL AFTER `user4`,
ADD COLUMN `user6` VARCHAR(255) NULL DEFAULT NULL AFTER `user5`,
ADD COLUMN `user7` VARCHAR(255) NULL DEFAULT NULL AFTER `user6`,
ADD COLUMN `user8` VARCHAR(255) NULL DEFAULT NULL AFTER `user7`,
ADD COLUMN `user9` VARCHAR(255) NULL DEFAULT NULL AFTER `user8`,
ADD COLUMN `user10` VARCHAR(255) NULL DEFAULT NULL AFTER `user9`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_order`
--

CREATE TABLE `tbl_om_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `iteration` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`iteration`),
  KEY `fk_order_to_create_user` (`create_user_id`),
  KEY `fk_order_to_update_user` (`update_user_id`),
  KEY `fk_order_to_project_idx` (`project_id`),
  CONSTRAINT `fk_order_to_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_to_project` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_to_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tbl_om_order`:
--   `project_id`
--       `tbl_project` -> `id`
--   `update_user_id`
--       `tbl_person` -> `id`
--   `create_user_id`
--       `tbl_person` -> `id`
--

INSERT INTO `tbl_om_order` (`id`, `name`, `type`, `status`, `iteration`, `project_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'First Partial', '10 pin', 'ACTIVE', 0, NULL, NULL, NULL, NULL, NULL),
(1, 'First Partial', '10 pin', 'ACTIVE', 1, NULL, NULL, NULL, NULL, NULL),
(2, 'First Partial', '10 pin', 'ACTIVE', 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_om_order_item`
--
DROP TABLE IF EXISTS `tbl_om_order_item`;
CREATE TABLE `tbl_om_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `desired_qty` int(11) DEFAULT '0',
  `shipped_qty` int(11) DEFAULT '0',
  `serial_no` text DEFAULT NULL,
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

INSERT INTO `tbl_om_order_item` (`id`, `order_id`, `part_id`, `desired_qty`, `shipped_qty`, `serial_no`, `action`) VALUES
(1, 1, 8, 0, 0, NULL, 'A'),
(2, 1, 32, 0, 0, NULL, 'A');
  
--
-- Add admin and demo user to `tbl_person`
--

INSERT INTO `tbl_person` (`username`, `status`, `password`, `email`, `nick`, `lname`, `fname`, `initial`, `profile`, `last_login_time`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
('admin', 1, 'admin', 'admin@firefly.scc.loc', 'AA', 'Admin', 'Admin', 'AA', 0, NULL, NULL, NULL, NULL, NULL),
('demo', 1, 'demo', 'demo@firefly.scc.loc', 'DD', 'Demo', 'Demo', 'DD', 1, NULL, NULL, NULL, NULL, NULL);