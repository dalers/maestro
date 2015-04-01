-- load current database
-- corresponds to maestro-scc-files-1.2.0.tar.gz
--
-- > mysql -uroot -p --local-infile=1 --show-warnings --verbose < ./demo.sql
--

use maestro;

-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2014 at 12:32 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `maestro`
--

--
-- Dumping data for table `tbl_issue`
--

INSERT INTO `tbl_issue` (`id`, `number`, `name`, `description`, `project`, `type`, `corrective_action`, `cost`, `status`, `project_id`, `type_id`, `status_id`, `part_id`, `stock_serial_id`, `owner_id`, `requester_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'IR00001', 'Incorrect PCB layout', 'Connectivity of PCB-type inductor in layout is incorrect.', 'P09-001', 'PCB', 'YES', '0', 'CLOSED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-01-02 00:00:00', NULL, NULL, NULL),
(2, 'IR00002', 'Difficult assembly procedure', 'Difficult to assemble and test PCA due to copper-side-up orientation. Orienting PCA component-side up allows for full access to components for debugging after assembly.', 'P09-001', 'ASSY', 'YES', '0', 'CLOSED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-01-03 00:00:00', NULL, NULL, NULL);

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `name`, `type`, `status`, `project_id`, `parts_list_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'Order 1', 'Spares', 'Active', 1, 33, '2014-02-18 16:28:07', 2, '2014-02-18 16:28:07', 2);

--
-- Dumping data for table `tbl_order_item`
--

INSERT INTO `tbl_order_item` (`id`, `order_id`, `part_id`, `desired_qty`, `shipped_qty`) VALUES
(1, 1, 20, 1, 0),
(2, 1, 5, 1, 0),
(3, 1, 2, 1, 0),
(4, 1, 6, 1, 0);

--
-- Dumping data for table `tbl_order_item_sn`
--

INSERT INTO `tbl_order_item_sn` (`id`, `order_item_id`, `stock_serial_id`) VALUES
(1, 3, 7),
(2, 3, 8);

--
-- Dumping data for table `tbl_person`
--

INSERT INTO `tbl_person` (`id`, `username`, `status`, `password`, `email`, `nick`, `lname`, `fname`, `initial`, `profile`, `last_login_time`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'admin', 1, 'admin', 'admin@firefly.scc.loc', 'admin', 'Administrator', 'System', 'SA', 0, NULL, NULL, NULL, NULL, NULL),
(2, 'demo', 1, 'demo', 'demo@firefly.scc.loc', 'demo', 'User', 'Demo', 'DU', 9, NULL, NULL, NULL, NULL, NULL),
(3, 'bjenks', 1, 'appleton', 'bjenks@firefly.scc.loc', 'BJ', 'Jenks', 'Barcoe', 'BJ', 2, NULL, NULL, NULL, NULL, NULL),
(4, 'bswift', 1, 'appleton', 'bswift@firefly.scc.loc', 'BS', 'Swift', 'Barton', 'BS', 1, NULL, NULL, NULL, NULL, NULL),
(5, 'barmstrong', 1, 'appleton', 'barmstrong@firefly.scc.loc', 'BA', 'Armstrong', 'Bub', 'BA', 2, NULL, NULL, NULL, NULL, NULL),
(6, 'fmason', 1, 'appleton', 'fmason@firefly.scc.loc', 'FM', 'Mason', 'Frank', 'FM', 2, NULL, NULL, NULL, NULL, NULL),
(7, 'gjackson', 1, 'appleton', 'gjackson@firefly.scc.loc', 'GJ', 'Jackson', 'Garret', 'GJ', 3, NULL, NULL, NULL, NULL, NULL),
(8, 'hbaldwin', 1, 'appleton', 'hbaldwin@firefly.scc.loc', 'HB', 'Baldwin', 'Hank', 'HB', 1, NULL, NULL, NULL, NULL, NULL),
(9, 'hrandall', 1, 'appleton', 'hrandall@firefly.scc.loc', 'HR', 'Randall', 'Helen', 'HR', 4, NULL, NULL, NULL, NULL, NULL),
(10, 'jwood', 1, 'appleton', 'jwood@firefly.scc.loc', 'JW', 'Wood', 'Jacab', 'JW', 5, NULL, NULL, NULL, NULL, NULL),
(11, 'jperiod', 1, 'appleton', 'jperiod@firefly.scc.loc', 'JP', 'Period', 'James', 'JP', 1, NULL, NULL, NULL, NULL, NULL),
(12, 'jhaddon', 1, 'appleton', 'jhaddon@firefly.scc.loc', 'JH', 'Haddon', 'Jennie', 'JH', 6, NULL, NULL, NULL, NULL, NULL),
(13, 'jmorse', 1, 'appleton', 'jmorse@firefly.scc.loc', 'JM', 'Morse', 'Jennie', 'JM', 4, NULL, NULL, NULL, NULL, NULL),
(14, 'jsharp', 1, 'appleton', 'jsharp@firefly.scc.loc', 'JS', 'Sharp', 'John', 'JS', 1, NULL, NULL, NULL, NULL, NULL),
(15, 'mbaggert', 1, 'appleton', 'mbaggert@firefly.scc.loc', 'MB', 'Baggert', 'Martha', 'MB', 1, NULL, NULL, NULL, NULL, NULL),
(16, 'mnestor', 1, 'appleton', 'mnestor@firefly.scc.loc', 'MN', 'Nestor', 'Mary', 'MN', 0, NULL, NULL, NULL, NULL, NULL),
(17, 'mblair', 1, 'appleton', 'mblair@firefly.scc.loc', 'MB', 'Blair', 'Minnie', 'MB', 2, NULL, NULL, NULL, NULL, NULL),
(18, 'mdelazes', 1, 'appleton', 'mdelazes@firefly.scc.loc', 'MD', 'DeLazes', 'Miquel', 'MD', 7, NULL, NULL, NULL, NULL, NULL),
(19, 'nnewton', 1, 'appleton', 'nnewton@firefly.scc.loc', 'NN', 'Newton', 'Ned', 'NN', 1, NULL, NULL, NULL, NULL, NULL),
(20, 'rsampson', 1, 'appleton', 'rsampson@firefly.scc.loc', 'RS', 'Sampson', 'Rad', 'RS', 1, NULL, NULL, NULL, NULL, NULL),
(21, 'smalloy', 1, 'appleton', 'smalloy@firefly.scc.loc', 'SM', 'Malloy', 'Sarah', 'SM', 6, NULL, NULL, NULL, NULL, NULL),
(22, 'tswift', 1, 'appleton', 'tswift@firefly.scc.loc', 'TS', 'Swift', 'Tom', 'TS', 1, NULL, NULL, NULL, NULL, NULL),
(23, 'wdamon', 1, 'appleton', 'wdamon@firefly.scc.loc', 'WD', 'Damon', 'Wakefield', 'WD', 1, NULL, NULL, NULL, NULL, NULL),
(24, 'wcrawford', 1, 'appleton', 'wcrawford@firefly.scc.loc', 'WC', 'Crawford', 'William', 'WC', 1, NULL, NULL, NULL, NULL, NULL);

--
-- Dumping data for table `tbl_project`
--

