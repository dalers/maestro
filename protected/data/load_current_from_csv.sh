#!/bin/sh
#
# Load current data into Maestro from CSV
# - DATABASE USER PASSWORD IN PLAIN TEXT
# - HARDCODED file paths (assumes Maestro reference server)
#

echo "load_current_from_csv: deleting data in maestro db"
# current data overwrites old data
#/usr/local/bin/mysql -umaestro -pappleton --local-infile=1 --show-warnings --verbose < /usr/local/www/maestro/protected/data/clear_tables.sql
/usr/local/bin/mysql -umaestro -pappleton --local-infile=1 < /usr/local/www/maestro/protected/data/clear_tables.sql

echo "load_current_from_csv: loading csv"
#/usr/local/bin/mysql -umaestro -pappleton --local-infile=1 --show-warnings --verbose < /usr/local/www/maestro/protected/data/load_current_from_csv.sql
/usr/local/bin/mysql -umaestro -pappleton --local-infile=1 < /usr/local/www/maestro/protected/data/load_current_from_csv.sql
echo

exit 0
