# Tryton Setup

## Create New Database

1) Connect to the Tryton server and create a new database (e.g. "scc").

2) Login to the new database as user "admin" (with password used to create the database). The Module Configuration Wizard will run automatically after login to configure the new database.

* Add user (e.g. "Dale Scott", login "dale"), optionally add permissions (you may need to update user permissions after installing modules, so this is optional at this point), 
	* add Permissions: "Administration" (which will be the only permission group available)
	* add Rule: Read, Write, Create, Delete, Model: View Search (which will be the only rule available available)

## Install Modules into Database

1) Mark the following modules for install.

_The modules must have already been installed on the server, this step installs them into a Tryton database._

* dashboard
* product
* product-attribute
* production
* project
* project-plan
* purchase
* sale
* stock
* stock-lot
* stock-split

2) Install the selected modules. There are two ways to perform the install.

* Select *Launch Action* icon in the Modules menu bar and then _Perform Pending Installation/Upgrade_, or
* Execute the _Perform Pending Installation/Upgrade_ Wizard from the main Tryton menu. 

After the install/upgrade completes, the Module Configuration wizard runs and will query you to configure the installed modules.

3) Create Company

A company is a type of 'party'. To create the desired company, you need to select the party the new company will be associated with. Since there are no parties in the new database, you will have to create a party, then select it by the new company.

* Name
	* Swift Construction Company
* Addresses
	* Name: Default
	* Street: 1 Swift Way
	* Zip: 13054
	* City: Shopton
	* Country: United States
	* Subdivision: New York
* Language
	* English

4) Configure Company

* Enter Company > Currency
	* US Dollar

* On the Company > Employees > Party view
	* select the new company (e.g. Swift Construction Company)
	* select _Add_

5) Create Chart of Accounts

* Company: Swift Construction Company
* Account Template: Minimal Account Chart
* Create Default Properties
	* Default Receivable Account: Main Receivable
	* Default Payable Account: Main Payable

6) The Tryton menu needs reloading to show the menus for the newly installed modules. 

* Follow menu: User > Menu Reload (Ctrl-T).

## Load Users

### Import Users

1) Login as admin

2) Follow Menu Path: Administration > Users > Users. Access Toolbar: Import Data (Auto-Detect fields, CSV parameters: encoding Latin1),  -> scc/excel/tryton-users.csv

Users will be imported with the new company set as their "Main Company". This is because during configuration of the new database, you set the Swift Construction Company as the default party for employees.

_144 user records are imported in ~15 seconds with the server running in VirtualBox on a ThinkPad T61 laptop_

#### To re-create import/tryton-users.csv

* edit the "master" worksheet in workbook scc/excel/persons.xlsx
* save the "tryton-users" worksheet in CSV format to scc/excel/tryton-users.csv

### Configure Users

1) Tom Swift

* Preferences:
	* Timezone: America/Edmonton
* Access rights:
	* Sales: Manager
	* Project: Manager
	* Knowledge: User
	* Warehouse: Manager
	* Manufacturing: Manager
	* Accounting & Finance: Financial Manager
	* Purchases: Manager
	* Human Resources: Employee
	* Sharing: User
	* Administration: Settings

2) James Period

* Preferences:
	* Timezone: America/Edmonton
* Access rights:
	* Sales: Manager
	* Project: Manager
	* Knowledge: User
	* Warehouse: Manager
	* Manufacturing: Manager
	* Accounting & Finance: Financial Manager
	* Purchases: Manager
	* Human Resources: Employee
	* Sharing: User
	* Administration: Settings

3) Miquel DeLazes

* Preferences:
	* Timezone: America/Edmonton
* Access rights:
	* Sales: Manager
	* Project: Manager
	* Knowledge: User
	* Warehouse: Manager
	* Manufacturing: Manager
	* Accounting & Finance: Financial Manager
	* Purchases: Manager
	* Human Resources: Employee
	* Sharing: User
	* Administration: Settings

4) Ned Newton

* Preferences:
	* Timezone: America/Edmonton
* Access rights:
	* Sales: Manager
	* Project: Manager
	* Knowledge: User
	* Warehouse: Manager
	* Manufacturing: Manager
	* Accounting & Finance: Financial Manager
	* Purchases: Manager
	* Human Resources: Employee
	* Sharing: User
	* Administration: Settings

