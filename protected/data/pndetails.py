#!/usr/bin/env python
#
# Extract Part Number, Title and Detail from input file
#   Write to output file
#   Assumes input file has same structure pv_pn.csv
#
# Note on Python shebang:
#   !/usr/bin/env python - execute using first python in user path - most portable
#   #!/usr/bin/python - execute assuming common Linux install (not FreeBSD! /usr/local/bin/python)
#   #!/usr/bin/python2.5 - execute using specific Python version (but for Linux install)
#

import csv
import sys

ifile = open(sys.argv[1], "rb") # open input csv file
reader = csv.reader(ifile)

ofile = open(sys.argv[2], "wb") # open output csv file
writer = csv.writer(ofile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

for PNID,PNIDToLNK,PNUNID,PNTabParentID,PNPrefix,PNPartNumber,PNSuffix,PNType,PNRevision,PNTitle,PNDetail,PNStatus,PNReqBy,PNNotes,PNUser1,PNUser2,PNUser3,PNUser4,PNUser5,PNUser6,PNUser7,PNUser8,PNUser9,PNUser10,PNDate,PNTab,PNControlled,PNAux1,PNQty,PNQty2,PNCostChanged,PNParentCost,PNExpandList,PNAssyCostOption,PNInclAssyOnPurchList,PNMadeFrom,PNMinStockQty,PNOrderToMaintain,PNOnECO,PNOverKit,PNOverKitQty,PNOverKitBy,PNOverKitFor,PNCurrentCost,PNLastRollupCost,PNUSRID,PNUserLock in reader:
#	writer.writerow([PNPartNumber])
	writer.writerow([PNPartNumber, PNTitle, PNDetail])
 
ifile.close()
ofile.close()
