#!/bin/sh
#
# Setup Maestro reference server environment
#
# Before running:
# - create maestro db (maestro will use root access)
# - create /home/maestro/scc
#

echo "Set script files executable..."
chmod a+x ./*.sh
chmod a+x ../../yiic
echo

echo "Give web server write access to Yii runtime directories..."
chmod a+rw ../../../assets/
chmod a+rw ../../runtime/
echo

echo "Load db with stored procedures..."
mysql -uroot -pappleton --show-warnings maestro < ./setup_db_stored_procedure.sql
echo

echo "Migrate database schema..."
../../yiic migrate
echo

echo "Setup data directory structure..."
./setup_file_share.sh
echo

exit 0
