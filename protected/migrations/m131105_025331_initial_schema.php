<?php

class m131105_025331_initial_schema extends CDbMigration
{
	public function up()
	{
		//issue table
		//based on Trackstar (Web Application Development with Yii and PHP 2nd ed, by Jeffrey Winesett)
		$this->createTable('tbl_issue', array(
			'id' => 'pk', //not included in source csv
			'number' => 'string',
			'name' => 'string NOT NULL',
			'description' => 'text',
			'project' => 'string',
			'project_id' => 'integer',
			'type' => 'string',
			'type_id' => 'integer',
			'corrective_action' => 'string',
			'cost' => 'string',
			'part_id' => 'integer',
			'stock_serial_id' => 'integer',
			'status_id' => 'integer',
			'owner_id' => 'integer',
			'requester_id' => 'integer',
			'create_time' => 'datetime',
			'create_user_id' => 'integer',
			'update_time' => 'datetime',
			'update_user_id' => 'integer',
		), 'ENGINE=InnoDB');

		//person table
		//based on Trackstar (Web Application Development with Yii and PHP 2nd ed, by Jeffrey Winesett)
		$this->createTable('tbl_person', array(
			'id' => 'pk',  //not imported
			'username' => 'string NOT NULL', //network login id
			'status' => 'integer', //e.g. 0=ACTIVE, 1=NOTACTIVE
			'password' => 'string NOT NULL',
			'email' => 'string',
			'nick' => 'string', //fk <- pv_pn.PNReqBy
			'lname' => 'string',
			'fname' => 'string',
			'initial' => 'string',
			'last_login_time' => 'datetime DEFAULT NULL',
			'create_time' => 'datetime DEFAULT NULL',
			'create_user_id' => 'int(11) DEFAULT NULL',
			'update_time' => 'datetime DEFAULT NULL',
			'update_user_id' => 'int(11) DEFAULT NULL',
		), 'ENGINE=InnoDB');
		
		//project table
		//based on Trackstar (Web Application Development with Yii and PHP 2nd ed, by Jeffrey Winesett)
		$this->createTable('tbl_project', array(
			'id' => 'pk', //not included in source csv
			'acct1' => 'string', //account number in chart of accounts e.g. 12345678
			'acct2' => 'string', //account number in chart of accounts e.g. 12345678			
			'acct3' => 'string', //account number in chart of accounts e.g. 12345678
			'acct4' => 'string', //account number in chart of accounts e.g. 12345678			'number' => 'integer', //e.g. 1234			
			'name' => 'string', //e.g. "Aircraft Wireless"
			'client' => 'string', //e.g. "B&E Submarines"
			'description' => 'text', //e.g. "Preliminary evaluation and sea trial"
			'type' => 'string', //e.g. "Research"
			'status' => 'integer', //e.g. 0=NotActive, 1=Active...	
			'milestone' => 'string', //e.g. "Sanction", "Definition", "Design", "Validation", "Pilot", "Production", "Termination"
			'milestone_date' => 'datetime', //forecast date for completion of milestone			
			'create_time' => 'datetime',
			'create_user_id' => 'integer',
			'update_time' => 'datetime',
			'update_user_id' => 'integer',
		), 'ENGINE = InnoDB');
						
		//stock serial number table
		$this->createTable('tbl_stock_serial', array(
			'id' => 'pk', //not included in source csv
			'serial_number' => 'string', //e.g. A1234, 1234B, A-1234...
			'part_number' => 'string', //e.g. 20123456
			'description' => 'string', //e.g. "Aircraft Wireless"
			'version' => 'string', //e.g. 0, 1, 1A...
			'status' => 'integer', //e.g. 0=NotActive, 1=Active...
			'part_id' => 'integer',
			), 'ENGINE=InnoDB');
		
		//stock location table
		$this->createTable('tbl_stock_location', array(
			'id' => 'pk', //not imported from source
			'location_name' => 'integer',
			'use_sublocation' => 'integer',
			'sublocation_min' => 'integer',
			'sublocation_max' => 'integer',
		), 'ENGINE=InnoDB');        

		//part and vendor tables
		//pv_al table
		$this->createTable('tbl_pv_al', array(
			'id' => 'pk',
			'ALPNID' => 'INTEGER DEFAULT 0', 
			'ALJOBID' => 'INTEGER DEFAULT 0', 
			'ALTASKID' => 'INTEGER DEFAULT 0', 
			'ALJOBNumber' => 'VARCHAR(50)', 
			'ALJOBNumberLine' => 'VARCHAR(50)', 
			'ALQty' => 'FLOAT NULL DEFAULT 0', 
			'ALQtyShort' => 'FLOAT NULL DEFAULT 0', 
		), 'ENGINE=InnoDB'); 

		//pv_cnv table
		$this->createTable('tbl_pv_cnv', array(
			'id' => 'pk',
			'CNVLNKID' => 'INTEGER NOT NULL DEFAULT 0', 
		), 'ENGINE=InnoDB'); 

		//pv_cost table
		$this->createTable('tbl_pv_cost', array(
			'id' => 'pk',
			'COSTLNKID' => 'INTEGER NOT NULL', 
			'COSTAtQty' => 'FLOAT NULL DEFAULT 1', 
			'COSTLeadtime' => 'INTEGER DEFAULT 0', 
			'COSTCost' => 'DOUBLE NULL DEFAULT 0', 
		), 'ENGINE=InnoDB'); 

		//pv_cu table
		$this->createTable('tbl_pv_cu', array(
			'id' => 'pk',
			'CUCustomer' => 'VARCHAR(255)', 
			'CUAddress' => 'VARCHAR(255)', 
			'CUShipAddress' => 'VARCHAR(255)', 
			'CUPhone1' => 'VARCHAR(20)', 
			'CUPhone2' => 'VARCHAR(20)', 
			'CUContact1' => 'VARCHAR(50)', 
			'CUContact2' => 'VARCHAR(50)', 
			'CUFax' => 'VARCHAR(20)', 
			'CUEmail1' => 'VARCHAR(50)', 
			'CUEmail2' => 'VARCHAR(50)', 
			'CUNotes' => 'LONGTEXT', 
			'CUWeb' => 'VARCHAR(100)', 
			'CUCode' => 'VARCHAR(20)', 
			'CUAccount' => 'VARCHAR(20)', 
			'CUTerms' => 'VARCHAR(20)', 
			'CUFedTaxID' => 'VARCHAR(20)', 
			'CUStateTaxID' => 'VARCHAR(20)', 
			'CUNoPhonePrefix' => 'TINYINT(1) DEFAULT 0', 
		), 'ENGINE=InnoDB'); 

		//pv_cur table
		$this->createTable('tbl_pv_cur', array(
			'id' => 'pk',
			'CURCurrencyName' => 'VARCHAR(50)', 
			'CURExchangeRate' => 'DOUBLE NULL DEFAULT 0',
			'CURCurrencyChar' => 'VARCHAR(4)', 
			'CURFormat' => 'VARCHAR(35)', 
			'CURFormatExt' => 'VARCHAR(35)', 
		), 'ENGINE=InnoDB'); 

		//pv_fil table
		$this->createTable('tbl_pv_fil', array(
			'id' => 'pk',
			'FILPNID' => 'INTEGER DEFAULT 0',
			'FILPNPartNumber' => 'VARCHAR(50)', 
			'FILFilePath' => 'VARCHAR(255)',
			'FILFileName' => 'VARCHAR(255)',
			'FILView' => 'TINYINT(1) DEFAULT 0',
			'FILNotes' => 'VARCHAR(50)', 
		), 'ENGINE=InnoDB');        

		//pv_hist table
		$this->createTable('tbl_pv_hist', array(
			'id' => 'pk',
			'HISTWho' => 'VARCHAR(20)', 
			'HISTWhat' => 'VARCHAR(255)', 
			'HISTWhen' => 'TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP', 
			'HISTWhy' => 'VARCHAR(255)', 
			'HISTHowMany' => 'FLOAT NULL DEFAULT 0', 
		), 'ENGINE=InnoDB');  
		
		//pv_hpref table
		$this->createTable('tbl_pv_hpref', array(
			'id' => 'pk',
			'GPREFKey' => 'VARCHAR(50) NOT NULL',
			'GPREFText1' => 'VARCHAR(50)', 
			'GPREFText2' => 'VARCHAR(50)', 
			'GPREFText3' => 'VARCHAR(50)', 
			'GPREFText4' => 'VARCHAR(50)', 
			'GPREFText5' => 'VARCHAR(50)', 
			'GPREFBool1' => 'TINYINT(1) DEFAULT 0', 
			'GPREFBool2' => 'TINYINT(1) DEFAULT 0', 
			'GPREFBool3' => 'TINYINT(1) DEFAULT 0', 
			'GPREFBool4' => 'TINYINT(1) DEFAULT 0', 
			'GPREFInt1' => 'INTEGER DEFAULT 0', 
			'GPREFText6' => 'VARCHAR(50)', 
			'GPREFText7' => 'VARCHAR(50)', 
			'GPREFText8' => 'VARCHAR(50)', 
			'GPREFText9' => 'VARCHAR(50)', 
			'GPREFText10' => 'VARCHAR(50)', 
		), 'ENGINE=InnoDB');  
		
		//pv_job table
		$this->createTable('tbl_pv_job', array(
			'id' => 'pk',
			'JOBNumber' => 'VARCHAR(50)', 
			'JOBCUID' => 'INTEGER DEFAULT 0', 
			'JOBCustomer' => 'VARCHAR(255)', 
			'JOBDateCreated' => 'DATETIME', 
			'JOBDatePromised' => 'DATETIME', 
			'JOBDateCompleted' => 'DATETIME', 
			'JOBAccount' => 'VARCHAR(50)', 
			'JOBNotes' => 'LONGTEXT', 
			'JOBAllocateStock' => 'TINYINT(1) DEFAULT 0', 
			'JOBFOB' => 'VARCHAR(50)', 
			'JOBTerms' => 'VARCHAR(50)', 
			'JOBShipMethod' => 'VARCHAR(50)', 
			'JOBAttnTo' => 'VARCHAR(50)', 
			'JOBTaxRate' => 'FLOAT NULL DEFAULT 0', 
			'JOBTaxRate2' => 'FLOAT NULL DEFAULT 0', 
			'JOBTax2OnTax1' => 'TINYINT(1) DEFAULT 0', 
			'JOBTotalCost' => 'DOUBLE NULL DEFAULT 0', 
			'JOBSubTotalCost' => 'DOUBLE NULL DEFAULT 0', 
			'JOBTotalPrice' => 'DOUBLE NULL DEFAULT 0', 
			'JOBSubTotalPrice' => 'DOUBLE NULL DEFAULT 0', 
			'JOBTax1' => 'DOUBLE NULL DEFAULT 0', 
			'JOBTax2' => 'DOUBLE NULL DEFAULT 0', 
			'JOBCustOrderNumber' => 'VARCHAR(50)', 
			'JOBDateInvoiced' => 'DATETIME', 
			'JOBDateShipped' => 'DATETIME', 
		), 'ENGINE=InnoDB');  

		//pv_lin table
		$this->createTable('tbl_pv_lin', array(
			'id' => 'pk',
			'LINSUID' => 'INTEGER NOT NULL DEFAULT 0', 
			'LINMFRID' => 'INTEGER NOT NULL DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//pv_lnk table
		$this->createTable('tbl_pv_lnk', array(
			'id' => 'pk',
			'LNKSUID' => 'INTEGER', 
			'LNKMFRPNID' => 'INTEGER', 
			'LNKMFRID' => 'INTEGER', 
			'LNKUNID' => 'INTEGER DEFAULT 1', 
			'LNKPNID' => 'INTEGER DEFAULT 0', 
			'LNKToPNID' => 'INTEGER DEFAULT 0', 
			'LNKUse' => 'TINYINT(1) DEFAULT 0', 
			'LNKLeadtime' => 'VARCHAR(20)', 
			'LNKChoice' => 'INTEGER DEFAULT 0', 
			'LNKVendorPN' => 'VARCHAR(50)', 
			'LNKVendorDesc' => 'VARCHAR(50)', 
			'LNKAtQty' => 'FLOAT NULL DEFAULT 0', 
			'LNKRFQDate' => 'DATETIME', 
			'LNKMinIncrement' => 'FLOAT NULL DEFAULT 0', 
			'LNKCurrentCost' => 'DOUBLE NULL DEFAULT 0', 
			'LNKSetupCost' => 'DOUBLE NULL DEFAULT 0', 
			'LNKRoHS' => 'TINYINT(1) DEFAULT 0', 
			'LNKRoHSDoc' => 'VARCHAR(50)', 
			'LNKRoHSNote' => 'VARCHAR(255)', 
		), 'ENGINE=InnoDB');  

		//pv_mf table
		$this->createTable('tbl_pv_mf', array(
			'id' => 'pk',
			'MFPNIDParent' => 'INTEGER DEFAULT 0', 
			'MFPNIDSub' => 'INTEGER DEFAULT 0', 
			'MFQty' => 'FLOAT NULL DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//pv_mfr table
		$this->createTable('tbl_pv_mfr', array(
			'id' => 'pk',
			'MFRMfrName' => 'VARCHAR(50) NOT NULL', 
			'MFRAddress' => 'VARCHAR(255)', 
			'MFRCountry' => 'VARCHAR(50)', 
			'MFRContact1' => 'VARCHAR(50)', 
			'MFRContact2' => 'VARCHAR(50)', 
			'MFRPhone1' => 'VARCHAR(20)', 
			'MFRPhone2' => 'VARCHAR(20)', 
			'MFRFax' => 'VARCHAR(20)', 
			'MFRWeb' => 'VARCHAR(255)',
			'MFRNotes' => 'LONGTEXT', 
			'MFRCode' => 'VARCHAR(20)', 
			'MFREMail1' => 'VARCHAR(50)', 
			'MFREMail2' => 'VARCHAR(50)', 
			'MFRNoPhonePrefix' => 'TINYINT(1) DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//pv_mfrpn table
		$this->createTable('tbl_pv_mfrpn', array(
			'id' => 'pk',
			'MFRPNMFRID' => 'INTEGER DEFAULT 0', 
			'MFRPNPart' => 'VARCHAR(50)', 
		), 'ENGINE=InnoDB');  

		//pv_org table
		$this->createTable('tbl_pv_org', array(
			'id' => 'pk',
			'ORGKey' => 'VARCHAR(20)', 
			'ORGName' => 'VARCHAR(50)',
			'ORGAddress' => 'VARCHAR(255)', 
			'ORGPhone' => 'VARCHAR(20)', 
			'ORGFaax' => 'VARCHAR(20)', 
			'ORGPOUseShpgAddr' => 'TINYINT(1) DEFAULT 0',
			'ORGRFQUseShpgAddr' => 'TINYINT(1) DEFAULT 0',
			'ORGListOrder' => 'INTEGER DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//pv_pl table
		$this->createTable('tbl_pv_pl', array(
			'id' => 'pk',
			'PLListID' => 'INTEGER NOT NULL DEFAULT 0',
			'PLPartID' => 'INTEGER NOT NULL DEFAULT 0',
			'PLItem' => 'INTEGER DEFAULT 0',
			'PLQty' => 'VARCHAR(10)',
			'PLRefMemo' => 'LONGTEXT',
			'PLRefText' => 'VARCHAR(255)',
			'PLAssyOrder' => 'FLOAT NULL',
			'PLAssySpec' => 'VARCHAR(255)',
			'PLMFRPNID' => 'INTEGER',
			'PLMFRID' => 'INTEGER',
			'PLSUID' => 'INTEGER',
			'PLLNKID' => 'INTEGER',
		), 'ENGINE=InnoDB');        

		//pv_pll table
		$this->createTable('tbl_pv_pll', array(
			'id' => 'pk',
			'PLLParentListID' => 'INTEGER DEFAULT 0', 
			'PLLSubListID' => 'INTEGER DEFAULT 0', 
			'PLLQty' => 'FLOAT NULL DEFAULT 0', 
			'PLLLevel' => 'INTEGER DEFAULT 0',
			'PLLCost' => 'FLOAT NULL DEFAULT 0', 
			'PLLItemNumber' => 'INTEGER DEFAULT 0', 
		), 'ENGINE=InnoDB');        

		//pv_pn table
		$this->createTable('tbl_pv_pn', array(
			'id' => 'pk',
			'PNIDToLNK' => 'INTEGER',
			'PNUNID' => 'INTEGER DEFAULT 1',
			'PNTabParentID' => 'INTEGER',
			'PNPrefix' => 'VARCHAR(50)', 
			'PNPartNumber' => 'VARCHAR(50) NOT NULL',
			'PNSuffix' => 'VARCHAR(50)', 
			'PNType' => 'VARCHAR(5)',
			'PNRevision' => 'VARCHAR(10)',
			'PNTitle' => 'VARCHAR(255)', 
			'PNDetail' => 'VARCHAR(255)', 
			'PNStatus' => 'VARCHAR(1)',
			'PNReqBy' => 'VARCHAR(10)', 
			'PNNotes' => 'LONGTEXT',
			'PNUser1' => 'VARCHAR(100)', 
			'PNUser2' => 'VARCHAR(100)', 
			'PNUser3' => 'VARCHAR(100)', 
			'PNUser4' => 'VARCHAR(100)', 
			'PNUser5' => 'VARCHAR(100)', 
			'PNUser6' => 'VARCHAR(100)', 
			'PNUser7' => 'VARCHAR(100)', 
			'PNUser8' => 'VARCHAR(100)', 
			'PNUser9' => 'VARCHAR(100)', 
			'PNUser10' => 'VARCHAR(100)', 
			'PNDate' => 'DATETIME', 
			'PNTab' => 'TINYINT(1) DEFAULT 0',
			'PNControlled' => 'TINYINT(1) DEFAULT 0', 
			'PNAux1' => 'VARCHAR(50)', 
			'PNQty' => 'FLOAT NULL DEFAULT 0',
			'PNQty2' => 'FLOAT NULL DEFAULT 0',
			'PNCostChanged' => 'TINYINT(1) DEFAULT 0',
			'PNParentCost' => 'TINYINT(1) DEFAULT 0',
			'PNExpandList' => 'TINYINT(1) DEFAULT 0',
			'PNAssyCostOption' => 'INTEGER DEFAULT 3',
			'PNInclAssyOnPurchList' => 'TINYINT(1) DEFAULT -1',
			'PNMadeFrom' => 'TINYINT(1) DEFAULT 0',
			'PNMinStockQty' => 'FLOAT NULL DEFAULT 0', 
			'PNOrderToMaintain' => 'TINYINT(1) DEFAULT 0', 
			'PNOnECO' => 'TINYINT(1) DEFAULT 0', 
			'PNOverKit' => 'TINYINT(1) DEFAULT 0',
			'PNOverKitQty' => 'FLOAT NULL DEFAULT 0', 
			'PNOverKitBy' => 'INTEGER DEFAULT 0',
			'PNOverKitFor' => 'INTEGER DEFAULT 0',
			'PNCurrentCost' => 'DOUBLE NULL DEFAULT 0', 
			'PNLastRollupCost' => 'DOUBLE NULL DEFAULT 0', 
			'PNUSRID' => 'INTEGER DEFAULT 0', 
			'PNUserLock' => 'TINYINT(1) DEFAULT 0', 
			//following fields are additions to PV schema
			'person_id' => 'integer', //fk -> person
			'stock_location_id' => 'integer', //fk -> stock_location
		), 'ENGINE=InnoDB');

		//pv_po table
		$this->createTable('tbl_pv_po', array(
			'id' => 'pk',
			'POPOMID' => 'INTEGER DEFAULT 0', 
			'POLNKID' => 'INTEGER', 
			'POItem' => 'INTEGER DEFAULT 0', 
			'POPart' => 'VARCHAR(50)', 
			'PORev' => 'VARCHAR(10)', 
			'PODescription' => 'LONGTEXT', 
			'POReceived' => 'TINYINT(1) DEFAULT 0', 
			'POPurchUnits' => 'VARCHAR(20)', 
			'POUseUnits' => 'VARCHAR(20)', 
			'POConvUnits' => 'FLOAT NULL DEFAULT 1', 
			'PORFQQty' => 'VARCHAR(255)', 
			'POAcct' => 'VARCHAR(20)', 
			'POIHPart' => 'VARCHAR(50)',
			'POSchedule' => 'VARCHAR(255)', 
			'POTaxable' => 'TINYINT(1) DEFAULT 0', 
			'POTaxable2' => 'TINYINT(1) DEFAULT 0', 
			'POExtension' => 'DOUBLE NULL DEFAULT 0', 
			'POExtPlusTax' => 'DOUBLE NULL DEFAULT 0', 
			'POCost' => 'DOUBLE NULL DEFAULT 0', 
			'POQty' => 'DOUBLE NULL DEFAULT 0', 
			'POItemQtyEntry' => 'DOUBLE NULL', 
			'POItemQtyReceived' => 'DOUBLE NULL DEFAULT 0', 
			'POItemQtyBackordered' => 'DOUBLE NULL DEFAULT 0', 
			'POTax1' => 'DOUBLE NULL DEFAULT 0', 
			'POTax2' => 'DOUBLE NULL DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//pv_pod table
		$this->createTable('tbl_pv_pod', array(
			'id' => 'pk',
			'PODField' => 'VARCHAR(50)', 
			'PODCaption' => 'VARCHAR(50)', 
			'PODOrder' => 'INTEGER DEFAULT 0', 
			'PODUse' => 'TINYINT(1) DEFAULT 0', 
			'PODNewLine' => 'TINYINT(1) DEFAULT 0', 
			'PODUseCaption' => 'TINYINT(1) DEFAULT 0', 
			'PODMode' => 'INTEGER DEFAULT 0', //0=PO; 1=JOB
			'PODOrderJOB' => 'INTEGER DEFAULT 0', 
			'PODUseJOB' => 'TINYINT(1) DEFAULT 0', 
			'PODNewLineJOB' => 'TINYINT(1) DEFAULT 0', 
			'PODUseCaptionJOB' => 'TINYINT(1) DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//pv_pom table
		$this->createTable('tbl_pv_pom', array(
			'id' => 'pk',
			'POMNumber' => 'VARCHAR(20) NOT NULL', 
			'POMDatePrinted' => 'DATETIME', 
			'POMSupplier' => 'VARCHAR(50) NOT NULL', 
			'POMSUID' => 'INTEGER DEFAULT 0', 
			'POMAccount' => 'VARCHAR(20)', 
			'POMNotes' => 'LONGTEXT', 
			'POMAttnTo' => 'VARCHAR(50)', 
			'POMFromBuyer' => 'VARCHAR(50)', 
			'POMEngrgContact' => 'VARCHAR(50)', 
			'POMDateReq' => 'VARCHAR(20)', 
			'POMDateClosed' => 'DATETIME', 
			'POMFOB' => 'VARCHAR(20)', 
			'POMTerms' => 'VARCHAR(20)', 
			'POMInsurance' => 'TINYINT(1) DEFAULT 0', 
			'POMUseOurShpngAcct' => 'TINYINT(1) DEFAULT 0', 
			'POMShippingAcct' => 'VARCHAR(25)', 
			'POMThisIsRFQ' => 'TINYINT(1) DEFAULT 0', 
			'POMPendingPrint' => 'TINYINT(1) DEFAULT 0', 
			'POMTaxRate' => 'FLOAT NULL DEFAULT 0', 
			'POMShipMethod' => 'VARCHAR(20)', 
			'POMShipTo' => 'LONGTEXT', 
			'POMTaxRate2' => 'FLOAT NULL DEFAULT 0', 
			'POMTaxTotal2' => 'FLOAT NULL DEFAULT 0', 
			'POMTax2OnTax1' => 'INTEGER DEFAULT 0', 
			'POMTotalCost' => 'DOUBLE NULL DEFAULT 0', 
			'POMTotalTax' => 'DOUBLE NULL DEFAULT 0', 
			'POMSubTotal' => 'DOUBLE NULL DEFAULT 0', 
			'POMCURID' => 'INTEGER DEFAULT 0', 
			'POMCurName' => 'VARCHAR(20)', 
			'POMCurExRate' => 'DOUBLE NULL DEFAULT 1', 
			'POMDateReqDate' => 'DATETIME', 
		), 'ENGINE=InnoDB');  

		//pv_rpx table
		$this->createTable('tbl_pv_rpx', array(
			'id' => 'pk',
			'RPXGrid' => 'VARCHAR(50) NOT NULL', 
			'RPXName' => 'VARCHAR(50)', 
			'RPXLayout' => 'LONGTEXT', 
			'RPXLabel' => 'TINYINT(1) DEFAULT 0', 
			'RPXPrimary' => 'TINYINT(1) DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//pv_ship table
		$this->createTable('tbl_pv_ship', array(
			'id' => 'pk',
			'SHIPMethod' => 'VARCHAR(50)', 
		), 'ENGINE=InnoDB');  

		//pv_su table
		$this->createTable('tbl_pv_su', array(
			'id' => 'pk',
			'SUSupplier' => 'VARCHAR(50) UNIQUE NOT NULL',
			'SUAddress' => 'VARCHAR(255)',
			'SUCountry' => 'VARCHAR(50)',
			'SUPhone1' => 'VARCHAR(20)',
			'SUPhone2' => 'VARCHAR(20)',
			'SUFAX' => 'VARCHAR(20)',
			'SUWeb' => 'VARCHAR(255)',
			'SUContact1' => 'VARCHAR(50)',
			'SUContact2' => 'VARCHAR(50)',
			'SUDateLast' => 'DATETIME',
			'SUFollowup' => 'TINYINT(1) DEFAULT 0',
			'SUNotes' => 'LONGTEXT',
			'SUCode' => 'VARCHAR(20)',
			'SUAccount' => 'VARCHAR(20)',
			'SUTerms' => 'VARCHAR(20)',
			'SUFedTaxID' => 'VARCHAR(20)',
			'SUStateTaxID' => 'VARCHAR(20)',
			'SUEMail1' => 'VARCHAR(50)', 
			'SUEMail2' => 'VARCHAR(50)', 
			'SUCurDedExRate' => 'TINYINT(1) DEFAULT 0', 
			'SUCurExRate' => 'DOUBLE NULL DEFAULT 0', 
			'SUCURID' => 'INTEGER DEFAULT 1', 
			'SUCurReverse' => 'TINYINT(1) DEFAULT 0', 
			'SUNoPhonePrefix' => 'TINYINT(1) DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//pv_task
		$this->createTable('tbl_pv_task', array(
			'id' => 'pk',
			'TASKJOBID' => 'INTEGER DEFAULT 0', 
			'TASKPNID' => 'INTEGER DEFAULT 0', 
			'TASKIHPartNumber' => 'VARCHAR(255)', 
			'TASKPartNumber' => 'VARCHAR(255)', 
			'TASKRevision' => 'VARCHAR(10)', 
			'TASKDescription' => 'LONGTEXT', 
			'TASKItem' => 'INTEGER DEFAULT 0', 
			'TASKQty' => 'FLOAT NULL DEFAULT 0', 
			'TASKCost' => 'DOUBLE NULL DEFAULT 0', 
			'TASKCostExt' => 'DOUBLE NULL DEFAULT 0', 
			'TASKPrice' => 'DOUBLE NULL DEFAULT 0', 
			'TASKPriceExt' => 'DOUBLE NULL DEFAULT 0', 
			'TASKNotes' => 'LONGTEXT', 
			'TASKShowOnQuote' => 'TINYINT(1) DEFAULT -1', 
			'TASKShowOnInvoice' => 'TINYINT(1) DEFAULT -1', 
			'TASKShowOnPackingList' => 'TINYINT(1) DEFAULT -1', 
			'TASKTaxable' => 'TINYINT(1) DEFAULT 0', 
			'TASKPriceExtPlusTax' => 'DOUBLE NULL DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//pv_type table
		$this->createTable('tbl_pv_type', array(
			'id' => 'pk',
			'TYPEType' => 'VARCHAR(6)',
		), 'ENGINE=InnoDB');  

		//pv_un table
		$this->createTable('tbl_pv_un', array(
			'id' => 'pk',
			'UNUseUnits' => 'VARCHAR(20) NOT NULL', 
			'UNPurchUnits' => 'VARCHAR(20) NOT NULL', 
			'UNConvUnits' => 'FLOAT NULL NOT NULL DEFAULT 1',
		), 'ENGINE=InnoDB');  

		//--------------
		//foreign key constraints
		//--------------

		//issue
		//project_id has been included to reference the associated project (or
		//null), implied by the value of the project column. A project field
		//should have the same value as one of the projects in the project table
		//- similar to a foreign key but without being being required for
		//referential integrity.		
		$this->addForeignKey("fk_issue_to_project", "tbl_issue", "project_id", "tbl_project", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_part", "tbl_issue", "part_id", "tbl_pv_pn", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_stock_serial", "tbl_issue", "stock_serial_id", "tbl_stock_serial", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_owner", "tbl_issue", "owner_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_requester", "tbl_issue", "requester_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_create_user", "tbl_issue", "create_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_update_user", "tbl_issue", "update_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		
		//stock_serial
		//part_id has been included to reference the stock part number (or null), implied
		//by the value of the part_number column. A part_number field should have the
		//same value as one of the part numbers in the pv_pn table - similar to a foreign
		//key but without being being required for referential integrity.
		$this->addForeignKey("fk_stock_serial_to_pv_pn", "tbl_stock_serial", "part_id", "tbl_pv_pn", "id", "CASCADE", "RESTRICT");

		//pv_pn
		//person_id has been added to the Parts&Vendors part master table
		//to reference the person referred to in the pre-existing ReqBy
		//column (or is null). A ReqBy field should have the same value
		//one of the nicks in the person table - similar to a foreign
		//key but without being required for integrity.
		$this->addForeignKey("fk_pv_pn_person", "tbl_pv_pn", "person_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		//stock_location_id has been added to the Parts&Vendors part master
		//table to reference the stock location referred to in the pre-existing
		//PNUser9 column (or is null). The value of PNUser9 should be the same
		//as one of the stock locations in the stock_location table - similar to
		//a foreign key, but without being required for integrity.		
		$this->addForeignKey("fk_pv_pn_location", "tbl_pv_pn", "stock_location_id", "tbl_stock_location", "id", "CASCADE", "RESTRICT");

		//pv_pl
		//reference parent part number for parts list item
		$this->addForeignKey("fk_pv_pl_pn_1", "tbl_pv_pl", "PLListID", "tbl_pv_pn", "id", "CASCADE", "RESTRICT");
		//reference child part number for parts list item
		$this->addForeignKey("fk_pv_pl_pn_2", "tbl_pv_pl", "PLPartID", "tbl_pv_pn", "id", "CASCADE", "RESTRICT");
		  
		//pv_fil
		$this->addForeignKey("fk_pv_fil_pn", "tbl_pv_fil", "FILPNID", "tbl_pv_pn", "id", "CASCADE", "RESTRICT");
	
	}

	public function down()
	{
		//delete table data
		//using DELETE instead of TRUNCATE (truncateTable will fail due to
		//foreign key constraints with MySQL 5.5+). Refer to the MySQL 5.1
		//manual Sec 13.1.34 and MySQL 5.5 manual Sec 5.1.33.
		//e.g $this->delete('tbl_serial_number');

		//drop tables
		$this->dropTable('tbl_issue'); //fk -> tbl_project

		$this->dropTable('tbl_project');

		$this->dropTable('tbl_pv_al');
		$this->dropTable('tbl_pv_cnv');
		$this->dropTable('tbl_pv_cost');
		$this->dropTable('tbl_pv_cu');
		$this->dropTable('tbl_pv_cur');
		$this->dropTable('tbl_pv_fil'); //must drop before pn
		$this->dropTable('tbl_pv_hist');
		$this->dropTable('tbl_pv_hpref');
		$this->dropTable('tbl_pv_job');
		$this->dropTable('tbl_pv_lin');
		$this->dropTable('tbl_pv_lnk');
		$this->dropTable('tbl_pv_mf');
		$this->dropTable('tbl_pv_mfr');
		$this->dropTable('tbl_pv_mfrpn');
		$this->dropTable('tbl_pv_org');
		$this->dropTable('tbl_pv_pl'); //must drop before pn
		$this->dropTable('tbl_pv_pll');
		$this->dropTable('tbl_pv_po');
		$this->dropTable('tbl_pv_pod');
		$this->dropTable('tbl_pv_pom');
		$this->dropTable('tbl_pv_rpx');
		$this->dropTable('tbl_pv_ship');
		$this->dropTable('tbl_pv_su');
		$this->dropTable('tbl_pv_task');
		$this->dropTable('tbl_pv_type');
		$this->dropTable('tbl_pv_un');
		$this->dropTable('tbl_pv_pn'); //must drop after fil, pl

		$this->dropTable('tbl_stock_location');
		$this->dropTable('tbl_stock_serial');
		$this->dropTable('tbl_person');
	}

	/*
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
	}

	public function safeDown()
	{
	}
	*/
}