5) Rad Sampson

* Preferences:
	* Timezone: America/Edmonton
* Access rights:
	* Sales: Manager
	* Project: Manager
	* Knowledge: User
	* Warehouse: Manager
	* Manufacturing: Manager
	* Accounting & Finance: Financial Manager
	* Purchases: Manager
	* Human Resources: Employee
	* Sharing: User
	* Administration: Settings

## Enter Reference Data

1) Define Additional Product Attributes

Create additional product attributes:

```
PNUser1       User1                          Char
PNUser2       User2                          Char
PNUser3       User3                          Char
PNUser4       User4                          Char
PNUser5       User5                          Char
PNUser6       User6                          Char
PNUser7       User7                          Char
PNUser8       User8                          Char
PNUser9       User9                          Char
PNUser10      User10                         Char
PNID          PNID (int)                     Integer
PNUNID        PNUNID (int)                   Integer
PNType        Type (CAT,PL,DWG,PS,AW,DOC)    Char
PNRevision    Rev (1...)                     Char
PNDetail      Detail                         Char
PNStatus      Status (U,R,O)                 Char
PNReqBy       By                             Char
PNDate        Date (dd-mm-yyyy)              Char
```

2) Define Units of Measure

One of the units in an "UOM Category" is assigned Factor and Rate both equal to 1, and the other units in the UOM Category are expressed in terms of that unit. For example, a meter (m) is a unit of length, and has factor and rate of 1. The other units of length (mile, kilometer, centimeter and millimeter) are expressed in terms of meters.

```
Name          Symbol      UOM Cat  Factor   Rate            Rounding Precision
--------------------------------------------------------------------------
spool66FT     spl66FT     Length   20.1168  0.049709695378  0.01
spool100FT    spl100FT    Length   30.48    0.032808398950  0.01
spool19300FT  spl19300FT  Length   5882.64  0.000169991704  0.01
```

Notes
- A UOM symbol has a maximum of 10 characters.

## Import products

1) Login as admin

2) Menu: Product > Products, Toolbar: Import Data (Encoding: Latin1) -> tryton-import/scc-products.csv

To re-create scc-products.csv using concatenated name and detail as name:

* export PN table from a Parts&Vendors(TM) database using mdbtools (pv_pn.csv)
* copy export from P&V PN table (e.g. scc/plm-scc-csv-5/pv_pn.csv)
* add column PNTitleDetail =CONCATENATE(J2,IF(K2="","",CONCATENATE(" : ",K2)))
* copy/paste PNTitleDetail column as text to replace formula
* sort by PNTitleDetail
* sort by PNID (or PNPartNumber?)
* delete all columns except those included in Tryton mapping
* edit column titles according to Tryton mapping

### Mapping from Parts&Vendors to Tryton

```
P&V                  -> Tryton
-----------------------------------------------------------			
PNID                 -> product-attribute PNID
PNUNID               -> product-attribute PNUNID
PNPartNumber         -> Code
PNType               -> product-attribute PNType
PNRevision           -> product-attribute PNRevision
PNTitle              -> Name
PNDetail             -> product-attribute PNDetail
PNStatus             -> product-attribute PNStatus
PNReqBy              -> product-attribute PNReqBy
PNNotes              -> Detail
PNUser1...PNUser10   -> product-attribute PNUser1..PNUser10
PNDate               -> product-attribute PNDate 
```
Keys
- PNID, primary part key (partslist table references using fk)
- PNUNID (fk to table UN)
- PNTYPE (fk to table TYPE)

Notes
- PNSTATUS contains status value (i.e. "U", "R", or "O"), but could (should?) be fk to STATUSID in table STATUS (that is, if table STATUS existed). 

### Create Bills of Materials (BoMs)

1) Menu: Manufacturing / Product / xxx / Bill of Materials / Create

2) Create BoMs as per scc/plm/csv-5/pv_pl.csv

