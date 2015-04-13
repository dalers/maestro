-- load current data from csv
--
-- This script is the Transform/Load portion of the ETL (Export-Transform-Load)
-- process (export_current_to_csv.sh is the Export portion).
--
-- HARDCODED file paths
-- > mysql -uroot -p --local-infile=1 --show-warnings --verbose < /path/to/load_current_from_csv.sql
--
-- import from csv files in /home/maestro/csv/
--   if from 
--   Windows File/SaveAs
--     - Win EOL
--     - currently do not include id (pk)
--   mdbtools (mdb-export)
--     - unix EOL, comma delimited
--     - table id maintained (pk) if referenced in foreign key relationship
--
-- Table by Table Structure
-- --------------------------------------------------------
-- [table name]
-- [Unix EOL, tab delimited]
--
-- CSV                  [TABLE]
-- -----------------------------------------------
-- [csv field name]     [Maestro table column name], comment if used, if used as pk, ...
-- ...
--
-- CASE 1 - csv created by mysql client on unix (i.e. unix to unix)
--
-- LOAD DATA INFILE '/home/maestro/scc/csv/filename.csv'
-- INTO TABLE epd2.tbl_maestro_table_name
-- CHARACTER SET LATIN1
--
-- FIELDS
--	TERMINATED BY '\t'
-- LINES
--	TERMINATED BY '\n'
-- IGNORE 1 LINES
--	(<list of comman-separated destination column names for each column in csv, make @columnname to assign to variable (and potentially not use)>)
-- SET
--	foo_id = nullif(@fool_id, 'NULL'),  -- e.g. if foo_id column in csv has NULL spelled out in letters
--	datebar = nullif(@datebar, 'NULL'); --  or e.g. if datebar column has NULL spelled out in letters (or other individual special case)
--
-- CASE 2 - csv created by mdb-export on unix
--
-- LOAD DATA INFILE '/home/maestro/scc/pv_pn.csv'
-- INTO TABLE maestro.tbl_part
-- CHARACTER SET ascii
-- FIELDS
--	TERMINATED BY ','
--	OPTIONALLY ENCLOSED BY '"'
--	ESCAPED BY '"'
-- LINES
--	TERMINATED BY '\n'
-- IGNORE 1 LINES
-- (id,PNIDToLNK,PNUNID,PNTabParentID,PNPrefix,PNPartNumber,PNSuffix,PNType,PNRevision,PNTitle,PNDetail,PNStatus,PNReqBy,PNNotes,PNUser1,PNUser2,PNUser3,PNUser4,PNUser5,PNUser6,PNUser7,PNUser8,PNUser9,PNUser10,PNDate,PNTab,PNControlled,PNAux1,PNQty,PNQty2,PNCostChanged,PNParentCost,PNExpandList,PNAssyCostOption,PNInclAssyOnPurchList,PNMadeFrom,PNMinStockQty,PNOrderToMaintain,PNOnECO,PNOverKit,PNOverKitQty,PNOverKitBy,PNOverKitFor,PNCurrentCost,PNLastRollupCost,PNUSRID,PNUserLock);
--
-- CASE 3 - csv created by Windows client
--
-- stock_serial spreadsheet
-- use Windows EOL (CSV created by Excel)
-- LOAD DATA INFILE '/home/maestro/scc/csv/stock_serial.csv'
-- INTO TABLE maestro.tbl_stock_serial
-- CHARACTER SET ascii
-- FIELDS
--	TERMINATED BY ','
--	OPTIONALLY ENCLOSED BY '"'
--	ESCAPED BY '"'
-- LINES
--	TERMINATED BY '\r\n'
-- IGNORE 1 LINES
-- (serial_number,part_number,description,version,status)
-- SET id = NULL;
--

-- foreign key constraints must be disabled during import
SET foreign_key_checks = 0;
-- save time, anything unique is guaranteed to be unique in import
SET unique_checks = 0;

-- activity (GanttProject -> csv -> project.ods -> csv)
-- Windows EOL
--
-- !?! FIRST RECORD FROM CSV DOES NOT LOAD USING FOLLOWING
--     INSTEAD, DATA MANUALLY LOADED FROM CSV USING ADMINER
--     ON SERVER, THEN EXPORTED AS SQL INSERT AND COPIED BELOW
--
-- LOAD DATA INFILE '/home/maestro/scc/csv/activity.csv'
-- INTO TABLE maestro.tbl_activity
-- CHARACTER SET ascii
-- FIELDS
-- 	TERMINATED BY ','
-- 	OPTIONALLY ENCLOSED BY '"'
-- 	ESCAPED BY '"'
-- LINES
-- 	TERMINATED BY '\r\n'
-- IGNORE 1 LINES
-- (id,name,begin_date,end_date,duration,completion,outline_number,cost,web_link,notes,coordinator_id,project_id,create_time,create_user_id,update_time,update_user_id);

