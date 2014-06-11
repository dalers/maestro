#!/bin/sh
#
# 1. export current data from source to csv
# 2. load current data from csv 
# 3. add new and/or modified current documents to local vault
# 4. analyse current vs previous data and files, send change report
#
# Schedule regular execution using cron e.g. nightly
#

echo
echo "get_current_and_review: copy csv/ to csv.old/"
echo
cp -a /home/samba/maestro/csv/ /home/samba/maestro/csv.old/

echo "get_current_and_review: export_current_to_csv"
echo
/usr/local/maestro/bin/export_current_to_csv.sh

# Initial bootstrap - uncomment commands for initial run
# csv.old/ will be empty on first-time execution, files required
# by current-vs-previous analysis must be specially created
#head -n 1 /home/samba/maestro/csv/pv_pn.csv > /home/samba/maestro/csv.old/pv_pn.csv
#python /usr/local/maestro/bin/pndetails.py /home/samba/maestro/csv.old/pv_pn.csv /home/samba/maestro/csv.old/pv_pn_details.csv
#sort /home/samba/maestro/csv.old/pv_pn_details.csv  > /home/samba/maestro/csv.old/pv_pn_details_sort.csv

echo "get_current_and_review: load_current_from_csv.sh"
echo
/usr/local/maestro/bin/load_current_from_csv.sh

echo "get_current_and_review: rsync_current_files.sh"
echo
/usr/local/maestro/bin/rsync_current_files.sh

echo "get_current_and_review: send_curent_change_report.sh"
echo
/usr/local/maestro/bin/send_current_change_report.sh

exit 0