INSERT INTO `tbl_project` (`id`, `name`, `client`, `description`, `type`, `status`, `milestone`, `milestone_date`, `acct1`, `acct2`, `acct3`, `acct4`, `user1`, `user2`, `user3`, `user4`, `user5`, `user6`, `user7`, `user8`, `user9`, `user10`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'P09-001', 'Aircraft Wireless', 'Development and air trials', 'R&D', 'ACTIVE', 'PILOT', '2013-02-14 00:00:00', '12345678', '12345679', '12345680', '12345681', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'P09-002', 'Fire-fighting Bombsight', 'Development and air trials', 'R&D', 'HOLD', 'DEFINITION', '2013-03-16 00:00:00', '23456789', '23456790', '23456791', '23456792', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Dumping data for table `tbl_pv_cost`
--

INSERT INTO `tbl_pv_cost` (`id`, `COSTLNKID`, `COSTAtQty`, `COSTLeadtime`, `COSTCost`) VALUES
(1, 1, 1, 0, 23.42),
(2, 2, 1, 0, 3.3432),
(3, 3, 10, 0, 5),
(4, 4, 5000, 0, 0.075),
(5, 5, 5000, 0, 0.06188),
(6, 6, 5000, 0, 0.05148),
(7, 7, 1000, 0, 0.11375),
(8, 8, 1000, 0, 0.059),
(9, 9, 1000, 0, 0.567),
(10, 10, 1, 0, 11.74),
(11, 11, 500, 0, 0.2324),
(12, 12, 1, 0, 354.1),
(13, 13, 1, 0, 154.83),
(14, 14, 1, 0, 6),
(15, 15, 1, 0, 5.62),
(16, 16, 100, 0, 50),
(17, 17, 1, 0, 5),
(18, 18, 1, 0, 14.9),
(19, 19, 1, 0, 6.21),
(20, 20, 1, 0, 35.5),
(21, 21, 1, 0, 35.5),
(22, 22, 1, 0, 0.97),
(23, 23, 10, 0, 1.016),
(24, 24, 100, 0, 4.13),
(25, 25, 100, 0, 0.0125),
(26, 26, 1, 0, 2.59),
(27, 27, 1, 0, 2.4),
(28, 28, 10, 0, 0.419);

--
-- Dumping data for table `tbl_pv_cu`
--

INSERT INTO `tbl_pv_cu` (`id`, `CUCustomer`, `CUAddress`, `CUShipAddress`, `CUPhone1`, `CUPhone2`, `CUContact1`, `CUContact2`, `CUFax`, `CUEmail1`, `CUEmail2`, `CUNotes`, `CUWeb`, `CUCode`, `CUAccount`, `CUTerms`, `CUFedTaxID`, `CUStateTaxID`, `CUNoPhonePrefix`) VALUES
(1, 'B&E Submarines', 'Penn''s Landing, 211 South Columbus Blvd. & Walnut St., Philadelphia, PA 19106, USA', 'Penn''s Landing, 211 South Columbus Blvd. & Walnut St., Philadelphia, PA 19106, USA', '1-215-413-8655', '', 'Edward Bentley, Principal', '', '1-315-345-6789', 'bentley@besub.com', '', 'Diving equipment', 'http://en.wikipedia.org/wiki/Submarine', 'BANDE', 'C0001', 'CA', '20-1234568', '12-124', 0),
(2, 'Hosmer Engineering', '1700 West Montgomery Avenue, Philadelphia, PA 19121, USA', '1700 West Montgomery Avenue, Philadelphia, PA 19121, USA', '1-215-763-6529', '', 'Fenwick Hosmer, Principal', '', '1-315-456-7890', 'hosmer@hosmer.com', '', 'Aviation engineering services', 'http://en.wikipedia.org/wiki/Aviation', 'HOSMER', 'C0002', '90', '20-1234569', '12-125', 0),
(3, 'Universal Flying Machine Company', 'One Charles Lindbergh Blvd., Garden City, NY 11530, USA', 'One Charles Lindbergh Blvd., Garden City, NY 11530, USA', '1-516-572-4111', '', 'Peton Gale, President', '', '1-315-567-8901', 'pgale@ufmc.com', '', 'Aviation electronics', 'http://en.wikipedia.org/wiki/Avionics', 'UFMC', 'C0003', '30', '20-1234570', '12-126', 0),
(4, 'Titus Bro. Construction Co.', '26-15 Ulmer Street College Point, NY 11354, USA', '26-15 Ulmer Street College Point, NY 11354, USA', '1-718-554-2320', '', 'Job Titus, Principal', '', '1-315-678-9012', 'job@titusbros.com', '', 'Earth tunneling equipment', 'http://en.wikipedia.org/wiki/Tunnel', 'TITUS', 'C0004', 'NG', '20-1234571', '12-127', 0);

--
-- Dumping data for table `tbl_pv_cur`
--

INSERT INTO `tbl_pv_cur` (`id`, `CURCurrencyName`, `CURExchangeRate`, `CURCurrencyChar`, `CURFormat`, `CURFormatExt`) VALUES
(1, '$ USD', 1, '$', '$#,##0.000;($#,##0.000)', '$#,##0.00;($#,##0.00)');

--
-- Dumping data for table `tbl_pv_fil`
--

INSERT INTO `tbl_pv_fil` (`id`, `FILPNID`, `FILPNPartNumber`, `FILFilePath`, `FILFileName`, `FILView`, `FILNotes`) VALUES
(1, 3, '', '', 'D:\\vault\\parts\\20000001\\20000001_WI-00_graphics.odg', 0, 'graphics used in WI-00'),
(4, 15, '', '', 'D:\\vault\\parts\\20000002\\20000002_QUO-00-APC-2004-12-23.pdf', 0, 'Quote'),
(9, 1, '', '', 'D:\\vault\\parts\\10000001\\10000001_WI-02.pdf', 0, 'Work Instruction - PDF'),
(10, 1, '', '', 'D:\\vault\\parts\\10000001\\10000001_PBS-02.odg', 0, 'Product Breakdown Structure - Source'),
(11, 1, '', '', 'D:\\vault\\parts\\10000001\\10000001_PBS-02.pdf', 0, 'Product Breakdown Structure - PDF'),
(12, 1, '', '', 'D:\\vault\\parts\\10000001\\10000001_WI-02.odt', 0, 'Work Instruction - Source'),
(13, 16, '', '', 'D:\\vault\\parts\\90000001\\Belden-8085.pdf', 0, 'Datasheet'),
(14, 17, '', '', 'D:\\vault\\parts\\90000002\\CWS-ByteMark-ferrite-datasheet.pdf', 0, 'Datasheet'),
(15, 17, '', '', 'D:\\vault\\parts\\90000002\\CWS-ByteMark-2009-12-04.pdf', 0, 'Quote'),
(16, 17, '', '', 'D:\\vault\\parts\\90000002\\CWS-ByteMark-ferrite-appnote.pdf', 0, 'App note'),
(17, 18, '', '', 'D:\\vault\\parts\\90000003\\Scotch-Vinyl-Electrical-Tape.pdf', 0, 'Datasheet'),
(18, 18, '', '', 'D:\\vault\\parts\\90000003\\MSDS-Scotch-Vinyl-Electrical-Tape-2007-01-05.pdf', 0, 'MSDS'),
(19, 14, '', '', 'D:\\vault\\parts\\90000004\\DS-CUI-MJ-3536NG.pdf', 0, 'Datasheet'),
(20, 13, '', '', 'D:\\vault\\parts\\90000005\\Sprague-Goodman-GM-Series.pdf', 0, 'Datasheet'),
(21, 12, '', '', 'D:\\vault\\parts\\90000006\\Magnatec-OA95.pdf', 0, 'Datasheet'),
(22, 11, '', '', 'D:\\vault\\parts\\90000007\\Panasonic-RadLead-KS.pdf', 0, 'Datasheet'),
(23, 10, '', '', 'D:\\vault\\parts\\90000008\\AVX-Radial-SkyCap.pdf', 0, 'Datasheet'),
(24, 9, '', '', 'D:\\vault\\parts\\90000009\\Kemet-Ceramic.pdf', 0, 'Datasheet'),
(25, 8, '', '', 'D:\\vault\\parts\\90000010\\Vishay-5063JD-Spacemiser.pdf', 0, 'Datasheet'),
(26, 7, '', '', 'D:\\vault\\parts\\90000011\\Vishay-5063JD-Spacemiser.pdf', 0, 'Datasheet'),
(27, 5, '', '', 'D:\\vault\\parts\\90000012\\Maplin-crystal-earph-LB25C.pdf', 0, 'Datasheet'),
(28, 6, '', '', 'D:\\vault\\parts\\50000001\\50000001_DSN-01.pdf', 0, 'Design Output - PDF'),
(29, 6, '', '', 'D:\\vault\\parts\\50000001\\50000001_DSN-01.odt', 0, 'Design Source'),
(30, 3, '', '', 'D:\\vault\\parts\\20000001\\20000001_WI-01.pdf', 0, 'Work Instruction - PDF'),
(31, 3, '', '', 'D:\\vault\\parts\\20000001\\20000001_WI-01.odt', 0, 'Work Instruction - Source'),
(32, 15, '', '', 'D:\\vault\\parts\\20000002\\20000002_MA-00.pdf', 0, 'Master Drawing - PDF'),
(33, 15, '', '', 'D:\\vault\\parts\\20000002\\20000002_CAM-01.pdf', 0, 'CAM plot'),
(34, 15, '', '', 'D:\\vault\\parts\\20000002\\20000002_CAM-01.zip', 0, 'CAM archive'),
(35, 15, '', '', 'D:\\vault\\parts\\20000002\\20000002_MA-00.odg', 0, 'Master Drawing - Source'),
(36, 2, '', '', 'D:\\vault\\parts\\20000003\\20000003_WI-01.pdf', 0, 'Work Instruction - PDF'),
(37, 2, '', '', 'D:\\vault\\parts\\20000003\\20000003_ASSY-01.odg', 0, 'Assembly drawing - Source'),
(38, 2, '', '', 'D:\\vault\\parts\\20000003\\20000003_ASSY-01.pdf', 0, 'Assembly drawing - PDF'),
(39, 2, '', '', 'D:\\vault\\parts\\20000003\\20000003_DSN-01.zip', 0, 'Design archive'),
(40, 2, '', '', 'D:\\vault\\parts\\20000003\\20000003_SCH-01.pdf', 0, 'Schematic'),
(41, 2, '', '', 'D:\\vault\\parts\\20000003\\20000003_WI-01.odt', 0, 'Work Instruction - Source'),
(42, 20, '', '', 'D:\\vault\\parts\\10000002\\10000002_ART-01.odg', 0, 'Artwork source'),
(43, 20, '', '', 'D:\\vault\\parts\\10000002\\10000002_ART-01.pdf', 0, 'Artwork PDF'),
(44, 20, '', '', 'D:\\vault\\parts\\10000002\\10000002_FAB-01.odg', 0, 'Fab source'),
(45, 20, '', '', 'D:\\vault\\parts\\10000002\\10000002_FAB-01.pdf', 0, 'Fab PDF'),
(46, 19, '', '', 'D:\\vault\\parts\\10000003\\10000003_PBS-00.odg', 0, 'Product Breakdown Structure diagram source'),
(47, 19, '', '', 'D:\\vault\\parts\\10000003\\10000003_PBS-00.pdf', 0, 'Product Breakdown Structure diagram PDF'),
(48, 19, '', '', 'D:\\vault\\parts\\10000003\\10000003_WI-00.odt', 0, 'Work Instruction source'),
(49, 19, '', '', 'D:\\vault\\parts\\10000003\\10000003_WI-00.pdf', 0, 'Work Instruction PDF'),
(50, 1, '', '', 'D:\\vault\\parts\\10000001\\10000001_ASSY-01.odg', 0, 'Assembly drawing source'),
(51, 1, '', '', 'D:\\vault\\parts\\10000001\\10000001_ASSY-01.pdf', 0, 'Assembly drawing PDF'),
(52, 22, '', '', 'D:\\vault\\parts\\80000001\\Hammond-9c2pg42-43.pdf', 0, 'Application note'),
(53, 22, '', '', 'D:\\vault\\parts\\80000001\\Hammond-1590T.dwg', 0, 'Datasheet drawing'),
(54, 22, '', '', 'D:\\vault\\parts\\80000001\\Hammond-1590T.pdf', 0, 'Datasheet'),
(55, 27, '', '', 'D:\\vault\\parts\\80000002\\Keystone-M55-prod31.pdf', 0, 'Datasheet'),
(56, 28, '', '', 'D:\\vault\\parts\\80000003\\Machinepancombo.pdf', 0, 'Datasheet'),
(57, 29, '', '', 'D:\\vault\\parts\\80000004\\TYCO-ENG_CD_5205820_O.pdf', 0, 'Datasheet'),
(58, 21, '', '', 'D:\\vault\\parts\\80000005\\IS-435.PDF', 0, 'Application'),
(59, 21, '', '', 'D:\\vault\\parts\\80000005\\MSDS-MS-4040.pdf', 0, 'MSDS'),
(60, 21, '', '', 'D:\\vault\\parts\\80000005\\Quote-ULINE-S-463.pdf', 0, 'Quote'),
(61, 21, '', '', 'D:\\vault\\parts\\80000005\\ULINE-S463.pdf', 0, 'Catalogue'),
(62, 32, '', '', 'D:\\vault\\parts\\80000006\\Keystone-M55-prod31.pdf', 0, 'Datasheet'),
(63, 26, '', '', 'D:\\vault\\parts\\80000007\\INT LWZ 004.jpg', 0, 'Drawing'),
(64, 4, '', '', 'D:\\vault\\parts\\90000013\\BICC-General-Carol-Hookup-Wire.pdf', 0, 'Datasheet'),
(65, 30, '', '', 'D:\\vault\\parts\\90000014\\1110104001.pdf', 0, 'Datasheet'),
(66, 31, '', '', 'D:\\vault\\parts\\90000015\\1110107001.pdf', 0, 'Datasheet'),
(67, 23, '', '', 'D:\\vault\\parts\\90000016\\ENG_CD_330648_F1.pdf', 0, 'Datasheet'),
(68, 24, '', '', 'D:\\vault\\parts\\90000017\\Hookup.pdf', 0, 'Datasheet'),
(69, 25, '', '', 'D:\\vault\\parts\\90000018\\Hookup.pdf', 0, 'Datasheet'),
(70, 6, '', '', 'D:\\vault\\parts\\50000001\\50000001_DSN-01-graphics.zip', 0, 'Design Source (graphic files)');

--
-- Dumping data for table `tbl_pv_hpref`
--

INSERT INTO `tbl_pv_hpref` (`id`, `GPREFKey`, `GPREFText1`, `GPREFText2`, `GPREFText3`, `GPREFText4`, `GPREFText5`, `GPREFBool1`, `GPREFBool2`, `GPREFBool3`, `GPREFBool4`, `GPREFInt1`, `GPREFText6`, `GPREFText7`, `GPREFText8`, `GPREFText9`, `GPREFText10`) VALUES
(2, 'PLOptions', '', '', '', '', '', 0, 0, 0, 1, 1, '', '', '', '', ''),
(3, 'PNOptions', '', '', '', '', '', 1, 1, 0, 0, 0, '', '', '', '', ''),
(4, 'POOptions', 'ASAP', 'Destination', '', 'ASAP', 'Net 30', 1, 1, 0, 1, 2, '', '', '', '', ''),
(6, 'UserFields', 'User 1', 'User 2', 'User 3', 'User 4', 'User 5', 0, 0, 0, 1, 2, 'Stk Class', 'User 7', 'User 8', 'Stk Loc', 'Stk Bin'),
(7, 'Version', '6.0.137', '', '', '', '', 0, 0, 0, 0, 0, '', '', '', '', ''),
(22, 'JOBTBL', '', '', '', '', '', 1, 0, 0, 0, 0, '', '', '', '', ''),
(23, 'JOBTBL2', '', '', '', '', '', 0, 0, 0, 0, 0, '', '', '', '', ''),
(24, 'Lic', 'TDSN61021626213488025', 'active', '', '', '', 0, 0, 0, 0, 0, '', '', '', '', ''),
(25, 'CustomerCaption', 'Customer', '', '', '', '', 0, 0, 0, 0, 0, '', '', '', '', ''),
(26, 'Lic', 'DEMO', '', '', '', '', 0, 0, 0, 0, 0, '', '', '', '', '');

--
-- Dumping data for table `tbl_pv_lin`
--

INSERT INTO `tbl_pv_lin` (`id`, `LINSUID`, `LINMFRID`) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 3, 3),
(4, 3, 4),
(5, 3, 5),
(6, 7, 6),
(7, 3, 7),
(8, 3, 8),
(9, 1, 9),
(10, 7, 10),
(11, 3, 11),
(12, 3, 13),
(13, 3, 15),
(14, 3, 12),
(15, 3, 14),
(16, 3, 17);

