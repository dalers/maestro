-- load csv legacy data
--
-- normally executed from load_demo_csv_win.sh
-- assumes csv files have Windows EOL marker
-- file paths hardcoded for server (XAMPP)
--
-- > mysql -uroot -p --local-infile=1 --show-warnings --verbose < /path/to/load_maestro_win.sql
--

use maestro;

-- disable foreign key constraint check during data import
SET foreign_key_checks = 0;
-- improve speed of import
SET unique_checks = 0;

-- stock serial numbers
-- use Windows EOL (CSV created by Excel on Windows)
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
(serial_number,part_number,revision,status)
SET id = NULL;

-- projects
-- use Windows EOL (CSV created by Excel on Windows)
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
(project, client, description, client_date, status)
SET id = NULL;

-- issues
-- use Windows EOL (CSV created by Excel on Windows)
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
(issue_num, project, issue_type, issue_description, date_reported)
SET id = NULL;

-- stock locations
-- use Windows EOL (CSV created by Excel on Windows)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/stock_location.csv'
INTO TABLE maestro.tbl_stock_location
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(location_name,use_sublocation,sublocation-min-num,sublocation-max-num)
SET id = NULL;

-- person (spreadsheet)
-- use Windows EOL (CSV created by Excel on Windows)
LOAD DATA INFILE 'C:/xampp/htdocs/epd2/protected/data/csv/person.csv'
INTO TABLE epd2.tbl_person
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(login,nick,lname,fname,initial,email)
SET id = NULL;

-- Parts&Vendors(TM)
-- primary keys retained from source tables

-- pv_al
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_al.csv'
INTO TABLE maestro.tbl_pv_al
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(ALID,ALPNID,ALJOBID,ALTASKID,ALJOBNumber,ALQty,ALQtyShort);

-- pv_cnv
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_cnv.csv'
INTO TABLE maestro.tbl_pv_cnv
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(CNVSUPID, CNVLNKID);

-- pv_cost
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_cost.csv'
INTO TABLE maestro.tbl_pv_cost
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(COSTID,COSTLNKID,COSTAtQty,COSTLeadtime,COSTCost);

-- pv_cu
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_cu.csv'
INTO TABLE maestro.tbl_pv_cu
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(CUID,CUCustomer,CUAddress,CUShipAddress,CUPhone1,CUPhone2,CUContact1,CUContact2,CUFax,CUEmail1,CUEmail2,CUNotes,CUWeb,CUCode,CUAccount,CUTerms,CUFedTaxID,CUStateTaxID,CUNoPhonePrefix);

-- pv_cur
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_cur.csv'
INTO TABLE maestro.tbl_pv_cur
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(CURID,CURCurrencyName,CURExchangeRate,CURCurrencyChar,CURFormat,CURFormatExt);

-- pv_fil
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_fil.csv'
INTO TABLE maestro.tbl_pv_fil
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(FILID,FILPNID,FILPNPartNumber,FILFilePath,FILFileName,FILView,FILNotes);

-- pv_hist
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_hist.csv'
INTO TABLE maestro.tbl_pv_hist
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(HISTID,HISTWho,HISTWhat,HISTWhen,HISTWhy,HISTHowMany);

-- pv_hpref
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_hpref.csv'
INTO TABLE maestro.tbl_pv_hpref
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(GPREFID,GPREFKey,GPREFText1,GPREFText2,GPREFText3,GPREFText4,GPREFText5,GPREFBool1,GPREFBool2,GPREFBool3,GPREFBool4,GPREFInt1,GPREFText6,GPREFText7,GPREFText8,GPREFText9,GPREFText10);

-- pv_job
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_job.csv'
INTO TABLE maestro.tbl_pv_job
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(JOBID,JOBNumber,JOBCUID,JOBCustomer,JOBDateCreated,JOBDatePromised,JOBDateCompleted,JOBAccount,JOBNotes,JOBAllocateStock,JOBFOB,JOBTerms,JOBShipMethod,JOBAttnTo,JOBTaxRate,JOBTaxRate2,JOBTax2OnTax1,JOBTotalCost,JOBSubTotalCost,JOBTotalPrice,JOBSubTotalPrice,JOBTax1,JOBTax2,JOBCustOrderNumber,JOBDateInvoiced,JOBDateShipped);

-- pv_lin
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_lin.csv'
INTO TABLE maestro.tbl_pv_lin
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(LINID,LINSUID,LINMFRID);

-- pv_lnk
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_lnk.csv'
INTO TABLE maestro.tbl_pv_lnk
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

-- pv_mf
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_mf.csv'
INTO TABLE maestro.tbl_pv_mf
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(MFID,MFPNIDParent,MFPNIDSub,MFQty);

-- pv_mfr
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_mfr.csv'
INTO TABLE maestro.tbl_pv_mfr
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(MFRID,MFRMfrName,MFRAddress,MFRCountry,MFRContact1,MFRContact2,MFRPhone1,MFRPhone2,MFRFax,MFRWeb,MFRNotes,MFRCode,MFREMail1,MFREMail2,MFRNoPhonePrefix);

