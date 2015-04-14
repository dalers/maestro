<?php

class m131105_025331_initial_schema extends CDbMigration
{
	public function up()
	{
		//activity table
		//project activities
		$this->createTable('tbl_activity', array(
			'id' => 'pk',
			
			'name' => 'string',
			'begin_date' => 'datetime',
			'end_date' => 'datetime',
			'duration' => 'integer', //in work units
			'completion' => 'float', //percentage of activity completed
			'outline_number' => 'string', //e.g. WBS code
			'cost' => 'float', //$$$s
			'web_link' => 'string',
			'notes' => 'string',

			'status_id' => 'integer DEFAULT NULL',
			'coordinator_id' => 'integer DEFAULT NULL',
			'project_id' => 'integer DEFAULT NULL',

			'create_time' => 'datetime NOT NULL',
			'create_user_id' => 'integer NOT NULL',
			'update_time' => 'datetime NOT NULL',
			'update_user_id' => 'integer NOT NULL',
		), 'ENGINE = InnoDB');

		//activity_part_assignment table (equipment)
		//many-to-many activity-to-part
		$this->createTable('tbl_activity_part_assignment', array(
			'activity_id' => 'integer DEFAULT NULL',
			'part_id' => 'integer DEFAULT NULL',
			'PRIMARY KEY (`activity_id`,`part_id`)',
		), 'ENGINE=InnoDB');

		//activity_predecessor_assignment table
		//many-to-many activity-to-predecessor
		$this->createTable('tbl_activity_predecessor_assignment', array(
			'activity_id' => 'integer DEFAULT NULL',
			'predecessor_id' => 'integer DEFAULT NULL',
			'PRIMARY KEY (`activity_id`,`predecessor_id`)',
		), 'ENGINE=InnoDB');

		//activity_resource_assignment table (human resource)
		//many-to-many activity-to-resource
		$this->createTable('tbl_activity_resource_assignment', array(
			'activity_id' => 'integer DEFAULT NULL',
			'resource_id' => 'integer DEFAULT NULL',
			'PRIMARY KEY (`activity_id`,`resource_id`)',
		), 'ENGINE=InnoDB');

		//activity_stock_assignment table (equipment)
		//many-to-many activity-to-stock
		$this->createTable('tbl_activity_stock_assignment', array(
			'activity_id' => 'integer DEFAULT NULL',
			'stock_id' => 'integer DEFAULT NULL',
			'PRIMARY KEY (`activity_id`,`stock_id`)',
		), 'ENGINE=InnoDB');

		//currency table (origin parts&vendors CUR table)
		//currencies with print symbol, formatting and exchange rate
		$this->createTable('tbl_currency', array(
			'id' => 'pk',
			'CURCurrencyName' => 'VARCHAR(50)', 
			'CURExchangeRate' => 'DOUBLE NULL DEFAULT 0', //<local currency> divided by <foreign currency>
			'CURCurrencyChar' => 'VARCHAR(4)', 
			'CURFormat' => 'VARCHAR(35)', 
			'CURFormatExt' => 'VARCHAR(35)', 
		), 'ENGINE=InnoDB'); 

		//customer table (origin parts&vendors CU table)
		//customer master data
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

		//file table (origin parts&vendors FIL table)
		//files associated with parts
		$this->createTable('tbl_file', array(
			'id' => 'pk',
			'FILPNPartNumber' => 'VARCHAR(50)', 
			'FILFilePath' => 'VARCHAR(255)',
			'FILFileName' => 'VARCHAR(255)', //filename with path (e.g. C:\docs\datasheet.pdf), or URL
			'FILView' => 'TINYINT(1) DEFAULT 0',
			'FILNotes' => 'VARCHAR(50)', 
			
			'part_id' => 'integer DEFAULT NULL', //limitation: one part number reference per file
		), 'ENGINE=InnoDB');        

		//issue table
		//issue master data
		$this->createTable('tbl_issue', array(
			'id' => 'pk',
			'name' => 'string NOT NULL',
			'description' => 'text',
			
			'part_id' => 'integer DEFAULT NULL', //limitation: one part number per issue
			'project_id' =>'integer DEFAULT NULL', //limitation: one project per issue
			'type_id' => 'integer DEFAULT NULL', //defined in issue model
			'status_id' => 'integer DEFAULT NULL', //defined in issue model
			'stock_id' => 'integer DEFAULT NULL', //limitation: one stock id per issue (e.g. serial number or batch/lot number) 
			'owner_id' => 'integer DEFAULT NULL', //constraint: one owner per issue

			'create_time' => 'datetime',
			'create_user_id' => 'integer',
			'update_time' => 'datetime',
			'update_user_id' => 'integer',
		), 'ENGINE=InnoDB');

		//manufacturer table (origin parts&vendors MFR table)
		//manufacturer master data
		$this->createTable('tbl_manufacturer', array(
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

		//manufacturer_part table (origin parts&vendors MFRPN table)
		//manufacturers part numbers and related data
		$this->createTable('tbl_manufacturer_part', array(
			'id' => 'pk',
			//'MFRPNMFRID' => 'INTEGER DEFAULT 0', 
			'manufacturer_id' => 'integer DEFAULT 0', 
			'MFRPNPart' => 'VARCHAR(50)', 
		), 'ENGINE=InnoDB');
		
		//order table
		$this->createTable('tbl_order', array(
			'id' => 'pk',
			'name' => 'string',
			'type' => 'string',
			'status' => 'string',
			
			'project_id' => 'integer',
			'part_id' => 'integer', //record of origin if parts list
			
			'create_time' => 'datetime DEFAULT NULL',
			'create_user_id' => 'integer DEFAULT NULL',
			'update_time' => 'datetime DEFAULT NULL',
			'update_user_id' => 'integer DEFAULT NULL',
		), 'ENGINE=InnoDB');
		
		//order_item table
		$this->createTable('tbl_order_item', array(
			'id' => 'pk',
			'desired_qty' => 'integer default 0',
			'shipped_qty' => 'integer default 0',
			
			'order_id' => 'integer',
			'part_id' => 'integer',
			
			'create_time' => 'datetime DEFAULT NULL',
			'create_user_id' => 'int(11) DEFAULT NULL',
			'update_time' => 'datetime DEFAULT NULL',
			'update_user_id' => 'int(11) DEFAULT NULL',
		), 'ENGINE=InnoDB');
		
		//order_item_stock_asignment table
		$this->createTable('tbl_order_item_stock_assignment', array(
			'id' => 'pk',
			'order_item_id' => 'integer',
			'stock_id' => 'integer',
		), 'ENGINE=InnoDB');
		
		//part table (origin parts&vendors PN table)
		//part master data
		$this->createTable('tbl_part', array(
			'id' => 'pk',
			'PNIDToLNK' => 'INTEGER', //key to source - parent or direct
			'PNUNID' => 'INTEGER DEFAULT 1', //unit of measure (fk)
			'PNTabParentID' => 'INTEGER', //parent if tabulated item (fk)
			'PNPrefix' => 'VARCHAR(50)', 
			'PNPartNumber' => 'VARCHAR(50) NOT NULL',
			'PNSuffix' => 'VARCHAR(50)', 
			'PNType' => 'VARCHAR(5)', //part type (value), see type_id for fk to part_type
			'PNRevision' => 'VARCHAR(10)',
			'PNTitle' => 'VARCHAR(255)', 
			'PNDetail' => 'VARCHAR(255)',
			'PNStatus' => 'VARCHAR(1)', //[R|U|O] (defined in model, not fk)
			'PNReqBy' => 'VARCHAR(10)', //initials or nickname of requestor, see requestor_id for fk to person
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
			'PNTab' => 'TINYINT(1) DEFAULT 0', //boolean, 1=item is tabulated parent
			'PNControlled' => 'TINYINT(1) DEFAULT 0', 
			'PNAux1' => 'VARCHAR(50)', 
			'PNQty' => 'FLOAT NULL DEFAULT 0', //inventory count location 1
			'PNQty2' => 'FLOAT NULL DEFAULT 0', //inventory count location 2
			'PNCostChanged' => 'TINYINT(1) DEFAULT 0', //boolean, 1=current cost was manually edited
			'PNParentCost' => 'TINYINT(1) DEFAULT 0', //boolean, 1=item cost determined by parent number vendor
			'PNExpandList' => 'TINYINT(1) DEFAULT 0', //boolean, 1=expand list in rollups
			'PNAssyCostOption' => 'INTEGER DEFAULT 3', //how to combine CurrentCost w/ LastRollupCost
			'PNInclAssyOnPurchList' => 'TINYINT(1) DEFAULT -1', //include on purchase list if an assembly
			'PNMadeFrom' => 'TINYINT(1) DEFAULT 0', //boolean, 1=made from other items
			'PNMinStockQty' => 'FLOAT NULL DEFAULT 0', 
			'PNOrderToMaintain' => 'TINYINT(1) DEFAULT 0', 
			'PNOnECO' => 'TINYINT(1) DEFAULT 0', 
			'PNOverKit' => 'TINYINT(1) DEFAULT 0', //boolean, 0=by percent, 1=by count
			'PNOverKitQty' => 'FLOAT NULL DEFAULT 0', 
			'PNOverKitBy' => 'INTEGER DEFAULT 0',
			'PNOverKitFor' => 'INTEGER DEFAULT 0', //boolean, 0=EachTopAssy, 1=EntireBuild
			'PNCurrentCost' => 'DOUBLE NULL DEFAULT 0', 
			'PNLastRollupCost' => 'DOUBLE NULL DEFAULT 0', 
			'PNUSRID' => 'INTEGER DEFAULT 0', 
			'PNUserLock' => 'TINYINT(1) DEFAULT 0', 
			
			'is_serialized' => 'boolean', //stock of part is serialized
			'iteration_number' => 'integer',
			'is_current_iteration' => 'boolean',

			'requester_id' => 'integer',
			'status_id' => 'integer',
			'stock_location_id' => 'integer',
			'type_id' => 'integer',

			'create_time' => 'datetime',
			'create_user_id' => 'integer',
			'update_time' => 'datetime',
			'update_user_id' => 'integer',			
		), 'ENGINE=InnoDB');

		//part_cost table (origin parts&vendors COST table)
		//cost at "buy-level" from a source for a part
		$this->createTable('tbl_part_cost', array(
			'id' => 'pk',
			'COSTLNKID' => 'INTEGER NOT NULL', 
			'COSTAtQty' => 'FLOAT NULL DEFAULT 1', 
			'COSTLeadtime' => 'INTEGER DEFAULT 0', 
			'COSTCost' => 'DOUBLE NULL DEFAULT 0', 
		), 'ENGINE=InnoDB'); 

		//part_list table (origin parts&vendors PL table)
		//part part relationships and related data
		$this->createTable('tbl_part_list', array(
			'id' => 'pk',
			'PLListID' => 'integer NOT NULL DEFAULT 0',
			'PLPartID' => 'integer NOT NULL DEFAULT 0',
			'PLItem' => 'INTEGER DEFAULT 0',
			'PLQty' => 'VARCHAR(10)',
			'PLRefMemo' => 'LONGTEXT',
			'PLRefText' => 'VARCHAR(255)',
			'PLAssyOrder' => 'FLOAT NULL',
			'PLAssySpec' => 'VARCHAR(255)',
			'PLMFRPNID' => 'integer DEFAULT NULL',
			'PLMFRID' => 'integer DEFAULT NULL',
			'PLSUID' => 'integer DEFAULT NULL',
			'PLLNKID' => 'integer DEFAULT NULL',
		), 'ENGINE=InnoDB');        

		//part_source_assignment table (origin parts&vendors LNK table)
		//part source links and related data and relationships
		$this->createTable('tbl_part_source_assignment', array(
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

		//part_type table (origin parts&vendors TYPE table)
		//part type lookup
		$this->createTable('tbl_part_type', array(
			'id' => 'pk',
			'TYPEType' => 'VARCHAR(6)',
		), 'ENGINE=InnoDB');  
		
		//person table
		$this->createTable('tbl_person', array(
			'id' => 'pk',
			'username' => 'string NOT NULL', //network login id
			'password' => 'string NOT NULL',
			'email' => 'string',
			'nick' => 'string',
			'lname' => 'string', //e.g. "Tom"
			'fname' => 'string', //e.g. "Swift"
			'initial' => 'string', //e.g. "TS"

			'status_id' => 'integer DEFAULT NULL', //[ACTIVE|NOTACTIVE] (0=Not-Active, 1=Active) (defined in model, not fk) 
			'profile_id' => 'integer DEFAULT NULL',
			
			'last_login_time' => 'datetime DEFAULT NULL',
			'create_time' => 'datetime DEFAULT NULL',
			'create_user_id' => 'int(11) DEFAULT NULL',
			'update_time' => 'datetime DEFAULT NULL',
			'update_user_id' => 'int(11) DEFAULT NULL',
		), 'ENGINE=InnoDB');
		
		//project table
		$this->createTable('tbl_project', array(
			'id' => 'pk',
			'name' => 'string NOT NULL', //e.g. "Aircraft Wireless"
			'code' => 'string NOT NULL', //e.g. "P2015-001"
			'description' => 'text NOT NULL', //e.g. "New smaller wireless for 2-seaters"

			'customer_id' => 'integer', //customer in case of a customer-directed project
			'owner_id' => 'integer', //primary scc stakeholder/benefactor
			'phase_id' => 'integer', //[IDEA|PRODUCT|DESIGN|TEST|PILOT|TERMINATION] (defined in model, not fk)
			'status_id' => 'integer', //[ACTIVE|NOTACTIVE] (defined in model, not fk)
			'type_id' => 'integer', //[DEV|RSRCH|CI|INFRA..] (defined in model, not fk)
			
			'create_time' => 'datetime DEFAULT NULL',
			'create_user_id' => 'integer DEFAULT NULL',
			'update_time' => 'datetime DEFAULT NULL',
			'update_user_id' => 'integer DEFAULT NULL',
		), 'ENGINE = InnoDB');

		//project_person_assignment table
		//many-to-many projects-to-persons
		$this->createTable('tbl_project_person_assignment', array(
			'project_id' => 'int(11) DEFAULT NULL',
			'person_id' => 'int(11) DEFAULT NULL',
			'PRIMARY KEY (`project_id`,`person_id`)',
		), 'ENGINE=InnoDB');
		
		//stock table (serial or lot identified stock)
		$this->createTable('tbl_stock', array(
			'id' => 'pk', //not included in source csv
			'serial_number' => 'string', //e.g. A1234, 1234B, A-1234...
			'version' => 'string',

			'part_id' => 'integer',
			'status_id' => 'integer DEFAULT NULL', //defined in stock model
		), 'ENGINE=InnoDB');
		
		//stock location table
		$this->createTable('tbl_stock_location', array(
			'id' => 'pk',
			'name' => 'string',
			'use_sublocation' => 'integer', //TODO boolean
			'sublocation_min' => 'integer',
			'sublocation_max' => 'integer',
		), 'ENGINE=InnoDB');        

		//supplier table (origin parts&vendors SU table)
		//supplier (vendor) master data
		$this->createTable('tbl_supplier', array(
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
			'SUDateLast' => 'DATETIME', //date supplier was last contacted
			'SUFollowup' => 'TINYINT(1) DEFAULT 0', //supplier requires follow-up
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
			//'SUCURID' => 'INTEGER DEFAULT 1', 
			'currency_id' => 'integer DEFAULT 1', 
			'SUCurReverse' => 'TINYINT(1) DEFAULT 0', 
			'SUNoPhonePrefix' => 'TINYINT(1) DEFAULT 0', //boolean, 0 = do not use prefix, 1 = use prefix (prefix in HPREF table)
 		), 'ENGINE=InnoDB');  

		//supplier_manufacturer_assignment table (origin parts&vendors LIN table)
		//many-to-many suppliers-to-manufacturers
		$this->createTable('tbl_supplier_manufacturer_assignment', array(
			'id' => 'pk',
			'LINSUID' => 'INTEGER NOT NULL DEFAULT 0', 
			'LINMFRID' => 'INTEGER NOT NULL DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//unit table (origin parts&vendors UN table)
		//units of measure
		$this->createTable('tbl_unit', array(
			'id' => 'pk',
			'UNUseUnits' => 'VARCHAR(20) NOT NULL', 
			'UNPurchUnits' => 'VARCHAR(20) NOT NULL', 
			'UNConvUnits' => 'FLOAT NULL NOT NULL DEFAULT 1', //number of use-units in purchase-unit
		), 'ENGINE=InnoDB');  

		//parts&vendors
		//tables specific to PV6EX or PV6ECO, not yet fully understood, or to be refactored
		//
		//pv_al table (PV6EX and PV6ECO only)
		//for managing client jobs
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
		//convert unit of measure? convert PO to RFQ?
		$this->createTable('tbl_pv_cnv', array(
			'id' => 'pk',
			'CNVLNKID' => 'INTEGER NOT NULL DEFAULT 0', 
		), 'ENGINE=InnoDB'); 

		//pv_cost table
		//cost at "buy-level" from a source for a part
		//refactored to part_cost table

		//pv_cu table
		//customer master data
		//refactored to customer table

		//pv_cur table
		//currencies with print symbol, formatting and exchange rate
		//refactored to currency table

		//pv_dept table (PV6ECO only, and only if schema installed)
		//eco sign-off departments
		//not supported

		//pv_eco table (PV6ECO only, and only if schema installed)
		//eco master data
		//not supported

		//pv_fil table
		//file paths or urls linked to parts
		//refactored to file table

		//pv_grp table (PV6EX and PV6ECO only, and only if schema installed)
		//user permission groups
		//not supported
		
		//pv_hist table
		//history of bulk inventory adjustments
		$this->createTable('tbl_pv_hist', array(
			'id' => 'pk',
			'HISTWho' => 'VARCHAR(20)', 
			'HISTWhat' => 'VARCHAR(255)', 
			'HISTWhen' => 'TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP', 
			'HISTWhy' => 'VARCHAR(255)', 
			'HISTHowMany' => 'FLOAT NULL DEFAULT 0', 
		), 'ENGINE=InnoDB');  
		
		//pv_hpref table
		//database configuration parameters		
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
		
		//pv_job table (PV6EX and PV6ECO only)
		//job master data for customer jobs
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
		//line card links, many-to-many suppliers-to-manufacturers
		//refactored to supplier_manufacturer_assignment table

		//pv_lnk table
		//links part sources to parts
		//refactored to part_source_assignment table

		//pv_mf table (PV6EX and PV6ECO only)
		//part made-from relationships
		$this->createTable('tbl_pv_mf', array(
			'id' => 'pk',
			'MFPNIDParent' => 'INTEGER DEFAULT 0', 
			'MFPNIDSub' => 'INTEGER DEFAULT 0', 
			'MFQty' => 'FLOAT NULL DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//pv_mfr table
		//manufacturer master data
		//refactored to manufacturer table

		//pv_mfrpn table
		//manufacturers part numbers and related data
		//refactored to manufacturer_part table

		//pv_org table
		//user organization details
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
		//part part relationships and related data
		//refactored to part_list table

		//pv_pll table
		//assembly index for purchase and kitting lists
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
		//part master data
		//refactored to part table

		//pv_po table (PV6EX and PV6ECO only)
		//line items on RFQs and POs
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

		//pv_pod table (PV6EX and PV6ECO only)
		//purchase order data included in PO line item
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

		//pv_pom table (PV6EX and PV6ECO only)
		//purchase order and RFQ master data
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

		//pv_rpx table (PV6EX and PV6ECO only)
		//global report layouts
		$this->createTable('tbl_pv_rpx', array(
			'id' => 'pk',
			'RPXGrid' => 'VARCHAR(50) NOT NULL', 
			'RPXName' => 'VARCHAR(50)', 
			'RPXLayout' => 'LONGTEXT', 
			'RPXLabel' => 'TINYINT(1) DEFAULT 0', 
			'RPXPrimary' => 'TINYINT(1) DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//pv_ship table (PV6EX and PV6ECO only)
		//shipping methods for reference by POs
		$this->createTable('tbl_pv_ship', array(
			'id' => 'pk',
			'SHIPMethod' => 'VARCHAR(50)', 
		), 'ENGINE=InnoDB');  

		//pv_su table
		//supplier master data
		//refactored to supplier table

		//pv_task (PV6EX and PV6ECO only)
		//job line items
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
		//part types (believed not used with types hard-coded in client)
		//refactored to part_type table

		//pv_un table
		//units of measure
		//refactored to unit table

		//foreign keys
		//
		//activity
		$this->addForeignKey("fk_activity_to_coordinator", "tbl_activity", "coordinator_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_activity_to_project", "tbl_activity", "project_id", "tbl_project", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_activity_to_create_user", "tbl_activity", "create_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_activity_to_update_user", "tbl_activity", "update_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		
        //activity_part_assignment
		$this->addForeignKey("fk_activity_to_part", "tbl_activity_part_assignment", "activity_id", "tbl_activity", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_activity", "tbl_activity_part_assignment", "part_id", "tbl_part", "id", "CASCADE", "RESTRICT");
		
        //activity_predecessor_assignment
		$this->addForeignKey("fk_activity_to_predecessor", "tbl_activity_predecessor_assignment", "activity_id", "tbl_activity", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_predecessor_to_activity", "tbl_activity_predecessor_assignment", "predecessor_id", "tbl_activity", "id", "CASCADE", "RESTRICT");
		
        //activity_resource_assignment
		$this->addForeignKey("fk_activity_to_resource", "tbl_activity_resource_assignment", "activity_id", "tbl_activity", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_resource_to_activity", "tbl_activity_resource_assignment", "resource_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		
        //activity_stock_assignment
		$this->addForeignKey("fk_activity_to_stock", "tbl_activity_stock_assignment", "activity_id", "tbl_activity", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_stock_to_activity", "tbl_activity_stock_assignment", "stock_id", "tbl_stock", "id", "CASCADE", "RESTRICT");
		
		//file
		$this->addForeignKey("fk_file_to_part", "tbl_file", "part_id", "tbl_part", "id", "CASCADE", "RESTRICT");

		//issue
		$this->addForeignKey("fk_issue_to_part", "tbl_issue", "part_id", "tbl_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_project", "tbl_issue", "project_id", "tbl_project", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_stock", "tbl_issue", "stock_id", "tbl_stock", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_owner", "tbl_issue", "owner_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_create_user", "tbl_issue", "create_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_update_user", "tbl_issue", "update_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		
		//manufacturer_part
		$this->addForeignKey("fk_mfrpn_mfr", "tbl_manufacturer_part", "manufacturer_id", "tbl_manufacturer", "id", "CASCADE", "RESTRICT");

		//order
		$this->addForeignKey("fk_order_to_project", "tbl_order", "project_id", "tbl_project", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_to_parts_list", "tbl_order", "part_id", "tbl_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_to_create_user", "tbl_order", "create_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_to_update_user", "tbl_order", "update_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		
		//order_item
		$this->addForeignKey("fk_order_item_to_order", "tbl_order_item", "order_id", "tbl_order", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_item_to_part", "tbl_order_item", "part_id", "tbl_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_item_to_create_user", "tbl_order_item", "create_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_item_to_update_user", "tbl_order_item", "update_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");

		//order_item_stock_assignment
		$this->addForeignKey("fk_order_item_to_stock_assignment_to_order", "tbl_order_item_stock_assignment", "order_item_id", "tbl_order_item", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_item_to_stock_assignment_to_stock", "tbl_order_item_stock_assignment", "stock_id", "tbl_stock", "id", "CASCADE", "RESTRICT");

		//part
		$this->addForeignKey("fk_part_to_units", "tbl_part", "PNUNID", "tbl_unit", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_tab_parent", "tbl_part", "PNTabParentID", "tbl_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_type", "tbl_part", "type_id", "tbl_part_type", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_stock_location", "tbl_part", "stock_location_id", "tbl_stock_location", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_requestor", "tbl_part", "requester_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_create_user", "tbl_part", "create_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_update_user", "tbl_part", "update_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");

		//part_cost
		$this->addForeignKey("fk_part_cost_to_part_source", "tbl_part_cost", "COSTLNKID", "tbl_part_source_assignment", "id", "CASCADE", "RESTRICT");

		//part_list
		$this->addForeignKey("fk_part_list_to_parent", "tbl_part_list", "PLListID", "tbl_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_list_to_child", "tbl_part_list", "PLPartID", "tbl_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_list_to_mfr_part", "tbl_part_list", "PLMFRPNID", "tbl_manufacturer_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_list_to_mfr", "tbl_part_list", "PLMFRID", "tbl_manufacturer", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_list_to_supplier", "tbl_part_list", "PLSUID", "tbl_supplier", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_list_to_part_source_assignment", "tbl_part_list", "PLLNKID", "tbl_part_source_assignment", "id", "CASCADE", "RESTRICT");
		
		//part_source_assignment
		$this->addForeignKey("fk_pv_lnk_supplier", "tbl_part_source_assignment", "LNKSUID", "tbl_supplier", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_pv_lnk_mfr_part", "tbl_part_source_assignment", "LNKMFRPNID", "tbl_manufacturer_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_pv_lnk_mfr", "tbl_part_source_assignment", "LNKMFRID", "tbl_manufacturer", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_pv_lnk_units", "tbl_part_source_assignment", "LNKUNID", "tbl_unit", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_pv_lnk_part", "tbl_part_source_assignment", "LNKPNID", "tbl_part", "id", "CASCADE", "RESTRICT");
		
		//project
		$this->addForeignKey("fk_project_to_customer", "tbl_project", "customer_id", "tbl_customer", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_project_to_owner", "tbl_project", "owner_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_project_to_create_user", "tbl_project", "create_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_project_to_update_user", "tbl_project", "update_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");

        //project_person_assignment
		$this->addForeignKey("fk_project_to_person", "tbl_project_person_assignment", "project_id", "tbl_project", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_person_to_project", "tbl_project_person_assignment", "person_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		
		//stock
		$this->addForeignKey("fk_stock_to_part", "tbl_stock", "part_id", "tbl_part", "id", "CASCADE", "RESTRICT");

		//supplier
		$this->addForeignKey("fk_supplier_to_currency", "tbl_supplier", "currency_id", "tbl_currency", "id", "CASCADE", "RESTRICT");

		//supplier_manufacturer_assignment
		$this->addForeignKey("fk_supplier_manufacturer_assignment_to_supplier", "tbl_supplier_manufacturer_assignment", "LINSUID", "tbl_supplier", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_supplier_manufacturer_assignment_to_manufacturer", "tbl_supplier_manufacturer_assignment", "LINMFRID", "tbl_manufacturer", "id", "CASCADE", "RESTRICT");
		
		//parts&vendors
		//
		//pv_cost
		//$this->addForeignKey("fk_pv_cost_lnk", "tbl_pv_cost", "COSTLNKID", "tbl_pv_lnk", "LNKID", "CASCADE", "RESTRICT");
		//
		//pv_fil
		//$this->addForeignKey("fk_pv_fil_part", "tbl_pv_fil", "FILPNID", "tbl_pv_pn", "id", "CASCADE", "RESTRICT");
		//
		//pv_lin
		//$this->addForeignKey("fk_pv_lin_supplier", "tbl_pv_lin", "LINSUID", "tbl_pv_lin", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_pv_lin_mfr", "tbl_pv_lin", "LINMFRID", "tbl_pv_mfr", "id", "CASCADE", "RESTRICT");
		//
		///pv_lnk
		//$this->addForeignKey("fk_pv_lnk_supplier", "tbl_pv_lnk", "LNKSUID", "tbl_pv_su", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_pv_lnk_mfr_part", "tbl_pv_lnk", "LNKMFRPNID", "tbl_pv_mfrpn", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_pv_lnk_mfr", "tbl_pv_lnk", "LNKMFRID", "tbl_pv_mfr", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_pv_lnk_units", "tbl_pv_lnk", "LNKUNID", "tbl_pv_un", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_pv_lnk_part", "tbl_pv_lnk", "LNKPNID", "tbl_pv_pn", "id", "CASCADE", "RESTRICT");
		//
		//pv_mfrpn
		//$this->addForeignKey("fk_pv_mfrpn_mfr", "tbl_pv_mfrpn", "MFRPNMFRID", "tbl_pv_mfr", "id", "CASCADE", "RESTRICT");
		//
		//pv_pl
		//$this->addForeignKey("fk_pv_pl_pn_parent", "tbl_pv_pl", "PLListID", "tbl_pv_pn", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_pv_pl_pn_child", "tbl_pv_pl", "PLPartID", "tbl_pv_pn", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_pv_pl_mfrpn", "tbl_pv_pl", "PLMFRPNID", "tbl_pv_mfrpn", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_pv_pl_mfr", "tbl_pv_pl", "PLMFRID", "tbl_pv_mfr", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_pv_pl_su", "tbl_pv_pl", "PLSUID", "tbl_pv_su", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_pv_pl_lnk", "tbl_pv_pl", "PLLNKID", "tbl_pv_lnk", "id", "CASCADE", "RESTRICT");
		//
		//pv_pn
		//$this->addForeignKey("fk_pv_pn_units", "tbl_pv_pn", "PNUNID", "tbl_pv_un", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_pv_pn_tab_parent", "tbl_pv_pn", "PNTabParentID", "tbl_pv_pn", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_pv_pn_type", "tbl_pv_pn", "type_id", "tbl_pv_type", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_pv_pn_stock_location", "tbl_pv_pn", "stock_location_id", "tbl_stock_location", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_pv_pn_person", "tbl_pv_pn", "requester_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_part_to_create_user", "tbl_pv_pn", "create_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		//$this->addForeignKey("fk_part_to_update_user", "tbl_pv_pn", "update_user_id", "tbl_person", "id", "CASCADE", "RESTRICT");
		//
		//pv_su
		//$this->addForeignKey("fk_pv_su_currency", "tbl_pv_su", "SUCURID", "tbl_pv_cur", "id", "CASCADE", "RESTRICT");
	}

	public function down()
	{
		$this->execute("SET foreign_key_checks = 0;");

		$this->dropTable('tbl_activity');
		$this->dropTable('tbl_activity_part_assignment');
		$this->dropTable('tbl_activity_predecessor_assignment');		
		$this->dropTable('tbl_activity_resource_assignment');		
		$this->dropTable('tbl_activity_stock_assignment');		
		$this->dropTable('tbl_currency');
		$this->dropTable('tbl_customer');
		$this->dropTable('tbl_file');
		$this->dropTable('tbl_issue');
		$this->dropTable('tbl_manufacturer');
		$this->dropTable('tbl_manufacturer_part');
		//$this->dropTable('tbl_migration');
		$this->dropTable('tbl_order');
		$this->dropTable('tbl_order_item');
		$this->dropTable('tbl_order_item_stock_assignment');
		$this->dropTable('tbl_part');   
		$this->dropTable('tbl_part_cost');
		$this->dropTable('tbl_part_list');
		$this->dropTable('tbl_part_source_assignment');
		$this->dropTable('tbl_part_type');
		$this->dropTable('tbl_person');
		$this->dropTable('tbl_project');
		$this->dropTable('tbl_project_person_assignment');
		$this->dropTable('tbl_stock');
		$this->dropTable('tbl_stock_location');
		$this->dropTable('tbl_supplier');
		$this->dropTable('tbl_supplier_manufacturer_assignment');
		$this->dropTable('tbl_unit');

		//parts&vendors
		$this->dropTable('tbl_pv_al');
		$this->dropTable('tbl_pv_cnv');
		//$this->dropTable('tbl_pv_cost');
		//$this->dropTable('tbl_pv_cu');
		//$this->dropTable('tbl_pv_cur');
		//$this->dropTable('tbl_pv_fil');
		$this->dropTable('tbl_pv_hist');
		$this->dropTable('tbl_pv_hpref');
		$this->dropTable('tbl_pv_job');
		//$this->dropTable('tbl_pv_lin');
		//$this->dropTable('tbl_pv_lnk');
		$this->dropTable('tbl_pv_mf');
		//$this->dropTable('tbl_pv_mfr');
		//$this->dropTable('tbl_pv_mfrpn');
		$this->dropTable('tbl_pv_org');
		//$this->dropTable('tbl_pv_pl');
		$this->dropTable('tbl_pv_pll');
		//$this->dropTable('tbl_pv_pn');
		$this->dropTable('tbl_pv_po');
		$this->dropTable('tbl_pv_pod');
		$this->dropTable('tbl_pv_pom');
		$this->dropTable('tbl_pv_rpx');
		$this->dropTable('tbl_pv_ship');
		//$this->dropTable('tbl_pv_su');
		$this->dropTable('tbl_pv_task');
		//$this->dropTable('tbl_pv_type');
		//$this->dropTable('tbl_pv_un');
		
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