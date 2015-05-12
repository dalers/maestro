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
-- CASE 1 - csv created by mysql on unix
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
-- CASE 3 - csv created by Excel on Windows
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

-- currency (origin: parts&vendors CUR)
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

-- customer (customer.xlsx, based on parts&vendors CU)
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

-- customer (origin: parts&vendors CU)
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

-- file (origin: parts&vendors FIL)
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
-- non-conformance-type issues (BUG or FEATURE)(issue.xlsx)
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
(id,name,description,@owner_id,@part_id,@project_id,@requester_id,@status_id,@stock_id,@type_id,create_time,create_user_id,update_time,update_user_id)
SET
    owner_id     = nullif(@owner_id, ''),
    project_id   = nullif(@project_id, ''),
    requester_id = nullif(@part_id, ''),
    status_id    = nullif(@status_id, ''),
    type_id      = nullif(@type_id, '');

-- issue
-- TASK-type issues (project activities/tasks)(GanttProject -> csv -> project.xlsx -> csv)
-- Windows EOL
LOAD DATA INFILE '/home/maestro/scc/csv/project-issue.csv'
INTO TABLE maestro.tbl_issue
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(id,name,type_id,status_id,begin_date,end_date,duration,completion,outline_number,cost,web_link,description,owner_id,project_id,create_time,create_user_id,update_time,update_user_id);

-- issue_list
-- issues determined to be related (child issues)
-- Windows EOL
-- LOAD DATA INFILE '/home/maestro/scc/csv/issue_list.csv'
-- INTO TABLE maestro.tbl_issue_list
-- CHARACTER SET ascii
-- FIELDS
-- 	TERMINATED BY ','
-- 	OPTIONALLY ENCLOSED BY '"'
-- 	ESCAPED BY '"'
-- LINES
-- 	TERMINATED BY '\r\n'
-- IGNORE 1 LINES
-- (id,issue_id,related_id);

-- issue_part_assignment
-- parts required to resolve an issue, or which themselves require resolution
-- Windows EOL
-- LOAD DATA INFILE '/home/maestro/scc/csv/issue_part_assignment].csv'
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

-- issue_predecessor_assignment
-- issues which require resolution before an issue (GanttProject -> csv -> project.xlsx -> csv)
-- Windows EOL
LOAD DATA INFILE '/home/maestro/scc/csv/project-issue-predecessor.csv'
INTO TABLE maestro.tbl_issue_predecessor_assignment
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(issue_id,predecessor_id);

-- issue_stock_assignment (GanttProject -> csv -> project.xlsx -> csv)
-- stock required to resolve an issue, or which themselves require resolution
-- Windows EOL
-- LOAD DATA INFILE '/home/maestro/scc/csv/issue_stock_assignment.csv'
-- INTO TABLE maestro.tbl_issue_stock_assignment
-- CHARACTER SET ascii
-- FIELDS
--	TERMINATED BY ','
--	OPTIONALLY ENCLOSED BY '"'
--	ESCAPED BY '"'
-- LINES
--	TERMINATED BY '\r\n'
-- IGNORE 1 LINES
-- (issue_id,stock_id);

-- issue_user_assignment (GanttProject -> csv -> project.xlsx -> csv)
-- Windows EOL
LOAD DATA INFILE '/home/maestro/scc/csv/project-issue-user.csv'
INTO TABLE maestro.tbl_issue_user_assignment
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(issue_id,user_id);

-- manufacturer (origin: parts&vendors MFR)
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

-- manufacturer_part (origin: parts&vendors MFRPN)
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

-- order (origin: parts&vendors JOB - PV6EX and PV6ECO only)
-- job master data for customer jobs
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_job.csv'
INTO TABLE maestro.tbl_order
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,JOBNumber,JOBCUID,JOBCustomer,JOBDateCreated,JOBDatePromised,JOBDateCompleted,JOBAccount,JOBNotes,JOBAllocateStock,JOBFOB,JOBTerms,JOBShipMethod,JOBAttnTo,JOBTaxRate,JOBTaxRate2,JOBTax2OnTax1,JOBTotalCost,JOBSubTotalCost,JOBTotalPrice,JOBSubTotalPrice,JOBTax1,JOBTax2,JOBCustOrderNumber,JOBDateInvoiced,JOBDateShipped);

-- order_item (origin: parts&vendors TASK - PV6EX, PV6ECO)	
-- line items for jobs	
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_task.csv'
INTO TABLE maestro.tbl_order_item
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,TASKJOBID,TASKPNID,TASKIHPartNumber,TASKPartNumber,TASKRevision,TASKDescription,TASKItem,TASKQty,TASKCost,TASKCostExt,TASKPrice,TASKPriceExt,TASKNotes,TASKShowOnQuote,TASKShowOnInvoice,TASKShowOnPackingList,TASKTaxable,TASKPriceExtPlusTax);

-- order_item_stock_assignment
-- NO DATA

-- part (origin: parts&vendors PN)
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
(id,PNIDToLNK,PNUNID,@PNTabParentID,PNPrefix,PNPartNumber,PNSuffix,PNType,PNRevision,PNTitle,PNDetail,PNStatus,PNReqBy,PNNotes,PNUser1,PNUser2,PNUser3,PNUser4,PNUser5,PNUser6,PNUser7,PNUser8,PNUser9,PNUser10,PNDate,PNTab,PNControlled,PNAux1,PNQty,PNQty2,PNCostChanged,PNParentCost,PNExpandList,PNAssyCostOption,PNInclAssyOnPurchList,PNMadeFrom,PNMinStockQty,PNOrderToMaintain,PNOnECO,PNOverKit,PNOverKitQty,PNOverKitBy,PNOverKitFor,PNCurrentCost,PNLastRollupCost,PNUSRID,PNUserLock)
SET
    PNTabParentID = nullif(@PNTabParentID, '');

