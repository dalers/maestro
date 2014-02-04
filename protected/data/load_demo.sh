#!/bin/sh
#
# Load demo SCC demo/test data into Maestro
#
# EXECUTE from within dir containing ./maestro-scc-files-1.2.0.tar.gz
# MAESTRO DATABASE PASSWORD IN PLAIN TEXT
#
# Creates maestro smb file share and sub-directory structure
# - /usr/home/samba/maestro MUST EXIST with r/w permission
# - DELETES /usr/home/samab/maestro/* (files and directories)
# - HARDCODED current-data file (maestro-scc-files-x.y.z.tar.gz)
# - HARDCODED file paths (assumes Maestro reference server)
#
# SCC Demo/Test data tar.gz structure
# ------------------------
#    maestro-scc-files/
#    +-- pv-1.mdb                 iteration 1 Parts&Vendors(TM) database
#    +-- pv-2.mdb
#    +-- pv-3.mdb
#    +-- pv-n.mdb
#    +-- README                   readme for maestro-scc-files-x.y.z.tar.gz
#    +-- README.txt               readme for smb file share (for access by MS Win clients)
#    +-- make_maestro_scc_files_targz.sh      execute to build new maestro-scc-files-x.y.z.tar.gz
#    +-- excel/                   master data spreadsheets (xlsx and csv)
#    +-- vault-1/                 iteration 1 vault
#    |   +-- parts/
#    |   |   +-- 10000001/          files related to parts
#    |   |   +-- 20000001/
#    |   |   +-- 20000002/
#    |   |   ...
#    |   \-- material/              files related to material
#    |       +...
#    +-- vault-2/
#    |   +-- parts/
#    |   \-- material/
#    +-- vault-3/
#    |   +-- parts/
#    |   \-- material/
#    \---vault-n/
#        +-- parts/
#        \-- material/
#
# Maestro smb file share structure
# ------------------------
#    maestro/                     root of maestro smb file share
#    +-- README.txt
#    +-- remotefs/                simulated remote file share
#    |   +-- issue.xlsx           "current" issue master data
#    |   +-- person.xlsx          "current" person master data
#    |   +-- project.xlsx         "current" project master data
#    |   +-- stock_location.xlsx  "current" stock location master data
#    |   +-- stock_serial.xlsx    "current" stock serial number master data
#    |   +-- pv.mdb               "current" Parts&Vendors database
#    |   \-- vault                "current" files relating to parts and material
#    |       +-- parts              files relating to parts (i.e. to a part number)
#    |       \-- material           files relating to material (i.e. to a lot or serial number) 
#    |
#    +-- vault/                   maestro file share "vault" (direct write access not allowed)
#    |   +-- parts                files relating to parts (i.e. to a part number)
#    |   \-- material             files relating to material (i.e. lot or serial number)
#    |
#    +-- csv/                     "current" CSV-format data, exported from current master data spreadsheets
#    +-- csv.old/                 previous "current" CSV-format data
#    \-- work/                    work to create PLM Change Report
#

echo
echo "Startup..."
echo "======================================="
echo

