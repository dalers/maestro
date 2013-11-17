#!/bin/sh
#
# Setup Maestro server
# - run when initially setting up maestro (see update.sh
#   for updating afterwards)
# - file paths hard-coded for server
#
# History
# ------------------------------
# 2012-11-02	dale scott	creation
#

echo
echo "Set up maestro..."
echo ""

echo "Set shell scripts executable..."
chmod u+x /usr/local/www/maestro/protected/data/*.sh
chmod u+x /usr/local/www/maestro/protected/yiic
echo ""

echo "Set permissions on directories written to
chmod a+rw /usr/local/www/maestro/assets/
chmod a+rw /usr/local/www/maestro/runtime/
echo ""

#echo "Create log file for export_current and load_current shell scripts..."
# LOGGING NOT IMPLEMENTED
#touch /usr/home/samba/maestro/legacy-export-import.log
# give system cron user write permission to log file, but not Windows clients accessing share
#chown nobody:wheel /usr/home/samba/maestro/maestro-import-from-legacy.log
#chmod a+rw /usr/home/samba/maestro/maestro-import-from-legacy.log
#echo ""

echo "Create csv dir in maestro file directory for export_current shell script"
mkdir /usr/home/samba/maestro/csv
chmod a+xrw /usr/home/samba/maestro/csv
echo ""

echo "Copy demo Parts&Vendors(TM) database to Windows share..."
cp /usr/local/www/maestro/protected/data/mdb/*.mdb /usr/home/samba/maestro/
chmod a+rw /usr/home/samba/maestro/*.mdb
echo ""

echo "Bootstrap export_current process with initial csv files..."
cp /usr/local/www/maestro/protected/data/csv/*.csv /usr/home/samba/maestro/csv/
chmod a+rw /usr/home/samba/maestro/csv/*.csv
echo ""

echo "Copy demo spreadsheet files to Windows share..."
cp /usr/local/www/maestro/protected/data/excel/*.xlsx /usr/home/samba/maestro/
# make read/write for Windows clients to update
chown nobody:wheel /usr/home/samba/maestro/*.xlsx
chmod a+rw /usr/home/samba/maestro/*.xlsx
echo ""

echo "Copy README to Windows share..."
cp /usr/local/www/maestro/protected/data/README-winshare.txt /usr/home/samba/maestro/README.txt
# ensure file has Windows EOL, but do not give write permission to Windows clients
flip -u /usr/home/samba/maestro/README.txt
#chown nobody:wheel /usr/home/samba/maestro/README.txt
#chmod a+rw /usr/home/samba/maestro/README.txt
echo ""

#echo "Load current data from CSV files..."
#/usr/local/www/maestro/protected/data/load_current_unix.sh
#echo ""

# cleanup
# -------
echo "Done!"
echo ""
exit 0
