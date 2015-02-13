These are sample SCC (Swift Construction Workflows), based on the Aircraft Wireless product.

The SCC buys assembled electronics circuit boards (Part Number 20000003) in lots of 10 from Trilogy-Net.  The circuit boards are used to manufacture Aircraft Wireless units (PN 10000003). When circuit boards from Trilogy-Net arrive at the SCC, they are inspected and, if acceptable, identified with a serial number and stored on a shelf. One of the SCC’s customers is B&E Submarines, who some time ago purchased an Aircraft Wireless system from the SCC to evaluate.

The products (part numbers), customer (B&E) and supplier (Trilogy-Net) have been created. Two BoMs have been created, one for the finished Aircraft Wireless product (PN 10000003) and one for a spare parts kit (PN 60000001), which includes the electronics circuit board (PN 20000003).

## Items
### Add New Item Attributes

* Type (pv-pn.PNType)
* Creation date (pv-pn.PNDate)
* Designer (pv-pn.PNReqBy)			
* Stock Location (pv-pn.PNUser9)
* Stock Bin (pv-pn.PNUser10)
* Title (pv-pn.PNTitle) ???
* Detail (pv-pn.PNDetail) ???

### Import Items

### Import Item Sources

* pv_su.csv
* pv_mfr.csv
* pv_mfrpn.csv

### Import BOMs

* pv_pl.csv

## Sales
### Create Customer

Menu: Selling > Customer > +New > B&E Submarines

Contact
* Edward Bentley

### Create Sales Order
* Create invoice, validate, print PDF
* Leave invoice UNPAID PAID (do not "Register Payment")

### Create Opportunity

TODO - must be updated.

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
	
### Create Lead

TODO - must be updated.

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

### Return Material Authorization Process

TODO - must be described.

## Purchasing
### Purchase Product from Supplier

* buy ??? from ???
* serialized!

## Manufacturing
### Create, sell, ship, and return a field spares kit

* Create manufacturing order
* Issue material to order (serialized PCA)
* Deliver order to customer
* Return order from customer
* Return material to stock (serialized PCA)

### Re-Verification Test

TODO - must be described.

## Projects
### Import Projects (import/projects.csv)

TODO: to be completed

## Reporting
### Serialized Stock Purchased by a Customer

This workflow explores serialized stock in the context of a customer purchase. B&E Submarines desires to purchase a spare parts kit for the Aircraft Wireless unit they previously purchased. A serialized circuit board is used in the assembly of the spare parts kit (preferably a phantom-type BoM to make the parts in it visible), which is then sold and delivered to B&E.

Sometime later, Ed Bentley calls from B&E. He says he found a circuit board, but he doesn't know if it is the circuit board from the spares kit. Ed is not sure, but he thinks the original board might have failed and he swapped it with the one from the spare parts kit. Ed wants to know if the serial number on the board is the same as the board shipped in the spare parts kit he bought.

### Serialized Stock Consumed by a Project

Explore serial numbers in the context of a project. B&E Submarines plans to upgrade 5 of their submarines with Aircraft Wireless systems. A contract is negotiated between the SCC and B&E, and the SCC initiates a Project to capture all related activity (of which the physical receiver units are only one portion). Complete radio receivers PN 10000003 are manufactured, each with its own serial number, traceable to the serialized electronics circuit board within. The completed radio receivers are sold and delivered to B&E as part of the overall project.

Sometime later, Ed Bentley calls from B&E. He has a circuit board in his hand again, and wants to know where the serial number came from. Ed asks if the circuit board was from one of the 5 receivers delivered as part of the upgrade project.

## Issues
### Import issues (import/issues.csv)
