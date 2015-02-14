#!/bin/sh
#
# Load current data from CSV on Windows dev system
# - DATABASE ROOT PASSWORD IN PLAN TEXT (LOAD DATA INFILE requires root user)
# - HARDCODED file paths (XAMPP)
# - execute from maestro/protected/data/
#

echo "load_current_from_csv_win: deleting data in db"
# clean database with current data
/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force maestro < /usr/local/www/maestro/protected/data/clear_tables.sql
echo

echo "load_current_from_csv: loading csv"
mysql -uroot -pappleton --local-infile=1 --show-warnings --verbose maestro < ./load_current_win.sql
echo


exit 0
