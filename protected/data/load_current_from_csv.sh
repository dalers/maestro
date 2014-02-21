#!/bin/sh
#
# Load current data from CSV
# - DATABASE ROOT PASSWORD IN PLAIN TEXT (LOAD DATA INFILE requires root user)
# - HARDCODED file paths
#

echo "load_current_from_csv: deleting data in db"
# current data overwrites old data
#/usr/local/bin/mysql -uroot -pappleton --local-infile=1 --show-warnings --verbose maestro < /usr/local/www/maestro/protected/data/clear_tables.sql
/usr/local/bin/mysql -uroot -pappleton --local-infile=1 maestro < /usr/local/www/maestro/protected/data/clear_tables.sql
echo

echo "load_current_from_csv: loading csv"
#/usr/local/bin/mysql -uroot -pappleton --local-infile=1 --show-warnings --verbose maestro < /usr/local/www/maestro/protected/data/load_current_from_csv.sql
/usr/local/bin/mysql -uroot -pappleton --local-infile=1 maestro < /usr/local/www/maestro/protected/data/load_current_from_csv.sql
echo

exit 0
