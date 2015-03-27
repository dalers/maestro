#!/bin/sh
#
# Create and mail change report for part numbers, files and projects
#
# Schedule in /etc/crontab:
#   - rsync_current_files.sh
#   - export_current_to_csv.sh
#   - send_current_change_report.sh
#   - load_current_from_csv.sh
#

# find current part numbers and sort
echo "send_current_change_report: extract and sort 'current' part number details."
/usr/local/www/maestro/protected/data/bin/get_pv_pn_details.py /home/maestro/scc/csv/pv_pn.csv /home/maestro/scc/csv/pv_pn_details.csv
sort /home/maestro/scc/csv/pv_pn_details.csv  > /home/maestro/scc/csv/pv_pn_details_sort.csv

# find current projects and sort
#echo "send_current_change_report: extract and sort 'current' project details."
#/usr/local/www/maestro/protected/data/bin/get_project_details.py /home/maestro/scc/csv/project.csv /home/maestro/scc/csv/project_details.csv
#sort /home/maestro/scc/csv/project_details.csv  > /home/maestro/scc/csv/project_details_sort.csv

# start new email report file and add heading
echo "send_current_change_report: build email report"
echo "Do not reply, this address does not accept mail." > /home/maestro/scc/work/current_changereport.txt

# add part number changes to email report file
echo "" >> /home/maestro/scc/work/current_changereport.txt
echo "Part Numbers" >> /home/maestro/scc/work/current_changereport.txt
echo "========================================" >> /home/maestro/scc/work/current_changereport.txt
diff -u /home/maestro/scc/csv.old/pv_pn_details_sort.csv /home/maestro/scc/csv/pv_pn_details_sort.csv  >> /home/maestro/scc/work/current_changereport.txt

# add document changes to email report file
echo "" >> /home/maestro/scc/work/current_changereport.txt
echo "Documents" >> /home/maestro/scc/work/current_changereport.txt
echo "========================================" >> /home/maestro/scc/work/current_changereport.txt
cut -c 28- /home/maestro/scc/work/rsync-parts.log | grep '>f'  >> /home/maestro/scc/work/current_changereport.txt
cut -c 28- /home/maestro/scc/work/rsync-parts.log | grep error >> /home/maestro/scc/work/current_changereport.txt

# add project changes to email report file
#echo "" >> /home/maestro/scc/work/current_changereport.txt
#echo "Projects" >> /home/maestro/scc/work/current_changereport.txt
#echo "========================================" >> /home/maestro/scc/work/current_changereport.txt
## TODO diff -U 0 may be unique to GNU-diff
#diff -U 0 /home/maestro/scc/csv.old/project_details_sort.csv /home/maestro/scc/csv/project_details_sort.csv  >> /home/maestro/scc/work/current_changereport.txt

# add footer to email report file
echo "" >> /home/maestro/scc/work/current_changereport.txt
echo "----------------------------------------" >> /home/maestro/scc/work/current_changereport.txt
echo "Contact your Maestro administrator with questions or concerns." >> /home/maestro/scc/work/current_changereport.txt
date >> /home/maestro/scc/work/current_changereport.txt

# clean up any EOL issues in report file (prevent mail client from misinterpreting file contents as binary data)
echo "send_current_change_report: dos2unix report file..."
/usr/local/bin/flip -u /home/maestro/scc/work/current_changereport.txt

# mail report file in body of email
echo "send_current_change_report: send email report..."
mail -s "Maestro Change Report" root@whizzer.swiftconstructioncompany.net < /home/maestro/scc/work/current_changereport.txt

# cleanup
#rm /home/maestro/scc/work/rsync*.log
# preserve change report
cp /home/maestro/scc/work/current_changereport.txt /home/maestro/scc/work/changereport-`date +%Y%m%d%S`.txt

exit 0
