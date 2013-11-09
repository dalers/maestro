-- drop and re-create maestro tables (except migration)
--
-- > mysql -uroot -p --local-infile=1 --show-warnings --verbose < /path/to/drop_and_create_tables.sql
--
-- THIS FILE MUST MATCH MIGRATION!! (i.e. this file MUST be updated if the migration is edited)
--
-- To create with phpMyAdmin: Export > Custom:
--		All tables EXCEPT migration
--		Save output to file
--		Format: SQL
--		Disable foreign key checks
--		Dump table: structure
--		Add statements: Add DROP TABLE, CREATE TABLE options: IF NOT EXISTS, AUTO_INCREMENT
--

use maestro;

-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2013 at 10:47 PM
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
-- Table structure for table `tbl_issue`
--

DROP TABLE IF EXISTS `tbl_issue`;
CREATE TABLE IF NOT EXISTS `tbl_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `project` varchar(255) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `corrective_action` varchar(255) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `stock_serial_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `requester_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_issue_to_project` (`project_id`),
  KEY `fk_issue_to_part` (`part_id`),
  KEY `fk_issue_to_stock_serial` (`stock_serial_id`),
  KEY `fk_issue_to_owner` (`owner_id`),
  KEY `fk_issue_to_requester` (`requester_id`),
  KEY `fk_issue_to_create_user` (`create_user_id`),
  KEY `fk_issue_to_update_user` (`update_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_migration`
--

-- DROP TABLE IF EXISTS `tbl_migration`;
-- CREATE TABLE IF NOT EXISTS `tbl_migration` (
--   `version` varchar(255) NOT NULL,
--   `apply_time` int(11) DEFAULT NULL,
--   PRIMARY KEY (`version`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_person`
--

DROP TABLE IF EXISTS `tbl_person`;
CREATE TABLE IF NOT EXISTS `tbl_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `initial` varchar(255) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project`
--

DROP TABLE IF EXISTS `tbl_project`;
CREATE TABLE IF NOT EXISTS `tbl_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acct1` varchar(255) DEFAULT NULL,
  `acct2` varchar(255) DEFAULT NULL,
  `acct3` varchar(255) DEFAULT NULL,
  `acct4` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `description` text,
  `type` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `milestone` varchar(255) DEFAULT NULL,
  `milestone_date` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_al`
--

DROP TABLE IF EXISTS `tbl_pv_al`;
CREATE TABLE IF NOT EXISTS `tbl_pv_al` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ALPNID` int(11) DEFAULT '0',
  `ALJOBID` int(11) DEFAULT '0',
  `ALTASKID` int(11) DEFAULT '0',
  `ALJOBNumber` varchar(50) DEFAULT NULL,
  `ALJOBNumberLine` varchar(50) DEFAULT NULL,
  `ALQty` float DEFAULT '0',
  `ALQtyShort` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_cnv`
--

DROP TABLE IF EXISTS `tbl_pv_cnv`;
CREATE TABLE IF NOT EXISTS `tbl_pv_cnv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CNVLNKID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_cost`
--

DROP TABLE IF EXISTS `tbl_pv_cost`;
CREATE TABLE IF NOT EXISTS `tbl_pv_cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `COSTLNKID` int(11) NOT NULL,
  `COSTAtQty` float DEFAULT '1',
  `COSTLeadtime` int(11) DEFAULT '0',
  `COSTCost` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_cu`
--

DROP TABLE IF EXISTS `tbl_pv_cu`;
CREATE TABLE IF NOT EXISTS `tbl_pv_cu` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_cur`
--

DROP TABLE IF EXISTS `tbl_pv_cur`;
CREATE TABLE IF NOT EXISTS `tbl_pv_cur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CURCurrencyName` varchar(50) DEFAULT NULL,
  `CURExchangeRate` double DEFAULT '0',
  `CURCurrencyChar` varchar(4) DEFAULT NULL,
  `CURFormat` varchar(35) DEFAULT NULL,
  `CURFormatExt` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_fil`
--

DROP TABLE IF EXISTS `tbl_pv_fil`;
CREATE TABLE IF NOT EXISTS `tbl_pv_fil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FILPNID` int(11) DEFAULT '0',
  `FILPNPartNumber` varchar(50) DEFAULT NULL,
  `FILFilePath` varchar(255) DEFAULT NULL,
  `FILFileName` varchar(255) DEFAULT NULL,
  `FILView` tinyint(1) DEFAULT '0',
  `FILNotes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pv_fil_pn` (`FILPNID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_hist`
--

DROP TABLE IF EXISTS `tbl_pv_hist`;
CREATE TABLE IF NOT EXISTS `tbl_pv_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `HISTWho` varchar(20) DEFAULT NULL,
  `HISTWhat` varchar(255) DEFAULT NULL,
  `HISTWhen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `HISTWhy` varchar(255) DEFAULT NULL,
  `HISTHowMany` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_hpref`
--

DROP TABLE IF EXISTS `tbl_pv_hpref`;
CREATE TABLE IF NOT EXISTS `tbl_pv_hpref` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_job`
--

DROP TABLE IF EXISTS `tbl_pv_job`;
CREATE TABLE IF NOT EXISTS `tbl_pv_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `JOBNumber` varchar(50) DEFAULT NULL,
  `JOBCUID` int(11) DEFAULT '0',
  `JOBCustomer` varchar(255) DEFAULT NULL,
  `JOBDateCreated` datetime DEFAULT NULL,
  `JOBDatePromised` datetime DEFAULT NULL,
  `JOBDateCompleted` datetime DEFAULT NULL,
  `JOBAccount` varchar(50) DEFAULT NULL,
  `JOBNotes` longtext,
  `JOBAllocateStock` tinyint(1) DEFAULT '0',
  `JOBFOB` varchar(50) DEFAULT NULL,
  `JOBTerms` varchar(50) DEFAULT NULL,
  `JOBShipMethod` varchar(50) DEFAULT NULL,
  `JOBAttnTo` varchar(50) DEFAULT NULL,
  `JOBTaxRate` float DEFAULT '0',
  `JOBTaxRate2` float DEFAULT '0',
  `JOBTax2OnTax1` tinyint(1) DEFAULT '0',
  `JOBTotalCost` double DEFAULT '0',
  `JOBSubTotalCost` double DEFAULT '0',
  `JOBTotalPrice` double DEFAULT '0',
  `JOBSubTotalPrice` double DEFAULT '0',
  `JOBTax1` double DEFAULT '0',
  `JOBTax2` double DEFAULT '0',
  `JOBCustOrderNumber` varchar(50) DEFAULT NULL,
  `JOBDateInvoiced` datetime DEFAULT NULL,
  `JOBDateShipped` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_lin`
--

DROP TABLE IF EXISTS `tbl_pv_lin`;
CREATE TABLE IF NOT EXISTS `tbl_pv_lin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LINSUID` int(11) NOT NULL DEFAULT '0',
  `LINMFRID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_lnk`
--

DROP TABLE IF EXISTS `tbl_pv_lnk`;
CREATE TABLE IF NOT EXISTS `tbl_pv_lnk` (
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_mf`
--

DROP TABLE IF EXISTS `tbl_pv_mf`;
CREATE TABLE IF NOT EXISTS `tbl_pv_mf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MFPNIDParent` int(11) DEFAULT '0',
  `MFPNIDSub` int(11) DEFAULT '0',
  `MFQty` float DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_mfr`
--

DROP TABLE IF EXISTS `tbl_pv_mfr`;
CREATE TABLE IF NOT EXISTS `tbl_pv_mfr` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_mfrpn`
--

DROP TABLE IF EXISTS `tbl_pv_mfrpn`;
CREATE TABLE IF NOT EXISTS `tbl_pv_mfrpn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MFRPNMFRID` int(11) DEFAULT '0',
  `MFRPNPart` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_org`
--

DROP TABLE IF EXISTS `tbl_pv_org`;
CREATE TABLE IF NOT EXISTS `tbl_pv_org` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_pl`
--

DROP TABLE IF EXISTS `tbl_pv_pl`;
CREATE TABLE IF NOT EXISTS `tbl_pv_pl` (
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
  KEY `fk_pv_pl_pn_1` (`PLListID`),
  KEY `fk_pv_pl_pn_2` (`PLPartID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_pll`
--

DROP TABLE IF EXISTS `tbl_pv_pll`;
CREATE TABLE IF NOT EXISTS `tbl_pv_pll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PLLParentListID` int(11) DEFAULT '0',
  `PLLSubListID` int(11) DEFAULT '0',
  `PLLQty` float DEFAULT '0',
  `PLLLevel` int(11) DEFAULT '0',
  `PLLCost` float DEFAULT '0',
  `PLLItemNumber` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_pn`
--

DROP TABLE IF EXISTS `tbl_pv_pn`;
CREATE TABLE IF NOT EXISTS `tbl_pv_pn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PNIDToLNK` int(11) DEFAULT NULL,
  `PNUNID` int(11) DEFAULT '1',
  `PNTabParentID` int(11) DEFAULT NULL,
  `PNPrefix` varchar(50) DEFAULT NULL,
  `PNPartNumber` varchar(50) NOT NULL,
  `PNSuffix` varchar(50) DEFAULT NULL,
  `PNType` varchar(5) DEFAULT NULL,
  `PNRevision` varchar(10) DEFAULT NULL,
  `PNTitle` varchar(255) DEFAULT NULL,
  `PNDetail` varchar(255) DEFAULT NULL,
  `PNStatus` varchar(1) DEFAULT NULL,
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
  `person_id` int(11) DEFAULT NULL,
  `stock_location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pv_pn_person` (`person_id`),
  KEY `fk_pv_pn_location` (`stock_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_po`
--

DROP TABLE IF EXISTS `tbl_pv_po`;
CREATE TABLE IF NOT EXISTS `tbl_pv_po` (
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_pod`
--

DROP TABLE IF EXISTS `tbl_pv_pod`;
CREATE TABLE IF NOT EXISTS `tbl_pv_pod` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_pom`
--

DROP TABLE IF EXISTS `tbl_pv_pom`;
CREATE TABLE IF NOT EXISTS `tbl_pv_pom` (
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_rpx`
--

DROP TABLE IF EXISTS `tbl_pv_rpx`;
CREATE TABLE IF NOT EXISTS `tbl_pv_rpx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RPXGrid` varchar(50) NOT NULL,
  `RPXName` varchar(50) DEFAULT NULL,
  `RPXLayout` longtext,
  `RPXLabel` tinyint(1) DEFAULT '0',
  `RPXPrimary` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_ship`
--

DROP TABLE IF EXISTS `tbl_pv_ship`;
CREATE TABLE IF NOT EXISTS `tbl_pv_ship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SHIPMethod` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_su`
--

DROP TABLE IF EXISTS `tbl_pv_su`;
CREATE TABLE IF NOT EXISTS `tbl_pv_su` (
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
  `SUCURID` int(11) DEFAULT '1',
  `SUCurReverse` tinyint(1) DEFAULT '0',
  `SUNoPhonePrefix` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SUSupplier` (`SUSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_task`
--

DROP TABLE IF EXISTS `tbl_pv_task`;
CREATE TABLE IF NOT EXISTS `tbl_pv_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TASKJOBID` int(11) DEFAULT '0',
  `TASKPNID` int(11) DEFAULT '0',
  `TASKIHPartNumber` varchar(255) DEFAULT NULL,
  `TASKPartNumber` varchar(255) DEFAULT NULL,
  `TASKRevision` varchar(10) DEFAULT NULL,
  `TASKDescription` longtext,
  `TASKItem` int(11) DEFAULT '0',
  `TASKQty` float DEFAULT '0',
  `TASKCost` double DEFAULT '0',
  `TASKCostExt` double DEFAULT '0',
  `TASKPrice` double DEFAULT '0',
  `TASKPriceExt` double DEFAULT '0',
  `TASKNotes` longtext,
  `TASKShowOnQuote` tinyint(1) DEFAULT '-1',
  `TASKShowOnInvoice` tinyint(1) DEFAULT '-1',
  `TASKShowOnPackingList` tinyint(1) DEFAULT '-1',
  `TASKTaxable` tinyint(1) DEFAULT '0',
  `TASKPriceExtPlusTax` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_type`
--

DROP TABLE IF EXISTS `tbl_pv_type`;
CREATE TABLE IF NOT EXISTS `tbl_pv_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TYPEType` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pv_un`
--

DROP TABLE IF EXISTS `tbl_pv_un`;
CREATE TABLE IF NOT EXISTS `tbl_pv_un` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UNUseUnits` varchar(20) NOT NULL,
  `UNPurchUnits` varchar(20) NOT NULL,
  `UNConvUnits` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock_location`
--

DROP TABLE IF EXISTS `tbl_stock_location`;
CREATE TABLE IF NOT EXISTS `tbl_stock_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` int(11) DEFAULT NULL,
  `use_sublocation` int(11) DEFAULT NULL,
  `sublocation_min` int(11) DEFAULT NULL,
  `sublocation_max` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock_serial`
--

DROP TABLE IF EXISTS `tbl_stock_serial`;
CREATE TABLE IF NOT EXISTS `tbl_stock_serial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(255) DEFAULT NULL,
  `part_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_serial_to_pv_pn` (`part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_issue`
--
ALTER TABLE `tbl_issue`
  ADD CONSTRAINT `fk_issue_to_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_issue_to_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_issue_to_owner` FOREIGN KEY (`owner_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_issue_to_part` FOREIGN KEY (`part_id`) REFERENCES `tbl_pv_pn` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_issue_to_project` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_issue_to_requester` FOREIGN KEY (`requester_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_issue_to_stock_serial` FOREIGN KEY (`stock_serial_id`) REFERENCES `tbl_stock_serial` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_pv_fil`
--
ALTER TABLE `tbl_pv_fil`
  ADD CONSTRAINT `fk_pv_fil_pn` FOREIGN KEY (`FILPNID`) REFERENCES `tbl_pv_pn` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_pv_pl`
--
ALTER TABLE `tbl_pv_pl`
  ADD CONSTRAINT `fk_pv_pl_pn_2` FOREIGN KEY (`PLPartID`) REFERENCES `tbl_pv_pn` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pv_pl_pn_1` FOREIGN KEY (`PLListID`) REFERENCES `tbl_pv_pn` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_pv_pn`
--
ALTER TABLE `tbl_pv_pn`
  ADD CONSTRAINT `fk_pv_pn_location` FOREIGN KEY (`stock_location_id`) REFERENCES `tbl_stock_location` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pv_pn_person` FOREIGN KEY (`person_id`) REFERENCES `tbl_person` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_stock_serial`
--
ALTER TABLE `tbl_stock_serial`
  ADD CONSTRAINT `fk_stock_serial_to_pv_pn` FOREIGN KEY (`part_id`) REFERENCES `tbl_pv_pn` (`id`) ON DELETE CASCADE;
SET FOREIGN_KEY_CHECKS=1;