--
-- Dumping data for table `tbl_pv_lnk`
--

INSERT INTO `tbl_pv_lnk` (`id`, `LNKSUID`, `LNKMFRPNID`, `LNKMFRID`, `LNKUNID`, `LNKPNID`, `LNKToPNID`, `LNKUse`, `LNKLeadtime`, `LNKChoice`, `LNKVendorPN`, `LNKVendorDesc`, `LNKAtQty`, `LNKRFQDate`, `LNKMinIncrement`, `LNKCurrentCost`, `LNKSetupCost`, `LNKRoHS`, `LNKRoHSDoc`, `LNKRoHSNote`) VALUES
(1, 3, 1, 1, 23, 4, 0, 1, '', 0, 'C2119W-100-ND', 'WHITE 18AWG HOOKUP WIRE SOLID', 1, '0000-00-00 00:00:00', 0, 23.42, 0, 0, '', ''),
(2, 5, 0, 0, 1, 5, 0, 1, '', 0, 'LB25C', 'Crystal Earpiece, Hi-z, 1m lead, 3.5mm plug', 1, '0000-00-00 00:00:00', 0, 3.3432, 0, 0, '', ''),
(3, 9, 0, 0, 1, 2, 0, 1, '', 0, 'SCC:20000003', 'PCA,AIRCRAFT WIRELESS', 10, '0000-00-00 00:00:00', 0, 5, 0, 0, '', ''),
(4, 3, 2, 2, 1, 7, 0, 1, '', 0, '5063JD5M600F12AF5-ND', 'RES 5.60MEG OHM MTLFLM.40W 1% TR', 5000, '0000-00-00 00:00:00', 0, 0.075, 0, 0, '', ''),
(5, 3, 3, 2, 1, 8, 0, 1, '', 0, 'BC2.00MXTR-ND', 'RES 2.00M OHM MTL FILM .40W 1% T', 5000, '0000-00-00 00:00:00', 0, 0.06188, 0, 0, '', ''),
(6, 3, 4, 3, 1, 9, 0, 1, '', 0, '399-4233-ND', 'CAP 3300PF 100V 10% CER RADIAL', 5000, '0000-00-00 00:00:00', 0, 0.05148, 0, 0, '', ''),
(7, 3, 5, 4, 1, 10, 0, 1, '', 0, 'SR151A330KAA-ND', 'CAP CER 33PF 100V 10% NP0 RADIAL', 1000, '0000-00-00 00:00:00', 0, 0.11375, 0, 0, '', ''),
(8, 3, 6, 5, 1, 11, 0, 1, '', 0, 'P965-ND', 'CAP ELECT 10UF 16V KK RADIAL', 1000, '0000-00-00 00:00:00', 0, 0.059, 0, 0, '', ''),
(9, 7, 7, 6, 1, 12, 0, 1, '', 0, '97K6768', 'SEMELAB - OA95/05 - DIODE, GERMANIUM, DO-7', 1000, '0000-00-00 00:00:00', 0, 0.567, 0, 0, '', ''),
(10, 3, 8, 7, 1, 13, 0, 1, '', 0, 'GMC30600-ND', 'CAP TRIM 56-250PF TOP ADJUST PCB', 1, '0000-00-00 00:00:00', 0, 11.74, 0, 0, '', ''),
(11, 3, 9, 8, 1, 14, 0, 1, '', 0, 'CP-3536NG-ND', 'CONN AUDIO JACK 3.5MM MONO', 500, '0000-00-00 00:00:00', 0, 0.2324, 0, 0, '', ''),
(12, 1, 0, 9, 1, 15, 0, 1, '', 0, 'SCC:20000002', 'PCB,AIRCRAFT WIRELESS', 1, '0000-00-00 00:00:00', 0, 354.1, 0, 0, '', ''),
(13, 7, 10, 10, 1, 16, 0, 1, '', 0, '36F779', 'BELDEN - 8085 - Hook-Up Wire', 1, '0000-00-00 00:00:00', 0, 154.83, 0, 0, '', ''),
(14, 2, 0, 0, 1, 17, 0, 1, '', 0, 'R-025400-61', 'FERRITE ROD 1/4-INCH X 4IN MATL=61', 1, '0000-00-00 00:00:00', 0, 6, 0, 0, '', ''),
(15, 3, 11, 11, 1, 18, 0, 1, '', 0, '3M35-BL-ND', 'TAPE ELECTRICAL VINYL 3/4" BLUE', 1, '0000-00-00 00:00:00', 0, 5.62, 0, 0, '', ''),
(16, 12, 0, 0, 1, 21, 0, 1, '', 0, 'S-463', '5 x 4 x 2" Indestructo Mailers', 100, '0000-00-00 00:00:00', 0, 50, 0, 0, '', ''),
(17, 11, 0, 0, 1, 20, 0, 1, '', 0, 'SCC:10000001', 'ENCL,AIRCRAFT WIRELESS', 1, '0000-00-00 00:00:00', 0, 5, 0, 0, '', ''),
(18, 3, 12, 13, 1, 22, 0, 1, '', 0, '1590TBK-ND', 'BOX ALUM BLACK 4.74X3.13X2.17"', 1, '0000-00-00 00:00:00', 0, 14.9, 0, 0, '', ''),
(19, 3, 13, 15, 1, 23, 0, 1, '', 0, 'A27230-ND', 'CONN RING 16-22 AWG #4 RED PIDG', 1, '0000-00-00 00:00:00', 0, 6.21, 0, 0, '', ''),
(20, 3, 14, 1, 1, 24, 0, 1, '', 0, 'C2065G-100-ND', 'GREEN STRANDED-HOOKUP WIRE-16AWG', 1, '0000-00-00 00:00:00', 0, 35.5, 0, 0, '', ''),
(21, 3, 15, 1, 1, 25, 0, 1, '', 0, 'C2065Y-100-ND', 'HOOK-UP WIRE YEL STRANDED 16 AWG', 1, '0000-00-00 00:00:00', 0, 35.5, 0, 0, '', ''),
(22, 3, 16, 12, 1, 26, 0, 1, '', 0, 'H236-ND', 'WASHER LOCK INT TOOTH #4 ZINC', 1, '0000-00-00 00:00:00', 0, 0.97, 0, 0, '', ''),
(23, 3, 17, 14, 1, 27, 0, 1, '', 0, '8440EK-ND', 'STDOFF HEX FLA-RET 4-40 .750"L', 10, '0000-00-00 00:00:00', 0, 1.016, 0, 0, '', ''),
(24, 3, 18, 12, 1, 28, 0, 1, '', 0, 'H703-ND', 'SCREW MACHINE PHIL 4-40X1/4 SS', 100, '0000-00-00 00:00:00', 0, 4.13, 0, 0, '', ''),
(25, 3, 19, 15, 1, 29, 0, 1, '', 0, '5205820-3-ND', 'CONN HARDWARE FLAT WASHER 4-40', 100, '0000-00-00 00:00:00', 0, 0.0125, 0, 0, '', ''),
(26, 3, 20, 17, 1, 30, 0, 1, '', 0, 'J371-ND', 'POST BINDING BANANA INSULATED GR', 1, '0000-00-00 00:00:00', 0, 2.59, 0, 0, '', ''),
(27, 3, 21, 17, 1, 31, 0, 1, '', 0, 'J372-ND', 'POST BINDING BANANA INSULATED YE', 1, '0000-00-00 00:00:00', 0, 2.4, 0, 0, '', ''),
(28, 3, 22, 14, 1, 32, 0, 1, '', 0, '2203K-ND', 'STANDOFF HEX 4-40THR ALUM .500"L', 10, '0000-00-00 00:00:00', 0, 0.419, 0, 0, '', '');

