#!/bin/sh
# find new and modified parts by extracting Part Number, Title and Detail from
# csv/pv_pn.csv and comparing to csv.old/pv_pn.csv
# - REQUIRES ssmtp
# - HARDCODED file paths (assumes Maestro reference server)
# - WRITES to maestro smb file share
#

# FIND DIFFERENCES IN PARTS
# create index file for part changes in current with extracted basic part details
python /usr/local/www/maestro/protected/data/pndetails.py /home/samba/maestro/csv/pv_pn.csv /home/samba/maestro/csv/pv_pn_details.csv
# TODO bootstrap initial iteration (csv.old/pv_pn_details.csv will exist for 2nd and following iterations)
python /usr/local/www/maestro/protected/data/pndetails.py /usr/home/samba/maestro/csv.old/pv_pn.csv /usr/home/samba/maestro/csv.old/pv_pn_details.csv

# sort extracted details and generate new and changed (modified/deleted) lists
sort /home/samba/maestro/csv/pv_pn_details.csv  > /home/samba/maestro/csv/pv_pn_details_sort.csv
# TODO bootstrap initial iteration (for 2nd iteration, csv/pv_pn_details_sort.csv -> csv.old/pv_pn_details_sort.csv)
sort /usr/home/samba/maestro/csv.old/pv_pn_details.csv  > /usr/home/samba/maestro/csv.old/pv_pn_details_sort.csv

# compare current and previous part details to create new and changed/deleted lists
comm -23 /home/samba/maestro/csv/pv_pn_details_sort.csv /home/samba/maestro/csv.old/pv_pn_details_sort.csv > /home/samba/maestro/work/pv_pn_new.txt
comm -13 /home/samba/maestro/csv/pv_pn_details_sort.csv /home/samba/maestro/csv.old/pv_pn_details_sort.csv > /home/samba/maestro/work/pv_pn_changed.txt

# FIND DIFFERENCES IN FILES
# rsync log file saved to maestro/work/rsync.log and used as-is for changes report

# SHOW RESULTS
echo ""
echo "New PNs"
echo "======================="
cat /home/samba/maestro/work/pv_pn_new.txt
echo

echo "Modified or Deleted PNs"
echo "======================="
cat /home/samba/maestro/work/pv_pn_changed.txt
echo

echo "New and Modified Files"
echo "======================"
cat /home/samba/maestro/work/rsync.log
echo

# BUILD EMAIL REPORT
# report header
echo "From: maestro@scc.local" > /usr/home/samba/maestro/work/current_changereport.txt
echo "Subject: Maestro Current Data Change Report" >> /usr/home/samba/maestro/work/current_changereport.txt
echo "" >>  /usr/home/samba/maestro/work/current_changereport.txt
echo "Do NOT reply" >> /usr/home/samba/maestro/work/current_changereport.txt
date >> /usr/home/samba/maestro/work/current_changereport.txt
echo "" >> /usr/home/samba/maestro/work/current_changereport.txt

echo "New Part Numbers" >> /usr/home/samba/maestro/work/current_changereport.txt
echo "=======================" >> /usr/home/samba/maestro/work/current_changereport.txt
cat /usr/home/samba/maestro/work/pv_pn_new.txt >> /usr/home/samba/maestro/work/current_changereport.txt
echo "" >> /usr/home/samba/maestro/work/current_changereport.txt

echo "Modified and Deleted PNs" >> /usr/home/samba/maestro/work/current_changereport.txt
echo "=======================" >> /usr/home/samba/maestro/work/current_changereport.txt
cat /usr/home/samba/maestro/work/pv_pn_changed.txt >> /usr/home/samba/maestro/work/current_changereport.txt
echo "" >> /usr/home/samba/maestro/work/current_changereport.txt

echo "New and Modified Files" >> /usr/home/samba/maestro/work/current_changereport.txt
echo "=====================" >> /usr/home/samba/maestro/work/current_changereport.txt
cat /usr/home/samba/maestro/work/rsync.log >> /usr/home/samba/maestro/work/current_changereport.txt
echo "" >> /usr/home/samba/maestro/work/current_changereport.txt

# SEND EMAIL
# ssmtp does not support aliases, each user must be listed explicitly
/usr/local/sbin/ssmtp root < /usr/home/samba/maestro/work/current_changereport.txt

exit 0
