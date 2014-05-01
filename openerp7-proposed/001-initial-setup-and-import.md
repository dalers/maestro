Install Apps into New Database
------------------------------
Install OpenERP, create a new database (e.g. "scc"), and install the following OpenERP applications in order:
* Remove openerp.com bindings
* Sales Management
* CRM
* MRP
* Project Management
* Issue Tracker
* Base Import
* Document Management System (install wizard reports config will be based on installed modules)

Login to the new database as "admin" to complete the rest of the procedure.

Configure Company
------------------------------
Settings / Companies / Companies
* Company name: Swift Construction Co.
* Logo: scc/scc-noname-100x51.jpg
* Address, phone, fax, tagline, website
* Paper Format: US Letter
* Do NOT configure email server (unless you know what you're doing ;-))

Load and Configure Users
------------------------------
1) Import users (import/res.users.csv)
* all passwords "maestro"
* users configured to NEVER receive email (all communication will be done from within OpenERP)

To re-create import/res.users.csv,
* edit the Master worksheet in scc-files/excel/persons.xlsx
* save the res.users worksheet in CSV format to import/res.users.csv

2) Configure users:
* Tom Swift
* James Period
* Miquel DeLazes
* Ned Newton
* Rad Sampson

```
Preferences:
	Timezone: America/Edmonton
	
Access rights:
	Sales: Manager
	Project: Manager
	Knowledge: User
	Warehouse: Manager
	Manufacturing: Manager
	Accounting & Finance: Financial Manager
	Purchases: Manager
	Human Resources: Employee
	Sharing: User
	Administration: Settings

Administrator: enable "Technical"
```

Load Products
------------------------------
1) Import products (import/product.product.csv)
Sales / Products / list view / Import / Encoding: Latin1

To re-create product.product.csv,
* export PN table from a Parts&Vendors(TM) database using mdbtools (pv_pn.csv)
* copy export from P&V PN table (testdata/csv-2014-03-24/pv_pn.csv)
* add column PNTitleDetail =CONCATENATE(J2,IF(K2="","",CONCATENATE(" : ",K2)))
* copy/paste PNTitleDetail column as text to replace formula
* sort by PNTitleDetail
* sort by PNID (or PNPartNumber?)
* delete all columns except: PNID, PNPartNumber, PNNotes, PNTitleDetail
* edit column titles: PNID -> External ID, PNPartNumber -> Internal Reference, PNNotes -> Description, PNTitleDetail -> Name

```
PV.PN			Import
---------------------------			
PNID			External ID	
PNPartNumber	Internal Reference	
PNType			(not imported at this time)
PNStatus			
PNTitle			(see PNTitleDetail)
PNDetail		(see PNTitleDetail)
PNReqBy			
PNNotes			Description	
PNUser5			
PNUser9			(not imported at this time)
PNUser10		(not imported at this time)
PNDate			
PNTitleDetail	Name ("[Title] : [Detail]")
```

2) Create BoMs
Create BoMs as per scc/plm/csv-5/pv_pl.csv
* Manufacturing / Product / xxx / Bill of Materials / Create / 

```
10000002
|--- 90000012 EARPH,MONO,HI-Z,3.5MM Maplin LB25C
|--- 20000003 PCA,AIRCRAFT WIRELESS Trilogy-Net SCC:20000003
\--- 50000001 DOC,USER,AIRCRAFT WIRELESS

10000003 ASSY,MKTG,AIRCRAFT WIRELESS
|--- 90000012 EARPH,MONO,HI-Z,3.5MM
|--- 50000001 DOC,USER,AIRCRAFT WIRELESS
|--- 80000005 BOX,SHIPPING,5X4X2,CARDBOARD,WHITE
|--- 10000001 ASSY,AIRCRAFT WIRELESS
     |--- 10000002 ENCL,AIRCRAFT WIRELESS
     |    \--- 80000001 BOX,IP54,4.74X3.13X2.17",ALUM,BLK,SCREWS
     |--- 20000003 PCA,AIRCRAFT WIRELESS
     |    |--- 20000001 IND,830UH,AIRCRAFT WIRELES
     |    |    |--- 90000001 WIRE,MAGNET,38AWG,POLY
     |    |    |--- 90000002 MAG,FERRITE ROD,1/4IN X 4IN,MATL=61
     |    |    \--- 90000003 TAPE,ELECTRICAL,3/4",BLUE,VINYL
     |    |--- 20000002 PCB,AIRCRAFT WIRELESS
     |    |--- 90000004 CONN,PHONE,F,MONO,PCB,3.5MM
     |    |--- 90000005 CAPV,150-230PF,TOP ADJUST,PCB
     |    |--- 90000006 DIO,SIG,GERM,0A95,AXIAL,D0-7,GLASS
     |    |--- 90000007 CAP,ELEC,10UF,16V,20%,RADIAL,ROHS
     |    |--- 90000008 CAP,CER,33PF,100V,10%,RADIAL,ROHS
     |    |--- 90000009 CAP,CER,3300PF,100V,10%,RADIAL,ROHS
     |    |--- 90000010 RES,AXIAL,2.0M,0.4W,1%,MF,ROHS
     |    |--- 90000011 RES,AXIAL,5.6M,0.4W,1%,MF,ROHS
     |--- 80000003 SCREW,MACHINE,PHIL,4-40X1/4,SS
     |--- 80000004 PS 6 each WASHER,FLAT,4-40
     |--- 80000006 PS 3 each STANDOFF,HEX,4-40,0.5"L,ALUM
     |--- 80000007 PS 1 each WASHER,LOCK,#4,INTERNAL TOOTH
     |--- 90000014 PS 1 each CONN,BINDING POST BANANA,INSUL,GRN
     |--- 90000015 PS 1 each CONN,BINDING POST BANANA,INSUL,YEL
     |--- 90000016 PS 2 each CONN,RING,16-22AWG,#4,RED
     |--- 90000017 PS 5 each WIRE,STRANDED,16AWG,GREEN,POLY
     \--- 90000018 PS 5 each WIRE,STRANDED,16AWG,YELLOW,POLY
```