--
-- Dumping data for table `tbl_pv_mfr`
--

INSERT INTO `tbl_pv_mfr` (`id`, `MFRMfrName`, `MFRAddress`, `MFRCountry`, `MFRContact1`, `MFRContact2`, `MFRPhone1`, `MFRPhone2`, `MFRFax`, `MFRWeb`, `MFRNotes`, `MFRCode`, `MFREMail1`, `MFREMail2`, `MFRNoPhonePrefix`) VALUES
(1, 'General Cable (Carol Brand)', '4 Tesseneer Drive, Highland Heights, KY 41076, USA', 'USA', '', '', '1-859-572-8000', '', '1-859-572-8458', 'http://www.generalcable.com/', '', 'CAROL', '', '', 0),
(2, 'Vishay (BC Components)', 'One Greenwich Place, Shelton, CT 06484, USA', 'USA', '', '', '1-402-563-6866', '', '1-402-563-6296', 'http://www.vishay.com/', '', 'VISHAY', '', '', 0),
(3, 'Kemet', 'P.O. Box 5928, Greenville, SC 29606, USA', 'USA', '', 'Tech Svces (8am - 5pm ET)', '1-864-963-6300', '1-877-695-3638', '', 'http://www.kemet.com/', '', 'KEMET', '', '', 0),
(4, 'AVX Corporation', '801 17th Avenue South, Box 867, Myrtle Beach, SC 29578-0687 USA', 'USA', '', '', '1-843-448-9411', '', '', 'http://www.avx.com/', '', 'AVX', '', '', 0),
(5, 'Panasonic (Industrial)', 'Three Panasonic Way, M/S: 7H-2, Secaucus, NJ 07094, USA', 'USA', '', '', '1-800-344-2112', '', '', 'http://www.panasonic.com/industrial/electronic-components/', '', 'PANA', '', '', 0),
(6, 'Semelab', 'Coventry Road, Lutterworth, Leicestershire LE17 4JB', 'Great Britain', '', '', '011-44-0-1455-552505', '', '', 'http://www.semelab.com/', '', 'SEMI', '', '', 0),
(7, 'Sprague-Goodman', '1700 Shames Drive, Westbury, NY 11590, USA', 'USA', '', '', '1-516-334-8700', '', '1-516-334-8771', 'http://www.spraguegoodman.com/', '', 'SPRAG', '', '', 0),
(8, 'CUI Inc.', '20050 SW 112th Avenue, Tualatin, OR 97062, USA', 'USA', '', '', '1-800-275-4899', '', '1-503-612-2383', 'http://www.cui.com/', '', 'CUI', '', '', 0),
(9, 'AP Circuits', 'Unit 3, 1112-40th Ave. NE, Calgary, AB T2E5T8, Canada', 'Canada', '', '', '1-403-250-3406', '', '', 'http://www.apcircuits.com/', '', 'APC', '', '', 0),
(10, 'Belden', '7733 Forsyth Boulevard, Suite 800, St. Louis, MO 63105, USA', 'USA', '', 'Customer Svces', '1-314-854-8000', '1-800-235-3361', '', 'http://www.belden.com/', '', 'BLDN', '', '', 0),
(11, '3M', '300 Tartan Drive, London, Ontario N5V 4M9, Canada', 'Canada', '', '', '1-888-364-3577', '', '1-800-479-4453', 'http://www.3m.com/', '', 'THREEM', '', '', 0),
(12, 'B&F Fastener Supply', '2827 Anthony Lane South, Minneapolis, MN 55418, USA', 'USA', '', '', '1-612-788-7468', '1-800-964-8241', '1-612-788-1914', 'http://www.buildingfasteners.com/', '', 'BANDF', '', '', 0),
(13, 'Hammond Manufacturing', '394 Edinburgh Rd North, Guelph , ON N1H 1E5, Canada', 'Canada', '', '', '1-519-822-2960', '1-905-456-3770', '1-519-822-0715', 'http://www.hammondmfg.com/', '', 'HAMMOND', 'sales@hammfg.com', '', 0),
(14, 'Keystone Electronics', '31-07 20th Road, Astoria, NY 11105, USA', 'USA', '', '', '1-718-956-8900', '1-800-221-5510', '1-718-956-9040', 'http://www.keyelco.com/', '', 'KEYSTONE', '', '', 0),
(15, 'Tyco Electronics', '', '', 'Canada Support', '', '1-905-475-6222', '', '', 'http://www.tycoelectronics.com/', '', 'TYCO', '', '', 0),
(16, 'Emerson', '3000 Lakeside Drive, Suite 308N, Bannockburn, IL 60015, USA', 'USA', '', '', '1-847-739-0300', '', '1-847-739-0301', 'http://emersonconnectivity.com/', '', 'EMERSON', '', '', 0),
(17, 'Emerson Network Power Connectivity Solutions', '', '', '', '', '', '', '', '', '', '', '', '', 0);