```
60000001 ASSY,FIELD SPARES,AIRCRAFT WIRELESS
|--- 90000012 EARPH,MONO,HI-Z,3.5MM Maplin LB25C
|--- 20000003 PCA,AIRCRAFT WIRELESS Trilogy-Net SCC:20000003
\--- 50000001 DOC,USER,AIRCRAFT WIRELESS

10000003 ASSY,MKTG,AIRCRAFT WIRELESS
|--- 90000012 EARPH,MONO,HI-Z,3.5MM
|--- 50000001 DOC,USER,AIRCRAFT WIRELESS
|--- 80000005 BOX,SHIPPING,5X4X2,CARDBOARD,WHITE
\--- 10000001 ASSY,AIRCRAFT WIRELESS
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
     |    \--- 90000011 RES,AXIAL,5.6M,0.4W,1%,MF,ROHS
     |--- 80000003 SCREW,MACHINE,PHIL,4-40X1/4,SS
     |--- 80000004 WASHER,FLAT,4-40
     |--- 80000006 STANDOFF,HEX,4-40,0.5"L,ALUM
     |--- 80000007 WASHER,LOCK,#4,INTERNAL TOOTH
     |--- 90000014 CONN,BINDING POST BANANA,INSUL,GRN
     |--- 90000015 CONN,BINDING POST BANANA,INSUL,YEL
     |--- 90000016 CONN,RING,16-22AWG,#4,RED
     |--- 90000017 WIRE,STRANDED,16AWG,GREEN,POLY
     \--- 90000018 WIRE,STRANDED,16AWG,YELLOW,POLY
```

# Workflows

*These workflows are included here temporarily for convenience, and will eventually be moved to one or more separate documents.*

The Swift Construction Company (SCC) manufactures a radio receiver called an  Aircraft Wireless.  The SCC buys an assembled electronics circuit board (Part Number 20000003) in lots of 10 from Trilogy-Net.  The circuit boards are used to manufacture Aircraft Wireless units (PN 10000003). When circuit boards from Trilogy-Net arrive at the SCC, they are inspected and, if acceptable, identified with a serial number and stored on a shelf. One of the SCC’s customers is B&E Submarines, who some time ago purchased an Aircraft Wireless system from the SCC to evaluate.

The products (part numbers), customer (B&E) and supplier (Trilogy-Net) have been created. Two BoMs have been created, one for the finished Aircraft Wireless product (PN 10000003) and one for a spare parts kit (PN 60000001), which includes the electronics circuit board (PN 20000003).


## Sales

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
	
## Purchasing

1) Purchase product from supplier
* buy ??? from ???
* serialized!

## Project Management

1) Import projects (import/projects.csv)

## Serialized Stock Purchased by a Customer

This workflow explores serialized stock in the context of a customer purchase. B&E Submarines desires to purchase a spare parts kit for the Aircraft Wireless unit they previously purchased. A serialized circuit board is used in the assembly of the spare parts kit (preferably a phantom-type BoM to make the parts in it visible), which is then sold and delivered to B&E.

Sometime later, Ed Bentley calls from B&E. He says he found a circuit board, but he doesn't know if it is the circuit board from the spares kit. Ed is not sure, but he thinks the original board might have failed and he swapped it with the one from the spare parts kit. Ed wants to know if the serial number on the board is the same as the board shipped in the spare parts kit he bought.

## Serialized Stock Consumed by a Project

Explore serial numbers in the context of a project. B&E Submarines plans to upgrade 5 of their submarines with Aircraft Wireless systems. A contract is negotiated between the SCC and B&E, and the SCC initiates a Project to capture all related activity (of which the physical receiver units are only one portion). Complete radio receivers PN 10000003 are manufactured, each with its own serial number, traceable to the serialized electronics circuit board within. The completed radio receivers are sold and delivered to B&E as part of the overall project.

Sometime later, Ed Bentley calls from B&E. He has a circuit board in his hand again, and wants to know where the serial number came from. Ed asks if the circuit board was from one of the 5 receivers delivered as part of the upgrade project.

## Create, sell, ship, and return a field spares kit

* Create manufacturing order
* Issue material to order (serialized PCA)
* Deliver order to customer
* Return order from customer
* Return material to stock (serialized PCA)

## Issues

1) Import issues (import/issues.csv)

## ToDo

1) Create new workflow
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

4) Import product sources
* pv_su.csv
* pv_mfr.csv
* pv_mfrpn.csv

