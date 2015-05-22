<?php

class m131105_025331_initial_schema extends CDbMigration
{
	public function up()
	{
		//currency (origin: parts&vendors CUR)
		//currencies with print symbol, formatting and exchange rate
		$this->createTable('tbl_currency', array(
			'id' => 'pk',
			'CURCurrencyName' => 'VARCHAR(50)', 
			'CURExchangeRate' => 'DOUBLE NULL DEFAULT 0', //local_currency divided by foreign_currency
			'CURCurrencyChar' => 'VARCHAR(4)', 
			'CURFormat' => 'VARCHAR(35)', 
			'CURFormatExt' => 'VARCHAR(35)', 
		), 'ENGINE=InnoDB'); 

		//customer (origin: parts&vendors CU)
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

		//file (origin: parts&vendors FIL)
		//files associated with parts
		$this->createTable('tbl_file', array(
			'id' => 'pk',
			'FILPNPartNumber' => 'VARCHAR(50)', 
			'FILFilePath' => 'VARCHAR(255)',
			'FILFileName' => 'VARCHAR(255)', //filename with path (e.g. C:\docs\datasheet.pdf), or URL
			'FILView' => 'TINYINT(1) DEFAULT 0',
			'FILNotes' => 'VARCHAR(50)', 

			'part_id' => 'integer DEFAULT NULL', //the part the file is associated with (one part per file)
		), 'ENGINE=InnoDB');        

		//invoice
		//invoice customer for goods sold
		$this->createTable('tbl_invoice', array(
			'id' => 'pk',
			'invoice_date' => 'datetime DEFAULT NULL',
			'due_date' => 'datetime DEFAULT NULL',
			'tax' => 'float',
			'shipping' => 'float',
			'amount_due' => 'float',

			'order_id' => 'integer',

			'create_time' => 'datetime NOT NULL',
			'create_user_id' => 'integer NOT NULL',
			'update_time' => 'datetime NOT NULL',
			'update_user_id' => 'integer NOT NULL',		
		), 'ENGINE=InnoDB');        

		//issue
		//an observation of a past behavior that must be investigated (which
		//be only taking note of, and to leave a record which may be of use
		//in some later investigation), or a behavior to be investigated or
		//verified at some later time.
		$this->createTable('tbl_issue', array(
			'id' => 'pk',
			'name' => 'string NOT NULL',
			'description' => 'text',

			'begin_date' => 'datetime DEFAULT NULL',
			'end_date' => 'datetime DEFAULT NULL',
			'duration' => 'integer DEFAULT NULL', //in work units
			'completion' => 'float DEFAULT NULL', //percentage of activity completed
			'outline_number' => 'string DEFAULT NULL', //e.g. WBS code
			'cost' => 'float DEFAULT NULL', //$$$s
			'web_link' => 'string DEFAULT NULL', //URL of arbitrary web resource

			'owner_id' => 'integer DEFAULT NULL', //the user who is accountable for the resolution of the issue
			'project_id' =>'integer DEFAULT NULL', //the project which the issue is being managed as part of
			'requester_id' => 'integer DEFAULT NULL', //the user taking responsibility for having the issue recorded
			'status_id' => 'integer DEFAULT NULL', //[NOT_STARTED|STARTED|FINISHED], defined in class, not fk
			'type_id' => 'integer DEFAULT NULL', //[BUG|FEATURE|TASK], defined in class, not fk

			'create_time' => 'datetime',
			'create_user_id' => 'integer',
			'update_time' => 'datetime',
			'update_user_id' => 'integer',
		), 'ENGINE=InnoDB');

		//issue_list
		//issues determined to be related (child issues)
		$this->createTable('tbl_issue_list', array(
			'id' => 'pk',
			'issue_id' => 'integer DEFAULT NULL',
			'related_id' => 'integer DEFAULT NULL',
		), 'ENGINE=InnoDB');

		//issue_part_assignment
		//parts required to resolve an issue, or which themselves require resolution
		//many-to-many issues to parts
		$this->createTable('tbl_issue_part_assignment', array(
			'issue_id' => 'integer DEFAULT NULL',
			'part_id' => 'integer DEFAULT NULL',
			'PRIMARY KEY (`issue_id`,`part_id`)',
		), 'ENGINE=InnoDB');

		//issue_predecessor_assignment
		//issues which require resolution before an issue
		//for use in scheduling TASK-type issues
		//many-to-many issues to predecessors
		$this->createTable('tbl_issue_predecessor_assignment', array(
			'issue_id' => 'integer DEFAULT NULL',
			'predecessor_id' => 'integer DEFAULT NULL',
			'PRIMARY KEY (`issue_id`,`predecessor_id`)',
		), 'ENGINE=InnoDB');

		//issue_stock_assignment
		//stock required to resolve an issue, or which themselves require resolution
		//many-to-many issues to stock items
		$this->createTable('tbl_issue_stock_assignment', array(
			'issue_id' => 'integer DEFAULT NULL',
			'stock_id' => 'integer DEFAULT NULL',
			'PRIMARY KEY (`issue_id`,`stock_id`)',
		), 'ENGINE=InnoDB');

		//issue_user_assignment
		//team of users tasked with resolving issue
		//many-to-many issues to users
		$this->createTable('tbl_issue_user_assignment', array(
			'issue_id' => 'integer DEFAULT NULL',
			'user_id' => 'integer DEFAULT NULL',
			'PRIMARY KEY (`issue_id`,`user_id`)',
		), 'ENGINE=InnoDB');

		//manufacturer (origin: parts&vendors MFR)
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

		//manufacturer_part (origin: parts&vendors MFRPN)
		//manufacturers part numbers and related data
		$this->createTable('tbl_manufacturer_part', array(
			'id' => 'pk',
			//'MFRPNMFRID' => 'INTEGER DEFAULT 0', 
			'manufacturer_id' => 'integer DEFAULT 0', 
			'MFRPNPart' => 'VARCHAR(50)', 
		), 'ENGINE=InnoDB');

		//order (origin: parts&vendors JOB - PV6EX and PV6ECO only)
		//job master data for customer jobs
		$this->createTable('tbl_order', array(
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

			'partslist_id' => 'integer', //parts list used as order template (if used)
			'project_id' => 'integer', //project associated with order
			'shipper_id' => 'integer',
			'status_id' => 'integer', //[New|Invoiced|Shipped|Closed], defined in class, not fk
			'type_id' => 'integer', //[Internal|External], defined in class, not fk

			'create_time' => 'datetime DEFAULT NULL',
			'create_user_id' => 'integer DEFAULT NULL',
			'update_time' => 'datetime DEFAULT NULL',
			'update_user_id' => 'integer DEFAULT NULL',	
		), 'ENGINE=InnoDB');  

		//order_item (origin: pv_task - PV6EX and PV6ECO only)
		//job line items
		$this->createTable('tbl_order_item', array(
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

			'status_id' => 'integer', //[None|Allocated|Invoiced|Shipped|On Order|No Stock], defined in class, not fk

			'create_time' => 'datetime DEFAULT NULL',
			'create_user_id' => 'int(11) DEFAULT NULL',
			'update_time' => 'datetime DEFAULT NULL',
			'update_user_id' => 'int(11) DEFAULT NULL',			
		), 'ENGINE=InnoDB');  

		//order_item_stock_asignment
		$this->createTable('tbl_order_item_stock_assignment', array(
			'id' => 'pk',
			'order_item_id' => 'integer',
			'stock_id' => 'integer',
		), 'ENGINE=InnoDB');

		//part (origin: parts&vendors PN)
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
			'PNStatus' => 'VARCHAR(1)', //[R|U|O], defined in class, not fk
			'PNReqBy' => 'VARCHAR(10)', //initials or nickname of requester (requester_id is fk to user)
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
			'status_id' => 'integer', //[Inactive|Active], defined in class, not fk
			'stock_location_id' => 'integer',
			'type_id' => 'integer DEFAULT NULL',

			'create_time' => 'datetime',
			'create_user_id' => 'integer',
			'update_time' => 'datetime',
			'update_user_id' => 'integer',			
		), 'ENGINE=InnoDB');

		//part_cost (origin: parts&vendors COST)
		//cost at "buy-level" from a source for a part
		$this->createTable('tbl_part_cost', array(
			'id' => 'pk',
			'COSTLNKID' => 'INTEGER NOT NULL', 
			'COSTAtQty' => 'FLOAT NULL DEFAULT 1', 
			'COSTLeadtime' => 'INTEGER DEFAULT 0', 
			'COSTCost' => 'DOUBLE NULL DEFAULT 0', 
		), 'ENGINE=InnoDB'); 

		//part_list (origin: parts&vendors PL)
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

		//part_source_assignment (origin:parts&vendors LNK)
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

		//part_type (origin: parts&vendors TYPE)
		//part type lookup
		$this->createTable('tbl_part_type', array(
			'id' => 'pk',
			'TYPEType' => 'VARCHAR(6)',
		), 'ENGINE=InnoDB');  

		//project
		$this->createTable('tbl_project', array(
			'id' => 'pk',
			'name' => 'string NOT NULL', //e.g. "Aircraft Wireless"
			'code' => 'string DEFAULT NULL', //e.g. "P2015-001"
			'description' => 'text NOT NULL', //e.g. "New smaller wireless for 2-seaters"

			'customer_id' => 'integer DEFAULT NULL', //customer, if the project has a direct customer
			'owner_id' => 'integer DEFAULT NULL', //primary stakeholder user
			'phase_id' => 'integer DEFAULT NULL', //[Idea|Definition|Design|Test|Pilot|Termination], defined in class, not fk
			'status_id' => 'integer DEFAULT NULL', //[NotStarted|Started|Finished], defined in class, not fk
			'type_id' => 'integer DEFAULT NULL', //[PDev|PCi|Rsrch|Infra], defined in class, not fk

			'create_time' => 'datetime DEFAULT NULL',
			'create_user_id' => 'integer DEFAULT NULL',
			'update_time' => 'datetime DEFAULT NULL',
			'update_user_id' => 'integer DEFAULT NULL',
		), 'ENGINE = InnoDB');

		//project_user_assignment
		//many-to-many projects-to-users
		$this->createTable('tbl_project_user_assignment', array(
			'project_id' => 'int(11) DEFAULT NULL',
			'user_id' => 'int(11) DEFAULT NULL',
			'PRIMARY KEY (`project_id`,`user_id`)',
		), 'ENGINE=InnoDB');

		//purchase_order (origin: parts&vendors POM - PV6EX and PV6ECO only)
		//purchase order and RFQ master data
		$this->createTable('tbl_purchase_order', array(
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

			'status_id' => 'integer', //[New|Submitted|Approved|Closed], defined in class, not fk

			'create_time' => 'datetime',
			'create_user_id' => 'integer',
			'update_time' => 'datetime',
			'update_user_id' => 'integer',			
		), 'ENGINE=InnoDB');  

		//purchase_order_item (origin: parts&vendors PO - PV6EX and PV6ECO only)
		//line items on RFQs and POs
		$this->createTable('tbl_purchase_order_item', array(
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

		//shipper (origin: parts&vendors SHIP - PV6EX and PV6ECO only)
		//shipping methods for reference by POs
		$this->createTable('tbl_shipper', array(
			'id' => 'pk',
			'SHIPMethod' => 'VARCHAR(50)', 
		), 'ENGINE=InnoDB');  

		//stock (serial or lot identified stock)
		$this->createTable('tbl_stock', array(
			'id' => 'pk', //not included in source csv
			'serial_number' => 'string', //e.g. A1234, 1234B, A-1234...
			'version' => 'string',

			'part_id' => 'integer',
			'status_id' => 'integer DEFAULT NULL', //[Inactive|Active], defined in class, not fk
		), 'ENGINE=InnoDB');

		//stock location
		$this->createTable('tbl_stock_location', array(
			'id' => 'pk',
			'name' => 'string',
			'use_sublocation' => 'integer', //TODO boolean
			'sublocation_min' => 'integer',
			'sublocation_max' => 'integer',
		), 'ENGINE=InnoDB');        

		//stock_transaction
		//from-to stock transactions
		$this->createTable('tbl_stock_transaction', array(
			'id' => 'pk',
			'comments' => 'string',
			'quantity' => 'float NOT NULL',

			'customer_order_id' => 'integer DEFAULT NULL',
			'part_id' => 'integer DEFAULT NULL',
			'purchase_order_id' => 'integer DEFAULT NULL',
			'stock_id' => 'integer DEFAULT NULL', //specific serial number or lot
			'type_id' => 'integer DEFAULT NULL', //[Purchased|Sold|On Hold|Waste], defined in class, not fk

			'create_time' => 'datetime NOT NULL',
			'create_user_id' => 'integer NOT NULL',
			'update_time' => 'datetime NOT NULL',
			'update_user_id' => 'integer NOT NULL',		
		), 'ENGINE=InnoDB');        

		//supplier (origin: parts&vendors SU)
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
			'SUNoPhonePrefix' => 'TINYINT(1) DEFAULT 0', //boolean, 0 = do not use prefix, 1 = use prefix (prefix stored in pv_hpref)
		), 'ENGINE=InnoDB');  

		//supplier_manufacturer_assignment (origin: parts&vendors LIN)
		//many-to-many suppliers-to-manufacturers
		$this->createTable('tbl_supplier_manufacturer_assignment', array(
			'id' => 'pk',
			'LINSUID' => 'INTEGER NOT NULL DEFAULT 0', 
			'LINMFRID' => 'INTEGER NOT NULL DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//unit (origin: parts&vendors UN)
		//units of measure
		$this->createTable('tbl_unit', array(
			'id' => 'pk',
			'UNUseUnits' => 'VARCHAR(20) NOT NULL', 
			'UNPurchUnits' => 'VARCHAR(20) NOT NULL', 
			'UNConvUnits' => 'FLOAT NULL NOT NULL DEFAULT 1', //number of use-units in purchase-unit
		), 'ENGINE=InnoDB');  

		//user
		$this->createTable('tbl_user', array(
			'id' => 'pk',
			'username' => 'string NOT NULL', //user *must* have a unique username (preferably network login id)
			'email' => 'string NOT NULL', //user *must* have a unique email address
			'password' => 'string NOT NULL', //user *must* have a password

			'nick' => 'string',
			'lname' => 'string', //e.g. "Tom"
			'fname' => 'string', //e.g. "Swift"
			'initial' => 'string', //e.g. "J"

			'status_id' => 'integer DEFAULT NULL', // //[Inactive|Active], defined in class, not fk
			'profile_id' => 'integer DEFAULT NULL', //[Admin|Demo|Eng|Finance|MfgBuild|PurchRcv|RelCtrl|Sales|View], defined in class, not fk

			'last_login_time' => 'datetime DEFAULT NULL',
			
			'create_time' => 'datetime DEFAULT NULL',
			'create_user_id' => 'int(11) DEFAULT NULL',
			'update_time' => 'datetime DEFAULT NULL',
			'update_user_id' => 'int(11) DEFAULT NULL',
		), 'ENGINE=InnoDB');

		//parts&vendors
		//tables specific to PV6EX or PV6ECO and not yet fully understood, or to be refactored

		//pv_al (PV6EX and PV6ECO only)
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

		//pv_cnv
		//convert unit of measure? convert PO to RFQ?
		$this->createTable('tbl_pv_cnv', array(
			'id' => 'pk',
			'CNVLNKID' => 'INTEGER NOT NULL DEFAULT 0', 
		), 'ENGINE=InnoDB'); 

		//pv_cost
		//refactored to part_cost

		//pv_cu
		//refactored to customer

		//pv_cur
		//refactored to currency

		//pv_dept (PV6ECO only, and only if schema installed)
		//not supported

		//pv_eco (PV6ECO only, and only if schema installed)
		//not supported

		//pv_fil
		//refactored to file

		//pv_grp (PV6EX and PV6ECO only, and only if schema installed)
		//not supported

		//pv_hist
		//history of bulk inventory adjustments
		$this->createTable('tbl_pv_hist', array(
			'id' => 'pk',
			'HISTWho' => 'VARCHAR(20)', 
			'HISTWhat' => 'VARCHAR(255)', 
			'HISTWhen' => 'TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP', 
			'HISTWhy' => 'VARCHAR(255)', 
			'HISTHowMany' => 'FLOAT NULL DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//pv_hpref
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

		//pv_job (PV6EX and PV6ECO only)
		//refactored to order

		//pv_lin
		//refactored to supplier_manufacturer_assignment

		//pv_lnk
		//refactored to part_source_assignment

		//pv_mf (PV6EX and PV6ECO only)
		//part made-from relationships
		$this->createTable('tbl_pv_mf', array(
			'id' => 'pk',
			'MFPNIDParent' => 'INTEGER DEFAULT 0', 
			'MFPNIDSub' => 'INTEGER DEFAULT 0', 
			'MFQty' => 'FLOAT NULL DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//pv_mfr
		//refactored to manufacturer

		//pv_mfrpn
		//refactored to manufacturer_part

		//pv_org
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

		//pv_pl
		//refactored to part_list

		//pv_pll
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

		//pv_pn
		//refactored to part

		//pv_po (PV6EX and PV6ECO only)
		//refactored to purchase_order_item

		//pv_pod (PV6EX and PV6ECO only)
		//purchase order data included in PO line item
		//P&V duplicates UDF captions here and in pv_hpref
		$this->createTable('tbl_pv_pod', array(
			'id' => 'pk',
			'PODField' => 'VARCHAR(50)', //field to potentially show on order or job
			'PODCaption' => 'VARCHAR(50)', //order-specific caption (override pv_hpref?)
			'PODOrder' => 'INTEGER DEFAULT 0', //order of appearance on order
			'PODUse' => 'TINYINT(1) DEFAULT 0', //use on order (boolean)
			'PODNewLine' => 'TINYINT(1) DEFAULT 0', //on new line on order (boolean)
			'PODUseCaption' => 'TINYINT(1) DEFAULT 0', //use local caption in order (boolean)
			'PODMode' => 'INTEGER DEFAULT 0', //0=PO; 1=JOB
			'PODOrderJOB' => 'INTEGER DEFAULT 0', //order of appearance on job
			'PODUseJOB' => 'TINYINT(1) DEFAULT 0', //use on job (boolean)
			'PODNewLineJOB' => 'TINYINT(1) DEFAULT 0', //on new line on job (boolean)
			'PODUseCaptionJOB' => 'TINYINT(1) DEFAULT 0', //use local caption in job (boolean)
		), 'ENGINE=InnoDB');  

		//pv_pom (PV6EX and PV6ECO only)
		//refactored to purchase_order

		//pv_rpx (PV6EX and PV6ECO only)
		//global report layouts
		$this->createTable('tbl_pv_rpx', array(
			'id' => 'pk',
			'RPXGrid' => 'VARCHAR(50) NOT NULL', 
			'RPXName' => 'VARCHAR(50)', 
			'RPXLayout' => 'LONGTEXT', 
			'RPXLabel' => 'TINYINT(1) DEFAULT 0', 
			'RPXPrimary' => 'TINYINT(1) DEFAULT 0', 
		), 'ENGINE=InnoDB');  

		//pv_ship (PV6EX and PV6ECO only)
		//refactored to shipper

		//pv_su 
		//refactored to supplier

		//pv_task (PV6EX and PV6ECO only)
		//refactored to order_item

		//pv_type
		//refactored to part_type

		//pv_un
		//refactored to unit

		//foreign keys
		//
		//file
		$this->addForeignKey("fk_file_to_part", "tbl_file", "part_id", "tbl_part", "id", "CASCADE", "RESTRICT");

		//invoice
		$this->addForeignKey("fk_invoice_to_order", "tbl_invoice", "order_id", "tbl_order", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_invoice_to_create_user", "tbl_invoice", "create_user_id", "tbl_user", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_invoice_to_update_user", "tbl_invoice", "update_user_id", "tbl_user", "id", "CASCADE", "RESTRICT");

		//issue
		$this->addForeignKey("fk_issue_to_owner", "tbl_issue", "owner_id", "tbl_user", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_project", "tbl_issue", "project_id", "tbl_project", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_requester", "tbl_issue", "requester_id", "tbl_user", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_create_user", "tbl_issue", "create_user_id", "tbl_user", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_to_update_user", "tbl_issue", "update_user_id", "tbl_user", "id", "CASCADE", "RESTRICT");

		//issue_list
		$this->addForeignKey("fk_issue_list_to_parent", "tbl_issue_list", "issue_id", "tbl_issue", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_issue_list_to_child", "tbl_issue_list", "related_id", "tbl_issue", "id", "CASCADE", "RESTRICT");

		//issue_part_assignment
		$this->addForeignKey("fk_issue_to_part", "tbl_issue_part_assignment", "issue_id", "tbl_issue", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_issue", "tbl_issue_part_assignment", "part_id", "tbl_part", "id", "CASCADE", "RESTRICT");

		//issue_predecessor_assignment
		$this->addForeignKey("fk_issue_to_predecessor", "tbl_issue_predecessor_assignment", "issue_id", "tbl_issue", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_predecessor_to_issue", "tbl_issue_predecessor_assignment", "predecessor_id", "tbl_issue", "id", "CASCADE", "RESTRICT");

		//issue_stock_assignment
		$this->addForeignKey("fk_issue_to_stock", "tbl_issue_stock_assignment", "issue_id", "tbl_issue", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_stock_to_issue", "tbl_issue_stock_assignment", "stock_id", "tbl_stock", "id", "CASCADE", "RESTRICT");

		//issue_user_assignment
		$this->addForeignKey("fk_issue_to_user", "tbl_issue_user_assignment", "issue_id", "tbl_issue", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_user_to_issue", "tbl_issue_user_assignment", "user_id", "tbl_user", "id", "CASCADE", "RESTRICT");

		//manufacturer_part
		$this->addForeignKey("fk_mfrpn_mfr", "tbl_manufacturer_part", "manufacturer_id", "tbl_manufacturer", "id", "CASCADE", "RESTRICT");

		//order
		$this->addForeignKey("fk_order_to_customer", "tbl_order", "JOBCUID", "tbl_customer", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_to_parts_list", "tbl_order", "partslist_id", "tbl_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_to_project", "tbl_order", "project_id", "tbl_project", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_to_shipper", "tbl_order", "shipper_id", "tbl_shipper", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_to_create_user", "tbl_order", "create_user_id", "tbl_user", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_to_update_user", "tbl_order", "update_user_id", "tbl_user", "id", "CASCADE", "RESTRICT");

		//order_item
		$this->addForeignKey("fk_order_item_to_order", "tbl_order_item", "TASKJOBID", "tbl_order", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_item_to_part", "tbl_order_item", "TASKPNID", "tbl_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_item_to_create_user", "tbl_order_item", "create_user_id", "tbl_user", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_item_to_update_user", "tbl_order_item", "update_user_id", "tbl_user", "id", "CASCADE", "RESTRICT");

		//order_item_stock_assignment
		$this->addForeignKey("fk_stock_item_to_order_item", "tbl_order_item_stock_assignment", "order_item_id", "tbl_order_item", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_order_item_to_stock_item", "tbl_order_item_stock_assignment", "stock_id", "tbl_stock", "id", "CASCADE", "RESTRICT");

		//part
		$this->addForeignKey("fk_part_to_units", "tbl_part", "PNUNID", "tbl_unit", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_tab_parent", "tbl_part", "PNTabParentID", "tbl_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_type", "tbl_part", "type_id", "tbl_part_type", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_stock_location", "tbl_part", "stock_location_id", "tbl_stock_location", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_requestor", "tbl_part", "requester_id", "tbl_user", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_create_user", "tbl_part", "create_user_id", "tbl_user", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_part_to_update_user", "tbl_part", "update_user_id", "tbl_user", "id", "CASCADE", "RESTRICT");

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
		$this->addForeignKey("fk_project_to_owner", "tbl_project", "owner_id", "tbl_user", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_project_to_create_user", "tbl_project", "create_user_id", "tbl_user", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_project_to_update_user", "tbl_project", "update_user_id", "tbl_user", "id", "CASCADE", "RESTRICT");

		//project_user_assignment
		$this->addForeignKey("fk_project_to_user", "tbl_project_user_assignment", "project_id", "tbl_project", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_user_to_project", "tbl_project_user_assignment", "user_id", "tbl_user", "id", "CASCADE", "RESTRICT");

		//purchase_order
		$this->addForeignKey("fk_purchase_order_to_supplier", "tbl_purchase_order", "POMSUID", "tbl_supplier", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_purchase_order_to_currency", "tbl_purchase_order", "POMCURID", "tbl_currency", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_purchase_order_to_create_user", "tbl_purchase_order", "create_user_id", "tbl_user", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_purchase_order_to_update_user", "tbl_purchase_order", "update_user_id", "tbl_user", "id", "CASCADE", "RESTRICT");

		//purchase_order_item
		$this->addForeignKey("fk_purchase_order_item_to_purchase_order", "tbl_purchase_order_item", "POPOMID", "tbl_purchase_order", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_purchase_order_item_to_part_source", "tbl_purchase_order_item", "POLNKID", "tbl_part_source_assignment", "id", "CASCADE", "RESTRICT");

		//stock
		$this->addForeignKey("fk_stock_to_part", "tbl_stock", "part_id", "tbl_part", "id", "CASCADE", "RESTRICT");

		//stock_transaction
		$this->addForeignKey("fk_stock_transaction_to_order", "tbl_stock_transaction", "customer_order_id", "tbl_order", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_stock_transaction_to_part", "tbl_stock_transaction", "part_id", "tbl_part", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_stock_transaction_to_purchase_order", "tbl_stock_transaction", "purchase_order_id", "tbl_purchase_order", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_stock_transaction_to_stock_item", "tbl_stock_transaction", "stock_id", "tbl_stock", "id", "CASCADE", "RESTRICT");

		//supplier
		$this->addForeignKey("fk_supplier_to_currency", "tbl_supplier", "currency_id", "tbl_currency", "id", "CASCADE", "RESTRICT");

		//supplier_manufacturer_assignment
		$this->addForeignKey("fk_supplier_manufacturer_assignment_to_supplier", "tbl_supplier_manufacturer_assignment", "LINSUID", "tbl_supplier", "id", "CASCADE", "RESTRICT");
		$this->addForeignKey("fk_supplier_manufacturer_assignment_to_manufacturer", "tbl_supplier_manufacturer_assignment", "LINMFRID", "tbl_manufacturer", "id", "CASCADE", "RESTRICT");
	}

	public function down()
	{
		$this->execute("SET foreign_key_checks = 0;");

		$this->dropTable('tbl_currency');
		$this->dropTable('tbl_customer');
		$this->dropTable('tbl_file');
		$this->dropTable('tbl_invoice');
		$this->dropTable('tbl_issue');
		$this->dropTable('tbl_issue_list');
		$this->dropTable('tbl_issue_part_assignment');
		$this->dropTable('tbl_issue_predecessor_assignment');
		$this->dropTable('tbl_issue_stock_assignment');		
		$this->dropTable('tbl_issue_user_assignment');		
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
		$this->dropTable('tbl_project');
		$this->dropTable('tbl_project_user_assignment');
		$this->dropTable('tbl_purchase_order');
		$this->dropTable('tbl_purchase_order_item');
		$this->dropTable('tbl_shipper');
		$this->dropTable('tbl_stock');
		$this->dropTable('tbl_stock_location');
		$this->dropTable('tbl_stock_transaction');
		$this->dropTable('tbl_supplier');
		$this->dropTable('tbl_supplier_manufacturer_assignment');
		$this->dropTable('tbl_unit');
		$this->dropTable('tbl_user');

		//parts&vendors
		$this->dropTable('tbl_pv_al');
		$this->dropTable('tbl_pv_cnv');
		$this->dropTable('tbl_pv_hist');
		$this->dropTable('tbl_pv_hpref');
		$this->dropTable('tbl_pv_mf');
		$this->dropTable('tbl_pv_org');
		$this->dropTable('tbl_pv_pll');
		$this->dropTable('tbl_pv_pod');
		$this->dropTable('tbl_pv_rpx');

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