INSERT INTO `tbl_activity` (`id`, `name`, `begin_date`, `end_date`, `duration`, `completion`, `outline_number`, `cost`, `web_link`, `notes`, `coordinator_id`, `project_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1,	'prototype 1',	'2015-01-01 00:00:00',	'2015-01-28 00:00:00',	20,	100,	'1.1',	280,	NULL,	'Release of PN 20000004 Rev 00 Parts List with child parts and assemblies for building a small number of prototype units. Assembly includes an earphone, wire for a stubby antenna and preliminary user manual, but no enclosure. Manufacturing process document',	6,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(2,	'design gate 1',	'2015-01-29 00:00:00',	'2015-01-29 00:00:00',	0,	0,	'1.2',	0,	NULL,	NULL,	20,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(3,	'prototype 2',	'2015-01-29 00:00:00',	'2015-02-25 00:00:00',	20,	20,	'1.3',	280,	NULL,	'Revise electrical schematic to correct connectivity of PCB-type inductor, revise PCB design to correct inductor layout, and generate new PCB CAM files. Correct mechanical dimensions of the PCB, create Master Drawing for the PCB, create assembly drawing an',	6,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(4,	'design gate 2',	'2015-02-26 00:00:00',	'2015-02-26 00:00:00',	0,	0,	'1.4',	0,	NULL,	NULL,	20,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(5,	'product release',	'2015-02-26 00:00:00',	'2015-03-25 00:00:00',	20,	0,	'1.5',	490,	NULL,	'Restructuring of parts lists for product release, including creation of a new top-level marketing assembly part number. An enclosure with hardware was added, the manual and earphone were moved to the marketing assembly, and the stubby antenna was removed ',	6,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(6,	'mfg gate 1',	'2015-03-26 00:00:00',	'2015-03-26 00:00:00',	0,	0,	'1.6',	0,	NULL,	NULL,	20,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(7,	'cost/quality improvements',	'2015-03-26 00:00:00',	'2015-04-22 00:00:00',	20,	0,	'1.7',	630,	NULL,	'Circuit board orientation in enclosure was inverted to aid assembly and test (mounted PCA component-side-up in enclosure changed to copper-side-up, allowing direct access to circuit board components and off-board wiring while mounted in the enclosure). Lo',	18,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(8,	'mfg gate 2',	'2015-04-23 00:00:00',	'2015-04-23 00:00:00',	0,	0,	'1.8',	0,	NULL,	NULL,	20,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(9,	'field service kit',	'2015-04-23 00:00:00',	'2015-05-20 00:00:00',	20,	0,	'1.9',	160,	NULL,	'A kit of parts useful for field service was released. The service kit and contents was created in response to requests from field service technicians to provide more effective and efficient field service.',	14,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6),
(10,	'mfg gate 3',	'2015-05-21 00:00:00',	'2015-05-21 00:00:00',	0,	0,	'1.1',	0,	NULL,	NULL,	20,	1,	'2015-01-01 00:00:00',	6,	'2015-01-01 00:00:00',	6);

-- activity_part_assignment (GanttProject -> csv -> project.ods -> csv)
-- Windows EOL
-- LOAD DATA INFILE '/home/maestro/scc/csv/activity_part_assignment].csv'
-- INTO TABLE maestro.tbl_activity_part_assignment
-- CHARACTER SET ascii
-- FIELDS
-- 	TERMINATED BY ','
-- 	OPTIONALLY ENCLOSED BY '"'
-- 	ESCAPED BY '"'
-- LINES
-- 	TERMINATED BY '\r\n'
-- IGNORE 1 LINES
-- (activity_id,part_id);

-- activity_predecessor_assignment (GanttProject -> csv -> project.ods -> csv)
-- Windows EOL
--
-- !?! FIRST RECORD FROM CSV DOES NOT LOAD USING FOLLOWING
--     INSTEAD, DATA MANUALLY LOADED FROM CSV USING ADMINER
--     ON SERVER, THEN EXPORTED AS SQL INSERT AND COPIED BELOW
--
-- LOAD DATA INFILE '/home/maestro/scc/csv/activity_predecessor_assignment.csv'
-- INTO TABLE maestro.tbl_activity_predecessor_assignment
-- CHARACTER SET ascii
-- FIELDS
-- 	TERMINATED BY ','
-- 	OPTIONALLY ENCLOSED BY '"'
-- 	ESCAPED BY '"'
-- LINES
-- 	TERMINATED BY '\r\n'
-- IGNORE 1 LINES
-- (activity_id,predecessor_id);

INSERT INTO `tbl_activity_predecessor_assignment` (`activity_id`, `predecessor_id`) VALUES
(2,	1),
(3,	1),
(4,	3),
(5,	3),
(6,	5),
(7,	5),
(8,	7),
(9,	7),
(10,	9);

-- activity_resource_assignment (GanttProject -> csv -> project.ods -> csv)
-- Windows EOL
--
-- !?! FIRST RECORD FROM CSV DOES NOT LOAD USING FOLLOWING
--     INSTEAD, DATA MANUALLY LOADED FROM CSV USING ADMINER
--     ON SERVER, THEN EXPORTED AS SQL INSERT AND COPIED BELOW
--
-- LOAD DATA INFILE '/home/maestro/scc/csv/activity_resource_assignment.csv'
-- INTO TABLE maestro.tbl_activity_resource_assignment
-- CHARACTER SET ascii
-- FIELDS
-- 	TERMINATED BY ','
-- 	OPTIONALLY ENCLOSED BY '"'
-- 	ESCAPED BY '"'
-- LINES
-- 	TERMINATED BY '\r\n'
-- IGNORE 1 LINES
-- (activity_id,resource_id);

INSERT INTO `tbl_activity_resource_assignment` (`activity_id`, `resource_id`) VALUES
(1,	3),
(3,	3),
(7,	3),
(7,	5),
(1,	6),
(3,	6),
(5,	6),
(7,	6),
(7,	7),
(1,	11),
(5,	14),
(7,	14),
(9,	14),
(5,	18),
(7,	18),
(9,	18),
(5,	19),
(2,	20),
(4,	20),
(5,	20),
(6,	20),
(8,	20),
(9,	20),
(10,	20),
(1,	22),
(3,	23),
(5,	23),
(7,	23),
(9,	23);


-- activity_stock_assignment (GanttProject -> csv -> project.ods -> csv)
-- Windows EOL
-- LOAD DATA INFILE '/home/maestro/scc/csv/activity_stock_assignment.csv'
-- INTO TABLE maestro.tbl_activity_stock_assignment
-- CHARACTER SET ascii
-- FIELDS
--	TERMINATED BY ','
--	OPTIONALLY ENCLOSED BY '"'
--	ESCAPED BY '"'
-- LINES
--	TERMINATED BY '\r\n'
-- IGNORE 1 LINES
-- (activity_id,stock_id);

-- currency (origin parts&vendors CUR)
-- use Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_cur.csv'
INTO TABLE maestro.tbl_currency
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,CURCurrencyName,CURExchangeRate,CURCurrencyChar,CURFormat,CURFormatExt);

-- customer (origin customer spreadsheet, based on parts&vendors CU table)
-- Windows EOL
-- LOAD DATA INFILE '/home/maestro/scc/csv/customer.csv'
-- INTO TABLE maestro.tbl_customer
-- CHARACTER SET ascii
-- FIELDS
-- 	TERMINATED BY ','
-- 	OPTIONALLY ENCLOSED BY '"'
-- 	ESCAPED BY '"'
-- LINES
-- 	TERMINATED BY '\r\n'
-- IGNORE 1 LINES
-- (id,CUCustomer,CUAddress,CUShipAddress,CUPhone1,CUPhone2,CUContact1,CUContact2,CUFax,CUEmail1,CUEmail2,CUNotes,CUWeb,CUCode,CUAccount,CUTerms,CUFedTaxID,CUStateTaxID,CUNoPhonePrefix);

-- customer (origin parts&vendors CU table)
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_cu.csv'
INTO TABLE maestro.tbl_customer
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,CUCustomer,CUAddress,CUShipAddress,CUPhone1,CUPhone2,CUContact1,CUContact2,CUFax,CUEmail1,CUEmail2,CUNotes,CUWeb,CUCode,CUAccount,CUTerms,CUFedTaxID,CUStateTaxID,CUNoPhonePrefix);

-- file (origin parts&vendors FIL table)
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_fil.csv'
INTO TABLE maestro.tbl_file
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,part_id,FILPNPartNumber,FILFilePath,FILFileName,FILView,FILNotes);

-- issue
-- Windows EOL
LOAD DATA INFILE '/home/maestro/scc/csv/issue.csv'
INTO TABLE maestro.tbl_issue
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(id,name,description,@part_id,@project_id,@type_id,status_id,stock_id,owner_id,create_time,create_user_id,update_time,update_user_id)
SET
    part_id    = nullif(@part_id, ''),
    project_id = nullif(@project_id, ''),
    type_id    = nullif(@type_id, ''),
    status_id  = nullif(@status_id, ''),
    stock_id   = nullif(@stock_id, ''),
    owner_id   = nullif(@owner_id, '');

-- manufacturer (origin parts&vendors MFR table)
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_mfr.csv'
INTO TABLE maestro.tbl_manufacturer
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,MFRMfrName,MFRAddress,MFRCountry,MFRContact1,MFRContact2,MFRPhone1,MFRPhone2,MFRFax,MFRWeb,MFRNotes,MFRCode,MFREMail1,MFREMail2,MFRNoPhonePrefix);

-- manufacturer_part (origin parts&vendors MFRPN table)
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_mfrpn.csv'
INTO TABLE maestro.tbl_manufacturer_part
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
-- (id,MFRPNMFRID,MFRPNPart);
(id,manufacturer_id,MFRPNPart);

-- order

-- order_item

-- order_item_stock_assignment

-- part table (origin parts&vendors PN table)
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_pn.csv'
INTO TABLE maestro.tbl_part
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,PNIDToLNK,PNUNID,PNTabParentID,PNPrefix,PNPartNumber,PNSuffix,PNType,PNRevision,PNTitle,PNDetail,PNStatus,PNReqBy,PNNotes,PNUser1,PNUser2,PNUser3,PNUser4,PNUser5,PNUser6,PNUser7,PNUser8,PNUser9,PNUser10,PNDate,PNTab,PNControlled,PNAux1,PNQty,PNQty2,PNCostChanged,PNParentCost,PNExpandList,PNAssyCostOption,PNInclAssyOnPurchList,PNMadeFrom,PNMinStockQty,PNOrderToMaintain,PNOnECO,PNOverKit,PNOverKitQty,PNOverKitBy,PNOverKitFor,PNCurrentCost,PNLastRollupCost,PNUSRID,PNUserLock);

-- part_cost (origin parts&vendors COST table)
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_cost.csv'
INTO TABLE maestro.tbl_part_cost
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,COSTLNKID,COSTAtQty,COSTLeadtime,COSTCost);

-- part_list (origin parts&vendors PL table)
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_pl.csv'
INTO TABLE maestro.tbl_part_list
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
    (id,PLListID,PLPartID,PLItem,PLQty,PLRefMemo,PLRefText,PLAssyOrder,PLAssySpec,@PLMFRPNID,@PLMFRID,@PLSUID,@PLLNKID)
SET
    PLMFRPNID = nullif(@PLMFRPNID, ''),
    PLMFRID   = nullif(@PLMFRID, ''),
    PLSUID    = nullif(@PLSUID, ''),
    PLLNKID   = nullif(@PLLNKID, '');

-- part_source_assignment (origin parts&vendors LNK table)
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_lnk.csv'
INTO TABLE maestro.tbl_part_source_assignment
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,LNKSUID,LNKMFRPNID,LNKMFRID,LNKUNID,LNKPNID,LNKToPNID,LNKUse,LNKLeadtime,LNKChoice,LNKVendorPN,LNKVendorDesc,LNKAtQty,LNKRFQDate,LNKMinIncrement,LNKCurrentCost,LNKSetupCost,LNKRoHS,LNKRoHSDoc,
LNKRoHSNote);

-- part_type (origin parts&vendors TYPE table)
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_type.csv'
INTO TABLE maestro.tbl_part_type
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,TYPEType);

-- person
-- Windows EOL
LOAD DATA INFILE '/home/maestro/scc/csv/person.csv'
INTO TABLE maestro.tbl_person
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(id,username,password,email,nick,lname,fname,initial,status_id,profile_id);

-- project (GanttProject -> csv -> project.ods -> csv)
-- Windows EOL
LOAD DATA INFILE '/home/maestro/scc/csv/project.csv'
INTO TABLE maestro.tbl_project
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(id,name,code,description,customer_id,owner_id,phase_id,status_id,type_id,create_time,create_user_id,update_time,update_user_id);

-- project_person_assignment (GanttProject -> csv -> project.ods -> csv)
-- Windows EOL
-- LOAD DATA INFILE '/home/maestro/scc/csv/project_person_assignment.csv'
-- INTO TABLE maestro.tbl_project_person_assignment
-- CHARACTER SET ascii
-- FIELDS
-- 	TERMINATED BY ','
-- 	OPTIONALLY ENCLOSED BY '"'
-- 	ESCAPED BY '"'
-- LINES
-- 	TERMINATED BY '\r\n'
-- IGNORE 1 LINES
-- (project_id,person_id);

-- stock
-- Windows EOL
LOAD DATA INFILE '/home/maestro/scc/csv/stock.csv'
INTO TABLE maestro.tbl_stock
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(serial_number,version,part_id,status_id)
SET id = NULL;

-- stock_location
-- Windows EOL
LOAD DATA INFILE '/home/maestro/scc/csv/stock_location.csv'
INTO TABLE maestro.tbl_stock_location
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(name,use_sublocation,sublocation_min,sublocation_max)
SET id = NULL;

-- supplier (origin parts&vendors SU table)
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_su.csv'
INTO TABLE maestro.tbl_supplier
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
-- (id,SUSupplier,SUAddress,SUCountry,SUPhone1,SUPhone2,SUFAX,SUWeb,SUContact1,SUContact2,SUDateLast,SUFollowup,SUNotes,SUCode,SUAccount,SUTerms,SUFedTaxID,SUStateTaxID,SUEMail1,SUEMail2,SUCurDedExRate,SUCurExRate,SUCURID,SUCurReverse,SUNoPhonePrefix);
(id,SUSupplier,SUAddress,SUCountry,SUPhone1,SUPhone2,SUFAX,SUWeb,SUContact1,SUContact2,SUDateLast,SUFollowup,SUNotes,SUCode,SUAccount,SUTerms,SUFedTaxID,SUStateTaxID,SUEMail1,SUEMail2,SUCurDedExRate,SUCurExRate,currency_id,SUCurReverse,SUNoPhonePrefix);

-- supplier_manufacturer_assignment (origin parts&vendors LIN table)
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_lin.csv'
INTO TABLE maestro.tbl_supplier_manufacturer_assignment
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,LINSUID,LINMFRID);

-- unit (origin parts&vendors UNIT table)
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_un.csv'
INTO TABLE maestro.tbl_unit
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,UNUseUnits,UNPurchUnits,UNConvUnits);

-- parts&vendors
-- tables specific to PV6EX or PV6ECO, or not yet fully understood
--
-- pv_al (PV6EX, PV6ECO)
-- for managing client jobs
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_al.csv'
INTO TABLE maestro.tbl_pv_al
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,ALPNID,ALJOBID,ALTASKID,ALJOBNumber,ALQty,ALQtyShort);

-- pv_cnv
-- convert unit of measure? convert PO to RFQ?
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_cnv.csv'
INTO TABLE maestro.tbl_pv_cnv
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id, CNVLNKID);

-- pv_cost
-- refactored to cost table

-- pv_cu
-- refactored to customer table

-- pv_cur
-- refactored to currency table

-- pv_dept table (PV6ECO & only if schema installed)
-- eco sign-off departments

-- pv_eco table (PV6ECO & only if schema installed)
-- eco master data

-- pv_fil
-- refactored to file table

-- pv_grp table (PV6EX, PV6ECO & only if schema installed)
-- user permission groups

-- pv_hist
-- history of bulk inventory adjustments
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_hist.csv'
INTO TABLE maestro.tbl_pv_hist
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,HISTWho,HISTWhat,HISTWhen,HISTWhy,HISTHowMany);

-- pv_hpref
-- database configuration parameters	
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_hpref.csv'
INTO TABLE maestro.tbl_pv_hpref
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,GPREFKey,GPREFText1,GPREFText2,GPREFText3,GPREFText4,GPREFText5,GPREFBool1,GPREFBool2,GPREFBool3,GPREFBool4,GPREFInt1,GPREFText6,GPREFText7,GPREFText8,GPREFText9,GPREFText10);

-- pv_job (PV6EX, PV6ECO)
-- job master data for customer jobs
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_job.csv'
INTO TABLE maestro.tbl_pv_job
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,JOBNumber,JOBCUID,JOBCustomer,JOBDateCreated,JOBDatePromised,JOBDateCompleted,JOBAccount,JOBNotes,JOBAllocateStock,JOBFOB,JOBTerms,JOBShipMethod,JOBAttnTo,JOBTaxRate,JOBTaxRate2,JOBTax2OnTax1,JOBTotalCost,JOBSubTotalCost,JOBTotalPrice,JOBSubTotalPrice,JOBTax1,JOBTax2,JOBCustOrderNumber,JOBDateInvoiced,JOBDateShipped);

-- pv_lin
-- refactored to supplier_manufacturer_assignment table

-- pv_lnk
-- refactored to part_source_assignment table

-- pv_mf (PV6EX, PV6ECO)
-- part made-from relationships
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_mf.csv'
INTO TABLE maestro.tbl_pv_mf
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,MFPNIDParent,MFPNIDSub,MFQty);

-- pv_mfr
-- refactored to manufacturer table

-- pv_mfrpn
-- refactored to manufacturer_part table

-- pv_org
-- user organization details
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_org.csv'
INTO TABLE maestro.tbl_pv_org
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,ORGKey,ORGName,ORGAddress,ORGPhone,ORGFaax,ORGPOUseShpgAddr,ORGRFQUseShpgAddr,ORGListOrder);

-- pv_pl
-- refactored to part_list table

-- pv_pll
-- assembly index for purchase and kitting lists
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_pll.csv'
INTO TABLE maestro.tbl_pv_pll
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,PLLParentListID,PLLSubListID,PLLQty,PLLLevel,PLLCost,PLLItemNumber);

-- pv_pn
-- refactored to part table

-- pv_po (PV6EX, PV6ECO)
-- line items on RFQs and POs
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_po.csv'
INTO TABLE maestro.tbl_pv_po
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,POPOMID,POLNKID,POItem,POPart,PORev,PODescription,POReceived,POPurchUnits,POUseUnits,POConvUnits,PORFQQty,POAcct,POIHPart,POSchedule,POTaxable,POTaxable2,POExtension,POExtPlusTax,POCost,POQty,POItemQtyEntry,POItemQtyReceived,POItemQtyBackordered,POTax1,POTax2);

-- pv_pod (PV6EX, PV6ECO)
-- purchase order data included in PO line item
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_pod.csv'
INTO TABLE maestro.tbl_pv_pod
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,PODField,PODCaption,PODOrder,PODUse,PODNewLine,PODUseCaption,PODMode,PODOrderJOB,PODUseJOB,PODNewLineJOB,PODUseCaptionJOB);

-- pv_pom (PV6EX, PV6ECO)
-- purchase order and RFQ master data
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_pom.csv'
INTO TABLE maestro.tbl_pv_pom
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,POMNumber,POMDatePrinted,POMSupplier,POMSUID,POMAccount,POMNotes,POMAttnTo,POMFromBuyer,POMEngrgContact,POMDateReq,POMDateClosed,POMFOB,POMTerms,POMInsurance,POMUseOurShpngAcct,POMShippingAcct,POMThisIsRFQ,POMPendingPrint,POMTaxRate,POMShipMethod,POMShipTo,POMTaxRate2,POMTaxTotal2,POMTax2OnTax1,POMTotalCost,POMTotalTax,POMSubTotal,POMCURID,POMCurName,POMCurExRate,POMDateReqDate);

-- pv_rpx (PV6EX, PV6ECO)
-- global report layouts
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_rpx.csv'
INTO TABLE maestro.tbl_pv_rpx
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,RPXGrid,RPXName,RPXLayout,RPXLabel,RPXPrimary);

-- pv_ship (PV6EX, PV6ECO)
-- shipping methods for reference by POs
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_ship.csv'
INTO TABLE maestro.tbl_pv_ship
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,SHIPMethod);

-- pv_su
-- refactored to supplier table

-- pv_task (PV6EX, PV6ECO)	
-- line items for jobs	
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_task.csv'
INTO TABLE maestro.tbl_pv_task
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,TASKJOBID,TASKPNID,TASKIHPartNumber,TASKPartNumber,TASKRevision,TASKDescription,TASKItem,TASKQty,TASKCost,TASKCostExt,TASKPrice,TASKPriceExt,TASKNotes,TASKShowOnQuote,TASKShowOnInvoice,TASKShowOnPackingList,TASKTaxable,TASKPriceExtPlusTax);

-- pv_type
-- refactored to part_type table

-- pv_un
-- refactored to unit table

-- --------------
-- Cleanup
-- --------------

-- re-enable foreign key constraint checking
SET foreign_key_checks = 1;
-- re-enable unique constraint checking
SET unique_checks = 0;
