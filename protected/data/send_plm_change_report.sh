#!/bin/sh
# find new and modified parts by extracting Part Number, Title and Detail from
# csv/pv_pn.csv and comparing to csv.old/pv_pn.csv
# - file paths hardcoded for Maestro
# - WRITES to maestro smb file share (TODO write temp files to /tmp/)
# - HARDCODED file paths (assumes Maestro reference server)
#

# extract part details from (current) csv/
python /usr/local/www/maestro/protected/data/pndetails.py /usr/home/samba/maestro/csv/pv_pn.csv /usr/home/samba/maestro/csv/pv_pn_details.csv
# extract part details from csv.old/
# only actually needed to bootstrap, in ongoing operation this should not be necessary (the extract would already be done)
python /usr/local/www/maestro/protected/data/pndetails.py /usr/home/samba/maestro/csv.old/pv_pn.csv /usr/home/samba/maestro/csv.old/pv_pn_details.csv

# sort extracted details and generate new and changed (modified/deleted) lists
sort /usr/home/samba/maestro/csv/pv_pn_details.csv  > /usr/home/samba/maestro/csv/pv_pn_details_sort.csv
sort /usr/home/samba/maestro/csv.old/pv_pn_details.csv  > /usr/home/samba/maestro/csv.old/pv_pn_details_sort.csv

comm -23 /usr/home/samba/maestro/csv/pv_pn_details_sort.csv /usr/home/samba/maestro/csv.old/pv_pn_details_sort.csv > /usr/home/samba/maestro/pv_pn_new.txt
comm -13 /usr/home/samba/maestro/csv/pv_pn_details_sort.csv /usr/home/samba/maestro/csv.old/pv_pn_details_sort.csv > /usr/home/samba/maestro/pv_pn_changed.txt

# display results
echo ""
echo "New PNs"
echo "======================="
cat /usr/home/samba/maestro/pv_pn_new.txt
echo ""

echo "Modified or Deleted PNs"
echo "======================="
cat /usr/home/samba/maestro/pv_pn_changed.txt
echo ""

# write output report
echo "Sent by Maestro - do NOT reply" > /usr/home/samba/maestro/pv_pn_changereport.txt
date >> /usr/home/samba/maestro/pv_pn_changereport.txt
echo "" >> /usr/home/samba/maestro/pv_pn_changereport.txt

echo "New PNs" >> /usr/home/samba/maestro/pv_pn_changereport.txt
echo "=======================" >> /usr/home/samba/maestro/pv_pn_changereport.txt
cat /usr/home/samba/maestro/pv_pn_new.txt >> /usr/home/samba/maestro/pv_pn_changereport.txt
echo "" >> /usr/home/samba/maestro/pv_pn_changereport.txt

echo "Modified or Deleted PNs" >> /usr/home/samba/maestro/pv_pn_changereport.txt
echo "=======================" >> /usr/home/samba/maestro/pv_pn_changereport.txt
cat /usr/home/samba/maestro/pv_pn_changed.txt >> /usr/home/samba/maestro/pv_pn_changereport.txt
echo "" >> /usr/home/samba/maestro/pv_pn_changereport.txt

# maestro alias must be defined in /root/.mailrc
mail -s "New/Modified PLM Report" maestro < /usr/home/samba/maestro/pv_pn_changereport.txt

# done!
