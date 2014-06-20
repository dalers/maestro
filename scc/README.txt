SCC Product Lifecycle Management (PLM) Data

The SCC PLM data currently exists of part data for the SCC Aircraft
Wireless product.

The Aircraft Wireless product lifecycle includes five design iterations.

Iteration                      Date
-----------------------------------------
1  Release PCA                 2013-01-01
2  Revise PCB                  2013-01-02
3  Release Product             2013-01-03
4  Manufacturing Improvements  2013-01-04
5  Field Spares Kit            2013-01-05

"Current" information for each iteration in the product life cycle of 
the Aircraft Wireless has been captured, including documents related to 
each part number. This allows the iterations to be "played back" in 
sequence, as if occurring sequentially in time. 

Directory and file timestamps conform to the iteration dates above. 
Dates embedded in the content of a file (such as in a drawing title 
block) conform when possible (some dates are automatically generated and 
cannot easily be made to conform). Refer to the Maestro project Wiki for 
more information on the changes made in each iteration. 

Parts&Vendors(TM) databases
-------------------------------------------------------
The data in each Parts&Vendors database is "current" as of a particular 
iteration (e.g. pv-1.mdb for iteration 1, pv-2.mdb for iteration 2, 
etc.). 

CSV (Comma Separated Value) is a popular and convenient file format for 
exporting from one system and importing into another. Each Parts&Vendors 
database has been exported to CSV-format files using the mdb-export 
utility from the mdbtools project, with one CSV file for each database 
table. The CSV files for each iteration are in separate directories 
(e.g. csv-1/ for iteration 1, csv-2/ for iteration 2, etc.). 

File vaults
-------------------------------------------------------
A part in a Parts&Vendors database may include references to supporting 
documents located in a file system. In general, all parts in the SCC 
Demo/Test data set include document references, with the documents 
themselves located in a vault directory corresponding to the iteration 
of the Parts&Vendors database file. 

There are two sets of vault directories, plm-vault-n/ and 
plm-vault-n-nover/. Documents in the plm-vault-n/ set of directories 
include the document version in its file name (e.g. 
parts-1/10000001/10000001_PBS-00.pdf for version 00, 
parts-2/10000001/10000001_PBS-01 for version 01, etc.). 

Including the document version within in a document file name 
allows convenient identification, but guaranteeing this is difficult
in a manual process. One alternative is to accept that file names
may not change, and simply identify that the content has changed.
Files in parts-n-nover/* take this approach.

E.g. parts-1-nover/10000001/10000001_PBS.pdf is the 
version in iteration 1 of the Aircraft Wireless product life cycle, and 
parts-3-nover/10000001/10000001_PBS.pdf is version 3  (to confirm, open
the documents in a viewer and inspect the title blocks). 

Recreating a "current" condition of part documents
-------------------------------------------------------
Only files added or modified by an iteration are included in the 
respective parts directory.

To reconstruct the "current" condition of the file system as of a
particular iteration:

* execute fix_iteration_datetime.sh to ensure document
modified datefiles are consistent with the iteration story.

* copy vault iterations in order to a new vault directory (preserve
  file modified datetime, start with iteration 1, continue up to and
  including the desired iteration. 

For example, to re-create the vault at iteration 5 using the 
plm-vault-n/ set of directories: 

 $ ./fix_iteration_datetime.sh
 $ mkdir vault
 $ cp -a ../scc/parts-1/* ./plm-vault/
 $ cp -a ../scc/parts-2/* ./plm-vault/
 $ cp -a ../scc/parts-3/* ./plm-vault/
 $ cp -a ../scc/parts-4/* ./plm-vault/
 $ cp -a ../scc/parts-5/* ./plm-vault/

See parts_all*.sch and load_scc.sh

###