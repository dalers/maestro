-- load current data from csv
--
-- HARDCODED file paths (assumes Maestro reference server)
-- csv files from xls have Win EOL, from mdbtools have unix EOL
-- > mysql -uroot -p --local-infile=1 --show-warnings --verbose < /path/to/load_current_from_csv.sql
--

use maestro;

-- disable foreign key constraint check during data import
SET foreign_key_checks = 0;
-- improve speed of import
SET unique_checks = 0;

-- issue spreadsheet
-- use Windows EOL (CSV created by Excel)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/issue.csv'
INTO TABLE maestro.tbl_issue
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(number,name,description,project,type,corrective_action,cost,status,create_time)
SET id = NULL;

-- person spreadsheet
-- use Windows EOL (CSV created by Excel)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/person.csv'
INTO TABLE maestro.tbl_person
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(username,status,password,email,nick,lname,fname,initial,profile)
SET id = NULL;

-- project spreadsheet
-- use Windows EOL (CSV created by Excel)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/project.csv'
INTO TABLE maestro.tbl_project
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(acct1,acct2,acct3,acct4,name,client,description,type,status,milestone,milestone_date)
SET id = NULL;

-- stock_serial spreadsheet
-- use Windows EOL (CSV created by Excel)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/stock_serial.csv'
INTO TABLE maestro.tbl_stock_serial
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(serial_number,part_number,description,version,status)
SET id = NULL;

-- stock_location spreadsheet
-- use Windows EOL (CSV created by Excel)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/partloc_location.csv'
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

-- Parts&Vendors database
-- primary keys retained from Parts&Vendors tables
-- pig_al
-- no data expected when importing from PV6SE
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_al.csv'
INTO TABLE maestro.tbl_pig_al
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(ALID,ALPNID,ALJOBID,ALTASKID,ALJOBNumber,ALQty,ALQtyShort);

-- pig_cnv
-- typically no data
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_cnv.csv'
INTO TABLE maestro.tbl_pig_cnv
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(CNVSUPID, CNVLNKID);

-- pig_cost
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_cost.csv'
INTO TABLE maestro.tbl_pig_cost
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(COSTID,COSTLNKID,COSTAtQty,COSTLeadtime,COSTCost);

-- pig_cu
-- no data expected when importing from PV6SE
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_cu.csv'
INTO TABLE maestro.tbl_pig_cu
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(CUID,CUCustomer,CUAddress,CUShipAddress,CUPhone1,CUPhone2,CUContact1,CUContact2,CUFax,CUEmail1,CUEmail2,CUNotes,CUWeb,CUCode,CUAccount,CUTerms,CUFedTaxID,CUStateTaxID,CUNoPhonePrefix);

-- pig_cur
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_cur.csv'
INTO TABLE maestro.tbl_pig_cur
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(CURID,CURCurrencyName,CURExchangeRate,CURCurrencyChar,CURFormat,CURFormatExt);

-- pig_fil
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_fil.csv'
INTO TABLE maestro.tbl_pig_fil
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(FILID,FILPNID,FILPNPartNumber,FILFilePath,FILFileName,FILView,FILNotes);

-- pig_hist
-- no data expected if part quantities are not managed
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_hist.csv'
INTO TABLE maestro.tbl_pig_hist
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(HISTID,HISTWho,HISTWhat,HISTWhen,HISTWhy,HISTHowMany);

-- pig_hpref
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_hpref.csv'
INTO TABLE maestro.tbl_pig_hpref
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(GPREFID,GPREFKey,GPREFText1,GPREFText2,GPREFText3,GPREFText4,GPREFText5,GPREFBool1,GPREFBool2,GPREFBool3,GPREFBool4,GPREFInt1,GPREFText6,GPREFText7,GPREFText8,GPREFText9,GPREFText10);

-- pig_job
-- no data expected when importing from PV6SE
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_job.csv'
INTO TABLE maestro.tbl_pig_job
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(JOBID,JOBNumber,JOBCUID,JOBCustomer,JOBDateCreated,JOBDatePromised,JOBDateCompleted,JOBAccount,JOBNotes,JOBAllocateStock,JOBFOB,JOBTerms,JOBShipMethod,JOBAttnTo,JOBTaxRate,JOBTaxRate2,JOBTax2OnTax1,JOBTotalCost,JOBSubTotalCost,JOBTotalPrice,JOBSubTotalPrice,JOBTax1,JOBTax2,JOBCustOrderNumber,JOBDateInvoiced,JOBDateShipped);

-- pig_lin
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_lin.csv'
INTO TABLE maestro.tbl_pig_lin
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(LINID,LINSUID,LINMFRID);

-- pig_lnk
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_lnk.csv'
INTO TABLE maestro.tbl_pig_lnk
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(LNKID,LNKSUID,LNKMFRPNID,LNKMFRID,LNKUNID,LNKPNID,LNKToPNID,LNKUse,LNKLeadtime,LNKChoice,LNKVendorPN,LNKVendorDesc,LNKAtQty,LNKRFQDate,LNKMinIncrement,LNKCurrentCost,LNKSetupCost,LNKRoHS,LNKRoHSDoc,
LNKRoHSNote);

-- pig_mf
-- no data expected when importing from PV6SE (or if PVEX/ECO and no made-from parts)
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_mf.csv'
INTO TABLE maestro.tbl_pig_mf
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(MFID,MFPNIDParent,MFPNIDSub,MFQty);

-- pig_mfr
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_mfr.csv'
INTO TABLE maestro.tbl_pig_mfr
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(MFRID,MFRMfrName,MFRAddress,MFRCountry,MFRContact1,MFRContact2,MFRPhone1,MFRPhone2,MFRFax,MFRWeb,MFRNotes,MFRCode,MFREMail1,MFREMail2,MFRNoPhonePrefix);

