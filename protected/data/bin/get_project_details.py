#!/usr/bin/env python2
#
# Get details from project.csv (e.g. JobID, Client, RunDate)
#   Reads from arg1/file1, writes to arg2/file2
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
#reader = csv.reader(ifile)
reader = csv.reader(ifile, delimiter='\t')

ofile = open(sys.argv[2], "wb") # open output csv file
#writer = csv.writer(ofile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
writer = csv.writer(ofile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

for ProjID,ActID,JobID,RemanNum,SONum,OrderNum,Client,Descriptor,Product,Size,Bend,Length,Comments,InspType,NotDone,Statuses,Resources,NextEvent,EventDate,Tagged,StartDate,StartDateDate,EndDate,EndDateDate,RunDate,SortDate,MobDate,MobDateSort in reader:
#	writer.writerow([JobID,RemanNum,SONum,OrderNum,Client,Descriptor,Product,Size,Bend,Length,Comment,InspType,RunDate])
	writer.writerow([JobID,Client,InspType,RunDate])
 
ifile.close()
ofile.close()
