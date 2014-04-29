Initial Setup and Import
========================
Follow this procedure to "install" Maestro in OpenERP..

First, install OpenERP, create a new database (e.g. "scc"), and install the following OpenERP applications in order:
* Remove openerp.com bindings
* Sales Management
* CRM
* MRP
* Project Management
* Issue Tracker
* Base Import
* Document Management System (install wizard reports config will be based on installed modules)

Login to the new database as "admin" to complete the rest of the procedure.

1) Configure company
* Company name: Swift Construction Co.
* Logo: scc/scc-noname-100x51.jpg
* Address, phone, fax, tagline, website
* Paper Format: US Letter
* Do NOT configure email server (unless you know what you're doing ;-))

2) Import users (import/res.users.csv)
* all passwords "maestro"
* users configured to NEVER receive email (all communication will be done from within OpenERP)

To re-create import/res.users.csv,
* edit the Master worksheet in scc-files/excel/persons.xlsx
* save the res.users worksheet in CSV format to import/res.users.csv

3) Import products (import/product.product.csv)
* Sales / Products / list view / Import / Encoding: Latin1

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

4) Create customer.

```
Sales / Customers / Create / Edward Bentley (B&E Submarines)
  Sales & Purchases / Salesperson / Jacab Wood
  Sales & Purchases / Sales Team / Sales Department
```

5) Create Sales Order.
* Create invoice, validate, print PDF
* Leave invoice UNPAID PAID (do not "Register Payment")

6) Create Opportunity.

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
	
7) Create Lead.

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
	
8) Create BoM for electronics spares kit PN 60000001.
* Manufacturing / Bill of Materials / Create / 
* Add items as per Parts&Vendors BoM
		
9) Configure users:
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

10) Purchase product from supplier.
* buy ??? from ???
* serialized!

11) Import projects (import/projects.csv)

12) Import issues (import/issues.csv)

13) Create, sell, ship, and return a spares kit
* Create manufacturing order
* Return products from spares kit to stock

14) Create workflow (e.g. RMA, re-verification test)

15) Add new product fields.
* Type (pv-pn.PNType)
* Creation date (pv-pn.PNDate)
* Designer (pv-pn.PNReqBy)			
* Stock Location (pv-pn.PNUser9)
* Stock Bin (pv-pn.PNUser10)
* Title (pv-pn.PNTitle) ???
* Detail (pv-pn.PNDetail) ???

16) Import BoMs from Parts&Vendors(TM).

17) Import product sources

---
Parts&Vendors(TM) is a trademark of Trilogy Design. http://www.trilogydesign.com