-- pv_mfrpn
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_mfrpn.csv'
INTO TABLE maestro.tbl_pv_mfrpn
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(MFRPNID,MFRPNMFRID,MFRPNPart);

-- pv_org
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_org.csv'
INTO TABLE maestro.tbl_pv_org
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(ORGID,ORGKey,ORGName,ORGAddress,ORGPhone,ORGFaax,ORGPOUseShpgAddr,ORGRFQUseShpgAddr,ORGListOrder);

-- pv_pl
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_pl.csv'
INTO TABLE maestro.tbl_pv_pl
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(PLID,PLListID,PLPartID,PLItem,PLQty,PLRefMemo,PLRefText,PLAssyOrder,PLAssySpec,PLMFRPNID,PLMFRID,PLSUID,PLLNKID);

-- pv_pll
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_pll.csv'
INTO TABLE maestro.tbl_pv_pll
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(PLLID,PLLParentListID,PLLSubListID,PLLQty,PLLLevel,PLLCost,PLLItemNumber);

-- pv_pn
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_pn.csv'
INTO TABLE maestro.tbl_pv_pn
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(PNID,PNIDToLNK,PNUNID,PNTabParentID,PNPrefix,PNPartNumber,PNSuffix,PNType,PNRevision,PNTitle,PNDetail,PNStatus,PNReqBy,PNNotes,PNUser1,PNUser2,PNUser3,PNUser4,PNUser5,PNUser6,PNUser7,PNUser8,PNUser9,PNUser10,PNDate,PNTab,PNControlled,PNAux1,PNQty,PNQty2,PNCostChanged,PNParentCost,PNExpandList,PNAssyCostOption,PNInclAssyOnPurchList,PNMadeFrom,PNMinStockQty,PNOrderToMaintain,PNOnECO,PNOverKit,PNOverKitQty,PNOverKitBy,PNOverKitFor,PNCurrentCost,PNLastRollupCost,PNUSRID,PNUserLock);

-- pv_po
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_po.csv'
INTO TABLE maestro.tbl_pv_po
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(POID,POPOMID,POLNKID,POItem,POPart,PORev,PODescription,POReceived,POPurchUnits,POUseUnits,POConvUnits,PORFQQty,POAcct,POIHPart,POSchedule,POTaxable,POTaxable2,POExtension,POExtPlusTax,POCost,POQty,POItemQtyEntry,POItemQtyReceived,POItemQtyBackordered,POTax1,POTax2);

-- pv_pod
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_pod.csv'
INTO TABLE maestro.tbl_pv_pod
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(PODID,PODField,PODCaption,PODOrder,PODUse,PODNewLine,PODUseCaption,PODMode,PODOrderJOB,PODUseJOB,PODNewLineJOB,PODUseCaptionJOB);

-- pv_pom
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_pom.csv'
INTO TABLE maestro.tbl_pv_pom
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(POMID,POMNumber,POMDatePrinted,POMSupplier,POMSUID,POMAccount,POMNotes,POMAttnTo,POMFromBuyer,POMEngrgContact,POMDateReq,POMDateClosed,POMFOB,POMTerms,POMInsurance,POMUseOurShpngAcct,POMShippingAcct,POMThisIsRFQ,POMPendingPrint,POMTaxRate,POMShipMethod,POMShipTo,POMTaxRate2,POMTaxTotal2,POMTax2OnTax1,POMTotalCost,POMTotalTax,POMSubTotal,POMCURID,POMCurName,POMCurExRate,POMDateReqDate);

-- pv_rpx
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_rpx.csv'
INTO TABLE maestro.tbl_pv_rpx
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(RPXID,RPXGrid,RPXName,RPXLayout,RPXLabel,RPXPrimary);

-- pv_ship
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_ship.csv'
INTO TABLE maestro.tbl_pv_ship
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(SHIPID,SHIPMethod);

-- pv_su
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_su.csv'
INTO TABLE maestro.tbl_pv_su
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(SUID,SUSupplier,SUAddress,SUCountry,SUPhone1,SUPhone2,SUFAX,SUWeb,SUContact1,SUContact2,SUDateLast,SUFollowup,SUNotes,SUCode,SUAccount,SUTerms,SUFedTaxID,SUStateTaxID,SUEMail1,SUEMail2,SUCurDedExRate,SUCurExRate,SUCURID,SUCurReverse,SUNoPhonePrefix);

-- pv_task
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_task.csv'
INTO TABLE maestro.tbl_pv_task
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(TASKID,TASKJOBID,TASKPNID,TASKIHPartNumber,TASKPartNumber,TASKRevision,TASKDescription,TASKItem,TASKQty,TASKCost,TASKCostExt,TASKPrice,TASKPriceExt,TASKNotes,TASKShowOnQuote,TASKShowOnInvoice,TASKShowOnPackingList,TASKTaxable,TASKPriceExtPlusTax);

-- pv_type
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_type.csv'
INTO TABLE maestro.tbl_pv_type
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(TYPEID,TYPEType);

-- pv_un
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/maestro/csv/pv_un.csv'
INTO TABLE maestro.tbl_pv_un
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
