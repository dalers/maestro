Files here are used by Maestro - the SME business management system.

Maestro integrates data from the following sources: 
* Issue Spreadsheet				Issue list with description and project/part/serial numbers
* Person spreadsheet			Person master data
* Project spreadsheet			Project master data, including client and financial accounts
* Parts&Vendors					Part numbers, bills of materials and sources
* Serial # spreadsheet			Production serial numbers and status
* Stock location spreadsheet	Production serial numbers and status
 
Maestro is updated nightly from Parts&Vendors and from other sources
as required.

For more information, consult your Maestro system administrator.

To access files from within Parts&Vendors
-----------------------------------------
1. Map a drive letter (e.g. "X") to the Windows file share on the Maestro
server  (e.g. \\hotstuff.scc.loc). The root of the mapped drive must contain
the vault\ directory. 

2. Configure Parts&Vendors to substitute the mapped drive letter in the 
file path for documents in the Part Master Files/URLs tab (P&V > Edit > 
Options > Viewers/Path, select "Use Network Path or Drive", select 
"Substitute Drive Letter Only", and enter the mapped drive letter). 

###
