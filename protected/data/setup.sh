#!/bin/sh
#
# Setup Maestro server
# - run when initially setting up maestro (see update.sh
#   for updating afterwards)
# - file paths hardcoded for server
#
# History
# ------------------------------
# 2012-11-02	dale scott	creation
#

echo
echo "Performing Maestro SETUP on server..."
echo ""

# Set shell scripts executable
echo "Setting shell scripts executable..."
chmod u+x /usr/local/www/maestro/protected/data/*.sh
chmod u+x /usr/local/www/maestro/protected/yiic
echo ""

# Create log file for export-legacy.sh & load-maestro.sh scripts
#echo "Creating log file..."
#touch /usr/home/samba/maestro/legacy-export-import.log
# do not give Windows clients write permission
#chown nobody:wheel /usr/home/samba/maestro/maestro-import-from-legacy.log
#chmod a+rw /usr/home/samba/maestro/maestro-import-from-legacy.log
#echo ""

# create csv dir on windows share
echo "Removing csv dir on Windows share..."
rm -r /usr/home/samba/maestro/csv
echo "Recreating csv dir..."
mkdir /usr/home/samba/maestro/csv
chmod a+xrw /usr/home/samba/maestro/csv
echo ""

echo "Copying default csv files to Windows share..."
cp /usr/local/www/maestro/protected/data/csv/*.csv /usr/home/samba/maestro/csv/
chmod a+rw /usr/home/samba/maestro/csv/*.csv
echo ""

echo "Copying spreadsheet files to Windows share..."
cp /usr/local/www/maestro/protected/data/excel/*.xlsx /usr/home/samba/maestro/
# make read/write for Windows clients to update (NOT SECURE!)
chown nobody:wheel /usr/home/samba/maestro/*.xlsx
chmod a+rw /usr/home/samba/maestro/*.xlsx
echo ""

echo "Copying README to Windows share..."
cp /usr/local/www/maestro/protected/data/README-winshare.txt /usr/home/samba/maestro/README.txt
# ensure file has Windows EOL, but do not give write permission to Windows clients
flip -u /usr/home/samba/maestro/README.txt
#chown nobody:wheel /usr/home/samba/maestro/README.txt
#chmod a+rw /usr/home/samba/maestro/README.txt
echo ""

echo "Loading Maestro database from CSV directory..."
/usr/local/www/maestro/protected/data/load_maestro_unix.sh
echo ""

# cleanup
# -------
echo "Done!"
echo ""
exit 0
