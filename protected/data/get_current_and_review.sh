#!/bin/sh
#
# Master script to get current data, review to determine if an
# iteration has occured, and send change report
#
# - configure to run by cron e.g. nightly
#

echo "get_current_and_review: copy 'current' csv/ to csv.old/"
echo
cp -a /home/samba/maestro/csv/ /home/samba/maestro/csv.old/

echo "get_current_and_review: export_current_to_csv"
echo
/usr/local/www/maestro/protected/data/export_current_to_csv.sh

# need to bootstrap csv.old/ first time through with required files
# for change analysis.
#head -n 1 /home/samba/maestro/csv/pv_pn.csv > /home/samba/maestro/csv.old/pv_pn.csv
#python /usr/local/www/maestro/protected/data/pndetails.py /home/samba/maestro/csv.old/pv_pn.csv /home/samba/maestro/csv.old/pv_pn_details.csv
#sort /home/samba/maestro/csv.old/pv_pn_details.csv  > /home/samba/maestro/csv.old/pv_pn_details_sort.csv

echo "get_current_and_review: load_current_from_csv.sh"
echo
/usr/local/www/maestro/protected/data/load_current_from_csv.sh

echo "get_current_and_review: rsync_current_files.sh"
echo
/usr/local/www/maestro/protected/data/rsync_current_files.sh

echo "get_current_and_review: send_curent_change_report.sh"
echo
/usr/local/www/maestro/protected/data/send_current_change_report.sh


exit 0
