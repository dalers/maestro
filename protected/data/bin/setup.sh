#!/bin/sh
#
# Setup Maestro reference server environment
#

echo "Ensure shell scripts are executable..."
chmod a+x ./*.sh
chmod a+x ../yiic
echo

echo "Ensure web server has write permission to Yii runtime directories..."
chmod a+rw ../../assets/
chmod a+rw ../runtime/
echo

echo "Create database..."
# create_db.sql creates maestro user and database 
# uncomment if user exists (create_db.sql will drop db if needed)
#mysql -uroot -p --show-warnings --verbose -e "DROP USER maestro@localhost ;"
# not required to drop db, create_db.sql will drop db if exists
#mysql -uroot -p --show-warnings --verbose -e "DROP DATABASE maestro ;"

mysql -uroot -pappleton --show-warnings --verbose < ./create_db.sql

echo "Migrate database schema..."
../yiic migrate

# uncomment to create maestro CIFS file share structure
#rm -r /home/samba/maestro/*
#mkdir /home/samba/maestro/csv/
#mkdir /home/samba/maestro/csv.old/
#mkdir /home/samba/maestro/work/
#mkdir /home/samba/maestro/remotefs/

exit 0
