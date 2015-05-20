Following are representative SCC (Swift Construction Company) workflows, based
on the Aircraft Wireless product.

## Overview

One of the SCC's most popular product is the Aircraft Wireless, PN (part
number) 10000003. The most significant customer for the Aircraft Wireless is
UFM (Universal Flying Machines), who sponsored the initial development effort.
The SCC has received recent inquiries from B&E Submarines, who are interested
in evaluating the Aircraft Wireless for communicating with their fleet of
submarines when surfaced.

To build Aircraft Wireless units, the SCC first purchases assembled electronics
circuit boards (PN 20000003) in lots of 10. The circuit boards are inspected
and serialized when received from the electronics contract manufacturer, then
stored until needed. Finished units are assembled in-house as needed
(i.e. build-to-order), using the previously assembled circuit boards and other
components. Although the Aircraft Wireless was designed to withstand harsh
environments, a field spares kit is available with the necessary parts to repair
most catastrophic failures.

It is assumed that all necessary parts, customers and suppliers are available
in the Maestro database (which will be the case if you installed the SCC
dataset into Maestro).


## On-Going Business Processes
### Create Opportunity

* Create Opportunity: Airforce Trial
* Create Customer: B&E Submarines
* Changed state to Proposition
* Logged a note and attach proposal (docx and pdf)
* Scheduled a discussion meeting, mark done
* Update expected revenue and risk percentage
* Change state to Negotiation
* Add Technical Approval
* Change opportunity state to Won
* Create Quotation
* Convert Quotation to Sales Order

### Create Sales Order
* Create invoice, validate, print PDF

### Purchase Raw Materials

* buy circuit boards
* receive and serialize circuit boards

### Manufacture Finished Product

* Create manufacturing order
* Issue raw material to order (including serialized PCAs)
* Test product

### Deliver Product

* Deliver order to customer

### Accept Return of Product

Product may be returned for a variety of reasons, including defects and no
longer required. This process is sometimes called an RMA (Return Material
Authorization) process.

* Receive returned stock from customer
* Inspect and Re-Validate
* Re-stock


## Project Processes

* TODO


## Issue Processes

* TODO

## Reporting
### Serialized Stock Purchased by a Customer

This workflow explores serialized stock in the context of a customer
purchase. B&E Submarines desires to purchase a spare parts kit for the Aircraft
Wireless unit they previously purchased. A serialized circuit board is used in
the assembly of the spare parts kit (preferably a phantom-type BoM to make the
parts in it visible), which is then sold and delivered to B&E.

Sometime later, Ed Bentley calls from B&E. He says he found a circuit board,
but does not know if it is the circuit board from the spares kit. Ed cannot
remember exactly, but he seems to recall the original circuit board failed and
he swapped it with the one from the spare parts kit. Ed wants to know if the
serial number on the board is the same as the board shipped in the spare parts
kit he bought. 

### Serialized Stock Consumed by a Project

Explore serial numbers in the context of a project. B&E Submarines plans to
upgrade 5 of their submarines with Aircraft Wireless systems. A contract is
negotiated between the SCC and B&E, and the SCC initiates a Project to capture
all related activity (of which the physical receiver units are only one portion).
Complete radio receivers PN 10000003 are manufactured, each with its own serial
number, traceable to the serialized electronics circuit board within. The
completed radio receivers are sold and delivered to B&E as part of the overall
project.

Sometime later, Ed Bentley calls from B&E. He has a circuit board in his hand
again, and wants to know where the serial number came from. Ed asks if the
circuit board was from one of the 5 receivers delivered as part of the upgrade
project.


## Startup
### Import Parts from Parts&Vendors

* export_current_to_csv.sh
* load_current_from_csv.sh


## Customization
### Re-Label Existing Part Attribute UDF (User Defined Field)

* ToDo

### Add New Part Attribute

* ToDo
