#!/bin/sh
#
# find new and modified parts by extracting Part Number, Title and Detail from
# csv/pv_pn.csv and comparing to csv.old/pv_pn.csv
# - file paths hardcoded for Win XAMPP
# - WRITES to maestro smb file share (TODO write temp files to /tmp/)
#   TODO write temp files to /tmp/
#

# extract part details from (current) csv/
python pndetails.py C:/xampp/htdocs/maestro/protected/data/csv/pv_pn.csv C:/xampp/htdocs/maestro/protected/data/csv/pv_pn_details.csv
# DEV ONLY, OR TO BOOTSTRAP PRODUCTION - extract details from (previous) csv.old/
# (in normal use, next import cycle will copy csv/ to csv.old/ (including pv_pn_details.csv)
python pndetails.py C:/xampp/htdocs/maestro/protected/data/csv.old/pv_pn.csv C:/xampp/htdocs/maestro/protected/data/csv.old/pv_pn_details.csv

# sort extracted details and generate new and changed (modified/deleted) lists
sort csv/pv_pn_details.csv  > csv/pv_pn_details_sort.csv
sort csv.old/pv_pn_details.csv  > csv.old/pv_pn_details_sort.csv

comm -23 csv/pv_pn_details_sort.csv csv.old/pv_pn_details_sort.csv > pv_pn_new.txt
comm -13 csv/pv_pn_details_sort.csv csv.old/pv_pn_details_sort.csv > pv_pn_changed.txt

# display results
echo ""
echo "New PNs"
echo "======================="
cat pv_pn_new.txt
echo ""

echo "Modified or Deleted PNs"
echo "======================="
cat pv_pn_changed.txt
echo ""

# write output report
echo "Sent by Maestro - do NOT reply" > pv_pn_changereport.txt
date >> pv_pn_changereport.txt
echo "" >> pv_pn_changereport.txt

echo "New PNs" >> pv_pn_changereport.txt
echo "=======================" >> pv_pn_changereport.txt
cat pv_pn_new.txt >> pv_pn_changereport.txt
echo "" >> pv_pn_changereport.txt

echo "Modified or Deleted PNs" >> pv_pn_changereport.txt
echo "=======================" >> pv_pn_changereport.txt
cat pv_pn_changed.txt >> pv_pn_changereport.txt
echo "" >> pv_pn_changereport.txt

# done!