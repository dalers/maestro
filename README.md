maestro-oe
==========

Maestro for OpenERP

Maestro(TM) is a data framework for demonstrating ERP and ERP-like applications. Maestro is particularaly intended for design, manufacturing and sales teams to manage and share information related to parts, projects, material (simple, serialized, or lot controlled), issues and people. Maestro demonstrates how "current" information from spreadsheets, shared directories and single-purpose applications can be consolidated in a single cohesive environment - a walled garden of *Transparency with Trust*.

Maestro provides a complete data set for a well-defined but fictional going concern, the Swift Construction Company (SCC). Maestro is an open source project, licensed according to the terms of the [GNU Affero General Public License](http://opensource.org/licenses/AGPL-3.0). This license was selected to encourage the return of derived works to the project, in particular from presenters and trainers who find Maestro useful in their business practices.

The purpose of the [Maestro project](https://www.github.com/maestrobpm/maestro) is to create, as a community, a common dataset for demonstrating business processes and integration opportunities. Maestro is in active development, and may not always be completely stable or consistent. Review this README and the [*Maestro for OpenERP* project wiki](https://github.com/dalers/maestro-oe/wiki), and explore behaviour carefully before any critical use. 

Getting Started
===============
Follow this procedure to **install** *Maestro for OpenERP* in OpenERP. When complete, you are encouraged to review the *Maestro for OpenERP* [Guided Tour](http://github.com/dalers/maestro-oe/wiki/Guided-tour).

Install OpenERP and create a new database (e.g. "scc"), then install the following modules in order:
* Remove openerp.com bindings
* Sales Management
* CRM
* MRP
* Project Management
* Issue Tracker
* Base Import
* Document Management System (install wizard reports config will be based on installed modules)

Login to the new database as "admin".

Configure company (SCC)
* Company name: Swift Construction Co.
* Logo: scc/scc-noname-100x51.jpg
* Address, phone, fax, tagline, website
* Paper Format: US Letter
* Do NOT configure email server (unless you know what you're doing ;-))

Import users (import/res.users.csv)
* all passwords "maestro"
* NEVER receive email

Import products from Parts&Vendors(TM) (import/product.csv)

To re-create product.csv,
* export P&V PN table using mdbtools (pv_pn.csv)
* copy export from P&V PN table (testdata/csv-2014-03-24/pv_pn.csv)
* add column PNTitleDetail =CONCATENATE(J2,IF(K2="","",CONCATENATE(" : ",K2)))
* copy/paste PNTitleDetail column as text to replace formula
* sort by PNTitleDetail
* sort by PNID (or PNPartNumber?)
* delete all columns except: PNID, PNPartNumber, PNNotes, PNTitleDetail
* edit column titles: PNID -> External ID, PNPartNumber -> Internal Reference, PNNotes -> Description, PNTitleDetail -> Name
* Sales / Products / list view / Import / Encoding: Latin1

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

Create customer.

```
Sales / Customers / Create / Edward Bentley (B&E Submarines)
  Sales & Purchases / Salesperson / Jacab Wood
  Sales & Purchases / Sales Team / Sales Department
```

Create Sales Order.
* Create invoice, validate, print PDF
* Leave invoice UNPAID PAID (do not "Register Payment")

Create Opportunity.

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
	
Create Lead.

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
	
Create BoM for electronics spares kit.
* Manufacturing / Bill of Materials / Create / 
* Add items as per BoM worksheet
		
Import BoMs from Parts&Vendors(TM).

Configure users:
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

Administrator: also "Technical"
```

Purchase product from supplier.
* buy ??? from ???
* serialized!

Import projects (import/projects.csv)

Import issues (import/issues.csv)

Create, sell, ship, and return a spares kit
* Create manufacturing order
* Return products from spares kit to stock

Create workflow (e.g. RMA, re-verification test)

Add new product fields.
* Type (pv-pn.PNType)
* Creation date (pv-pn.PNDate)
* Designer (pv-pn.PNReqBy)			
* Stock Location (pv-pn.PNUser9)
* Stock Bin (pv-pn.PNUser10)
* Title (pv-pn.PNTitle) ???
* Detail (pv-pn.PNDetail) ???

Inport product sources from Parts&Vendors(TM)
* imported sources (at least primary source, export manually via "Show All" pane)
	
Code Repository and Issue Tracking
==================================
* [*Maestro for OpenERP* project repo](https://github.com/dalers/maestro-oe)
* [*Maestro for OpenERP* issue tracker](https://github.com/dalers/maestro-oe/issues) (also includes milestones)

Communication Channels
======================
At this time, the official communication channel is the [*Maestro for OpenERP* issue tracker](https://github.com/dalers/maestro-oe/issues). Other options (e.g. mailing list, Google Group...) are being considered and will be announced should they become available.

Developer Guidelines
====================
The basic development procedure is:
* Create a GitHub account and use GitHub to fork the project repo
* Clone your fork locally
* Create a local topic branch off the master branch
* Develop and test your work locally
* Push your topic branch to your GitHub clone
* Issue a pull request with your changes to the project repo

All development is currently done in the master branch.

For more information, see the [*Maestro for OpenERP* project wiki](https://github.com/dalers/maestro-oe/wiki).

Project Documentation
=====================
Official project documentation is published in the [*Maestro for OpenERP* project wiki](https://github.com/dalers/maestro-oe/wiki).

Legal
=====
*Maestro for OpenERP* source is copyright by its authors, as recorded in the repository commit log. The *Maestro for OpenERP* project does not use a Contributor Licence Agreement (CLA) or a Copyright Assignment Agreement (CAA). By submitting work to the project, you acknowledge that a) you have the legal right to do so, and b) you are licensing the work according to the GNU Affero General Public License.

Support
=======
Should you need help, try the following.

* Update your code to the latest commit in the project repo on GitHub.
* Search the [*Maestro for OpenERP* wiki](https://github.com/maestrobpm/maestro/wiki/).
* Search the [*Maestro OpenERP issue tracker*](https://github.com/dalers/maestro-oe/issues) (and post if necessary).

If you post an issue, try to include as much of the following information as possible.

* What are you trying to achieve?
* What are the symptoms of your problem? Why do you think this *is* a problem?
* What Maestro version are you using? *Until formal releases, give the date you downloaded or cloned the project repo.*
* What version of OpenERP are you using? *E.g. "Bitnami OpenERP vx.y.z"*
* Include as an example, the **simplest** sequence of operations that demonstrates the symptoms.

---

Maestro is a trademark of [Dale Scott](http://www.dalescott.net). Parts&Vendors is a trademark of [Trilogy Design](http://www.trilogydesign.com).

