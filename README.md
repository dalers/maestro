maestro
==========
Maestro(TM) is a cohesive set of demo and test data for using with ERP and ERP-like applications, representing a well-defined but fictional going concern - the Swift Construction Company (SCC). Maestro provides a background for exploring and demonstrating how design, manufacturing and sales teams can manage and share information related to parts, projects, material (optionally serialized or otherwise controlled), issues and people. Maestro also provides a context for demonstrating how "current" information from spreadsheets, shared directories and single-purpose applications can be consolidated in a common environment of *Transparency with Trust*.

Maestro is an open source project, licensed according to the terms of the [GNU Affero General Public License](http://opensource.org/licenses/AGPL-3.0). This license was selected to encourage the return of derived works to the project, in particular from presenters and trainers who find Maestro useful in their business practices.

The purpose of the [Maestro project](https://www.github.com/maestrobpm/maestro) is to create, as a community, a shared dataset for demonstrating business processes and integration opportunities. Maestro is in active development, and may not always be completely stable or consistent, you should explore behaviour carefully before any critical use.

Getting Started
===============
The initial (and currently only) implementation target for Maestro is [OpenERP](https://www.openerp.com). Follow this procedure to "install" Maestro in OpenERP. When complete, you are encouraged to review the [Maestro OpenERP Guided Tour](http://github.com/maestrobpm/maestro/wiki/Maestro-OpenERP-Guided-Tour).

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

17) Import product sources from Parts&Vendors(TM)
* imported sources (at least primary source, export manually via "Show All" pane)
	
Code Repository and Issue Tracking
==================================
* [Maestro project repo](https://github.com/maestrobpm/maestro)
* [Maestro issue tracker](https://github.com/maestrobpm/maestro/issues) (also includes milestones)

Communication Channels
======================
At this time, the official communication channel is the [Maestro issue tracker](https://github.com/maestrobpm/maestro/issues). Other options (e.g. mailing list, Google Group...) are being considered and will be announced if and when they are should be used.

Developer Guidelines
====================
The basic development procedure is:
* Create a GitHub account and use GitHub to fork the Maestro project repo
* Clone your fork locally
* Create a local topic branch off the master branch
* Develop and test your work locally
* Push your topic branch to your GitHub clone
* Issue a pull request with your changes to the project repo

All development is currently done in the master branch.

For more information, see the [Maestro project Wiki](https://github.com/maestrobpm/maestro/wiki).

Project Documentation
=====================
Official project documentation is published in the [Maestro project Wiki](https://github.com/maestrobpm/maestro/wiki).

Legal
=====
Maestro source is copyright by its authors, as recorded in the repository commit log. The Maestro project does not use a Contributor Licence Agreement (CLA) or a Copyright Assignment Agreement (CAA). By submitting work to the project, you acknowledge that a) you have the legal right to do so, and b) you are licensing the work according to the GNU Affero General Public License.

Support
=======
Should you need help, try the following.

* Update your code to the latest commit in the project repo on GitHub.
* Search the [Maestro project Wiki](https://github.com/maestrobpm/maestro/wiki/).
* Search the [Maestro issue tracker](https://github.com/maestrobpm/maestro/issues) (and submit an issue if necessary).

If you post an issue, try to include answers to the following questions:

* What are you trying to achieve?
* What are the symptoms of your problem? Why do you think this *is* a problem?
* What is the version of Maestro you are using?
* What is the version of OpenERP you are using?
* Include as an example, the **simplest** sequence of operations that demonstrates the symptoms.

---

Maestro is a trademark of [Dale Scott](http://www.dalescott.net). Parts&Vendors is a trademark of [Trilogy Design](http://www.trilogydesign.com).
