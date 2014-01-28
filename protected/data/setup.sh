#!/bin/sh
#
# Setup Maestro reference server environment
# - MANUALLY CREATE /usr/home/samba/maestro first!
#
# - Creates smb file share directories and copy of most recent data
# - Deletes /usr/home/samab/maestro/*
# - MUST be executed from /usr/local/www/maestro/protected/data/
# - HARDCODED current-data file (maestro-scc-files-x.y.z.tar.gz)
# - HARDCODED file paths (assumes Maestro reference server)
# - Assumes smb file share has public read/write permissions
#

echo
echo "Setting up new Maestro install..."
echo

echo "Confirming shell scripts are executable..."
chmod a+x /usr/local/www/maestro/protected/data/*.sh
chmod a+x /usr/local/www/maestro/protected/yiic
echo

echo "Setting permissions on Yii runtime directories..."
chmod a+rw /usr/local/www/maestro/assets/
chmod a+rw /usr/local/www/maestro/protected/runtime/
echo

echo "Recreating smb file share directory structure..."
rm -r /usr/home/samba/maestro/*
mkdir /home/samba/maestro/csv/
mkdir /home/samba/maestro/csv.old/
mkdir /home/samba/maestro/remotefs/
mkdir /home/samba/maestro/vault/
mkdir /home/samba/maestro/vault/parts/
mkdir /home/samba/maestro/vault/material/
echo

echo "Extracting ./maestro-scc-files/..."
# use -a when copying files to preserve file timestamps
tar -xzf ./maestro-scc-files-1.2.0.tar.gz 
echo

echo "Copying SCC Parts&Vendors(TM) database to smb file share..."
cp -a ./maestro-scc-files/pv-5.mdb /usr/home/samba/maestro/pv.mdb
chmod a+rw /usr/home/samba/maestro/*.mdb
echo

echo "Copying SCC spreadsheet files to smb file share..."
cp -a ./maestro-scc-files/excel/*.xlsx /usr/home/samba/maestro/
cp -a ./maestro-scc-files/excel/*.csv /usr/home/samba/maestro/csv/
echo

echo "Copying SCC file vault to smb file share..."
# build current data from successive iterations
cp -a ./maestro-scc-files/vault-1/* /home/samba/maestro/vault/
cp -a ./maestro-scc-files/vault-2/* /home/samba/maestro/vault/
cp -a ./maestro-scc-files/vault-3/* /home/samba/maestro/vault/
cp -a ./maestro-scc-files/vault-4/* /home/samba/maestro/vault/
cp -a ./maestro-scc-files/vault-5/* /home/samba/maestro/vault/
echo

echo "Copying README.txt file to smb share..."
cp -a ./maestro-scc-files/README.txt /usr/home/samba/maestro/
# ensure README.txt uses Windows-type EOL
flip -m /usr/home/samba/maestro/README.txt
echo

echo "Setting permissions on smb file share..."
chown -R www:www /usr/home/samba/maestro/
chmod -R a+rw /usr/home/samba/maestro/
echo

echo "Cleaning up..."
echo " Removing maestro-scc-files/ ..."
rm -r ./maestro-scc-files/
echo

echo "Done!"
echo

exit 0
