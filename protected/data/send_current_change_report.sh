#!/bin/sh
# find new and modified parts by extracting Part Number, Title and Detail from
# csv/pv_pn.csv and comparing to csv.old/pv_pn.csv
# - REQUIRES ssmtp
# - HARDCODED file paths (assumes Maestro reference server)
# - WRITES to maestro CIFS file share
#

#
# review current data
#
echo "send_current_change_report: extract details from 'current' csv and sort"
python /usr/local/www/maestro/protected/data/pndetails.py /home/samba/maestro/csv/pv_pn.csv /home/samba/maestro/csv/pv_pn_details.csv
sort /home/samba/maestro/csv/pv_pn_details.csv  > /home/samba/maestro/csv/pv_pn_details_sort.csv
echo

echo "send_current_change_report: compare current to previous details and create new and changed/deleted lists"
comm -23 /home/samba/maestro/csv/pv_pn_details_sort.csv /home/samba/maestro/csv.old/pv_pn_details_sort.csv > /home/samba/maestro/work/pv_pn_new.txt
comm -13 /home/samba/maestro/csv/pv_pn_details_sort.csv /home/samba/maestro/csv.old/pv_pn_details_sort.csv > /home/samba/maestro/work/pv_pn_changed.txt
#echo "send_current_change_report: find file differences..."
# rsync log file saved to maestro/work/rsync.log and used as-is for changes report
#echo

#
# show review results
#

echo "send_current_change_report: show results..."
echo

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

#
# build results email
#

echo "send_current_change_report: build email report..."
# wrapper fields
echo "From: maestro@firefly.scc.local" > /home/samba/maestro/work/current_changereport.txt
echo "Subject: Maestro Current Data Change Report" >> /home/samba/maestro/work/current_changereport.txt

# heading
echo "" >>  /home/samba/maestro/work/current_changereport.txt
echo "Do NOT reply" >> /home/samba/maestro/work/current_changereport.txt
date >> /home/samba/maestro/work/current_changereport.txt
echo "" >> /home/samba/maestro/work/current_changereport.txt

# body
echo "New Part Numbers" >> /home/samba/maestro/work/current_changereport.txt
echo "=======================" >> /home/samba/maestro/work/current_changereport.txt
cat /home/samba/maestro/work/pv_pn_new.txt >> /home/samba/maestro/work/current_changereport.txt
echo "" >> /home/samba/maestro/work/current_changereport.txt

echo "Modified and Deleted PNs" >> /home/samba/maestro/work/current_changereport.txt
echo "=======================" >> /home/samba/maestro/work/current_changereport.txt
cat /home/samba/maestro/work/pv_pn_changed.txt >> /home/samba/maestro/work/current_changereport.txt
echo "" >> /home/samba/maestro/work/current_changereport.txt

echo "New and Modified Files" >> /home/samba/maestro/work/current_changereport.txt
echo "=====================" >> /home/samba/maestro/work/current_changereport.txt
cat /home/samba/maestro/work/rsync.log >> /home/samba/maestro/work/current_changereport.txt
echo "" >> /home/samba/maestro/work/current_changereport.txt

#
# send email
# ssmtp does not support aliases, explicitly list each intended recipient
#   - or email a group address (and administer the group separately)

echo "send_current_change_report: send email report..."

# Testing (uncomment to use, and comment "Production"
#/usr/local/sbin/ssmtp root < /home/samba/maestro/work/current_changereport.txt

# Production (uncomment to use, and comment "Testing"
#/usr/local/sbin/ssmtp tswift@scc.local fmason@scc.local mdelazes@scc.local < /home/samba/maestro/work/current_changereport.txt

exit 0
