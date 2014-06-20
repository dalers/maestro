#!/bin/sh
#
# Create and mail report with modified part numbers and files
# - extract Part Number, Title and Detail from csv/pv_pn.csv
#   and compare to csv.old/pv_pn.csv
# - extract file transfer details (and errors) from rsync
#   log files
# - assemble and mail report
#
# Schedule using cron as follows:
#   1. rsync_current_files.sh
#      - rsync MUST complete before send_current_change_report.sh runs
#   2. export_current_to_csv.sh
#   3. send_current_change_report.sh
#
# - HARDCODED ssmtp for mailing
#

# find new/modified/deleted part numbers and create report lists
echo "send_current_change_report: extract PN details from current csv"
/usr/local/maestro/bin/pndetails.py /home/samba/scc/csv/pv_pn.csv /home/samba/scc/csv/pv_pn_details.csv
sort /home/samba/scc/csv/pv_pn_details.csv  > /home/samba/scc/csv/pv_pn_details_sort.csv
echo

echo "send_current_change_report: compare current PN details to previous"
comm -23 /home/samba/scc/csv/pv_pn_details_sort.csv /home/samba/scc/csv.old/pv_pn_details_sort.csv > /home/samba/scc/work/pv_pn_new.txt
comm -13 /home/samba/scc/csv/pv_pn_details_sort.csv /home/samba/scc/csv.old/pv_pn_details_sort.csv > /home/samba/scc/work/pv_pn_changed.txt

# review rsync log files for copied files and errors
echo "send_current_change_report: review rsync log files"

# create summary of rsync changes and errors
#
# parts
#
# create new file
echo "Parts:"  >  /home/samba/scc/work/rsync.log
cut -c 28- /home/samba/scc/work/rsync-parts.log | grep '^>f'          >> /home/samba/scc/work/rsync.log
cut -c 28- /home/samba/scc/work/rsync-parts.log | grep error          >> /home/samba/scc/work/rsync.log
echo ""                                                            >> /home/samba/scc/work/rsync.log
                                                                
#                                                               
# material                                                      
#                                                               
#echo ""          >  /home/samba/scc/work/rsync.log
#echo "Material:"  >  /home/samba/scc/work/rsync.log
#cut -c 28- /home/samba/scc/work/rsync-material.log | grep '^>f'          >> /home/samba/scc/work/rsync.log
#cut -c 28- /home/samba/scc/work/rsync-material.log | grep error          >> /home/samba/scc/work/rsync.log
#echo ""                                                            >> /home/samba/scc/work/rsync.log

#
# build email report
#
echo "send_current_change_report: build email report..."
# wrapper fields
echo "From: maestro@hotstuff.can.bjs" > /home/samba/scc/work/current_changereport.txt
echo "Subject: Maestro Part Number and File Changes" >> /home/samba/scc/work/current_changereport.txt

# heading
echo "" >>  /home/samba/scc/work/current_changereport.txt
echo "Do not reply, this address does not accept mail" >> /home/samba/scc/work/current_changereport.txt
echo "" >> /home/samba/scc/work/current_changereport.txt

# body
echo "New Part Numbers" >> /home/samba/scc/work/current_changereport.txt
echo "========================================" >> /home/samba/scc/work/current_changereport.txt
cat /home/samba/scc/work/pv_pn_new.txt >> /home/samba/scc/work/current_changereport.txt
echo "" >> /home/samba/scc/work/current_changereport.txt

echo "Modified and Deleted Part Numbers" >> /home/samba/scc/work/current_changereport.txt
echo "========================================" >> /home/samba/scc/work/current_changereport.txt
cat /home/samba/scc/work/pv_pn_changed.txt >> /home/samba/scc/work/current_changereport.txt
echo "" >> /home/samba/scc/work/current_changereport.txt

echo "New and Modified Files" >> /home/samba/scc/work/current_changereport.txt
echo "========================================" >> /home/samba/scc/work/current_changereport.txt
cat /home/samba/scc/work/rsync.log >> /home/samba/scc/work/current_changereport.txt
echo "" >> /home/samba/scc/work/current_changereport.txt

echo "" >> /home/samba/scc/work/current_changereport.txt
echo "----------------------------------------" >> /home/samba/scc/work/current_changereport.txt
echo "Contact your Maestro administrator with questions or concerns." >> /home/samba/scc/work/current_changereport.txt
date >> /home/samba/scc/work/current_changereport.txt
echo "" >> /home/samba/scc/work/current_changereport.txt

#
# send email
# ssmtp does not support aliases, explicitly list each intended recipient
echo "send_current_change_report: send email report..."
/usr/local/sbin/ssmtp root < /home/samba/scc/work/current_changereport.txt

#
# cleanup
#

#rm /home/samba/scc/work/rsync*.log
echo

exit 0
