#!/bin/sh
#
# Setup Maestro reference server environment
# - /usr/home/samba/maestro MUST EXIST
#
# - Creates smb file share directories and copy of most recent data
# - Deletes /usr/home/samab/maestro/*
# - MUST be executed from /usr/local/www/maestro/protected/data/
# - HARDCODED current-data file (maestro-scc-files-x.y.z.tar.gz)
# - HARDCODED file paths (assumes Maestro reference server)
# - Assumes smb file share has public read/write permissions
#

echo
echo "Setting up initial Maestro environment..."
echo

echo "Confirming shell scripts are executable..."
chmod a+x /usr/local/www/maestro/protected/data/*.sh
chmod a+x /usr/local/www/maestro/protected/yiic
echo

echo "Setting permissions on Yii runtime directories..."
chmod a+rw /usr/local/www/maestro/assets/
chmod a+rw /usr/local/www/maestro/protected/runtime/
echo

echo "Recreating directories on smb file share..."
rm -r /usr/home/samba/maestro/*
# maestro vault
mkdir /home/samba/maestro/vault/
mkdir /home/samba/maestro/vault/parts/
mkdir /home/samba/maestro/vault/material/
# simulated remote network share
mkdir /home/samba/maestro/remotefs/
mkdir /home/samba/maestro/remotefs/parts/
mkdir /home/samba/maestro/remotefs/material/
# intermediary data files
mkdir /home/samba/maestro/csv/
mkdir /home/samba/maestro/csv.old/
echo

echo "Extracting ./maestro-scc-files/..."
# use -a when copying files to preserve file timestamps
tar -xzf ./maestro-scc-files-1.2.0.tar.gz 
echo

echo "Copying SCC Parts&Vendors(TM) db to remotefs smb file share..."
cp -a ./maestro-scc-files/pv-5.mdb /usr/home/samba/maestro/remotefs/pv.mdb
chmod a+rw /usr/home/samba/maestro/remotefs/pv.mdb
echo

echo "Copying SCC spreadsheet files to remotefs smb file share..."
# don't currently have iterations of spreadsheets
cp -a ./maestro-scc-files/excel/*.xlsx /usr/home/samba/maestro/remotefs/
cp -a ./maestro-scc-files/excel/*.csv  /usr/home/samba/maestro/remotefs/
echo

echo "Copying SCC current document files to remotefs smb file share..."
# build current data set from successive iterations
cp -a ./maestro-scc-files/vault-1/* /home/samba/maestro/remotefs/vault/
cp -a ./maestro-scc-files/vault-2/* /home/samba/maestro/remotefs/vault/
cp -a ./maestro-scc-files/vault-3/* /home/samba/maestro/remotefs/vault/
cp -a ./maestro-scc-files/vault-4/* /home/samba/maestro/remotefs/vault/
cp -a ./maestro-scc-files/vault-5/* /home/samba/maestro/remotefs/vault/
echo

echo "Copying README.txt file to remotefs smb share..."
cp -a ./maestro-scc-files/README.txt /usr/home/samba/maestro/remotefs/
# ensure README.txt uses Windows-type EOL
flip -m /usr/home/samba/maestro/remotefs/README.txt
echo

echo "Setting permissions on smb file share..."
chown -R www:www /usr/home/samba/maestro/remotefs
chmod -R a+rw /usr/home/samba/maestro/remotefs
echo

echo "Cleaning up..."
echo " Removing maestro-scc-files/ ..."
rm -r ./maestro-scc-files/
echo

echo "Done!"
echo

exit 0
