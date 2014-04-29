SCC PLM Data

The PLM data documents the SCC Aircraft Wireless. The life-cycle of
the Aircraft Wireless product has five distinct iterations.

Iteration                      Date
-----------------------------------------
1  Release PCA                 2013-01-01
2  Revise PCB                  2013-01-02
3  Release Product             2013-01-03
4  Manufacturing Improvements  2013-01-04
5  Field Spares Kit            2013-01-05

The "current" information at each iteration in the product life cycle of 
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

There are two sets of vault directories, vault-n/ and vault-n-nover/. 
Documents in the vault-n/ set of directories include the document 
version in its file name (e.g. vault-1/parts/10000001_PBS-00.pdf for 
version 00, vault-1/parts/10000001_PBS-01 for version 01). 

Although including the document version in the document's file name 
allows for convenient identification, mistakes can easily be made (in 
particular when done manually). An alternative approach is to not change 
the document file name after making changes, and treat a modified 
document file as a new version (although the version itself will not be 
known). Files in the vault-n-nover/ set of directories follow this 
approach. For example, vault-1-nover/parts/10000001_PBS.pdf is the 
version in iteration 1 of the Aircraft Wireless product life cycle, and 
vault-3-nover/parts/10000001_PBS.pdf is the version in iteration 3 
(opening the documents in a reader application will show they are 
version 00 and version 01 respectively). 

Recreating a "current" file vault
-------------------------------------------------------
Only files added or modified by an iteration are included in the 
respective vault directory. This allows the file and directory 
dates to be readily managed by iteration.

To reconstruct the complete "current" file system as of a particular 
iteration, first execute fix_iteration_datetime.sh to ensure the 
directory and document file timestamps conform to the iteration dates. 
Next, copy vault iterations in order "over top of" a new vault directory 
(preserving timestamps), starting with iteration 1 and continuing up to 
and including the desired iteration. 

For example, to re-create the vault at iteration 5 using the vault-n/ 
set of directories: 

 $ ./fix_iteration_datetime.sh
 $ mkdir vault
 $ cp -a ./vault-1/* ./vault/
 $ cp -a ./vault-2/* ./vault/
 $ cp -a ./vault-3/* ./vault/
 $ cp -a ./vault-4/* ./vault/
 $ cp -a ./vault-5/* ./vault/

###