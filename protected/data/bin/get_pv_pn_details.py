#!/usr/bin/env python2
#
# Get details from pv_pn.csv (e.g. Part Number, Title, Detail)
#   Reads from file1, writes to file2
#
# Note on shebang:
#   #!/usr/bin/env python    - use first python in user path - most portable (unless no "python" as default on FreeBSD)
#   #!/usr/local/bin/python2 - FreeBSD default python 2.x install
#   #!/usr/bin/python        - common Linux python install
#   #!/usr/bin/python2.5     - specific Python version (common Linux install as shown)
#

import csv
import sys

ifile = open(sys.argv[1], "rb") # open input csv file
reader = csv.reader(ifile)

ofile = open(sys.argv[2], "wb") # open output csv file
writer = csv.writer(ofile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

for PNID,PNIDToLNK,PNUNID,PNTabParentID,PNPrefix,PNPartNumber,PNSuffix,PNType,PNRevision,PNTitle,PNDetail,PNStatus,PNReqBy,PNNotes,PNUser1,PNUser2,PNUser3,PNUser4,PNUser5,PNUser6,PNUser7,PNUser8,PNUser9,PNUser10,PNDate,PNTab,PNControlled,PNAux1,PNQty,PNQty2,PNCostChanged,PNParentCost,PNExpandList,PNAssyCostOption,PNInclAssyOnPurchList,PNMadeFrom,PNMinStockQty,PNOrderToMaintain,PNOnECO,PNOverKit,PNOverKitQty,PNOverKitBy,PNOverKitFor,PNCurrentCost,PNLastRollupCost,PNUSRID,PNUserLock in reader:
	writer.writerow([PNPartNumber, PNTitle, PNDetail])
 
ifile.close()
ofile.close()
