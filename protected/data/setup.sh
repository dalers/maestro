#!/bin/sh
#
# Setup Maestro reference server environment
# - DATABASE SERVER ROOT PASSWORD IN PLAIN TEXT
#

echo "Ensure shell scripts are executable..."
chmod a+x /usr/local/www/maestro/protected/data/*.sh
chmod a+x /usr/local/www/maestro/protected/yiic
echo

echo "Set permissions on Yii runtime directories..."
chmod a+rw /usr/local/www/maestro/assets/
chmod a+rw /usr/local/www/maestro/protected/runtime/
echo

echo "Create dbms user and database..."
# uncomment if maestro user and database exists (otherwise error and script aborts)
#mysql -uroot -pappleton --show-warnings --verbose -e "DROP USER maestro@localhost ;"
# not required to drop db, create_db.sql will drop db if exists
#mysql -uroot -pappleton --show-warnings --verbose -e "DROP DATABASE maestro ;"
mysql -uroot -pappleton --show-warnings --verbose < ./create_db.sql

echo "Migrate database schema..."
../yiic migrate

exit 0
