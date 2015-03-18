<?php

class m131105_025331_initial_schema extends CDbMigration
{
	public function up()
	{
		//activity table
		$this->createTable('tbl_activity', array(
			'id' => 'pk',
            'project_id' => 'integer',
			
            'name' => 'string',
            'begin_date' => 'string',
            'end_date' => 'string',
            'duration' => 'string',
            'completion' => 'string',
            'coordinator' => 'string',
            'predecessors' => 'string',
            'outline_number' => 'string',
            'cost' => 'string',
            'web_link' => 'string',
            'resources' => 'string',
            'notes' => 'string',

			//audit fields
			'create_time' => 'datetime',
			'create_user_id' => 'integer',
			'update_time' => 'datetime',
			'update_user_id' => 'integer',
		), 'ENGINE = InnoDB');
						
		//customer (customer master, based on parts&vendors CU pv_cu table)
		$this->createTable('tbl_customer', array(
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

		//issue table
		$this->createTable('tbl_issue', array(
			'id' => 'pk',
            'type' => 'string',
            'owner' => 'string',
			'requestor' => 'string',
            'status' => 'string',
			'description' => 'text',

			//foreign keys
			'part_id' => 'integer', //one part number per issue
			'project_id' => 'integer', //one project per issue
			'stock_id' => 'integer', //one serial number per issue
			'owner_id' => 'integer', //one owner per issue
            
			//audit fields
			'create_time' => 'datetime',
			'create_user_id' => 'integer',
			'update_time' => 'datetime',
			'update_user_id' => 'integer',
		), 'ENGINE=InnoDB');
		
		//order table
		$this->createTable('tbl_order', array(
			'id' => 'pk',
			'name' => 'string',
			'type' => 'string',
			'status' => 'string',
			'project_id' => 'integer',
			'parts_list_id' => 'integer', //to pre-populate order from part number parts list
			
			//audit fields
			'create_time' => 'datetime DEFAULT NULL',
			'create_user_id' => 'integer DEFAULT NULL',
			'update_time' => 'datetime DEFAULT NULL',
			'update_user_id' => 'integer DEFAULT NULL',
		), 'ENGINE=InnoDB');
		
		//order_item table
		$this->createTable('tbl_order_item', array(
			'id' => 'pk',
			'order_id' => 'integer',
			'part_id' => 'integer',
			'desired_qty' => 'integer default 0',
			'shipped_qty' => 'integer default 0',
			
			//audit fields
			'create_time' => 'datetime DEFAULT NULL',
			'create_user_id' => 'int(11) DEFAULT NULL',
			'update_time' => 'datetime DEFAULT NULL',
			'update_user_id' => 'int(11) DEFAULT NULL',
		), 'ENGINE=InnoDB');
		
		//order_item_to_stock table
		$this->createTable('tbl_order_item_to_stock', array(
			'id' => 'pk',
			'order_item_id' => 'integer',
			'stock_id' => 'integer',
			
			//audit fields
			'create_time' => 'datetime DEFAULT NULL',
			'create_user_id' => 'int(11) DEFAULT NULL',
			'update_time' => 'datetime DEFAULT NULL',
			'update_user_id' => 'int(11) DEFAULT NULL',
		), 'ENGINE=InnoDB');
		
		//part table (part master, based on parts&vendors PN/pv_pn table)
		$this->createTable('tbl_part', array(
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
			'PNReqBy' => 'VARCHAR(10)',  //soft fk->part.nick
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
			
			'is_serialized' => 'boolean',
			'iteration_number' => 'integer',
			'is_current_iteration' => 'boolean',

			//foreign keys
			'type_id' => 'integer', //PNType -> pv_type
			'stock_location_id' => 'integer', //PNUser9 -> stock_location
			'requester_id' => 'integer', //PNReqBy -> person

			//audit fields
			'create_time' => 'datetime',
			'create_user_id' => 'integer',
			'update_time' => 'datetime',
			'update_user_id' => 'integer',			
		), 'ENGINE=InnoDB');

		//person table
		$this->createTable('tbl_person', array(
			'id' => 'pk',  //not imported
			'username' => 'string NOT NULL', //network login id
			'status' => 'integer', //e.g. 0=inactive, 1=active
			'password' => 'string NOT NULL',
			'email' => 'string',
			'nick' => 'string',
			'lname' => 'string', //e.g. "Tom"
			'fname' => 'string', //e.g. "Swift"
			'initial' => 'string', //e.g. "TS"

            //foreign keys
			'profile_id' => 'integer',
			
			//audit fields
			'last_login_time' => 'datetime DEFAULT NULL',
			'create_time' => 'datetime DEFAULT NULL',
			'create_user_id' => 'int(11) DEFAULT NULL',
			'update_time' => 'datetime DEFAULT NULL',
			'update_user_id' => 'int(11) DEFAULT NULL',
		), 'ENGINE=InnoDB');
		
		//project table
		$this->createTable('tbl_project', array(
			'id' => 'pk',
			'name' => 'string', //e.g. "Aircraft Wireless"
			'description' => 'text', //e.g. "Preliminary evaluation and sea trial"
			'type' => 'string', //e.g. "Research"
			'status' => 'string', //e.g. NOTACTIVE, ACTIVE...	

            //foreign keys
            'customer_id' => 'integer', //e.g. "B&E Submarines"
			
			//audit fields
			'create_time' => 'datetime',
			'create_user_id' => 'integer',
			'update_time' => 'datetime',
			'update_user_id' => 'integer',
		), 'ENGINE = InnoDB');
						
		//stock table (serial or lot identified stock)
		$this->createTable('tbl_stock', array(
			'id' => 'pk', //not included in source csv
			'serial_number' => 'string', //e.g. A1234, 1234B, A-1234...
			'description' => 'string', //e.g. "Aircraft Wireless"
			'status' => 'string', //e.g. ACTIVE, DESTROYED...
			'part_version' => 'integer'

            //foreign keys
			'part_id' => 'integer',
		), 'ENGINE=InnoDB');
		
		//stock location table
		$this->createTable('tbl_stock_location', array(
			'id' => 'pk',
			'name' => 'string',
			'use_sublocation' => 'integer', //TODO boolean
			'sublocation_min' => 'integer',
			'sublocation_max' => 'integer',
		), 'ENGINE=InnoDB');        

		//parts and vendors tables
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

		//foreign keys
		//activity
		$this->addForeignKey("fk_activity_to_project", "tbl_activity", "project_id", "tbl_project", "id", "CASCADE", "RESTRICT");
		
		//issue
		$this->addForeignKey("fk_issue_to_part", "tbl_issue", "part_id", "tbl_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_project", "tbl_issue", "project_id", "tbl_project", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_stock", "tbl_issue", "stock_id", "tbl_stock", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_owner", "tbl_issue", "owner_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_create_user", "tbl_issue", "create_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_update_user", "tbl_issue", "update_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		
		//order
		$this->addForeignKey("fk_order_to_project", "tbl_order", "project_id", "tbl_project", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_to_parts_list", "tbl_order", "parts_list_id", "tbl_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_to_create_user", "tbl_order", "create_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_to_update_user", "tbl_order", "update_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		
		//order_item
		$this->addForeignKey("fk_order_item_to_order", "tbl_order_item", "order_id", "tbl_order", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_item_to_part", "tbl_order_item", "part_id", "tbl_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_item_to_create_user", "tbl_order_item", "create_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_item_to_update_user", "tbl_order_item", "update_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");

		//order_item_to_stock
		$this->addForeignKey("fk_order_item_to_stock_to_order_item", "tbl_order_item_to_stock", "order_item_id", "tbl_order_item", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_item_to_stock_to_stock", "tbl_order_item_to_stock", "stock_id", "tbl_stock", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_item_to_stock_to_create_user", "tbl_order", "create_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_item_to_stock_to_update_user", "tbl_order", "update_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");

		//part
		$this->addForeignKey("fk_part_to_units", "tbl_part", "PNUNID", "tbl_pv_un", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_tab_parent", "tbl_part", "PNTabParentID", "tbl_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_type", "tbl_part", "type_id", "tbl_pv_type", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_stock_location", "tbl_part", "stock_location_id", "tbl_stock_location", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_requestor", "tbl_part", "requester_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_create_user", "tbl_part", "create_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_update_user", "tbl_part", "update_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");

        //project
		$this->addForeignKey("fk_project_to_customer", "tbl_project", "customer_id", "tbl_customer", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_project_to_create_user", "tbl_project", "create_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_project_to_update_user", "tbl_project", "update_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		
		//stock
		$this->addForeignKey("fk_stock_to_part", "tbl_stock", "part_id", "tbl_part", "id", "CASCADE", "RESTRICT");

		//parts and vendors tables
		//pv_fil
		$this->addForeignKey("fk_pv_fil_part", "tbl_pv_fil", "FILPNID", "tbl_pv_pn", "id", "CASCADE", "RESTRICT");

		//pv_lin
		$this->addForeignKey("fk_pv_lin_supplier", "tbl_pv_lin", "LINSUID", "tbl_pv_lin", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_pv_lin_mfr", "tbl_pv_lin", "LINMFRID", "tbl_pv_mfr", "id", "CASCADE", "RESTRICT");

		//pv_lnk
		$this->addForeignKey("fk_pv_lnk_supplier", "tbl_pv_lnk", "LNKSUID", "tbl_pv_su", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_pv_lnk_mfr_part", "tbl_pv_lnk", "LNKMFRPNID", "tbl_pv_mfrpn", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_pv_lnk_mfr", "tbl_pv_lnk", "LNKMFRID", "tbl_pv_mfr", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_pv_lnk_units", "tbl_pv_lnk", "LNKUNID", "tbl_pv_un", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_pv_lnk_part", "tbl_pv_lnk", "LNKPNID", "tbl_pv_pn", "id", "CASCADE", "RESTRICT");
		
		//pv_mfrpn
		$this->addForeignKey("fk_pv_mfrpn_mfr", "tbl_pv_mfrpn", "MFRPNMFRID", "tbl_pv_mfr", "id", "CASCADE", "RESTRICT");

		//pv_pl
		$this->addForeignKey("fk_pv_pl_pn_parent", "tbl_pv_pl", "PLListID", "tbl_pv_pn", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_pv_pl_pn_child", "tbl_pv_pl", "PLPartID", "tbl_pv_pn", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_pv_pl_mfrpn", "tbl_pv_pl", "PLMFRPNID", "tbl_pv_mfrpn", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_pv_pl_mfr", "tbl_pv_pl", "PLMFRID", "tbl_pv_mfr", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_pv_pl_su", "tbl_pv_pl", "PLSUID", "tbl_pv_su", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_pv_pl_lnk", "tbl_pv_pl", "PLLNKID", "tbl_pv_lnk", "id", "CASCADE", "RESTRICT");

		//pv_su
		$this->addForeignKey("fk_pv_su_currency", "tbl_pv_su", "SUCURID", "tbl_pv_cur", "id", "CASCADE", "RESTRICT");
	}

	public function down()
	{
		$this->execute("SET foreign_key_checks = 0;");

		$this->dropTable('tbl_activity');
		$this->dropTable('tbl_customer');
		$this->dropTable('tbl_issue');
		$this->dropTable('tbl_order');
		$this->dropTable('tbl_order_item');
		$this->dropTable('tbl_order_item_to_stock');        
		$this->dropTable('tbl_part');        
		$this->dropTable('tbl_person');
		$this->dropTable('tbl_project');
		$this->dropTable('tbl_stock');
		$this->dropTable('tbl_stock_location');

		$this->dropTable('tbl_pv_al');
		$this->dropTable('tbl_pv_cnv');
		$this->dropTable('tbl_pv_cost');
		$this->dropTable('tbl_pv_cu');
		$this->dropTable('tbl_pv_fil');
		$this->dropTable('tbl_pv_hist');
		$this->dropTable('tbl_pv_hpref');
		$this->dropTable('tbl_pv_job');
		$this->dropTable('tbl_pv_lin');
		$this->dropTable('tbl_pv_mf');
		$this->dropTable('tbl_pv_org');
		$this->dropTable('tbl_pv_pl');
		$this->dropTable('tbl_pv_pll');
		$this->dropTable('tbl_pv_po');
		$this->dropTable('tbl_pv_pod');
		$this->dropTable('tbl_pv_pom');
		$this->dropTable('tbl_pv_rpx');
		$this->dropTable('tbl_pv_ship');
		$this->dropTable('tbl_pv_task');

		$this->dropTable('tbl_pv_lnk');
		$this->dropTable('tbl_pv_pn');
		$this->dropTable('tbl_pv_type');
		$this->dropTable('tbl_pv_mfrpn');
		$this->dropTable('tbl_pv_mfr');
		$this->dropTable('tbl_pv_su');
		$this->dropTable('tbl_pv_cur');
		$this->dropTable('tbl_pv_un');
		
		$this->execute("SET foreign_key_checks = 0;");
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
