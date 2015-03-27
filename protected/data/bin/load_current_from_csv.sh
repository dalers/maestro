#!/bin/sh
#
# Load current data into maestro db from CSV
# - DATABASE ROOT PASSWORD IN PLAIN TEXT (LOAD DATA INFILE requires root user)
# - HARDCODED file paths
#
# Schedule in /etc/crontab:
#   - rsync_current_files.sh
#   - export_current_to_csv.sh
#   - send_current_change_report.sh
#   - load_current_from_csv.sh
#

echo "load_current_from_csv: deleting data in maestro db"
# current data overwrites old data
#/usr/local/bin/mysql -uroot -pappleton --local-infile=1 --show-warnings --verbose maestro < /usr/local/www/maestro/protected/data/bin/setup_clear_tables.sql
/usr/local/bin/mysql -uroot -pappleton --local-infile=1 maestro < /usr/local/www/maestro/protected/data/bin/setup_clear_tables.sql

echo "load_current_from_csv: loading csv"
#/usr/local/bin/mysql -uroot -pappleton --local-infile=1 --show-warnings --verbose maestro < /usr/local/www/maestro/protected/data/bin/load_current_from_csv.sql
/usr/local/bin/mysql -uroot -pappleton --local-infile=1 maestro < /usr/local/www/maestro/protected/data/bin/load_current_from_csv.sql
echo

exit 0