--
-- Dumping data for table `tbl_pv_mfrpn`
--

INSERT INTO `tbl_pv_mfrpn` (`id`, `MFRPNMFRID`, `MFRPNPart`) VALUES
(1, 1, 'C2119A-12-02'),
(2, 2, 'MBA02040C5604FRP00'),
(3, 2, 'MBA02040C2004FRP00'),
(4, 3, 'C317C332K1R5TA'),
(5, 4, 'SR151A330KAA'),
(6, 5, 'ECE-A1CKK100'),
(7, 6, 'OA95/05'),
(8, 7, 'GM-C-3-06-00'),
(9, 8, 'MJ-3536NG'),
(10, 10, '8085'),
(11, 11, '35 BLUE (3/4"X66'')'),
(12, 13, '1590TBK'),
(13, 15, '330648'),
(14, 1, 'C2065A.12.06'),
(15, 1, 'C2065A.12.05'),
(16, 12, 'INT LWZ 004'),
(17, 14, '8440E'),
(18, 12, 'PMSSS 440 0025 PH'),
(19, 15, '5205820-3'),
(20, 17, '111-0104-001'),
(21, 17, '111-0107-001'),
(22, 14, '2203K-ND');

--
-- Dumping data for table `tbl_pv_org`
--

INSERT INTO `tbl_pv_org` (`id`, `ORGKey`, `ORGName`, `ORGAddress`, `ORGPhone`, `ORGFaax`, `ORGPOUseShpgAddr`, `ORGRFQUseShpgAddr`, `ORGListOrder`) VALUES
(1, 'Billing', 'Swift Construction Company', '1 Swift Way\r\nShopton, NY 13054, USA', '1-315-123-4567', '1-315-123-4568', 0, 0, 0),
(6, 'Shipping', '', 'Swift Construction Company\r\n1 Swift Way\r\nShopton, NY 13054, USA', '', '', 1, 1, 1);

--
-- Dumping data for table `tbl_pv_pl`
--

INSERT INTO `tbl_pv_pl` (`id`, `PLListID`, `PLPartID`, `PLItem`, `PLQty`, `PLRefMemo`, `PLRefText`, `PLAssyOrder`, `PLAssySpec`, `PLMFRPNID`, `PLMFRID`, `PLSUID`, `PLLNKID`) VALUES
(4, 1, 2, 2, '1', '', '', 0, '', 0, 0, 0, 0),
(5, 2, 7, 10, '1', 'R1', '', 0, '', 0, 0, 0, 0),
(6, 2, 8, 9, '1', 'R2', '', 0, '', 0, 0, 0, 0),
(7, 2, 9, 8, '1', 'C1', '', 0, '', 0, 0, 0, 0),
(8, 2, 10, 7, '1', 'C2', '', 0, '', 0, 0, 0, 0),
(9, 2, 11, 6, '1', 'C3', '', 0, '', 0, 0, 0, 0),
(10, 2, 12, 5, '1', 'D1', '', 0, '', 0, 0, 0, 0),
(11, 2, 13, 4, '1', 'VC1', '', 0, '', 0, 0, 0, 0),
(12, 2, 14, 3, '1', 'J1', '', 0, '', 0, 0, 0, 0),
(13, 2, 15, 2, '1', 'PCB', '', 0, '', 0, 0, 0, 0),
(14, 2, 3, 1, '1', 'L1', '', 0, '', 0, 0, 0, 0),
(15, 3, 16, 1, '846', '', '', 0, '', 0, 0, 0, 0),
(16, 3, 17, 2, '0.5', '', '', 0, '', 0, 0, 0, 0),
(17, 3, 18, 3, '2', '', '', 0, '', 0, 0, 0, 0),
(18, 19, 5, 1, '1', '', '', 0, '', 0, 0, 0, 0),
(19, 19, 6, 1, '1', '', '', 0, '', 0, 0, 0, 0),
(20, 19, 21, 1, '1', '', '', 0, '', 0, 0, 0, 0),
(21, 19, 1, 1, '0', '', '', 0, '', 0, 0, 0, 0),
(22, 1, 20, 1, '1', '', '', 0, '', 0, 0, 0, 0),
(23, 20, 22, 1, '1', '', '', 0, '', 0, 0, 0, 0),
(24, 1, 23, 9, '2', '', '', 0, '', 0, 0, 0, 0),
(25, 1, 24, 10, '5', '', '', 0, '', 0, 0, 0, 0),
(26, 1, 25, 11, '5', '', '', 0, '', 0, 0, 0, 0),
(27, 1, 26, 6, '1', '', '', 0, '', 0, 0, 0, 0),
(29, 1, 28, 3, '4', '', '', 0, '', 0, 0, 0, 0),
(30, 1, 29, 4, '6', '', '', 0, '', 0, 0, 0, 0),
(31, 1, 30, 7, '1', '', '', 0, '', 0, 0, 0, 0),
(32, 1, 31, 8, '1', '', '', 0, '', 0, 0, 0, 0),
(33, 1, 32, 5, '3', '', '', 0, '', 0, 0, 0, 0),
(34, 33, 20, 1, '1', '', '', 0, '', 0, 0, 0, 0),
(35, 33, 5, 2, '1', '', '', 0, '', 0, 0, 0, 0),
(36, 33, 2, 3, '1', '', '', 0, '', 0, 0, 0, 0),
(37, 33, 6, 4, '1', '', '', 0, '', 0, 0, 0, 0);

