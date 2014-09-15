-- Adminer 4.1.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

USE `bugtracker_scc`;

DROP TABLE IF EXISTS `mantis_bugnote_table`;
CREATE TABLE `mantis_bugnote_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bugnote_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `note_type` int(11) DEFAULT '0',
  `note_attr` varchar(250) DEFAULT '',
  `time_tracking` int(10) unsigned NOT NULL DEFAULT '0',
  `last_modified` int(10) unsigned NOT NULL DEFAULT '1',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug` (`bug_id`),
  KEY `idx_last_mod` (`last_modified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_bugnote_text_table`;
CREATE TABLE `mantis_bugnote_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_bug_file_table`;
CREATE TABLE `mantis_bug_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `content` longblob NOT NULL,
  `date_added` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bug_file_bug_id` (`bug_id`),
  KEY `idx_diskfile` (`diskfile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_bug_history_table`;
CREATE TABLE `mantis_bug_history_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_name` varchar(64) NOT NULL,
  `old_value` varchar(255) NOT NULL,
  `new_value` varchar(255) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `date_modified` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_history_bug_id` (`bug_id`),
  KEY `idx_history_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bug_history_table` (`id`, `user_id`, `bug_id`, `field_name`, `old_value`, `new_value`, `type`, `date_modified`) VALUES
(79,	1,	17,	'date_submitted',	'1409983167',	'1356937200',	0,	1409983167),
(78,	1,	17,	'handler_id',	'0',	'6',	0,	1409983167),
(84,	1,	19,	'',	'',	'',	1,	1409983167),
(83,	1,	18,	'date_submitted',	'1409983167',	'1357023600',	0,	1409983167),
(82,	1,	18,	'handler_id',	'0',	'6',	0,	1409983167),
(81,	1,	18,	'status',	'10',	'50',	0,	1409983167),
(80,	1,	18,	'',	'',	'',	1,	1409983167),
(85,	1,	19,	'status',	'10',	'50',	0,	1409983167),
(86,	1,	19,	'handler_id',	'0',	'18',	0,	1409983167),
(87,	1,	19,	'date_submitted',	'1409983167',	'1357110000',	0,	1409983167),
(88,	1,	20,	'',	'',	'',	1,	1409983167),
(89,	1,	20,	'status',	'10',	'50',	0,	1409983167),
(90,	1,	20,	'handler_id',	'0',	'21',	0,	1409983167),
(91,	1,	20,	'date_submitted',	'1409983167',	'1357196400',	0,	1409983167),
(92,	1,	21,	'',	'',	'',	1,	1409983167),
(93,	1,	21,	'status',	'10',	'50',	0,	1409983167),
(94,	1,	21,	'handler_id',	'0',	'10',	0,	1409983167),
(95,	1,	21,	'date_submitted',	'1409983167',	'1357282800',	0,	1409983168),
(96,	1,	18,	'',	'6',	'',	12,	1409983364),
(97,	1,	22,	'',	'',	'',	1,	1410496267),
(98,	1,	22,	'status',	'10',	'50',	0,	1410496267),
(99,	1,	22,	'handler_id',	'0',	'31',	0,	1410496267),
(100,	1,	22,	'date_submitted',	'1410496267',	'1302113040',	0,	1410496267),
(101,	1,	23,	'',	'',	'',	1,	1410496267),
(102,	1,	23,	'status',	'10',	'50',	0,	1410496267),
(103,	1,	23,	'handler_id',	'0',	'32',	0,	1410496267),
(104,	1,	23,	'date_submitted',	'1410496267',	'1278603660',	0,	1410496267),
(77,	1,	17,	'status',	'10',	'50',	0,	1409983167),
(76,	1,	17,	'',	'',	'',	1,	1409983167),
(105,	1,	24,	'',	'',	'',	1,	1410496267),
(106,	1,	24,	'status',	'10',	'50',	0,	1410496267),
(107,	1,	24,	'handler_id',	'0',	'32',	0,	1410496267),
(108,	1,	24,	'date_submitted',	'1410496267',	'1386093300',	0,	1410496267),
(109,	1,	25,	'',	'',	'',	1,	1410496267),
(110,	1,	25,	'status',	'10',	'50',	0,	1410496267),
(111,	1,	25,	'handler_id',	'0',	'32',	0,	1410496267),
(112,	1,	25,	'date_submitted',	'1410496267',	'1385426460',	0,	1410496267),
(113,	1,	26,	'',	'',	'',	1,	1410496267),
(114,	1,	26,	'status',	'10',	'50',	0,	1410496267),
(115,	1,	26,	'handler_id',	'0',	'32',	0,	1410496267),
(116,	1,	26,	'date_submitted',	'1410496267',	'1361305620',	0,	1410496267),
(117,	1,	27,	'',	'',	'',	1,	1410496267),
(118,	1,	27,	'status',	'10',	'50',	0,	1410496267),
(119,	1,	27,	'handler_id',	'0',	'32',	0,	1410496267),
(120,	1,	27,	'date_submitted',	'1410496267',	'1386098820',	0,	1410496267);

DROP TABLE IF EXISTS `mantis_bug_monitor_table`;
CREATE TABLE `mantis_bug_monitor_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bug_monitor_table` (`user_id`, `bug_id`) VALUES
(6,	18);

DROP TABLE IF EXISTS `mantis_bug_relationship_table`;
CREATE TABLE `mantis_bug_relationship_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `destination_bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `relationship_type` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_relationship_source` (`source_bug_id`),
  KEY `idx_relationship_destination` (`destination_bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_bug_revision_table`;
CREATE TABLE `mantis_bug_revision_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL,
  `bugnote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_rev_type` (`type`),
  KEY `idx_bug_rev_id_time` (`bug_id`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_bug_table`;
CREATE TABLE `mantis_bug_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `handler_id` int(10) unsigned NOT NULL DEFAULT '0',
  `duplicate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority` smallint(6) NOT NULL DEFAULT '30',
  `severity` smallint(6) NOT NULL DEFAULT '50',
  `reproducibility` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `resolution` smallint(6) NOT NULL DEFAULT '10',
  `projection` smallint(6) NOT NULL DEFAULT '10',
  `eta` smallint(6) NOT NULL DEFAULT '10',
  `bug_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '',
  `fixed_in_version` varchar(64) NOT NULL DEFAULT '',
  `build` varchar(32) NOT NULL DEFAULT '',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `summary` varchar(128) NOT NULL DEFAULT '',
  `sponsorship_total` int(11) NOT NULL DEFAULT '0',
  `sticky` tinyint(4) NOT NULL DEFAULT '0',
  `target_version` varchar(64) NOT NULL DEFAULT '',
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  `due_date` int(10) unsigned NOT NULL DEFAULT '1',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_sponsorship_total` (`sponsorship_total`),
  KEY `idx_bug_fixed_in_version` (`fixed_in_version`),
  KEY `idx_bug_status` (`status`),
  KEY `idx_project` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bug_table` (`id`, `project_id`, `reporter_id`, `handler_id`, `duplicate_id`, `priority`, `severity`, `reproducibility`, `status`, `resolution`, `projection`, `eta`, `bug_text_id`, `os`, `os_build`, `platform`, `version`, `fixed_in_version`, `build`, `profile_id`, `view_state`, `summary`, `sponsorship_total`, `sticky`, `target_version`, `category_id`, `date_submitted`, `due_date`, `last_updated`) VALUES
(17,	1,	10,	6,	0,	0,	50,	70,	50,	10,	10,	10,	17,	'',	'',	'',	'',	'',	'',	0,	10,	'Release prototype PCA',	0,	0,	'',	1,	1356937200,	1357023600,	1409983167),
(18,	1,	10,	6,	0,	0,	50,	70,	50,	10,	10,	10,	18,	'',	'',	'',	'',	'',	'',	0,	10,	'Make PCB corrections',	0,	0,	'',	1,	1357023600,	1357110000,	1409983364),
(19,	1,	10,	18,	0,	0,	50,	70,	50,	10,	10,	10,	19,	'',	'',	'',	'',	'',	'',	0,	10,	'Release marketing assembly',	0,	0,	'',	1,	1357110000,	1357196400,	1409983167),
(20,	1,	10,	21,	0,	0,	50,	70,	50,	10,	10,	10,	20,	'',	'',	'',	'',	'',	'',	0,	10,	'Reduce cost and improve quality',	0,	0,	'',	1,	1357196400,	1357282800,	1409983167),
(21,	1,	10,	10,	0,	0,	50,	70,	50,	10,	10,	10,	21,	'',	'',	'',	'',	'',	'',	0,	10,	'Release field service kit',	0,	0,	'',	1,	1357282800,	1357369200,	1409983167),
(22,	2,	0,	31,	0,	0,	50,	70,	50,	10,	10,	10,	22,	'',	'',	'',	'',	'',	'',	0,	10,	'AGM - Mfr GPS Box qty 6',	0,	0,	'',	1,	1302113040,	1,	1410496267),
(23,	2,	0,	32,	0,	0,	50,	70,	50,	10,	10,	10,	23,	'',	'',	'',	'',	'',	'',	0,	10,	'AGM - Modify BJ AGM to prevent battery over-discharge',	0,	0,	'',	1,	1278603660,	1,	1410496267),
(24,	2,	33,	32,	0,	0,	50,	70,	50,	10,	10,	10,	24,	'',	'',	'',	'',	'',	'',	0,	10,	'AGM - Modify firmware to make Copernicus compatible with old ACE III',	0,	0,	'',	1,	1386093300,	1,	1410496267),
(25,	2,	33,	32,	0,	0,	50,	70,	50,	10,	10,	10,	25,	'',	'',	'',	'',	'',	'',	0,	10,	'AGM - Replace V-Infinity power supply module on GPS-001',	0,	0,	'',	1,	1385426460,	1,	1410496267),
(26,	2,	0,	32,	0,	0,	50,	70,	50,	10,	10,	10,	26,	'',	'',	'',	'',	'',	'',	0,	10,	'AGM - Resolve failure of new units at test (? units)',	0,	0,	'',	1,	1361305620,	1,	1410496267),
(27,	2,	33,	32,	0,	0,	50,	70,	50,	10,	10,	10,	27,	'',	'',	'',	'',	'',	'',	0,	10,	'AGM - Revise PCB',	0,	0,	'',	1,	1386098820,	1,	1410496267);

DROP TABLE IF EXISTS `mantis_bug_tag_table`;
CREATE TABLE `mantis_bug_tag_table` (
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_attached` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`bug_id`,`tag_id`),
  KEY `idx_bug_tag_tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_bug_text_table`;
CREATE TABLE `mantis_bug_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `steps_to_reproduce` longtext NOT NULL,
  `additional_information` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_bug_text_table` (`id`, `description`, `steps_to_reproduce`, `additional_information`) VALUES
(17,	'Release PN 20000004 Rev 00 with child parts and sub-assemblies for building a small number of prototype units. Assembly to include functional PCA, earphone, wire for stubby antenna and preliminary user manual (NO enclosure). Manufacturing process documentation to include product part breakdown structure diagram, work instruction for packing beta test units and a work instruction for fabricating PN 20000001 (custom inductor).',	'',	''),
(18,	'Revise schematic to correct connectivity of PCB-type inductor; revise PCB design to correct the inductor layout and mechanical dimensions (and generate new CAM files). Create PCB master drawing. Create PCA assembly drawing and work instruction. Update work instruction for custom inductor PN 20000001 to meet revised format requirements (rev level will not change as fit/form/function remains the same).',	'',	''),
(19,	'Re-structure product to meet product release requirements, including creation of new top-level marketing assembly part number. Product to include enclosure with hardware, user manual and earphone to be moved to marketing assembly, stubby antenna removed, user manual to be updated.',	'',	''),
(20,	'Invert PCB in enclosure to aid assembly and test (requiring modifications to enclosure base and lid, including artwork). Update PCA assembly diagram and work instruction, update enclosure-level assembly diagram and work instruction.',	'',	''),
(21,	'Create kit of parts found typically useful for field service.',	'',	''),
(22,	'AGM - Mfr GPS Box qty 6',	'',	''),
(23,	'AGM - Modify BJ AGM to prevent battery over-discharge',	'',	''),
(24,	'AGM - Modify firmware to make Copernicus compatible with old ACE III',	'',	''),
(25,	'AGM - Replace V-Infinity power supply module on GPS-001',	'',	''),
(26,	'AGM - Resolve failure of new units at test (? units)',	'',	''),
(27,	'AGM - Revise PCB',	'',	'');

DROP TABLE IF EXISTS `mantis_category_table`;
CREATE TABLE `mantis_category_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category_project_name` (`project_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_category_table` (`id`, `project_id`, `user_id`, `name`, `status`) VALUES
(1,	0,	0,	'General',	0);

DROP TABLE IF EXISTS `mantis_config_table`;
CREATE TABLE `mantis_config_table` (
  `config_id` varchar(64) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `access_reqd` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '90',
  `value` longtext NOT NULL,
  PRIMARY KEY (`config_id`,`project_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_config_table` (`config_id`, `project_id`, `user_id`, `access_reqd`, `type`, `value`) VALUES
('database_version',	0,	0,	90,	1,	'183'),
('plugin_MantisGraph_schema',	0,	0,	90,	1,	'-1'),
('plugin_MantisGraph_jpgraph_path',	0,	0,	90,	2,	''),
('plugin_MantisGraph_eczlibrary',	0,	0,	90,	1,	'0'),
('plugin_Csv_import_schema',	0,	0,	90,	1,	'-1');

DROP TABLE IF EXISTS `mantis_custom_field_project_table`;
CREATE TABLE `mantis_custom_field_project_table` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sequence` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_custom_field_string_table`;
CREATE TABLE `mantis_custom_field_string_table` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `bug_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`bug_id`),
  KEY `idx_custom_field_bug` (`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_custom_field_table`;
CREATE TABLE `mantis_custom_field_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `possible_values` text NOT NULL,
  `default_value` varchar(255) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `access_level_r` smallint(6) NOT NULL DEFAULT '0',
  `access_level_rw` smallint(6) NOT NULL DEFAULT '0',
  `length_min` int(11) NOT NULL DEFAULT '0',
  `length_max` int(11) NOT NULL DEFAULT '0',
  `require_report` tinyint(4) NOT NULL DEFAULT '0',
  `require_update` tinyint(4) NOT NULL DEFAULT '0',
  `display_report` tinyint(4) NOT NULL DEFAULT '0',
  `display_update` tinyint(4) NOT NULL DEFAULT '1',
  `require_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `display_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `display_closed` tinyint(4) NOT NULL DEFAULT '0',
  `require_closed` tinyint(4) NOT NULL DEFAULT '0',
  `filter_by` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_custom_field_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_email_table`;
CREATE TABLE `mantis_email_table` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL DEFAULT '',
  `subject` varchar(250) NOT NULL DEFAULT '',
  `metadata` longtext NOT NULL,
  `body` longtext NOT NULL,
  `submitted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_email_table` (`email_id`, `email`, `subject`, `metadata`, `body`, `submitted`) VALUES
(28,	'mdelazes@whizzer.local',	'[Default 0000015]: Reduce cost and improve quality',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"d28e74a8a481fc2e3dd95e2076562115\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                mdelazes\n====================================================================== \nProject:                    Default\nIssue ID:                   15\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2013-01-03 00:00 MST\nLast Modified:              2014-09-05 23:51 MDT\n====================================================================== \nSummary:                    Reduce cost and improve quality\nDescription: \nInvert PCB in enclosure to aid assembly and test (requiring modifications to enclosure base and lid, including artwork). Update PCA assembly diagram and work instruction, update enclosure-level assembly diagram and work instruction.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:51 administrator  New Issue                                    \n2014-09-05 23:51 administrator  Assigned To               => mdelazes        \n2014-09-05 23:51 administrator  Date Submitted           1409982700 => 1357196400\n2014-09-05 23:54 administrator  Issue Deleted: 0000015                       \n======================================================================',	1409982855),
(26,	'fmason@whizzer.local',	'[Default 0000016]: Release field service kit',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"f4b6dfbef73de52714364a1fa42b6536\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                fmason\n====================================================================== \nProject:                    Default\nIssue ID:                   16\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2013-01-04 00:00 MST\nLast Modified:              2014-09-05 23:51 MDT\n====================================================================== \nSummary:                    Release field service kit\nDescription: \nCreate kit of parts found typically useful for field service.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:51 administrator  New Issue                                    \n2014-09-05 23:51 administrator  Assigned To               => fmason          \n2014-09-05 23:51 administrator  Date Submitted           1409982700 => 1357282800\n2014-09-05 23:54 administrator  Issue Deleted: 0000016                       \n======================================================================',	1409982850),
(12,	'jperiod@whizzer.local',	'[MantisBT] Account updated',	'a:4:{s:7:\"headers\";a:0:{}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8080/mantis/account_page.php\n\nReal Name:  => James Period\nE-mail:  => jperiod@whizzer.local',	1408203114),
(13,	'jhaddon@whizzer.local',	'[MantisBT] Account updated',	'a:4:{s:7:\"headers\";a:0:{}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8080/mantis/account_page.php\n\nReal Name:  => Jennie Haddon\nE-mail:  => jhaddon@whizzer.local',	1408203140),
(14,	'jmorse@whizzer.local',	'[MantisBT] Account updated',	'a:4:{s:7:\"headers\";a:0:{}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8080/mantis/account_page.php\n\nReal Name:  => Jennie Morse\nE-mail:  => jmorse@whizzer.local',	1408203176),
(15,	'jsharp@whizzer.local',	'[MantisBT] Account updated',	'a:4:{s:7:\"headers\";a:0:{}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8080/mantis/account_page.php\n\nReal Name:  => John Sharp\nE-mail:  => jsharp@whizzer.local',	1408203203),
(16,	'mnestor@whizzer.local',	'[MantisBT] Account updated',	'a:4:{s:7:\"headers\";a:0:{}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8080/mantis/account_page.php\n\nReal Name:  => Mary Nestor\nE-mail:  => mnestor@whizzer.local',	1408203237),
(17,	'mblair@whizzer.local',	'[MantisBT] Account updated',	'a:4:{s:7:\"headers\";a:0:{}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8080/mantis/account_page.php\n\nReal Name:  => Minnie Blair\nE-mail:  => mblair@whizzer.local',	1408203275),
(18,	'mdelazes@whizzer.local',	'[MantisBT] Account updated',	'a:4:{s:7:\"headers\";a:0:{}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8080/mantis/account_page.php\n\nReal Name:  => Miquel DeLazes\nE-mail:  => mdelazes@whizzer.local',	1408203306),
(19,	'nnewton@whizzer.local',	'[MantisBT] Account updated',	'a:4:{s:7:\"headers\";a:0:{}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8080/mantis/account_page.php\n\nReal Name:  => Ned Newton\nE-mail:  => nnewton@whizzer.local',	1408203338),
(20,	'rsampson@whizzer.local',	'[MantisBT] Account updated',	'a:4:{s:7:\"headers\";a:0:{}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8080/mantis/account_page.php\n\nReal Name:  => Rad Sampson\nE-mail:  => rsampson@whizzer.local',	1408203371),
(21,	'smalloy@whizzer.local',	'[MantisBT] Account updated',	'a:4:{s:7:\"headers\";a:0:{}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8080/mantis/account_page.php\n\nReal Name:  => Sarah Malloy\nE-mail:  => smalloy@whizzer.local',	1408203401),
(22,	'tswift@whizzer.local',	'[MantisBT] Account updated',	'a:4:{s:7:\"headers\";a:0:{}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8080/mantis/account_page.php\n\nReal Name:  => Tom Swift\nE-mail:  => tswift@whizzer.local',	1408203429),
(23,	'wdamon@whizzer.local',	'[MantisBT] Account updated',	'a:4:{s:7:\"headers\";a:0:{}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8080/mantis/account_page.php\n\nReal Name:  => Wakefield Damon\nE-mail:  => wdamon@whizzer.local',	1408203470),
(24,	'wcrawford@whizzer.local',	'[MantisBT] Account updated',	'a:4:{s:7:\"headers\";a:0:{}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8080/mantis/account_page.php\n\nReal Name:  => William Crawford\nE-mail:  => wcrawford@whizzer.local',	1408203509),
(27,	'fmason@whizzer.local',	'[Default 0000015]: Reduce cost and improve quality',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"d28e74a8a481fc2e3dd95e2076562115\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                mdelazes\n====================================================================== \nProject:                    Default\nIssue ID:                   15\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2013-01-03 00:00 MST\nLast Modified:              2014-09-05 23:51 MDT\n====================================================================== \nSummary:                    Reduce cost and improve quality\nDescription: \nInvert PCB in enclosure to aid assembly and test (requiring modifications to enclosure base and lid, including artwork). Update PCA assembly diagram and work instruction, update enclosure-level assembly diagram and work instruction.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:51 administrator  New Issue                                    \n2014-09-05 23:51 administrator  Assigned To               => mdelazes        \n2014-09-05 23:51 administrator  Date Submitted           1409982700 => 1357196400\n2014-09-05 23:54 administrator  Issue Deleted: 0000015                       \n======================================================================',	1409982855),
(29,	'fmason@whizzer.local',	'[Default 0000014]: Release marketing assembly',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"3eef7fdea6716717ef95dea0073d7352\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                jsharp\n====================================================================== \nProject:                    Default\nIssue ID:                   14\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2013-01-02 00:00 MST\nLast Modified:              2014-09-05 23:51 MDT\n====================================================================== \nSummary:                    Release marketing assembly\nDescription: \nRe-structure product to meet product release requirements, including creation of new top-level marketing assembly part number. Product to include enclosure with hardware, user manual and earphone to be moved to marketing assembly, stubby antenna removed, user manual to be updated.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:51 administrator  New Issue                                    \n2014-09-05 23:51 administrator  Assigned To               => jsharp          \n2014-09-05 23:51 administrator  Date Submitted           1409982700 => 1357110000\n2014-09-05 23:54 administrator  Issue Deleted: 0000014                       \n======================================================================',	1409982872),
(30,	'jsharp@whizzer.local',	'[Default 0000014]: Release marketing assembly',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"3eef7fdea6716717ef95dea0073d7352\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                jsharp\n====================================================================== \nProject:                    Default\nIssue ID:                   14\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2013-01-02 00:00 MST\nLast Modified:              2014-09-05 23:51 MDT\n====================================================================== \nSummary:                    Release marketing assembly\nDescription: \nRe-structure product to meet product release requirements, including creation of new top-level marketing assembly part number. Product to include enclosure with hardware, user manual and earphone to be moved to marketing assembly, stubby antenna removed, user manual to be updated.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:51 administrator  New Issue                                    \n2014-09-05 23:51 administrator  Assigned To               => jsharp          \n2014-09-05 23:51 administrator  Date Submitted           1409982700 => 1357110000\n2014-09-05 23:54 administrator  Issue Deleted: 0000014                       \n======================================================================',	1409982872),
(31,	'fmason@whizzer.local',	'[Default 0000013]: Make PCB corrections',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"ae9755e4aa03688a00a5fc161faf1605\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                bjenks\n====================================================================== \nProject:                    Default\nIssue ID:                   13\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2013-01-01 00:00 MST\nLast Modified:              2014-09-05 23:51 MDT\n====================================================================== \nSummary:                    Make PCB corrections\nDescription: \nRevise schematic to correct connectivity of PCB-type inductor; revise PCB design to correct the inductor layout and mechanical dimensions (and generate new CAM files). Create PCB master drawing. Create PCA assembly drawing and work instruction. Update work instruction for custom inductor PN 20000001 to meet revised format requirements (rev level will not change as fit/form/function remains the same).\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:51 administrator  New Issue                                    \n2014-09-05 23:51 administrator  Assigned To               => bjenks          \n2014-09-05 23:51 administrator  Date Submitted           1409982700 => 1357023600\n2014-09-05 23:54 administrator  Issue Deleted: 0000013                       \n======================================================================',	1409982879),
(32,	'bjenks@whizzer.local',	'[Default 0000013]: Make PCB corrections',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"ae9755e4aa03688a00a5fc161faf1605\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                bjenks\n====================================================================== \nProject:                    Default\nIssue ID:                   13\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2013-01-01 00:00 MST\nLast Modified:              2014-09-05 23:51 MDT\n====================================================================== \nSummary:                    Make PCB corrections\nDescription: \nRevise schematic to correct connectivity of PCB-type inductor; revise PCB design to correct the inductor layout and mechanical dimensions (and generate new CAM files). Create PCB master drawing. Create PCA assembly drawing and work instruction. Update work instruction for custom inductor PN 20000001 to meet revised format requirements (rev level will not change as fit/form/function remains the same).\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:51 administrator  New Issue                                    \n2014-09-05 23:51 administrator  Assigned To               => bjenks          \n2014-09-05 23:51 administrator  Date Submitted           1409982700 => 1357023600\n2014-09-05 23:54 administrator  Issue Deleted: 0000013                       \n======================================================================',	1409982879),
(33,	'fmason@whizzer.local',	'[Default 0000012]: Release prototype PCA',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"5f9ff93647b6c2865b408a8331c9671c\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                bjenks\n====================================================================== \nProject:                    Default\nIssue ID:                   12\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2012-12-31 00:00 MST\nLast Modified:              2014-09-05 23:51 MDT\n====================================================================== \nSummary:                    Release prototype PCA\nDescription: \nRelease PN 20000004 Rev 00 with child parts and sub-assemblies for building a small number of prototype units. Assembly to include functional PCA, earphone, wire for stubby antenna and preliminary user manual (NO enclosure). Manufacturing process documentation to include product part breakdown structure diagram, work instruction for packing beta test units and a work instruction for fabricating PN 20000001 (custom inductor).\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:51 administrator  New Issue                                    \n2014-09-05 23:51 administrator  Assigned To               => bjenks          \n2014-09-05 23:51 administrator  Date Submitted           1409982700 => 1356937200\n2014-09-05 23:54 administrator  Issue Deleted: 0000012                       \n======================================================================',	1409982890),
(34,	'bjenks@whizzer.local',	'[Default 0000012]: Release prototype PCA',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"5f9ff93647b6c2865b408a8331c9671c\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                bjenks\n====================================================================== \nProject:                    Default\nIssue ID:                   12\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2012-12-31 00:00 MST\nLast Modified:              2014-09-05 23:51 MDT\n====================================================================== \nSummary:                    Release prototype PCA\nDescription: \nRelease PN 20000004 Rev 00 with child parts and sub-assemblies for building a small number of prototype units. Assembly to include functional PCA, earphone, wire for stubby antenna and preliminary user manual (NO enclosure). Manufacturing process documentation to include product part breakdown structure diagram, work instruction for packing beta test units and a work instruction for fabricating PN 20000001 (custom inductor).\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:51 administrator  New Issue                                    \n2014-09-05 23:51 administrator  Assigned To               => bjenks          \n2014-09-05 23:51 administrator  Date Submitted           1409982700 => 1356937200\n2014-09-05 23:54 administrator  Issue Deleted: 0000012                       \n======================================================================',	1409982890),
(35,	'fmason@whizzer.local',	'[Default 0000011]: Release field service kit',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"a70529f954df124e759a1b9ab4ee1a15\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                fmason\n====================================================================== \nProject:                    Default\nIssue ID:                   11\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2013-01-04 00:00 MST\nLast Modified:              2014-09-05 23:48 MDT\n====================================================================== \nSummary:                    Release field service kit\nDescription: \nCreate kit of parts found typically useful for field service.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:48 administrator  New Issue                                    \n2014-09-05 23:48 administrator  Assigned To               => fmason          \n2014-09-05 23:48 administrator  Date Submitted           1409982510 => 1357282800\n2014-09-05 23:54 administrator  Issue Deleted: 0000011                       \n======================================================================',	1409982896),
(36,	'fmason@whizzer.local',	'[Default 0000010]: Reduce cost and improve quality',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"4ead6aab5aff8a06016f0b1bc693717b\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                mdelazes\n====================================================================== \nProject:                    Default\nIssue ID:                   10\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2013-01-03 00:00 MST\nLast Modified:              2014-09-05 23:48 MDT\n====================================================================== \nSummary:                    Reduce cost and improve quality\nDescription: \nInvert PCB in enclosure to aid assembly and test (requiring modifications to enclosure base and lid, including artwork). Update PCA assembly diagram and work instruction, update enclosure-level assembly diagram and work instruction.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:48 administrator  New Issue                                    \n2014-09-05 23:48 administrator  Assigned To               => mdelazes        \n2014-09-05 23:48 administrator  Date Submitted           1409982510 => 1357196400\n2014-09-05 23:55 administrator  Issue Deleted: 0000010                       \n======================================================================',	1409982904),
(37,	'mdelazes@whizzer.local',	'[Default 0000010]: Reduce cost and improve quality',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"4ead6aab5aff8a06016f0b1bc693717b\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                mdelazes\n====================================================================== \nProject:                    Default\nIssue ID:                   10\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2013-01-03 00:00 MST\nLast Modified:              2014-09-05 23:48 MDT\n====================================================================== \nSummary:                    Reduce cost and improve quality\nDescription: \nInvert PCB in enclosure to aid assembly and test (requiring modifications to enclosure base and lid, including artwork). Update PCA assembly diagram and work instruction, update enclosure-level assembly diagram and work instruction.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:48 administrator  New Issue                                    \n2014-09-05 23:48 administrator  Assigned To               => mdelazes        \n2014-09-05 23:48 administrator  Date Submitted           1409982510 => 1357196400\n2014-09-05 23:55 administrator  Issue Deleted: 0000010                       \n======================================================================',	1409982904),
(38,	'fmason@whizzer.local',	'[Default 0000009]: Release marketing assembly',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"294af842129ebcba42d420924ea85762\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                jsharp\n====================================================================== \nProject:                    Default\nIssue ID:                   9\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2013-01-02 00:00 MST\nLast Modified:              2014-09-05 23:48 MDT\n====================================================================== \nSummary:                    Release marketing assembly\nDescription: \nRe-structure product to meet product release requirements, including creation of new top-level marketing assembly part number. Product to include enclosure with hardware, user manual and earphone to be moved to marketing assembly, stubby antenna removed, user manual to be updated.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:48 administrator  New Issue                                    \n2014-09-05 23:48 administrator  Assigned To               => jsharp          \n2014-09-05 23:48 administrator  Date Submitted           1409982510 => 1357110000\n2014-09-05 23:55 administrator  Issue Deleted: 0000009                       \n======================================================================',	1409982916),
(39,	'jsharp@whizzer.local',	'[Default 0000009]: Release marketing assembly',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"294af842129ebcba42d420924ea85762\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                jsharp\n====================================================================== \nProject:                    Default\nIssue ID:                   9\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2013-01-02 00:00 MST\nLast Modified:              2014-09-05 23:48 MDT\n====================================================================== \nSummary:                    Release marketing assembly\nDescription: \nRe-structure product to meet product release requirements, including creation of new top-level marketing assembly part number. Product to include enclosure with hardware, user manual and earphone to be moved to marketing assembly, stubby antenna removed, user manual to be updated.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:48 administrator  New Issue                                    \n2014-09-05 23:48 administrator  Assigned To               => jsharp          \n2014-09-05 23:48 administrator  Date Submitted           1409982510 => 1357110000\n2014-09-05 23:55 administrator  Issue Deleted: 0000009                       \n======================================================================',	1409982916),
(40,	'fmason@whizzer.local',	'[Default 0000008]: Make PCB corrections',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"9e4168ef2227740722397bc778b643b9\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                bjenks\n====================================================================== \nProject:                    Default\nIssue ID:                   8\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2013-01-01 00:00 MST\nLast Modified:              2014-09-05 23:48 MDT\n====================================================================== \nSummary:                    Make PCB corrections\nDescription: \nRevise schematic to correct connectivity of PCB-type inductor; revise PCB design to correct the inductor layout and mechanical dimensions (and generate new CAM files). Create PCB master drawing. Create PCA assembly drawing and work instruction. Update work instruction for custom inductor PN 20000001 to meet revised format requirements (rev level will not change as fit/form/function remains the same).\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:48 administrator  New Issue                                    \n2014-09-05 23:48 administrator  Assigned To               => bjenks          \n2014-09-05 23:48 administrator  Date Submitted           1409982510 => 1357023600\n2014-09-05 23:55 administrator  Issue Deleted: 0000008                       \n======================================================================',	1409982925),
(41,	'bjenks@whizzer.local',	'[Default 0000008]: Make PCB corrections',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"9e4168ef2227740722397bc778b643b9\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                bjenks\n====================================================================== \nProject:                    Default\nIssue ID:                   8\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2013-01-01 00:00 MST\nLast Modified:              2014-09-05 23:48 MDT\n====================================================================== \nSummary:                    Make PCB corrections\nDescription: \nRevise schematic to correct connectivity of PCB-type inductor; revise PCB design to correct the inductor layout and mechanical dimensions (and generate new CAM files). Create PCB master drawing. Create PCA assembly drawing and work instruction. Update work instruction for custom inductor PN 20000001 to meet revised format requirements (rev level will not change as fit/form/function remains the same).\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:48 administrator  New Issue                                    \n2014-09-05 23:48 administrator  Assigned To               => bjenks          \n2014-09-05 23:48 administrator  Date Submitted           1409982510 => 1357023600\n2014-09-05 23:55 administrator  Issue Deleted: 0000008                       \n======================================================================',	1409982925),
(42,	'fmason@whizzer.local',	'[Default 0000007]: Release prototype PCA',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"223b30865d75817c4d8b2086139e695e\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                bjenks\n====================================================================== \nProject:                    Default\nIssue ID:                   7\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2012-12-31 00:00 MST\nLast Modified:              2014-09-05 23:48 MDT\n====================================================================== \nSummary:                    Release prototype PCA\nDescription: \nRelease PN 20000004 Rev 00 with child parts and sub-assemblies for building a small number of prototype units. Assembly to include functional PCA, earphone, wire for stubby antenna and preliminary user manual (NO enclosure). Manufacturing process documentation to include product part breakdown structure diagram, work instruction for packing beta test units and a work instruction for fabricating PN 20000001 (custom inductor).\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:48 administrator  New Issue                                    \n2014-09-05 23:48 administrator  Assigned To               => bjenks          \n2014-09-05 23:48 administrator  Date Submitted           1409982510 => 1356937200\n2014-09-05 23:55 administrator  Issue Deleted: 0000007                       \n======================================================================',	1409982935),
(43,	'bjenks@whizzer.local',	'[Default 0000007]: Release prototype PCA',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"223b30865d75817c4d8b2086139e695e\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                bjenks\n====================================================================== \nProject:                    Default\nIssue ID:                   7\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2012-12-31 00:00 MST\nLast Modified:              2014-09-05 23:48 MDT\n====================================================================== \nSummary:                    Release prototype PCA\nDescription: \nRelease PN 20000004 Rev 00 with child parts and sub-assemblies for building a small number of prototype units. Assembly to include functional PCA, earphone, wire for stubby antenna and preliminary user manual (NO enclosure). Manufacturing process documentation to include product part breakdown structure diagram, work instruction for packing beta test units and a work instruction for fabricating PN 20000001 (custom inductor).\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:48 administrator  New Issue                                    \n2014-09-05 23:48 administrator  Assigned To               => bjenks          \n2014-09-05 23:48 administrator  Date Submitted           1409982510 => 1356937200\n2014-09-05 23:55 administrator  Issue Deleted: 0000007                       \n======================================================================',	1409982935),
(44,	'fmason@whizzer.local',	'[Default 0000002]: Release prototype PCA',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"df9aa342ea017a68d0036f65e2245c79\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                bjenks\n====================================================================== \nProject:                    Default\nIssue ID:                   2\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2014-09-05 23:44 MDT\nLast Modified:              2014-09-05 23:44 MDT\n====================================================================== \nSummary:                    Release prototype PCA\nDescription: \nRelease PN 20000004 Rev 00 with child parts and sub-assemblies for building a small number of prototype units. Assembly to include functional PCA, earphone, wire for stubby antenna and preliminary user manual (NO enclosure). Manufacturing process documentation to include product part breakdown structure diagram, work instruction for packing beta test units and a work instruction for fabricating PN 20000001 (custom inductor).\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:44 administrator  New Issue                                    \n2014-09-05 23:44 administrator  Assigned To               => bjenks          \n2014-09-05 23:55 administrator  Issue Deleted: 0000002                       \n======================================================================',	1409982942),
(45,	'bjenks@whizzer.local',	'[Default 0000002]: Release prototype PCA',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"df9aa342ea017a68d0036f65e2245c79\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                bjenks\n====================================================================== \nProject:                    Default\nIssue ID:                   2\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2014-09-05 23:44 MDT\nLast Modified:              2014-09-05 23:44 MDT\n====================================================================== \nSummary:                    Release prototype PCA\nDescription: \nRelease PN 20000004 Rev 00 with child parts and sub-assemblies for building a small number of prototype units. Assembly to include functional PCA, earphone, wire for stubby antenna and preliminary user manual (NO enclosure). Manufacturing process documentation to include product part breakdown structure diagram, work instruction for packing beta test units and a work instruction for fabricating PN 20000001 (custom inductor).\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:44 administrator  New Issue                                    \n2014-09-05 23:44 administrator  Assigned To               => bjenks          \n2014-09-05 23:55 administrator  Issue Deleted: 0000002                       \n======================================================================',	1409982942),
(46,	'fmason@whizzer.local',	'[Default 0000003]: Make PCB corrections',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"a3b2639d5076a1276cdac1c3565ea71c\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                bjenks\n====================================================================== \nProject:                    Default\nIssue ID:                   3\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2014-09-05 23:44 MDT\nLast Modified:              2014-09-05 23:44 MDT\n====================================================================== \nSummary:                    Make PCB corrections\nDescription: \nRevise schematic to correct connectivity of PCB-type inductor; revise PCB design to correct the inductor layout and mechanical dimensions (and generate new CAM files). Create PCB master drawing. Create PCA assembly drawing and work instruction. Update work instruction for custom inductor PN 20000001 to meet revised format requirements (rev level will not change as fit/form/function remains the same).\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:44 administrator  New Issue                                    \n2014-09-05 23:44 administrator  Assigned To               => bjenks          \n2014-09-05 23:55 administrator  Issue Deleted: 0000003                       \n======================================================================',	1409982948),
(47,	'bjenks@whizzer.local',	'[Default 0000003]: Make PCB corrections',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"a3b2639d5076a1276cdac1c3565ea71c\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                bjenks\n====================================================================== \nProject:                    Default\nIssue ID:                   3\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2014-09-05 23:44 MDT\nLast Modified:              2014-09-05 23:44 MDT\n====================================================================== \nSummary:                    Make PCB corrections\nDescription: \nRevise schematic to correct connectivity of PCB-type inductor; revise PCB design to correct the inductor layout and mechanical dimensions (and generate new CAM files). Create PCB master drawing. Create PCA assembly drawing and work instruction. Update work instruction for custom inductor PN 20000001 to meet revised format requirements (rev level will not change as fit/form/function remains the same).\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:44 administrator  New Issue                                    \n2014-09-05 23:44 administrator  Assigned To               => bjenks          \n2014-09-05 23:55 administrator  Issue Deleted: 0000003                       \n======================================================================',	1409982948),
(48,	'fmason@whizzer.local',	'[Default 0000004]: Release marketing assembly',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"1a9e54c2bbefc9c742ebb03ab6ec88f0\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                jsharp\n====================================================================== \nProject:                    Default\nIssue ID:                   4\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2014-09-05 23:44 MDT\nLast Modified:              2014-09-05 23:44 MDT\n====================================================================== \nSummary:                    Release marketing assembly\nDescription: \nRe-structure product to meet product release requirements, including creation of new top-level marketing assembly part number. Product to include enclosure with hardware, user manual and earphone to be moved to marketing assembly, stubby antenna removed, user manual to be updated.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:44 administrator  New Issue                                    \n2014-09-05 23:44 administrator  Assigned To               => jsharp          \n2014-09-05 23:56 administrator  Issue Deleted: 0000004                       \n======================================================================',	1409982964),
(49,	'jsharp@whizzer.local',	'[Default 0000004]: Release marketing assembly',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"1a9e54c2bbefc9c742ebb03ab6ec88f0\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                jsharp\n====================================================================== \nProject:                    Default\nIssue ID:                   4\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2014-09-05 23:44 MDT\nLast Modified:              2014-09-05 23:44 MDT\n====================================================================== \nSummary:                    Release marketing assembly\nDescription: \nRe-structure product to meet product release requirements, including creation of new top-level marketing assembly part number. Product to include enclosure with hardware, user manual and earphone to be moved to marketing assembly, stubby antenna removed, user manual to be updated.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:44 administrator  New Issue                                    \n2014-09-05 23:44 administrator  Assigned To               => jsharp          \n2014-09-05 23:56 administrator  Issue Deleted: 0000004                       \n======================================================================',	1409982964),
(50,	'fmason@whizzer.local',	'[Default 0000005]: Reduce cost and improve quality',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"6c76968cc29aff329f7514cbdf660427\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                mdelazes\n====================================================================== \nProject:                    Default\nIssue ID:                   5\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2014-09-05 23:44 MDT\nLast Modified:              2014-09-05 23:44 MDT\n====================================================================== \nSummary:                    Reduce cost and improve quality\nDescription: \nInvert PCB in enclosure to aid assembly and test (requiring modifications to enclosure base and lid, including artwork). Update PCA assembly diagram and work instruction, update enclosure-level assembly diagram and work instruction.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:44 administrator  New Issue                                    \n2014-09-05 23:44 administrator  Assigned To               => mdelazes        \n2014-09-05 23:56 administrator  Issue Deleted: 0000005                       \n======================================================================',	1409982977),
(51,	'mdelazes@whizzer.local',	'[Default 0000005]: Reduce cost and improve quality',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"6c76968cc29aff329f7514cbdf660427\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                mdelazes\n====================================================================== \nProject:                    Default\nIssue ID:                   5\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2014-09-05 23:44 MDT\nLast Modified:              2014-09-05 23:44 MDT\n====================================================================== \nSummary:                    Reduce cost and improve quality\nDescription: \nInvert PCB in enclosure to aid assembly and test (requiring modifications to enclosure base and lid, including artwork). Update PCA assembly diagram and work instruction, update enclosure-level assembly diagram and work instruction.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:44 administrator  New Issue                                    \n2014-09-05 23:44 administrator  Assigned To               => mdelazes        \n2014-09-05 23:56 administrator  Issue Deleted: 0000005                       \n======================================================================',	1409982977),
(52,	'fmason@whizzer.local',	'[Default 0000006]: Release field service kit',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"23de42ea9c696553d39bc229840c2303\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                fmason\nAssigned To:                fmason\n====================================================================== \nProject:                    Default\nIssue ID:                   6\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     @0@\n====================================================================== \nDate Submitted:             2014-09-05 23:44 MDT\nLast Modified:              2014-09-05 23:44 MDT\n====================================================================== \nSummary:                    Release field service kit\nDescription: \nCreate kit of parts found typically useful for field service.\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:44 administrator  New Issue                                    \n2014-09-05 23:44 administrator  Assigned To               => fmason          \n2014-09-05 23:56 administrator  Issue Deleted: 0000006                       \n======================================================================',	1409982988),
(53,	'dale@whizzer.local',	'[Default 0000001]: Test Bug',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"b381b667fd09252752374f35239d2a51\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'The following issue has been DELETED. \n====================================================================== \nReported By:                admin\nAssigned To:                dale\n====================================================================== \nProject:                    Default\nIssue ID:                   1\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   normal\nStatus:                     assigned\n====================================================================== \nDate Submitted:             2014-09-05 23:24 MDT\nLast Modified:              2014-09-05 23:24 MDT\n====================================================================== \nSummary:                    Test Bug\nDescription: \nTest, test, test\n\nSteps to Reproduce: \n1, 2, 3, 4...\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:24 admin          New Issue                                    \n2014-09-05 23:24 admin          Status                   new => assigned     \n2014-09-05 23:24 admin          Assigned To               => dale            \n2014-09-05 23:56 administrator  Issue Deleted: 0000001                       \n======================================================================',	1409982993),
(54,	'bjenks@whizzer.local',	'[Default 0000018]: Make PCB corrections',	'a:4:{s:7:\"headers\";a:2:{s:8:\"keywords\";s:17:\"[Default] General\";s:11:\"In-Reply-To\";s:32:\"8857e5b56d94b587a086aa0dc6b839e4\";}s:8:\"priority\";i:3;s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}',	'Issue 0000018 is now monitored by user bjenks. \n====================================================================== \nhttp://localhost:8080/mantis/view.php?id=18 \n====================================================================== \nReported By:                fmason\nAssigned To:                bjenks\n====================================================================== \nProject:                    Default\nIssue ID:                   18\nCategory:                   General\nReproducibility:            have not tried\nSeverity:                   minor\nPriority:                   @0@\nStatus:                     assigned\n====================================================================== \nDate Submitted:             2013-01-01 00:00 MST\nLast Modified:              2014-09-06 00:02 MDT\n====================================================================== \nSummary:                    Make PCB corrections\nDescription: \nRevise schematic to correct connectivity of PCB-type inductor; revise PCB design to correct the inductor layout and mechanical dimensions (and generate new CAM files). Create PCB master drawing. Create PCA assembly drawing and work instruction. Update work instruction for custom inductor PN 20000001 to meet revised format requirements (rev level will not change as fit/form/function remains the same).\n====================================================================== \n\nIssue History \nDate Modified    Username       Field                    Change               \n====================================================================== \n2014-09-05 23:59 administrator  New Issue                                    \n2014-09-05 23:59 administrator  Status                   new => assigned     \n2014-09-05 23:59 administrator  Assigned To               => bjenks          \n2014-09-05 23:59 administrator  Date Submitted           1409983167 => 1357023600\n======================================================================',	1409983364);

DROP TABLE IF EXISTS `mantis_filters_table`;
CREATE TABLE `mantis_filters_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `is_public` tinyint(4) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `filter_string` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_filters_table` (`id`, `user_id`, `project_id`, `is_public`, `name`, `filter_string`) VALUES
(1,	1,	-1,	0,	'',	'v8#a:42:{s:8:\"_version\";s:2:\"v8\";s:10:\"_view_type\";s:6:\"simple\";s:8:\"per_page\";i:50;s:17:\"highlight_changed\";i:6;s:13:\"sticky_issues\";b:1;s:4:\"sort\";s:12:\"last_updated\";s:3:\"dir\";s:4:\"DESC\";s:8:\"platform\";a:1:{i:0;i:0;}s:2:\"os\";a:1:{i:0;i:0;}s:8:\"os_build\";a:1:{i:0;i:0;}s:10:\"project_id\";a:1:{i:0;i:-3;}s:11:\"start_month\";s:2:\"09\";s:9:\"start_day\";i:1;s:10:\"start_year\";s:4:\"2014\";s:9:\"end_month\";s:2:\"09\";s:7:\"end_day\";s:2:\"06\";s:8:\"end_year\";s:4:\"2014\";s:6:\"search\";s:0:\"\";s:16:\"and_not_assigned\";b:0;s:17:\"do_filter_by_date\";b:0;s:10:\"view_state\";i:0;s:17:\"relationship_type\";i:-1;s:16:\"relationship_bug\";i:0;s:14:\"target_version\";a:1:{i:0;s:1:\"0\";}s:10:\"tag_string\";s:0:\"\";s:10:\"tag_select\";s:0:\"\";s:10:\"match_type\";i:0;s:13:\"show_category\";a:1:{i:0;s:1:\"0\";}s:13:\"show_severity\";a:1:{i:0;i:0;}s:11:\"show_status\";a:1:{i:0;i:0;}s:11:\"reporter_id\";a:1:{i:0;i:0;}s:10:\"handler_id\";a:1:{i:0;i:0;}s:12:\"note_user_id\";a:1:{i:0;i:0;}s:15:\"show_resolution\";a:1:{i:0;i:0;}s:13:\"show_priority\";a:1:{i:0;i:0;}s:10:\"show_build\";a:1:{i:0;s:1:\"0\";}s:12:\"show_version\";a:1:{i:0;s:1:\"0\";}s:11:\"hide_status\";a:1:{i:0;i:90;}s:16:\"fixed_in_version\";a:1:{i:0;s:1:\"0\";}s:12:\"user_monitor\";a:1:{i:0;i:0;}s:12:\"show_profile\";a:1:{i:0;i:0;}s:16:\"_source_query_id\";i:1;}'),
(2,	1,	0,	0,	'',	'v8#a:43:{s:16:\"_source_query_id\";s:0:\"\";s:8:\"_version\";s:2:\"v8\";s:10:\"_view_type\";s:6:\"simple\";s:13:\"show_category\";a:1:{i:0;s:1:\"0\";}s:13:\"show_severity\";a:1:{i:0;i:0;}s:11:\"show_status\";a:1:{i:0;i:0;}s:8:\"per_page\";i:50;s:17:\"highlight_changed\";i:6;s:11:\"reporter_id\";a:1:{i:0;i:0;}s:10:\"handler_id\";a:1:{i:0;i:0;}s:10:\"project_id\";a:1:{i:0;i:-3;}s:4:\"sort\";s:12:\"last_updated\";s:3:\"dir\";s:4:\"DESC\";s:11:\"start_month\";i:9;s:9:\"start_day\";i:1;s:10:\"start_year\";i:2014;s:9:\"end_month\";i:9;s:7:\"end_day\";i:11;s:8:\"end_year\";i:2014;s:6:\"search\";s:0:\"\";s:11:\"hide_status\";a:1:{i:0;i:-2;}s:16:\"and_not_assigned\";b:0;s:15:\"show_resolution\";a:1:{i:0;i:0;}s:10:\"show_build\";a:1:{i:0;s:1:\"0\";}s:12:\"show_version\";a:1:{i:0;s:1:\"0\";}s:17:\"do_filter_by_date\";b:0;s:16:\"fixed_in_version\";a:1:{i:0;s:1:\"0\";}s:14:\"target_version\";a:1:{i:0;s:1:\"0\";}s:13:\"show_priority\";a:1:{i:0;i:0;}s:12:\"user_monitor\";a:1:{i:0;i:0;}s:10:\"view_state\";i:0;s:13:\"custom_fields\";a:0:{}s:13:\"sticky_issues\";s:3:\"off\";s:17:\"relationship_type\";i:-1;s:16:\"relationship_bug\";i:0;s:12:\"show_profile\";a:1:{i:0;i:0;}s:8:\"platform\";a:1:{i:0;i:0;}s:2:\"os\";a:1:{i:0;i:0;}s:8:\"os_build\";a:1:{i:0;i:0;}s:10:\"tag_string\";s:0:\"\";s:10:\"tag_select\";i:0;s:12:\"note_user_id\";a:1:{i:0;i:0;}s:10:\"match_type\";i:0;}'),
(3,	1,	-2,	0,	'',	'v8#a:43:{s:8:\"_version\";s:2:\"v8\";s:10:\"_view_type\";s:6:\"simple\";s:8:\"per_page\";i:50;s:17:\"highlight_changed\";i:6;s:13:\"sticky_issues\";b:1;s:4:\"sort\";s:12:\"last_updated\";s:3:\"dir\";s:4:\"DESC\";s:8:\"platform\";a:1:{i:0;i:0;}s:2:\"os\";a:1:{i:0;i:0;}s:8:\"os_build\";a:1:{i:0;i:0;}s:10:\"project_id\";a:1:{i:0;i:-3;}s:11:\"start_month\";s:2:\"09\";s:9:\"start_day\";i:1;s:10:\"start_year\";s:4:\"2014\";s:9:\"end_month\";s:2:\"09\";s:7:\"end_day\";s:2:\"06\";s:8:\"end_year\";s:4:\"2014\";s:6:\"search\";s:0:\"\";s:16:\"and_not_assigned\";b:0;s:17:\"do_filter_by_date\";b:0;s:10:\"view_state\";i:0;s:17:\"relationship_type\";i:-1;s:16:\"relationship_bug\";i:0;s:14:\"target_version\";a:1:{i:0;s:1:\"0\";}s:10:\"tag_string\";s:0:\"\";s:10:\"tag_select\";s:0:\"\";s:10:\"match_type\";i:0;s:13:\"show_category\";a:1:{i:0;s:1:\"0\";}s:13:\"show_severity\";a:1:{i:0;i:0;}s:11:\"show_status\";a:1:{i:0;i:0;}s:11:\"reporter_id\";a:1:{i:0;i:0;}s:10:\"handler_id\";a:1:{i:0;i:0;}s:12:\"note_user_id\";a:1:{i:0;i:0;}s:15:\"show_resolution\";a:1:{i:0;i:0;}s:13:\"show_priority\";a:1:{i:0;i:0;}s:10:\"show_build\";a:1:{i:0;s:1:\"0\";}s:12:\"show_version\";a:1:{i:0;s:1:\"0\";}s:11:\"hide_status\";a:1:{i:0;i:90;}s:16:\"fixed_in_version\";a:1:{i:0;s:1:\"0\";}s:12:\"user_monitor\";a:1:{i:0;i:0;}s:12:\"show_profile\";a:1:{i:0;i:0;}s:16:\"_source_query_id\";s:0:\"\";s:13:\"custom_fields\";a:0:{}}');

DROP TABLE IF EXISTS `mantis_news_table`;
CREATE TABLE `mantis_news_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `poster_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `announcement` tinyint(4) NOT NULL DEFAULT '0',
  `headline` varchar(64) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  `last_modified` int(10) unsigned NOT NULL DEFAULT '1',
  `date_posted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_plugin_table`;
CREATE TABLE `mantis_plugin_table` (
  `basename` varchar(40) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `priority` int(10) unsigned NOT NULL DEFAULT '3',
  PRIMARY KEY (`basename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_plugin_table` (`basename`, `enabled`, `protected`, `priority`) VALUES
('MantisCoreFormatting',	1,	0,	3),
('MantisGraph',	1,	0,	3),
('Csv_import',	1,	0,	3);

DROP TABLE IF EXISTS `mantis_project_file_table`;
CREATE TABLE `mantis_project_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `content` longblob NOT NULL,
  `date_added` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_project_hierarchy_table`;
CREATE TABLE `mantis_project_hierarchy_table` (
  `child_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `inherit_parent` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `idx_project_hierarchy_child_id` (`child_id`),
  KEY `idx_project_hierarchy_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_project_table`;
CREATE TABLE `mantis_project_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `access_min` smallint(6) NOT NULL DEFAULT '10',
  `file_path` varchar(250) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `inherit_global` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_name` (`name`),
  KEY `idx_project_view` (`view_state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_project_table` (`id`, `name`, `status`, `enabled`, `view_state`, `access_min`, `file_path`, `description`, `category_id`, `inherit_global`) VALUES
(1,	'Default',	10,	1,	10,	10,	'',	'Automatically created and un-categorized projects.',	1,	1),
(2,	'agm',	10,	1,	10,	10,	'',	'agm and/or gps system',	1,	1),
(3,	'caliper',	10,	1,	10,	10,	'',	'caliper technology (old-school)',	1,	1),
(4,	'failsafe',	10,	1,	10,	10,	'',	'failsafe technology',	1,	1),
(5,	'gemini',	10,	1,	10,	10,	'',	'gemini technology (syp2, gem)',	1,	1),
(6,	'jmx',	10,	1,	10,	10,	'',	'jmx and/or interbody cable',	1,	1),
(7,	'mfl',	10,	1,	10,	10,	'',	'mfl sensor head - general',	1,	1),
(8,	'mfl2t',	10,	1,	10,	10,	'',	'mfl 2-triad sensor head',	1,	1),
(9,	'mfl3t',	10,	1,	10,	10,	'',	'mfl 3-triad sensor head',	1,	1),
(10,	'mfl8/10',	10,	1,	10,	10,	'',	'mfl 8/10 sensor head',	1,	1),
(11,	'mfls7',	10,	1,	10,	10,	'',	'mfl sensor7 sensor head',	1,	1),
(12,	'ncr',	10,	1,	10,	10,	'',	'ncr investigation',	1,	1),
(13,	'nkd',	10,	1,	10,	10,	'',	'nakoda technology',	1,	1),
(14,	'profile',	10,	1,	10,	10,	'',	'profile technology',	1,	1),
(15,	'smp',	10,	1,	10,	10,	'',	'smp technology',	1,	1),
(16,	'smx',	10,	1,	10,	10,	'',	'smx multiplexor technology',	1,	1),
(17,	'spdctrl',	10,	1,	10,	10,	'',	'speed control system',	1,	1),
(18,	'support-sappn',	10,	1,	10,	10,	'',	'support project - sap pn',	1,	1),
(19,	'support',	10,	1,	10,	10,	'',	'support project',	1,	1),
(20,	'transmitter',	10,	1,	10,	10,	'',	'transmitter and/or transmitter receiver',	1,	1);

DROP TABLE IF EXISTS `mantis_project_user_list_table`;
CREATE TABLE `mantis_project_user_list_table` (
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `access_level` smallint(6) NOT NULL DEFAULT '10',
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `idx_project_user` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_project_version_table`;
CREATE TABLE `mantis_project_version_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `version` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `released` tinyint(4) NOT NULL DEFAULT '1',
  `obsolete` tinyint(4) NOT NULL DEFAULT '0',
  `date_order` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_version` (`project_id`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_sponsorship_table`;
CREATE TABLE `mantis_sponsorship_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `logo` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(128) NOT NULL DEFAULT '',
  `paid` tinyint(4) NOT NULL DEFAULT '0',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_sponsorship_bug_id` (`bug_id`),
  KEY `idx_sponsorship_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_tag_table`;
CREATE TABLE `mantis_tag_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `date_created` int(10) unsigned NOT NULL DEFAULT '1',
  `date_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`name`),
  KEY `idx_tag_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_tokens_table`;
CREATE TABLE `mantis_tokens_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `value` longtext NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '1',
  `expiry` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_typeowner` (`type`,`owner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_tokens_table` (`id`, `owner`, `type`, `value`, `timestamp`, `expiry`) VALUES
(82,	1,	4,	'1',	1410629872,	1410630301),
(83,	1,	3,	'18',	1410629974,	1410716374),
(59,	29,	5,	'a:1:{s:6:\"filter\";b:1;}',	1409936068,	1441472834);

DROP TABLE IF EXISTS `mantis_user_pref_table`;
CREATE TABLE `mantis_user_pref_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_profile` int(10) unsigned NOT NULL DEFAULT '0',
  `default_project` int(10) unsigned NOT NULL DEFAULT '0',
  `refresh_delay` int(11) NOT NULL DEFAULT '0',
  `redirect_delay` int(11) NOT NULL DEFAULT '0',
  `bugnote_order` varchar(4) NOT NULL DEFAULT 'ASC',
  `email_on_new` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_assigned` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_feedback` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_closed` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_reopened` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_bugnote` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_status` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_priority` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_priority_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_status_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_bugnote_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_reopened_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_closed_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_resolved_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_feedback_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_assigned_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_new_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_bugnote_limit` smallint(6) NOT NULL DEFAULT '0',
  `language` varchar(32) NOT NULL DEFAULT 'english',
  `timezone` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_user_pref_table` (`id`, `user_id`, `project_id`, `default_profile`, `default_project`, `refresh_delay`, `redirect_delay`, `bugnote_order`, `email_on_new`, `email_on_assigned`, `email_on_feedback`, `email_on_resolved`, `email_on_closed`, `email_on_reopened`, `email_on_bugnote`, `email_on_status`, `email_on_priority`, `email_on_priority_min_severity`, `email_on_status_min_severity`, `email_on_bugnote_min_severity`, `email_on_reopened_min_severity`, `email_on_closed_min_severity`, `email_on_resolved_min_severity`, `email_on_feedback_min_severity`, `email_on_assigned_min_severity`, `email_on_new_min_severity`, `email_bugnote_limit`, `language`, `timezone`) VALUES
(1,	29,	0,	0,	1,	30,	2,	'ASC',	1,	1,	1,	1,	1,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'english',	'America/Edmonton'),
(2,	1,	0,	0,	1,	30,	2,	'ASC',	1,	1,	1,	1,	1,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'english',	'America/Edmonton');

DROP TABLE IF EXISTS `mantis_user_print_pref_table`;
CREATE TABLE `mantis_user_print_pref_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `print_pref` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mantis_user_profile_table`;
CREATE TABLE `mantis_user_profile_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_user_profile_table` (`id`, `user_id`, `platform`, `os`, `os_build`, `description`) VALUES
(1,	0,	'N/A',	'N/A',	'N/A',	'');

DROP TABLE IF EXISTS `mantis_user_table`;
CREATE TABLE `mantis_user_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `realname` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `access_level` smallint(6) NOT NULL DEFAULT '10',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `lost_password_request_count` smallint(6) NOT NULL DEFAULT '0',
  `failed_login_count` smallint(6) NOT NULL DEFAULT '0',
  `cookie_string` varchar(64) NOT NULL DEFAULT '',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '1',
  `date_created` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_cookie_string` (`cookie_string`),
  UNIQUE KEY `idx_user_username` (`username`),
  KEY `idx_enable` (`enabled`),
  KEY `idx_access` (`access_level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mantis_user_table` (`id`, `username`, `realname`, `email`, `password`, `enabled`, `protected`, `access_level`, `login_count`, `lost_password_request_count`, `failed_login_count`, `cookie_string`, `last_visit`, `date_created`) VALUES
(1,	'administrator',	'Administrator User',	'',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	90,	44,	0,	0,	'd83be508932f3af9a5f7400d8cf5a52600427675a83192a46583df0757bbccbf',	1410630113,	1407536734),
(4,	'dale',	'Dale Scott',	'dale@whizzer.local',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	90,	16,	0,	0,	'4ec6efb267336e6721db82fb7289b4fbb6cde98bf6fdf1f530cf3c74ba24a2bb',	1408781426,	1408130895),
(3,	'anonymous',	'Anonymous',	'nomail@nomail.local',	'2e275723301c8c6788cd2bd4e6250ff7',	1,	0,	25,	5,	0,	0,	'b1a95da78bf8126070bf3a136504e60df9fa5adcf20e78305e5737daaa3ae270',	1408130004,	1408130004),
(9,	'barmstrong',	'Bub Armstrong',	'barmstrong@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'cb90fce7eef4418d3c9c8d333b52f8820015451ae79a893862d15bbfef6d30d5',	1408202886,	1408202886),
(6,	'bjenks',	'Barcoe Jenks',	'bjenks@whizzer.local',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	25,	3,	0,	0,	'cf3f864191ff19b28b848e9d769a2d7314e3d80b447dc2fb3c171a1229b2499b',	1408202781,	1408136885),
(8,	'bswift',	'Barton Swift',	'bswift@whizzer.local',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	25,	2,	0,	0,	'0aa4df7418b3d07d4ccea5061d3043cc531119a32b7f582b891c5e745aa2e994',	1409010037,	1408163236),
(10,	'fmason',	'Frank Mason',	'fmason@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'9f9116d777c7125e6f17fcd383b5a95c66175e81078114656625985061ffaa88',	1408202973,	1408202973),
(11,	'gjackson',	'Garret Jackson',	'gjackson@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'959981212f3a1528d4d7a1b3b761a85b092ad8b268578f2828e4190ddfd3b2a4',	1408203003,	1408203003),
(12,	'hbaldwin',	'Hank Baldwin',	'hbaldwin@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'd6e5c06ea8a786d2c70998828680adf9c79435511994ebf55b3943aa76f6728b',	1408203031,	1408203031),
(13,	'hrandall',	'Helen Randall',	'hrandall@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'bc40d141512f44bad32609b942cadf4bb2b1160d5647bb3f0d4f170d98d10e0f',	1408203058,	1408203058),
(14,	'jwood',	'Jacob Wood',	'jwood@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'fddb72c6606895d37599a9c6d9c4952f8e0a3184c18f3d9a894698de751c745f',	1408203085,	1408203085),
(15,	'jperiod',	'James Period',	'jperiod@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'3b8f4f8c7a86ddb18a88759172438559ab40970707eaf014e52826b82a6d1c21',	1408203110,	1408203110),
(16,	'jhaddon',	'Jennie Haddon',	'jhaddon@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'1ee7dd42b6df19f527b60a27ba61740412dda1b80498df70523721384c0ddf38',	1408203136,	1408203136),
(17,	'jmorse',	'Jennie Morse',	'jmorse@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'4f795ac06ad9478cdee52be062e60f78e4e938ead07456f49e0b86cda31c99f9',	1408203173,	1408203173),
(18,	'jsharp',	'John Sharp',	'jsharp@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'8c3a0d3badad2d6975d3c1557e761694d5e8179ffc9e3fccb3ae6b0838f34096',	1408203198,	1408203198),
(19,	'mnestor',	'Mary Nestor',	'mnestor@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'ed20d660b5134440aec5f9c0b8addac5d06108a2c8a61ac501cc962db8a22119',	1408203229,	1408203229),
(20,	'mblair',	'Minnie Blair',	'mblair@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'978192ad21ebb9e86ce4383c697aff778e1d2fe816ef86fbf7cdd8e35353d3ac',	1408203272,	1408203272),
(21,	'mdelazes',	'Miquel DeLazes',	'mdelazes@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'85b85ebb78312be85148ac4e5e2179be7fd5a5b8c7ce226841c2694181ed91cb',	1408203303,	1408203303),
(22,	'nnewton',	'Ned Newton',	'nnewton@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'162b60ae81dc61dd1d52d90025ae454b2f5678f2cde1e64a80fb9fbfbef8bff1',	1408203334,	1408203334),
(23,	'rsampson',	'Rad Sampson',	'rsampson@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'8d94cc0ad5b541a223a7651264d441cd7a4d5494b727a87e7448b9e5082f1b93',	1408203367,	1408203367),
(24,	'smalloy',	'Sarah Malloy',	'smalloy@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'5c636649a3b7f54ce23859ba5b0925c77ee7c3f6f2a0b46ce70d17bde4d52f01',	1408203397,	1408203397),
(25,	'tswift',	'Tom Swift',	'tswift@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'284126c9a39f977727b62c6202c834e9af5df3597bbe27fc05b8ca635d4aa024',	1408203424,	1408203424),
(26,	'wdamon',	'Wakefield Damon',	'wdamon@whizzer.local',	'appleton',	1,	0,	25,	0,	0,	0,	'ce65404e4119a90a43391940ed77f7519c6c764166e6cdbb5987b5278653283a',	1408203465,	1408203465),
(27,	'wcrawford',	'William Crawford',	'wcrawford@whizzer.local',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	25,	1,	0,	0,	'0d4aecfb15765e8e2cdf56a8de986dae9206f48efc7b178a3b82e9a9059d2d29',	1408203541,	1408203504),
(32,	'spurdou',	'',	'd7a3198845c5c0a9806805d799c784e6@localhost',	'14104962674053',	0,	0,	25,	0,	0,	0,	'ce855299348bad5ed38473a38d9ea2738126ce8c31f6ad388e227586a639d875',	1410496267,	1410496267),
(29,	'admin',	'Administrator User',	'',	'5c1f1ee8133c8c02e8e005461ac924fa',	1,	0,	90,	24,	0,	2,	'a3f2191cf54627b883d5a03284f6c7134a42768773a16ee85babc545d319e0cf',	1409982113,	1408741044),
(31,	'kalkama',	'',	'a8ad6f0fec85c0abea03390ee6e9a2d5@localhost',	'14104962672022',	0,	0,	25,	0,	0,	0,	'b96b1215b6b07f7efc6c4f20ab719cf88126ce8c31f6ad388e227586a639d875',	1410496267,	1410496267),
(33,	'scotdalr',	'',	'757af2ea77f7b6d926e947ae8c870faa@localhost',	'14104962678969',	0,	0,	25,	0,	0,	0,	'0b2c7cb274898005b4215b442c823af08126ce8c31f6ad388e227586a639d875',	1410496267,	1410496267);

-- 2014-09-13 17:46:56
