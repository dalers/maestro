-- load csv legacy data
--
-- for Hotstuff production environment (hard-coded file paths)
-- correct csv file EOL marker first if necessary (see load_epd2_win.sh)
-- > mysql -uroot -pHarvey57 --local-infile=1 --show-warnings --verbose < /path/to/load_epd2_win.sql
--

use epd2;

-- disable foreign key constraint check during data import
SET foreign_key_checks = 0;
-- improve speed of import
SET unique_checks = 0;

-- --------------
-- EPDQA (Lotus Notes)
-- --------------

-- epdqa_production_record
-- use Windows EOL (CSV created by Windows Notes client)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/epdqa_production_record.csv'
INTO TABLE epd2.tbl_epdqa_production_record
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

-- --------------
-- IDS15 (Planning
-- --------------

-- ids15
-- use Unix EOL (CSV created by Unix mysql cli utility)
-- simple tab delimeted ("> mysql -e "SELECT * FROM PlanningOverview2" IDS15 > ids15_planningoverview2.csv")
LOAD DATA INFILE '/usr/home/samba/epd2/csv/ids15_planningoverview2.csv'
INTO TABLE epd2.tbl_ids15_planningoverview2
CHARACTER SET ascii
FIELDS
	TERMINATED BY '\t'
LINES
	TERMINATED BY '\n'
IGNORE 1 LINES
(proj_id,act_id,job_id,reman_num,so_num,order_num,client,descriptor,product,size,bend,length,comments,insp_type,not_done,statuses,resources,next_event,event_date,tagged,start_date_txt,start_date,end_date_txt,end_date,run_date,sort_date,mob_date,mob_date_sort)
SET id = NULL;

-- --------------
-- NCR (Lotus Notes)
-- --------------

-- ncr_job_num
-- use Windows EOL (CSV created by Windows Notes client)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/ncr_job_num.csv'
INTO TABLE epd2.tbl_ncr_job_num
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(job_num,control_num,type,corrective_action,brief_desc,date,cost)
SET id = NULL;

-- --------------
-- partloc stock locations (source: spreadsheet)
-- --------------

-- partloc_location
-- use Windows EOL (CSV created by Windows Excel)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/partloc_location.csv'
INTO TABLE epd2.tbl_partloc_location
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(location_id,location_name,max_bin_number)
SET id = NULL;

-- partloc_section
-- use Windows EOL (created by Windows Excel)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/partloc_section.csv'
INTO TABLE epd2.tbl_partloc_section
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(section_id,sub_binlayout_id,section_name,min,max,col)
SET id = NULL;

-- partloc_sub_binlocation
LOAD DATA INFILE '/usr/home/samba/epd2/csv/partloc_sub_binlocation.csv'
INTO TABLE epd2.tbl_partloc_sub_binlocation
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(sub_binlayout_id,location_id,sublocations)
SET id = NULL;

-- --------------
-- person (source: spreadsheet)
-- --------------

-- person (spreadsheet)
-- use Windows EOL (created by Excel)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/person.csv'
INTO TABLE epd2.tbl_person
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(four31,nick,lname,fname,initial,email)
SET id = NULL;

-- --------------
-- Pig (Parts&Vendors)
-- --------------
-- primary keys retained from Parts&Vendors tables

-- pig_al
-- possibly used by PVEX/ECO for managing client jobs?
-- no data expected when importing from PV6SE
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_al.csv'
INTO TABLE epd2.tbl_pig_al
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
-- possibly used to convert one part to another?
-- typically no data
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_cnv.csv'
INTO TABLE epd2.tbl_pig_cnv
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
-- part cost at buy-level (price break) for each source
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_cost.csv'
INTO TABLE epd2.tbl_pig_cost
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
-- customer (client) master, not used by SE edition
-- no data expected when importing from PV6SE
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_cu.csv'
INTO TABLE epd2.tbl_pig_cu
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
-- currencies with symbol, formatting and exchange rate
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_cur.csv'
INTO TABLE epd2.tbl_pig_cur
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
-- files/URLs references to part numbers
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_fil.csv'
INTO TABLE epd2.tbl_pig_fil
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
-- history of bulk inventory adjustments (who, what, when, why, qty)
-- no data expected if part quantities are not managed
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_hist.csv'
INTO TABLE epd2.tbl_pig_hist
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
-- database configuration parameters (user defined field captions, po options, ...)
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_hpref.csv'
INTO TABLE epd2.tbl_pig_hpref
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
-- customer (client) job master, not used by SE edition
-- no data expected when importing from PV6SE
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_job.csv'
INTO TABLE epd2.tbl_pig_job
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
-- line card links between vendor and manufacturer
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_lin.csv'
INTO TABLE epd2.tbl_pig_lin
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
-- link table from part sources to parts and additional information
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_lnk.csv'
INTO TABLE epd2.tbl_pig_lnk
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
-- part made-from relationships, not used by SE edition
-- no data expected when importing from PV6SE (or if PVEX/ECO and no made-from parts)
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_mf.csv'
INTO TABLE epd2.tbl_pig_mf
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
-- manufacturer master
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_mfr.csv'
INTO TABLE epd2.tbl_pig_mfr
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
-- manufacturers part numbers and related data
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_mfrpn.csv'
INTO TABLE epd2.tbl_pig_mfrpn
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
-- user organization information
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_org.csv'
INTO TABLE epd2.tbl_pig_org
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
-- links defining parts lists, additional information
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_pl.csv'
INTO TABLE epd2.tbl_pig_pl
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
-- assembly index for P/K lists
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_pll.csv'
INTO TABLE epd2.tbl_pig_pll
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
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_pn.csv'
INTO TABLE epd2.tbl_pig_pn
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
-- PO and RFQ line items (includes "Account" for "Job Number"), not used by SE edition
-- no data expected when importing from PV6SE
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_po.csv'
INTO TABLE epd2.tbl_pig_po
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
-- purchase order data, not used by SE edition (but still contains data in SE edition db)
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_pod.csv'
INTO TABLE epd2.tbl_pig_pod
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
-- purchase order and rfq master, not used by SE edition
-- no data expected when importing from PV6SE
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_pom.csv'
INTO TABLE epd2.tbl_pig_pom
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
-- global report layouts, not used by SE edition
-- no data expected when importing from PV6SE
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_rpx.csv'
INTO TABLE epd2.tbl_pig_rpx
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
-- shipping methods for purchase orders, not used by SE edition  (but still contains data in SE edition) 
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_ship.csv'
INTO TABLE epd2.tbl_pig_ship
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
-- supplier (vendor) master
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_su.csv'
INTO TABLE epd2.tbl_pig_su
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
-- line items for Jobs, not used by SE edition
-- no data expected when importing from PV6SE
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_task.csv'
INTO TABLE epd2.tbl_pig_task
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
-- part type (AW, CAT, DOC, DWG, PL, PS), although not used by Parts&Vendors client
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_type.csv'
INTO TABLE epd2.tbl_pig_type
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
-- units of measure
-- use Unix EOL (created by mdbtools)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/pig_un.csv'
INTO TABLE epd2.tbl_pig_un
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
-- SapLookup05 (spreadsheet), table epdqa_to_sap_pv
-- --------------

-- epdqa_to_sap_pv (spreadsheet)
-- use Windows EOL (CSV created by Excel)
LOAD DATA INFILE '/usr/home/samba/epd2/csv/saplookup05.csv'
INTO TABLE epd2.tbl_epdqa_to_sap_pig
CHARACTER SET ascii
FIELDS
	TERMINATED BY ','
	OPTIONALLY ENCLOSED BY '"'
	ESCAPED BY '"'
LINES
	TERMINATED BY '\r\n'
IGNORE 1 LINES
(pk_id,epd_part_number,epd_pn_version,epd_pn_description,stock_comment,sap_pn,sap_old_matl_number,sap_description,inv_post_comment)
SET id = NULL, pig_pn_id = NULL;

-- --------------
-- Cleanup
-- --------------

-- re-enable foreign key constraint checking
SET foreign_key_checks = 1;
-- re-enable unique constraint checking
SET unique_checks = 0;
