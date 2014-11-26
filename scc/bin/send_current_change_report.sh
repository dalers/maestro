#!/bin/sh
#
# Create and mail report with modified part numbers and files
# - extract Part Number, Title and Detail from csv/pv_pn.csv
#   and compare to csv.old/pv_pn.csv
# - extract file transfer details (and errors) from rsync
#   log files
# - assemble and mail report
#
# Schedule using cron in following order:
#   1. rsync_current_files.sh
#   2. export_current_to_csv.sh
#   3. send_current_change_report.sh
#      - rsync_current_files.sh and export_current_to_csv.sh MUST complete first
#

# find new/modified/deleted part numbers and create report lists
echo "send_current_change_report: extract PN details from 'current' csv"
/home/maestro/maestro-repo/scc/bin/pndetails.py /home/maestro/scc/csv/pv_pn.csv /home/maestro/scc/csv/pv_pn_details.csv
sort /home/maestro/scc/csv/pv_pn_details.csv  > /home/maestro/scc/csv/pv_pn_details_sort.csv

echo "send_current_change_report: compare 'current' PN details to 'old' details"
comm -23 /home/maestro/scc/csv/pv_pn_details_sort.csv /home/maestro/scc/csv.old/pv_pn_details_sort.csv > /home/maestro/scc/work/pv_pn_new.txt
comm -13 /home/maestro/scc/csv/pv_pn_details_sort.csv /home/maestro/scc/csv.old/pv_pn_details_sort.csv > /home/maestro/scc/work/pv_pn_changed.txt

# create summary of rsync changes and errors
echo "send_current_change_report: create change summary reports"

echo "Part Documents"     >  /home/maestro/scc/work/rsync.log
echo "----------------------------------------" >> /home/maestro/scc/work/rsync.log
cut -c 29- /home/maestro/scc/work/rsync-parts.log | grep '>f'      >> /home/maestro/scc/work/rsync.log
cut -c 29- /home/maestro/scc/work/rsync-parts.log | grep error     >> /home/maestro/scc/work/rsync.log
echo ""                                                            >> /home/maestro/scc/work/rsync.log
                                                               
echo "Material Documents" >> /home/maestro/scc/work/rsync.log
echo "----------------------------------------" >> /home/maestro/scc/work/rsync.log
#cut -c 29- /home/maestro/scc/work/rsync-material.log | grep '>f'   >> /home/maestro/scc/work/rsync.log
#cut -c 29- /home/maestro/scc/work/rsync-material.log | grep error  >> /home/maestro/scc/work/rsync.log
echo ""                                                             >> /home/maestro/scc/work/rsync.log

# build report
echo "send_current_change_report: build report"
# heading
echo "" >  /home/maestro/scc/work/current_changereport.txt
echo "Do not reply, this address does not accept mail" >> /home/maestro/scc/work/current_changereport.txt
echo "" >> /home/maestro/scc/work/current_changereport.txt

# body
echo "New Part Numbers" >> /home/maestro/scc/work/current_changereport.txt
echo "========================================" >> /home/maestro/scc/work/current_changereport.txt
cat /home/maestro/scc/work/pv_pn_new.txt >> /home/maestro/scc/work/current_changereport.txt
echo "" >> /home/maestro/scc/work/current_changereport.txt

echo "Modified and Deleted Part Numbers" >> /home/maestro/scc/work/current_changereport.txt
echo "========================================" >> /home/maestro/scc/work/current_changereport.txt
cat /home/maestro/scc/work/pv_pn_changed.txt >> /home/maestro/scc/work/current_changereport.txt
echo "" >> /home/maestro/scc/work/current_changereport.txt

echo "New and Modified Documents" >> /home/maestro/scc/work/current_changereport.txt
echo "========================================" >> /home/maestro/scc/work/current_changereport.txt
cat /home/maestro/scc/work/rsync.log >> /home/maestro/scc/work/current_changereport.txt
echo "" >> /home/maestro/scc/work/current_changereport.txt

echo "" >> /home/maestro/scc/work/current_changereport.txt
echo "----------------------------------------" >> /home/maestro/scc/work/current_changereport.txt
echo "Contact your Maestro administrator with questions or concerns." >> /home/maestro/scc/work/current_changereport.txt
date >> /home/maestro/scc/work/current_changereport.txt
echo "" >> /home/maestro/scc/work/current_changereport.txt

# send report
#echo "send_current_change_report: send email report..."
#mail -s "Maestro Part and Document Changes" root@whizzer.local < /home/maestro/scc/work/current_changereport.txt
#echo

# cleanup
#rm /home/maestro/scc/work/rsync*.log
echo

exit 0
