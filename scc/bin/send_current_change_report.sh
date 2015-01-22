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

# create a list with current part number details to compare later with previous list
# (rsync has created a log file, which will be used to identify file changes)
echo "send_current_change_report: extract and sort 'current' part number details."
/home/maestro/maestro-repo/scc/bin/pndetails.py /home/maestro/scc/csv/pv_pn.csv /home/maestro/scc/csv/pv_pn_details.csv
sort /home/maestro/scc/csv/pv_pn_details.csv  > /home/maestro/scc/csv/pv_pn_details_sort.csv

# start new email report file and add heading
echo "send_current_change_report: build email report"
echo "Do not reply, the return address will not accept mail." > /home/maestro/scc/work/current_changereport.txt
echo "" >> /home/maestro/scc/work/current_changereport.txt

# add part number changes to email report file
echo "Part Numbers" >> /home/maestro/scc/work/current_changereport.txt
echo "========================================" >> /home/maestro/scc/work/current_changereport.txt
diff -u /home/maestro/scc/csv.old/pv_pn_details_sort.csv /home/maestro/scc/csv/pv_pn_details_sort.csv  >> /home/maestro/scc/work/current_changereport.txt

# add document changes to email report file
echo "" >> /home/maestro/scc/work/current_changereport.txt
echo "Documents" >> /home/maestro/scc/work/current_changereport.txt
echo "========================================" >> /home/maestro/scc/work/current_changereport.txt
cut -c 28- /home/maestro/scc/work/rsync-parts.log | grep '>f'  >> /home/maestro/scc/work/current_changereport.txt
cut -c 28- /home/maestro/scc/work/rsync-parts.log | grep error >> /home/maestro/scc/work/current_changereport.txt

# add footer to email report file
echo "" >> /home/maestro/scc/work/current_changereport.txt
echo "----------------------------------------" >> /home/maestro/scc/work/current_changereport.txt
echo "Contact your Maestro administrator with questions or concerns." >> /home/maestro/scc/work/current_changereport.txt
date >> /home/maestro/scc/work/current_changereport.txt

# clean up any EOL issues in report file (prevent mail client from misinterpreting file contents as binary data)
echo "send_current_change_report: dos2unix report file..."
dos2unix /home/maestro/scc/work/current_changereport.txt

# mail report file in body of email
echo "send_current_change_report: send email report..."
mail -s "Maestro PLM Change Report" root@whizzer.swiftconstructioncompany.net < /home/maestro/scc/work/current_changereport.txt

# cleanup
#rm /home/maestro/scc/work/rsync*.log

exit 0