-- part_cost (origin: parts&vendors COST)
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

-- part_list (origin: parts&vendors PL)
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

-- part_source_assignment (origin: parts&vendors LNK)
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

-- part_type (origin: parts&vendors TYPE)
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

-- project (GanttProject -> csv -> project.xlsx -> csv)
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

-- NO DATA
-- project_user_assignment (GanttProject -> csv -> project.xlsx -> csv)
-- Windows EOL
-- LOAD DATA INFILE '/home/maestro/scc/csv/project_user_assignment.csv'
-- INTO TABLE maestro.tbl_project_user_assignment
-- CHARACTER SET ascii
-- FIELDS
-- 	TERMINATED BY ','
-- 	OPTIONALLY ENCLOSED BY '"'
-- 	ESCAPED BY '"'
-- LINES
-- 	TERMINATED BY '\r\n'
-- IGNORE 1 LINES
-- (project_id,user_id);

-- purchase_order (origin: parts&vendors POM - PV6EX and PV6ECO only)
-- purchase order and RFQ master data
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_pom.csv'
INTO TABLE maestro.tbl_purchase_order
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,POMNumber,POMDatePrinted,POMSupplier,POMSUID,POMAccount,POMNotes,POMAttnTo,POMFromBuyer,POMEngrgContact,POMDateReq,POMDateClosed,POMFOB,POMTerms,POMInsurance,POMUseOurShpngAcct,POMShippingAcct,POMThisIsRFQ,POMPendingPrint,POMTaxRate,POMShipMethod,POMShipTo,POMTaxRate2,POMTaxTotal2,POMTax2OnTax1,POMTotalCost,POMTotalTax,POMSubTotal,POMCURID,POMCurName,POMCurExRate,POMDateReqDate);

-- purchase_order_item (origin: parts&vendors PO - PV6EX and PV6ECO only)
-- line items on RFQs and POs
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_po.csv'
INTO TABLE maestro.tbl_purchase_order_item
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,POPOMID,POLNKID,POItem,POPart,PORev,PODescription,POReceived,POPurchUnits,POUseUnits,POConvUnits,PORFQQty,POAcct,POIHPart,POSchedule,POTaxable,POTaxable2,POExtension,POExtPlusTax,POCost,POQty,POItemQtyEntry,POItemQtyReceived,POItemQtyBackordered,POTax1,POTax2);

-- shipper (origin: parts&vendors SHIP - PV6EX and PV6ECO only)
-- shipping methods for reference by POs
-- Unix EOL
LOAD DATA INFILE '/home/maestro/scc/csv/pv_ship.csv'
INTO TABLE maestro.tbl_shipper
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(id,SHIPMethod);

-- stock (stock.xlsx)
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

-- stock_location (stock_location.xlsx)
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

-- supplier (origin: parts&vendors SU)
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

-- supplier_manufacturer_assignment (origin: parts&vendors LIN)
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

-- unit (origin: parts&vendors UNIT)
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

-- user (user.xlsx)
-- Windows EOL
LOAD DATA INFILE '/home/maestro/scc/csv/user.csv'
INTO TABLE maestro.tbl_user
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(id,username,@password,email,nick,lname,fname,initial,status_id,profile_id)
SET
    password = MD5(@password);

-- parts&vendors
-- tables specific to PV6EX or PV6ECO and not yet fully understood, or to be refactored

-- pv_al (PV6EX and PV6ECO only)
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
-- refactored to part_cost

-- pv_cu
-- refactored to customer

-- pv_cur
-- refactored to currency

-- pv_dept (PV6ECO & only if schema installed)
-- eco sign-off departments

-- pv_eco (PV6ECO & only if schema installed)
-- eco master data

-- pv_fil
-- refactored to file

-- pv_grp (PV6EX, PV6ECO & only if schema installed)
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
-- WARNING!! HPREF includes license string in plain text, TODO do not load license key?
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

-- pv_job
-- refactored to order

-- pv_lin
-- refactored to supplier_manufacturer_assignment

-- pv_lnk
-- refactored to part_source_assignment

-- pv_mf (PV6EX and PV6ECO only)
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
-- refactored to manufacturer

-- pv_mfrpn
-- refactored to manufacturer_part

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
-- refactored to part_list

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
-- refactored to part

-- pv_po (PV6EX and PV6ECO only)
-- refactored to purchase_order_item

-- pv_pod (PV6EX and PV6ECO only)
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

-- pv_pom (PV6EX and PV6ECO only)
-- refactored to purchase_order

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
-- refactored to shipper

-- pv_su
-- refactored to supplier

-- pv_task (PV6EX, PV6ECO)
-- refactored to order_item

-- pv_type
-- refactored to part_type

-- pv_un
-- refactored to unit

-- --------------
-- Cleanup
-- --------------

-- re-enable foreign key constraint checking
SET foreign_key_checks = 1;
-- re-enable unique constraint checking
SET unique_checks = 0;