-- pig_mfrpn
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_mfrpn.csv'
INTO TABLE maestro.tbl_pig_mfrpn
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(MFRPNID,MFRPNMFRID,MFRPNPart);

-- pig_org
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_org.csv'
INTO TABLE maestro.tbl_pig_org
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(ORGID,ORGKey,ORGName,ORGAddress,ORGPhone,ORGFaax,ORGPOUseShpgAddr,ORGRFQUseShpgAddr,ORGListOrder);

-- pig_pl
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_pl.csv'
INTO TABLE maestro.tbl_pig_pl
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(PLID,PLListID,PLPartID,PLItem,PLQty,PLRefMemo,PLRefText,PLAssyOrder,PLAssySpec,PLMFRPNID,PLMFRID,PLSUID,PLLNKID);

-- pig_pll
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_pll.csv'
INTO TABLE maestro.tbl_pig_pll
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(PLLID,PLLParentListID,PLLSubListID,PLLQty,PLLLevel,PLLCost,PLLItemNumber);

-- pig_pn
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_pn.csv'
INTO TABLE maestro.tbl_pig_pn
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(PNID,PNIDToLNK,PNUNID,PNTabParentID,PNPrefix,PNPartNumber,PNSuffix,PNType,PNRevision,PNTitle,PNDetail,PNStatus,PNReqBy,PNNotes,PNUser1,PNUser2,PNUser3,PNUser4,PNUser5,PNUser6,PNUser7,PNUser8,PNUser9,PNUser10,PNDate,PNTab,PNControlled,PNAux1,PNQty,PNQty2,PNCostChanged,PNParentCost,PNExpandList,PNAssyCostOption,PNInclAssyOnPurchList,PNMadeFrom,PNMinStockQty,PNOrderToMaintain,PNOnECO,PNOverKit,PNOverKitQty,PNOverKitBy,PNOverKitFor,PNCurrentCost,PNLastRollupCost,PNUSRID,PNUserLock);

-- pig_po
-- no data expected when importing from PV6SE
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_po.csv'
INTO TABLE maestro.tbl_pig_po
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(POID,POPOMID,POLNKID,POItem,POPart,PORev,PODescription,POReceived,POPurchUnits,POUseUnits,POConvUnits,PORFQQty,POAcct,POIHPart,POSchedule,POTaxable,POTaxable2,POExtension,POExtPlusTax,POCost,POQty,POItemQtyEntry,POItemQtyReceived,POItemQtyBackordered,POTax1,POTax2);

-- pig_pod
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_pod.csv'
INTO TABLE maestro.tbl_pig_pod
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(PODID,PODField,PODCaption,PODOrder,PODUse,PODNewLine,PODUseCaption,PODMode,PODOrderJOB,PODUseJOB,PODNewLineJOB,PODUseCaptionJOB);

-- pig_pom
-- no data expected when importing from PV6SE
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_pom.csv'
INTO TABLE maestro.tbl_pig_pom
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(POMID,POMNumber,POMDatePrinted,POMSupplier,POMSUID,POMAccount,POMNotes,POMAttnTo,POMFromBuyer,POMEngrgContact,POMDateReq,POMDateClosed,POMFOB,POMTerms,POMInsurance,POMUseOurShpngAcct,POMShippingAcct,POMThisIsRFQ,POMPendingPrint,POMTaxRate,POMShipMethod,POMShipTo,POMTaxRate2,POMTaxTotal2,POMTax2OnTax1,POMTotalCost,POMTotalTax,POMSubTotal,POMCURID,POMCurName,POMCurExRate,POMDateReqDate);

-- pig_rpx
-- no data expected when importing from PV6SE
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_rpx.csv'
INTO TABLE maestro.tbl_pig_rpx
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(RPXID,RPXGrid,RPXName,RPXLayout,RPXLabel,RPXPrimary);

-- pig_ship
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_ship.csv'
INTO TABLE maestro.tbl_pig_ship
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(SHIPID,SHIPMethod);

-- pig_su
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_su.csv'
INTO TABLE maestro.tbl_pig_su
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(SUID,SUSupplier,SUAddress,SUCountry,SUPhone1,SUPhone2,SUFAX,SUWeb,SUContact1,SUContact2,SUDateLast,SUFollowup,SUNotes,SUCode,SUAccount,SUTerms,SUFedTaxID,SUStateTaxID,SUEMail1,SUEMail2,SUCurDedExRate,SUCurExRate,SUCURID,SUCurReverse,SUNoPhonePrefix);

-- pig_task
-- no data expected when importing from PV6SE
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_task.csv'
INTO TABLE maestro.tbl_pig_task
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(TASKID,TASKJOBID,TASKPNID,TASKIHPartNumber,TASKPartNumber,TASKRevision,TASKDescription,TASKItem,TASKQty,TASKCost,TASKCostExt,TASKPrice,TASKPriceExt,TASKNotes,TASKShowOnQuote,TASKShowOnInvoice,TASKShowOnPackingList,TASKTaxable,TASKPriceExtPlusTax);

-- pig_type
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_type.csv'
INTO TABLE maestro.tbl_pig_type
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(TYPEID,TYPEType);

-- pig_un
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pig_un.csv'
INTO TABLE maestro.tbl_pig_un
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(UNID,UNUseUnits,UNPurchUnits,UNConvUnits);

-- --------------
-- Cleanup
-- --------------

-- re-enable foreign key constraint checking
SET foreign_key_checks = 1;
-- re-enable unique constraint checking
SET unique_checks = 0;