Sales Walkthrough
------------------------------
1) Create Customer

```
Sales / Customers / Create / Edward Bentley (B&E Submarines)
  Sales & Purchases / Salesperson / Jacab Wood
  Sales & Purchases / Sales Team / Sales Department
```

2) Create Sales Order
* Create invoice, validate, print PDF
* Leave invoice UNPAID PAID (do not "Register Payment")

3) Create Opportunity

```
Settings / Users / Jacab Wood / Edit /
  Preferences / Default Sales Team: Sales Department
  Access Rights / Sales / Manager
Sales / Customers / Edward Bentley / Edit / 
  Sales & Purchases / Salesperson / Jacab Wood
  Sales & Purchases / Sales Team / Sales Department
Sales / Opportunities / Create
  Subject: Airforce Trial
    changed state to Proposition
    logged a note, attached proposal (docx and pdf)
      noted attaching files to note is essentially same as using Attachment
      button, but leaves nice audit trail
    scheduled call, marked done
    updated expected revenue and risk percentage
    change stage to negotiation
    added Technical Approval to stages of the sale (kanban view)
    change stage to Won
    Create Quotation (book calls it "Make Quotation")
      Quotation SO002
    Left quotation as-is (did not convert to Sales Order)
```
	
4) Create Lead

```
Sales / Leads / Create Fenwick Hosmer (Hosmer Engineering)
  did not identify as customer
  save
did not create custom stages for "Sales Department" as shown in book, however...
  Sales / Configuration / Sales Teams / Sales Department
    why isn't Jacab Wood shown as Team Members?!?
    could add manually but did not (unsure if need to and also implications of doing so)
    profile for Jacab shows Default Sales Team = Sales Department - perhaps only when documents "pushed" from user?
```
	
Purchasing Walkthrough
------------------------------
1) Purchase product from supplier
* buy ??? from ???
* serialized!

Project Management Walkthrough
------------------------------
1) Import projects (import/projects.csv)

13) Create, sell, ship, and return a spares kit
* Create manufacturing order
* Return products from spares kit to stock

Scenario 1
------------------------------
Explore serial numbers in the context of a customer purchase. B&E Submarines desires to purchase a spare parts kit for the Aircraft Wireless unit they previously purchased. A serialized circuit board is used in the assembly of the spare parts kit (preferably a phantom-type BoM to make the parts in it visible), which is then sold and delivered to B&E.

Sometime later, Ed Bentley calls from B&E. He says he found a circuit board, but he doesn’t know if it’s the circuit board from the spares kit. He’s not sure but he thinks the original board might have failed, and he swapped it with the one from the spare parts kit. Ed wants to know if the serial number on the board is the same as the board shipped in the spare parts kit he bought.

Scenario 2
------------------------------
Explore serial numbers in the context of a project. B&E Submarines plans to upgrade 5 of their submarines with Aircraft Wireless systems. A contract is negotiated between the SCC and B&E, and the SCC initiates a Project to capture all related activity (of which the physical receiver units are only one portion). Complete radio receivers PN 10000003 are manufactured, each with its own serial number – traceable to the serialized electronics circuit board inside. The completed radio receivers are sold and delivered to B&E as part of the overall project.

Sometime later, Ed Bentley calls from B&E. He has a circuit board in his hand again, and wants to know where the serial number came from. Ed asks if the circuit board was from one of the 5 receivers delivered as part of the upgrade project.

Issues Walkthrough
------------------------------
1) Import issues (import/issues.csv)

ToDo
------------------------------
1) Create Workflow
* RMA
* Re-verification test

2) Add new Product Fields
* Type (pv-pn.PNType)
* Creation date (pv-pn.PNDate)
* Designer (pv-pn.PNReqBy)			
* Stock Location (pv-pn.PNUser9)
* Stock Bin (pv-pn.PNUser10)
* Title (pv-pn.PNTitle) ???
* Detail (pv-pn.PNDetail) ???

3) Import BoMs
* pv_pl.csv

4) Import Product Sources
* pv_su.csv
* pv_mfr.csv
* pv_mfrpn.csv
