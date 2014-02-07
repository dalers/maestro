#!/bin/sh
#
# Master script to get current data and review for potential
# iteration and send change report
# - intended to be run by cron on periodic basis (e.g. nightly)

# move csv/ from previous check to csv.old/
# well, actually...
rm -rfv /home/samba/maestro/csv.old
mv -fv  /home/samba/maestro/csv /home/samba/maestro/csv.old
mkdir   /home/samba/maestro/csv
chmod a+xrw /home/samba/maestro/csv

# export new csv
/usr/local/www/maestro/protected/data/export_current_to_csv.sh

# when running for very first time, csv.old/ must be bootstrapped with
# any files used/required by send_current_change_port.sh
# - for initial setup, run through the commands in this script manually.
#   You will learn/refresh how things work, verify everything *is* working,
#   and  prime the pump for the 2nd time through to be done automatically.
#head -n 1 /home/samba/maestro/csv/pv_pn.csv > /home/samba/maestro/csv.old/pv_pn.csv

/usr/local/www/maestro/protected/data/load_curent_from_csv.sh
/usr/local/www/maestro/protected/data/rsync_current_files.sh
/usr/local/www/maestro/protected/data/send_current_change_report.sh

exit 0
