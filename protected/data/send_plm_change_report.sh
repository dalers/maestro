#!/bin/sh
# find new and modified parts by extracting Part Number, Title and Detail from
# csv/pv_pn.csv and comparing to csv.old/pv_pn.csv
# - file paths hardcoded for Maestro
# - WRITES to maestro smb file share
# - HARDCODED file paths (assumes Maestro reference server)
#

# ##########
# FIND DIFFERENCES IN PARTS
# ##########
# create index file for current plm
# extract part details
python /usr/local/www/maestro/protected/data/pndetails.py /home/samba/maestro/csv/pv_pn.csv /home/samba/maestro/csv/pv_pn_details.csv
# TODO bootstrap initial iteration (for 2nd iteration, csv/pv_pn_details.csv -> csv.old/pv_pn_details.csv)
python /usr/local/www/maestro/protected/data/pndetails.py /usr/home/samba/maestro/csv.old/pv_pn.csv /usr/home/samba/maestro/csv.old/pv_pn_details.csv

# sort extracted details and generate new and changed (modified/deleted) lists
sort /home/samba/maestro/csv/pv_pn_details.csv  > /home/samba/maestro/csv/pv_pn_details_sort.csv
# TODO bootstrap initial iteration (for 2nd iteration, csv/pv_pn_details_sort.csv -> csv.old/pv_pn_details_sort.csv)
sort /usr/home/samba/maestro/csv.old/pv_pn_details.csv  > /usr/home/samba/maestro/csv.old/pv_pn_details_sort.csv

comm -23 /home/samba/maestro/csv/pv_pn_details_sort.csv /home/samba/maestro/csv.old/pv_pn_details_sort.csv > /home/samba/maestro/pv_pn_new.txt
comm -13 /home/samba/maestro/csv/pv_pn_details_sort.csv /home/samba/maestro/csv.old/pv_pn_details_sort.csv > /home/samba/maestro/pv_pn_changed.txt

# ##########
# FIND DIFFERENCES IN FILES
# ##########
# rsync log file maestro/rsync.log used as-is

# ##########
# OUTPUT RESULTS
# ##########
echo ""
echo "New PNs"
echo "======================="
cat /home/samba/maestro/pv_pn_new.txt
echo ""

echo "Modified or Deleted PNs"
echo "======================="
cat /home/samba/maestro/pv_pn_changed.txt
echo ""

echo "New and Modified Files"
echo "======================"
cat /home/samba/maestro/rsync.log
echo ""

# ##########
# BUILD EMAIL REPORT
# ##########
# create and build report text file
echo "Sent by Maestro - do NOT reply" > /usr/home/samba/maestro/plm_changereport.txt
date >> /usr/home/samba/maestro/plm_changereport.txt
echo "" >> /usr/home/samba/maestro/plm_changereport.txt

echo "New PNs" >> /usr/home/samba/maestro/plm_changereport.txt
echo "=======================" >> /usr/home/samba/maestro/plm_changereport.txt
cat /usr/home/samba/maestro/pv_pn_new.txt >> /usr/home/samba/maestro/plm_changereport.txt
echo "" >> /usr/home/samba/maestro/plm_changereport.txt

echo "Modified or Deleted PNs" >> /usr/home/samba/maestro/plm_changereport.txt
echo "=======================" >> /usr/home/samba/maestro/plm_changereport.txt
cat /usr/home/samba/maestro/pv_pn_changed.txt >> /usr/home/samba/maestro/plm_changereport.txt
echo "" >> /usr/home/samba/maestro/plm_changereport.txt

echo "New or Modified Files" >> /usr/home/samba/maestro/plm_changereport.txt
echo "=====================" >> /usr/home/samba/maestro/plm_changereport.txt
cat /usr/home/samba/maestro/rsync.log >> /usr/home/samba/maestro/plm_changereport.txt
echo "" >> /usr/home/samba/maestro/plm_changereport.txt

# ##########
# SEND EMAIL
# ##########
# assuming root user is running this script (either directly or via cron), mail aliases
# can be listed /root/.mailrc
#
# ssmtp does not support aliases
# if using sendmail or postfix, can define group alias in /root/.mailrc or /etc/aliases (run newaliases)
mail -s "PLM Change Report" root < /usr/home/samba/maestro/plm_changereport.txt

exit 0
