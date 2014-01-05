#!/bin/sh
#
# Setup Maestro server
# - sets up initial maestro environment (also see update.sh)
# - MUST be executed from maestro/protected/data/
# - ASSUMES /usr/home/samba/maestro/ exists and is empty!!
# - HARCODED maestro-scc-files-x.x.x.tar.gz filename (version)
# - HARDCODED file paths for reference server
#
# History
# ------------------------------
# 2012-11-02	dale scott	creation
#

echo
echo "Setting up new Maestro install..."
echo

echo "Set shell scripts executable"
chmod u+x /usr/local/www/maestro/protected/data/*.sh
chmod u+x /usr/local/www/maestro/protected/yiic
echo

echo "Set permissions on Yii runtime directories"
chmod a+rw /usr/local/www/maestro/assets/
chmod a+rw /usr/local/www/maestro/protected/runtime/
echo

echo "Clean smb share"
rm -r /usr/home/samba/maestro/*
echo

# LOGGING NOT IMPLEMENTED
#echo "Create load_current log file"
#touch /usr/home/samba/maestro/load_current.log
# system cron user gets write permission, others read-only (e.g. Windows clients)
#chown nobody:wheel /usr/home/samba/maestro/load_current.log
#chmod a+rw /usr/home/samba/maestro/load_current.log
#echo

echo "Extract maestro-scc-files-xxx.tar.gz temporarily to local directory"
# will create ./maestro-scc-files/*
# all copying of extracted files must use -a option to preserve file timestamps
tar -xzf ./maestro-scc-files-1.1.0.tar.gz 
echo

echo "Copy SCC Parts&Vendors(TM) database to smb share"
cp -a ./maestro-scc-files/pv-4.mdb /usr/home/samba/maestro/pv.mdb
chmod a+rw /usr/home/samba/maestro/*.mdb
echo

echo "Bootstrap load_current by copying 'current' SCC CSV files to smb share"
mkdir /usr/home/samba/maestro/csv
chmod a+xrw /usr/home/samba/maestro/csv
cp -a ./maestro-scc-files/csv-4/*.csv /usr/home/samba/maestro/csv/
chmod a+rw /usr/home/samba/maestro/csv/*.csv
echo

echo "Copy SCC spreadsheet files to smb share"
cp -a ./maestro-scc-files/excel/*.xlsx /usr/home/samba/maestro/
# all Windows clients get read write permission for updating
chown nobody:wheel /usr/home/samba/maestro/*.xlsx
chmod a+rw /usr/home/samba/maestro/*.xlsx
echo

echo "Copy README.txt file to smb share"
cp -a ./maestro-scc-files/README.txt /usr/home/samba/maestro/
# ensure file has Windows EOL
flip -u /usr/home/samba/maestro/README.txt
# do not give write permission to Windows clients (as-is, without using chown/chmod to grant permission)
#chown nobody:wheel /usr/home/samba/maestro/README.txt
#chmod a+rw /usr/home/samba/maestro/README.txt
echo

# TODO CREATE load_current_unix.sh
# not required when using bootstrap CSV and export_current_to_csv.sh is NOT used (i.e. no cron job)
#echo "Load current data from CSV files..."
#/usr/local/www/maestro/protected/data/load_current_unix.sh
#echo

# cleanup
# -------
echo "Cleaning up..."
echo

echo "Delete local temp maestro-scc-files/ directory"
rm -r ./maestro-scc-files/
echo

echo "Done!"
echo
exit 0
