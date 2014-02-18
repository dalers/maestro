#!/bin/sh
#
# Load current data into Maestro from CSV
# - DATABASE ROOT PASSWORD IN PLAIN TEXT (LOAD DATA INFILE requires root user)
# - HARDCODED file paths (assumes Maestro reference server)
#

echo "load_current_from_csv: deleting data in maestro db"
# current data will replace old data
#/usr/local/bin/mysql -uroot -pappleton --local-infile=1 --show-warnings --verbose < /usr/local/www/maestro/protected/data/clear_tables.sql
/usr/local/bin/mysql -uroot -pappleton --local-infile=1 < /usr/local/www/maestro/protected/data/clear_tables.sql
echo

echo "load_current_from_csv: loading csv"
#/usr/local/bin/mysql -uroot -pappleton --local-infile=1 --show-warnings --verbose < /usr/local/www/maestro/protected/data/load_current_from_csv.sql
/usr/local/bin/mysql -uroot -pappleton --local-infile=1 < /usr/local/www/maestro/protected/data/load_current_from_csv.sql
echo

exit 0