--
-- Dumping data for table `tbl_pv_pll`
--

INSERT INTO `tbl_pv_pll` (`id`, `PLLParentListID`, `PLLSubListID`, `PLLQty`, `PLLLevel`, `PLLCost`, `PLLItemNumber`) VALUES
(1, 1, 2, 1, 0, 0, 2),
(2, 2, 3, 1, 0, 0, 1),
(3, 19, 1, 0, 0, 0, 1),
(4, 1, 20, 1, 0, 0, 1),
(5, 33, 20, 1, 0, 0, 1),
(6, 33, 2, 1, 0, 0, 3);

--
-- Dumping data for table `tbl_pv_pn`
--

INSERT INTO `tbl_pv_pn` (`id`, `PNIDToLNK`, `PNUNID`, `PNTabParentID`, `PNPrefix`, `PNPartNumber`, `PNSuffix`, `PNType`, `PNRevision`, `PNTitle`, `PNDetail`, `PNStatus`, `PNReqBy`, `PNNotes`, `PNUser1`, `PNUser2`, `PNUser3`, `PNUser4`, `PNUser5`, `PNUser6`, `PNUser7`, `PNUser8`, `PNUser9`, `PNUser10`, `PNDate`, `PNTab`, `PNControlled`, `PNAux1`, `PNQty`, `PNQty2`, `PNCostChanged`, `PNParentCost`, `PNExpandList`, `PNAssyCostOption`, `PNInclAssyOnPurchList`, `PNMadeFrom`, `PNMinStockQty`, `PNOrderToMaintain`, `PNOnECO`, `PNOverKit`, `PNOverKitQty`, `PNOverKitBy`, `PNOverKitFor`, `PNCurrentCost`, `PNLastRollupCost`, `PNUSRID`, `PNUserLock`, `type_id`, `stock_location_id`, `requester_id`, `iteration_number`, `is_current_iteration`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 0, 1, 0, '', '10000001', '', 'PL', '3', 'ASSY,AIRCRAFT WIRELESS', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'FIN', '', '', 'FINGOODS', '0002', '2013-01-04 00:00:00', 0, 0, '', 2, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7.5, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 0, 1, 0, '', '20000003', '', 'PL', '2', 'PCA,AIRCRAFT WIRELESS', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'ASSY', '', '', 'ELEC-PCB', '0001', '2013-01-04 00:00:00', 0, 0, '', 4, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 7.5, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 0, 1, 0, '', '20000001', '', 'PL', '0', 'IND,830UH,AIRCRAFT WIRELESS', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'ASSY', '', '', 'ELEC-COMPS', '0010', '2013-01-01 00:00:00', 0, 0, '', 4, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 7.5, 7.5, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 0, 23, 0, '', '90000013', '', 'PS', '0', 'WIRE,SOLID,18AWG,WHITE,POLY', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'RAW', '', '', 'ELEC-WIRE', '0001', '2013-01-01 00:00:00', 0, 0, '', 420, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0.007684, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 1, 0, '', '90000012', '', 'PS', '0', 'EARPH,MONO,HI-Z,3.5MM', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'ELEC-COMPS', '0001', '2013-01-01 00:00:00', 0, 0, '', 12, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3.3432, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 0, 1, 0, '', '50000001', '', 'DWG', '1', 'DOC,USER,AIRCRAFT WIRELESS', '', 'R', 'J. Sharp', '', '', '', '', '', '', 'FIN', '', '', 'DOCS', '0001', '2013-01-03 00:00:00', 0, 0, '', 12, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 0, 1, 0, '', '90000011', '', 'PS', '0', 'RES,AXIAL,5.6M,0.4W,1%,MF,ROHS', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'ELEC-COMPS', '0002', '2013-01-01 00:00:00', 0, 0, '', 12, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0.075, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 0, 1, 0, '', '90000010', '', 'PS', '0', 'RES,AXIAL,2.0M,0.4W,1%,MF,ROHS', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'ELEC-COMPS', '0003', '2013-01-01 00:00:00', 0, 0, '', 12, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0.06188, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 0, 1, 0, '', '90000009', '', 'PS', '0', 'CAP,CER,3300PF,100V,10%,RADIAL,ROHS', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'ELEC-COMPS', '0004', '2013-01-01 00:00:00', 0, 0, '', 12, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0.05148, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 1, 0, '', '90000008', '', 'PS', '0', 'CAP,CER,33PF,100V,10%,RADIAL,ROHS', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'ELEC-COMPS', '0005', '2013-01-01 00:00:00', 0, 0, '', 12, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0.11375, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 0, 1, 0, '', '90000007', '', 'PS', '0', 'CAP,ELEC,10UF,16V,20%,RADIAL,ROHS', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'ELEC-COMPS', '0006', '2013-01-01 00:00:00', 0, 0, '', 12, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0.059, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 0, 1, 0, '', '90000006', '', 'PS', '0', 'DIO,SIG,GERM,0A95,AXIAL,D0-7,GLASS', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'ELEC-COMPS', '0007', '2013-01-01 00:00:00', 0, 0, '', 12, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0.567, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 0, 1, 0, '', '90000005', '', 'PS', '0', 'CAPV,150-230PF,TOP ADJUST,PCB', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'ELEC-COMPS', '0008', '2013-01-01 00:00:00', 0, 0, '', 12, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 11.74, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 0, 1, 0, '', '90000004', '', 'PS', '0', 'CONN,PHONE,F,MONO,PCB,3.5MM', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'ELEC-COMPS', '0009', '2013-01-01 00:00:00', 0, 0, '', 12, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0.2324, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 0, 1, 0, '', '20000002', '', 'DWG', '1', 'PCB,AIRCRAFT WIRELESS', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'ELEC-PCB', '0002', '2013-01-02 00:00:00', 0, 0, '', 12, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 354.1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 0, 23, 0, '', '90000001', '', 'PS', '0', 'WIRE,MAGNET,38AWG,POLY', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'RAW', '', '', 'ELEC-WIRE', '0004', '2013-01-01 00:00:00', 0, 0, '', 2000, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 154.83, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 0, 1, 0, '', '90000002', '', 'PS', '0', 'MAG,FERRITE ROD,1/4IN X 4IN,MATL=61', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'DETAIL', '', '', 'ELEC-COMPS', '0011', '2013-01-01 00:00:00', 0, 0, '', 6, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 0, 22, 0, '', '90000003', '', 'PS', '0', 'TAPE,ELECTRICAL,3/4",BLUE,VINYL', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'RAW', '', '', 'SHOPSUP', '0001', '2013-01-01 00:00:00', 0, 1, '', 24, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5.62, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 0, 1, 0, '', '10000003', '', 'CAT', '1', 'ASSY,MKTG,AIRCRAFT WIRELESS', '', 'R', 'J. Sharp', '', '', '', '', '', '', 'FIN', '', '', 'FINGOODS', '0001', '2013-01-04 00:00:00', 0, 0, '', 2, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.34, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 1, 0, '', '10000002', '', 'PL', '1', 'ENCL,AIRCRAFT WIRELESS', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'DETAIL', '', '', 'MECH', '0001', '2013-01-04 00:00:00', 0, 0, '', 2, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 0, 1, 0, '', '80000005', '', 'PS', '0', 'BOX,SHIPPING,5X4X2,CARDBOARD,WHITE', '', 'R', 'J. Sharp', '', '', '', '', '', '', 'BOF', '', '', 'SHIPPING', '0001', '2013-01-03 00:00:00', 0, 0, '', 25, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 0, 1, 0, '', '80000001', '', 'PS', '0', 'BOX,IP54,4.74X3.13X2.17",ALUM,BLK,SCREWS', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'RAW', '', '', 'MECH', '0002', '2013-01-03 00:00:00', 0, 0, '', 0, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 14.9, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 0, 1, 0, '', '90000016', '', 'PS', '0', 'CONN,RING,16-22AWG,#4,RED', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'ELEC-CONNS', '0001', '2013-01-03 00:00:00', 0, 0, '', 48, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 6.21, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 0, 1, 0, '', '90000017', '', 'PS', '0', 'WIRE,STRANDED,16AWG,GREEN,POLY', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'RAW', '', '', 'ELEC-WIRE', '0002', '2013-01-03 00:00:00', 0, 0, '', 400, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 35.5, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 0, 1, 0, '', '90000018', '', 'PS', '0', 'WIRE,STRANDED,16AWG,YELLOW,POLY', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'RAW', '', '', 'ELEC-WIRE', '0003', '2013-01-03 00:00:00', 0, 0, '', 475, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 35.5, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 0, 1, 0, '', '80000007', '', 'PS', '0', 'WASHER,LOCK,#4,INTERNAL TOOTH', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'MECH-HW', '0001', '2013-01-03 00:00:00', 0, 0, '', 420, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0.97, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 0, 1, 0, '', '80000002', '', 'PS', '0', 'STANDOFF,HEX,4-40,0.75"L,NYLON', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'MECH-HW', '0002', '2013-01-03 00:00:00', 0, 0, '', 83, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1.016, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 0, 1, 0, '', '80000003', '', 'PS', '0', 'SCREW,MACHINE,PHIL,4-40X1/4,SS', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'MECH-HW', '0004', '2013-01-03 00:00:00', 0, 0, '', 300, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 4.13, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 0, 1, 0, '', '80000004', '', 'PS', '0', 'WASHER,FLAT,4-40', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'MECH-HW', '0005', '2013-01-03 00:00:00', 0, 0, '', 300, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0.0125, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 0, 1, 0, '', '90000014', '', 'PS', '0', 'CONN,BINDING POST BANANA,INSUL,GRN', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'ELEC-CONNS', '0002', '2013-01-03 00:00:00', 0, 0, '', 25, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2.59, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 0, 1, 0, '', '90000015', '', 'PS', '0', 'CONN,BINDING POST BANANA,INSUL,YEL', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'ELEC-CONNS', '0003', '2013-01-03 00:00:00', 0, 0, '', 25, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2.4, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 0, 1, 0, '', '80000006', '', 'PS', '0', 'STANDOFF,HEX,4-40,0.5"L,ALUM', '', 'R', 'B. Jenks', '', '', '', '', '', '', 'BOF', '', '', 'MECH-HW', '0003', '2013-01-04 00:00:00', 0, 0, '', 79, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0.419, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 0, 1, 0, '', '60000001', '', 'PL', '1', 'ASSY,FIELD SPARES,AIRCRAFT WIRELESS', '', 'R', 'B. Jenks', '', '', '', '', '', '', '', '', '', '', '', '2013-05-01 00:00:00', 0, 0, '', 0, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Dumping data for table `tbl_pv_pod`
--

INSERT INTO `tbl_pv_pod` (`id`, `PODField`, `PODCaption`, `PODOrder`, `PODUse`, `PODNewLine`, `PODUseCaption`, `PODMode`, `PODOrderJOB`, `PODUseJOB`, `PODNewLineJOB`, `PODUseCaptionJOB`) VALUES
(1, 'POIHPart', 'InHouse P/N (always)', 1, 0, 1, 0, 0, 0, 0, 0, 0),
(2, 'POIHPart', 'InHouse P/N (if not above)', 2, 1, 1, 1, 0, 0, 0, 0, 0),
(3, 'PNTitle', 'Title', 3, 1, 1, 0, 1, 1, 1, 1, 0),
(4, 'PNDetail', 'Detail', 4, 1, 0, 0, 1, 2, 1, 1, 0),
(5, 'LNKVendorPN', 'Vendor P/N (always)', 5, 1, 1, 1, 0, 0, 0, 0, 0),
(6, 'LNKVendorPN', 'Vendor P/N (if not above)', 6, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 'LNKVendorDesc', 'Vendor Desc', 7, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 'MFRMfrName', 'Mfr', 8, 1, 1, 1, 0, 0, 0, 0, 0),
(9, 'MFRPNPart', 'Mfr P/N (always)', 9, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 'MFRPNPart', 'Mfr P/N (if not above)', 10, 1, 0, 1, 0, 0, 0, 0, 0),
(11, 'PNUser1', 'User 1', 11, 1, 1, 1, 1, 3, 1, 1, 1),
(12, 'PNUser2', 'User 2', 12, 1, 1, 1, 1, 4, 1, 1, 1),
(13, 'PNUser3', 'User 3', 13, 1, 1, 1, 1, 5, 1, 1, 1),
(14, 'PNUser4', 'User 4', 14, 1, 1, 1, 1, 6, 1, 1, 1),
(15, 'PNUser5', 'User 5', 15, 1, 1, 1, 1, 7, 1, 1, 1),
(16, 'PNUser6', 'Stk Class', 16, 0, 1, 0, 1, 8, 1, 1, 1),
(17, 'PNUser7', 'User 7', 17, 0, 1, 0, 1, 9, 1, 1, 1),
(18, 'PNUser8', 'User 8', 18, 0, 1, 0, 1, 10, 1, 1, 1),
(19, 'PNUser9', 'Stk Loc', 19, 0, 1, 0, 1, 11, 1, 1, 1),
(20, 'PNUser10', 'Stk Bin', 20, 0, 1, 0, 1, 12, 1, 1, 1),
(21, 'Setting', '', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 'LNKRoHS', 'RoHS', 21, 1, 1, 1, 0, 0, 0, 0, 0),
(23, 'LNKRoHSDoc', 'RoHS Doc', 22, 1, 0, 1, 0, 0, 0, 0, 0),
(24, 'LNKRoHSNote', 'RoHS Note', 23, 1, 1, 1, 0, 0, 0, 0, 0);

--
-- Dumping data for table `tbl_pv_ship`
--

INSERT INTO `tbl_pv_ship` (`id`, `SHIPMethod`) VALUES
(1, 'FEDX Overnight'),
(2, 'FEDX Economy'),
(3, 'UPS');

--
-- Dumping data for table `tbl_pv_su`
--

INSERT INTO `tbl_pv_su` (`id`, `SUSupplier`, `SUAddress`, `SUCountry`, `SUPhone1`, `SUPhone2`, `SUFAX`, `SUWeb`, `SUContact1`, `SUContact2`, `SUDateLast`, `SUFollowup`, `SUNotes`, `SUCode`, `SUAccount`, `SUTerms`, `SUFedTaxID`, `SUStateTaxID`, `SUEMail1`, `SUEMail2`, `SUCurDedExRate`, `SUCurExRate`, `SUCURID`, `SUCurReverse`, `SUNoPhonePrefix`) VALUES
(1, 'AP Circuits', 'Unit 3, 1112-40th Avenue NE, Calgary, AB T2E 5T8, Canada', 'Canada', '1-403-250-3406', '', '1-403-250-3465', 'http://www.apcircuits.com', 'Sales', '', '0000-00-00 00:00:00', 0, 'Ftp: ftp://ftp.apcircuits.com. Tech Support 7am to 3pm (MTN)', 'APCKT', 'S0007', '30DAY', '20-1234578', '12-134', 'staff@apcircuits.com', '', 0, 0, 1, 0, 0),
(2, 'CWS ByteMark', '353 West Grove Avenue, Orange, CA 92865, USA', 'USA', '1-800-679-3184', '', '', 'http://www.cwsbytemark.com', 'Sales', '', '0000-00-00 00:00:00', 0, '', 'CWSBM', 'S0008', 'CREDITCARD', '20-1234579', '12-135', 'sales@cwsbytemark.com', '', 0, 0, 1, 0, 0),
(3, 'Digi-Key', '701 Brooks Avenue South, Thief River Falls, MN 56701, USA', 'USA', '1-800-344-4539', '1-218-681-6674', '1-218-681-3380', 'http://www.digikey.com', 'Sales', 'Sales', '0000-00-00 00:00:00', 0, '', 'DIGIKEY', 'S0005', 'CREDITCARD', '20-1234576', '12-132', '', '', 0, 0, 1, 0, 0),
(4, 'Eagle Park Machinery', '605 Central Avenue, Albany, New York 12206, USA', 'USA', '1-518-438-5854', '', '', 'http://en.wikipedia.org/wiki/Industrial_age', 'Frank Forker, Proprietor', '', '0000-00-00 00:00:00', 0, 'COTS mechanical equipment', 'EAGLE', 'S0001', '45DAY', '20-1234572', '12-128', 'forker@eaglepark.com', '', 0, 0, 1, 0, 0),
(5, 'Maplin', 'Brookfields Way, Manvers, Wath-upon-Dearne, Rotherham, South Yorkshire S63 5DL, Great Britain', 'Great Britain', '011-44-0844-557-6000', '', '011-44-0844-557-6001', 'http://www.maplin.co.uk', 'Sales', '', '0000-00-00 00:00:00', 0, '', 'MAPLIN', 'S0004', 'CREDITCARD', '20-1234575', '12-131', 'sales@maplin.co.uk', '', 0, 0, 1, 0, 0),
(6, 'Merton''s Machine Shop', '85 South Main Street, Barre, Vermont 05641, USA', 'USA', '1-802-479-5345', '', '', 'http://en.wikipedia.org/wiki/Machining', 'Thomas Merton, Proprietor', '', '0000-00-00 00:00:00', 0, 'Custom mechanical components', 'MERTON', 'S0003', '45DAY', '20-1234574', '12-130', 'merton@mms.com', '', 0, 0, 1, 0, 0),
(7, 'Newark', '4801 N. Ravenswood, Chicago, IL 60640-4496, USA', 'USA', '1-800-463-9275', '1-800-639-2758', '1-888-551-4801', 'http://www.newark.com', 'Sales & Service', 'Web Site Support', '0000-00-00 00:00:00', 0, '', 'NEWARK', 'S0006', 'CREDITCARD', '20-1234577', '12-133', '', '', 0, 0, 1, 0, 0),
(8, 'Shopton Hardware', '6600 Germany Road, Shopton, NY 13054, USA', 'USA', '1-315-363-6799', '', '', 'http://en.wikipedia.org/wiki/Nuts_and_Bolts_%28general_relativity%29', 'Henry Harrison, Proprietor', '', '0000-00-00 00:00:00', 0, 'COTS mechanical fasteners', 'SHPTHW', 'S0002', '30DAY', '20-1234573', '12-129', 'harrison@shoptonhw.com', '', 0, 0, 1, 0, 0),
(9, 'Trilogy-Net', '#8, 3320-14th Avenue NE, Calgary, Alberta T2A 6J4, Canada', 'Canada', '1-403-219-8868', '', '1-403-219-8860', 'http://www.trilogy-net.com/', 'Sales', '', '0000-00-00 00:00:00', 0, '', 'TRLGYNT', 'S0009', '30DAY', '20-1234580', '12-136', 'info@trilogy-net.com', '', 0, 0, 1, 0, 0),
(10, 'Uline Canada', '60 Hereford St., Brampton, ON L6Y-0N3, Canada', 'Canada', '1-800-958-5463', '', '1-800-295-5571', 'http://www.uline.ca', '', '', '0000-00-00 00:00:00', 0, '', 'ULINE', 'S0010', 'CREDITCARD', '20-1234578', '12-134', 'customer.service@uline.ca', '', 0, 0, 1, 0, 0),
(11, 'Miracle Imprint', '4019 - 4 Street S.E., Calgary T2G 2W4, AB, Canada', 'Canada', '1-403-243-6306', '1-877-369-9197', '1-403-243-8029', 'http://www.miracleimprint.com/', '', '', '0000-00-00 00:00:00', 0, '', 'MIRACLE', 'S0011', '30DAY', '20-1234578', '12-134', 'orders@miracleimprint.com', '', 0, 0, 1, 0, 0),
(12, 'Uline', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', 0, '', '', '', '', '', '', '', '', 0, 0, 1, 0, 0);

--
-- Dumping data for table `tbl_pv_type`
--

INSERT INTO `tbl_pv_type` (`id`, `TYPEType`) VALUES
(1, 'AW'),
(2, 'DOC'),
(3, 'DWG'),
(4, 'PL'),
(5, 'PS'),
(6, 'CAT');

--
-- Dumping data for table `tbl_pv_un`
--

INSERT INTO `tbl_pv_un` (`id`, `UNUseUnits`, `UNPurchUnits`, `UNConvUnits`) VALUES
(1, 'each', 'each', 1),
(20, 'each', 'Lot10', 10),
(21, 'each', 'Lot100', 100),
(22, 'inch', 'spool66FT', 792),
(23, 'cm', 'spool100FT', 3048),
(24, 'cm', 'spool19300FT', 588264);

--
-- Dumping data for table `tbl_stock_location`
--

INSERT INTO `tbl_stock_location` (`id`, `name`, `use_sublocation`, `sublocation_min`, `sublocation_max`) VALUES
(1, 'DOCS', 1, 1, 10),
(2, 'ELEC-COMPS', 1, 1, 20),
(3, 'ELEC-CONNS', 1, 1, 10),
(4, 'ELEC-PCB', 1, 1, 10),
(5, 'ELEC-WIRE', 1, 1, 10),
(6, 'FINGOODS', 1, 1, 10),
(7, 'MECH', 1, 1, 10),
(8, 'MECH-HW', 1, 1, 10),
(9, 'SHIPPING', 1, 1, 10),
(10, 'SHOPSUP', 1, 1, 10),
(11, 'YARD', 0, 0, 0);

--
-- Dumping data for table `tbl_stock_serial`
--

INSERT INTO `tbl_stock_serial` (`id`, `serial_number`, `part_number`, `description`, `version`, `status`, `part_id`) VALUES
(1, '2003-001', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'DESTROYED', NULL),
(2, '2003-002', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'DESTROYED', NULL),
(3, '2003-003', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'DESTROYED', NULL),
(4, '2003-004', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'DESTROYED', NULL),
(5, '2003-005', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'DESTROYED', NULL),
(6, '2003-006', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'DESTROYED', NULL),
(7, '2003-007', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(8, '2003-008', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(9, '2003-009', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(10, '2003-010', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(11, '2003-011', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(12, '2003-012', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(13, '2003-013', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(14, '2003-014', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(15, '2003-015', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(16, '2003-016', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(17, '2003-017', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(18, '2003-018', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(19, '2003-019', '20000003', 'PCA,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(20, '1001-001', '20000003', 'ASSY,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(21, '1001-002', '10000001', 'ASSY,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(22, '1001-003', '10000001', 'ASSY,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(23, '1001-004', '10000001', 'ASSY,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(24, '1001-005', '10000001', 'ASSY,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL),
(25, '1001-006', '10000001', 'ASSY,AIRCRAFT WIRELESS', '1', 'ACTIVE', NULL);

SET FOREIGN_KEY_CHECKS=1;