echo "Destroy and re-create smb file share directories..."
rm -r /usr/home/samba/maestro/*
# maestro vault
mkdir /home/samba/maestro/vault/
mkdir /home/samba/maestro/vault/parts/
mkdir /home/samba/maestro/vault/material/
# simulated remote network share
mkdir /home/samba/maestro/remotefs/
mkdir /home/samba/maestro/remotefs/vault
mkdir /home/samba/maestro/remotefs/vault/parts/
mkdir /home/samba/maestro/remotefs/vault/material/
# data files
mkdir /home/samba/maestro/csv/
mkdir /home/samba/maestro/csv.old/
mkdir /home/samba/maestro/work/
echo

echo "Extract ./maestro-scc-files/..."
# use -a when copying files to preserve file timestamps
tar -xzf ./maestro-scc-files-1.2.0.tar.gz 
ls -l maestro-scc-files/
echo

echo "Copy README.txt file to smb file share..."
cp -a ./maestro-scc-files/README.txt /usr/home/samba/maestro/
# ensure README.txt uses Windows-type EOL
#flip -m /usr/home/samba/maestro/remotefs/README.txt
echo

echo "Iteration 1..."
echo "======================================="
echo

# don't copy csv/ to csv.old/ on first iteration (nothing to copy yet!)
# see hack when exporting 'current' to CSV
#echo "Copying csv/* to csv.old/* ..."
#cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/
#echo

echo "Restore 'current' master data spreadsheets (with csv) to (simulated) remote file share..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/excel/*.xlsx /home/samba/maestro/remotefs/
cp -a ./maestro-scc-files/excel/*.csv /home/samba/maestro/remotefs/
echo

echo "Restore 'current' Parts&Vendors(TM) database to (simulated) remote file share..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-1.mdb /home/samba/maestro/remotefs/pv.mdb
echo

echo "Restore 'current' data files to (simulated) remote file share..."
cp -a ./maestro-scc-files/vault-1/* /home/samba/maestro/remotefs/vault/
chown -R www:www /usr/home/samba/maestro/remotefs/
chmod -R a+rw /usr/home/samba/maestro/remotefs/
echo

echo "Export 'current' to CSV..." ; echo
/usr/local/www/maestro/protected/data/export_current_to_csv.sh
# hack necessary csv.old/ files to bootstrap iteration 1
head -n 1 /home/samba/maestro/csv/pv_pn.csv > /home/samba/maestro/csv.old/pv_pn.csv
echo

echo "Rsync (simulated) remote file share to Maestro vault..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro-rsync.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault > /dev/null
cp /tmp/maestro-rsync.log /home/samba/maestro/work/rsync.log
cp /tmp/maestro-rsync.log /home/samba/maestro/work/rsync-1.log
rm /tmp/maestro-rsync.log
echo

echo "Report changes in 'current' data (from previous 'current' data)..."
/usr/local/www/maestro/protected/data/send_current_change_report.sh
echo

echo "Load 'current' from CSV..."
# first clear database tables, currently each iteration is complete current data into clean db
# TODO support smart loading of iteration changes
#/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql
/usr/local/bin/mysql -uroot -pappleton --force < /usr/local/www/maestro/protected/data/clear_tables.sql
# now load current from csv
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo

echo "Iteration 2..."
echo "======================================="
echo

echo "Copying csv/* to csv.old/* ..."
cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/
echo

echo "Restore 'current' master data spreadsheets (with csv) to (simulated) remote file share..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/excel/*.xlsx /home/samba/maestro/remotefs/
cp -a ./maestro-scc-files/excel/*.csv /home/samba/maestro/remotefs/
echo

echo "Restore 'current' Parts&Vendors(TM) database to (simulated) remote file share..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-2.mdb /home/samba/maestro/remotefs/pv.mdb
echo

echo "Restore 'current' data files to (simulated) remote file share..."
cp -a ./maestro-scc-files/vault-2/* /home/samba/maestro/remotefs/vault/
chown -R www:www /usr/home/samba/maestro/remotefs/
chmod -R a+rw /usr/home/samba/maestro/remotefs/
echo

echo "Export 'current' to CSV..." ; echo
/usr/local/www/maestro/protected/data/export_current_to_csv.sh
echo

echo "Rsync (simulated) remote file share to Maestro vault..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro-rsync.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault > /dev/null
cp /tmp/maestro-rsync.log /home/samba/maestro/work/rsync.log
cp /tmp/maestro-rsync.log /home/samba/maestro/work/rsync-2.log
rm /tmp/maestro-rsync.log
echo

echo "Report changes in 'current' data (from previous 'current' data)..."
/usr/local/www/maestro/protected/data/send_current_change_report.sh
echo

echo "Load 'current' from CSV..."
# first clear database tables, currently each iteration is complete current data into clean db
# TODO support smart loading of iteration changes
#/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql
/usr/local/bin/mysql -uroot -pappleton --force < /usr/local/www/maestro/protected/data/clear_tables.sql
# now load current from csv
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo

echo "Iteration 3..."
echo "======================================="
echo

echo "Copying csv/* to csv.old/* ..."
cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/
echo

echo "Restore 'current' master data spreadsheets (with csv) to (simulated) remote file share..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/excel/*.xlsx /home/samba/maestro/remotefs/
cp -a ./maestro-scc-files/excel/*.csv /home/samba/maestro/remotefs/
echo

echo "Restore 'current' Parts&Vendors(TM) database to (simulated) remote file share..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-3.mdb /home/samba/maestro/remotefs/pv.mdb
echo

echo "Restore 'current' data files to (simulated) remote file share..."
cp -a ./maestro-scc-files/vault-3/* /home/samba/maestro/remotefs/vault/
chown -R www:www /usr/home/samba/maestro/remotefs/
chmod -R a+rw /usr/home/samba/maestro/remotefs/
echo

echo "Export 'current' to CSV..." ; echo
/usr/local/www/maestro/protected/data/export_current_to_csv.sh
echo

echo "Rsync (simulated) remote file share to Maestro vault..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro-rsync.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault > /dev/null
cp /tmp/maestro-rsync.log /home/samba/maestro/work/rsync.log
cp /tmp/maestro-rsync.log /home/samba/maestro/work/rsync-3.log
rm /tmp/maestro-rsync.log
echo

echo "Report changes in 'current' data (from previous 'current' data)..."
/usr/local/www/maestro/protected/data/send_current_change_report.sh
echo

echo "Load 'current' from CSV..."
# first clear database tables, currently each iteration is complete current data into clean db
# TODO support smart loading of iteration changes
#/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql
/usr/local/bin/mysql -uroot -pappleton --force < /usr/local/www/maestro/protected/data/clear_tables.sql
# now load current from csv
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo

echo "Iteration 4..."
echo "======================================="
echo

echo "Copying csv/* to csv.old/* ..."
cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/
echo

echo "Restore 'current' master data spreadsheets (with csv) to (simulated) remote file share..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/excel/*.xlsx /home/samba/maestro/remotefs/
cp -a ./maestro-scc-files/excel/*.csv /home/samba/maestro/remotefs/
echo

echo "Restore 'current' Parts&Vendors(TM) database to (simulated) remote file share..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-4.mdb /home/samba/maestro/remotefs/pv.mdb
echo

echo "Restore 'current' data files to (simulated) remote file share..."
cp -a ./maestro-scc-files/vault-4/* /home/samba/maestro/remotefs/vault/
chown -R www:www /usr/home/samba/maestro/remotefs/
chmod -R a+rw /usr/home/samba/maestro/remotefs/
echo

echo "Export 'current' to CSV..." ; echo
/usr/local/www/maestro/protected/data/export_current_to_csv.sh
echo

echo "Rsync (simulated) remote file share to Maestro vault..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro-rsync.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault > /dev/null
cp /tmp/maestro-rsync.log /home/samba/maestro/work/rsync.log
cp /tmp/maestro-rsync.log /home/samba/maestro/work/rsync-4.log
rm /tmp/maestro-rsync.log
echo

echo "Report changes in 'current' data (from previous 'current' data)..."
/usr/local/www/maestro/protected/data/send_current_change_report.sh
echo

echo "Load 'current' from CSV..."
# first clear database tables, currently each iteration is complete current data into clean db
# TODO support smart loading of iteration changes
#/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql
/usr/local/bin/mysql -uroot -pappleton --force < /usr/local/www/maestro/protected/data/clear_tables.sql
# now load current from csv
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo

echo "Iteration 5..."
echo "======================================="
echo

echo "Copying csv/* to csv.old/* ..."
cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/
echo

echo "Restore 'current' master data spreadsheets (with csv) to (simulated) remote file share..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/excel/*.xlsx /home/samba/maestro/remotefs/
cp -a ./maestro-scc-files/excel/*.csv /home/samba/maestro/remotefs/
echo

echo "Restore 'current' Parts&Vendors(TM) database to (simulated) remote file share..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-5.mdb /home/samba/maestro/remotefs/pv.mdb
echo

echo "Restore 'current' data files to (simulated) remote file share..."
cp -a ./maestro-scc-files/vault-5/* /home/samba/maestro/remotefs/vault/
chown -R www:www /usr/home/samba/maestro/remotefs/
chmod -R a+rw /usr/home/samba/maestro/remotefs/
echo

echo "Export 'current' to CSV..." ; echo
/usr/local/www/maestro/protected/data/export_current_to_csv.sh
echo

echo "Rsync (simulated) remote file share to Maestro vault..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro-rsync.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault > /dev/null
cp /tmp/maestro-rsync.log /home/samba/maestro/work/rsync.log
cp /tmp/maestro-rsync.log /home/samba/maestro/work/rsync-5.log
rm /tmp/maestro-rsync.log
echo

echo "Report changes in 'current' data (from previous 'current' data)..."
/usr/local/www/maestro/protected/data/send_current_change_report.sh
echo

echo "Load 'current' from CSV..."
# first clear database tables, currently each iteration is complete current data into clean db
# TODO support smart loading of iteration changes
#/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql
/usr/local/bin/mysql -uroot -pappleton --force < /usr/local/www/maestro/protected/data/clear_tables.sql
# now load current from csv
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo

echo "======================================="
echo "Cleanup..."
echo "======================================="
echo

echo "Removing maestro-scc-files/"
rm -r ./maestro-scc-files
echo

exit 0
