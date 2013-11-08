Files here are used by Maestro - the *new* Part and Vendor data management system.

Maestro integrates data from the following sources: 
* Parts&Vendors				Part numbers, bills of materials and sources
* SerialNumber Spreadsheet	Production serial numbers and status
* Issue Reporting System	Issue report with job number and overview
* Projects Spreadsheet		Client project information
 
Maestro is updated nightly from Parts&Vendors and other sources
as required.

For more information, contact your Maestro system administrator.

To access files in DOCVAULT from Parts&Vendors
----------------------------------------------
1. Map a drive letter (e.g. "X") to the Windows file share on the Maestro
server  (e.g. \\hotstuff.scc.loc). The root of the mapped drive must contain
the vault\ directory. 

2. Configure Parts&Vendors to substitute the mapped drive letter in the 
file path for documents in the Part Master Files/URLs tab (P&V > Edit > 
Options > Viewers/Path, select "Use Network Path or Drive", select 
"Substitute Drive Letter Only", and enter the mapped drive letter). 

###
