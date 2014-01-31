#!/bin/sh
#
# Load current data into Maestro
# - EXECUTE IN SAME DIR AS ./maestro-scc-files-1.2.0.tar.gz
# - NO ITERATION DETECTION, CURRENT DATA OVERWRITES OLD DATA EACH ITERATION
# - DATABASE PASSWORD IN PLAIN TEXT
# - INTENDED TO BE EDITED aS REQUIRED FOR SITUATION AT HAND
#
# SCC demo/test data
# - runs all iterations sequentially
# - ASSUMES dir structure, DELETES all files in place
#     .../vault/material/*
#     .../vault/parts/*
#     .../remotefs/*
# - HARDCODED current-data file (maestro-scc-files-x.y.z.tar.gz)
# - HARDCODED file paths (assumes Maestro reference server)
# - CURRENT DATA REPLACES OLD DATA EACH ITERATION
#   TODO decide rules for iterations, modify schem and code
#     smart loading of csv data according to the rules, could be
#     done in shell (like reporting scripts) or SQL.
#
# Production deployment
# - edit as needed to rsync from current files in existing smb file
#   shares 
# - schedule using cron (e.g. nightly), which will determine the
#   resolution of an iteration.
#
# Demo Data File structure
# ------------------------
#    maestro-scc-files/
#    +-- pv-1.mdb                   Per-iteration Parts&Vendors(TM) databases
#    +-- pv-2.mdb
#    +-- pv-3.mdb
#    *-- pv-n.mdb
#    +---excel/
#    +---vault-1/
#    |   \---parts/
#    |       +---10000001/         files related to parts
#    |       +---20000001/
#    |       +---20000002/
#    |       ...
#    +---vault-2/
#    |   \---parts/
#    +---vault-3/
#    |   \---parts/
#    \---vault-n/
#        \---parts/
#

# -----------------
# startup
# -----------------

echo
echo "Removing old log files..."
rm /tmp/maestro*
echo

echo "Removing files from smb file share vault and simulated remote file system..."
rm -r /home/samba/maestro/vault/material/*
rm -r /home/samba/maestro/vault/parts/*
rm -r /home/samba/maestro/remotefs/vault/material/*
rm -r /home/samba/maestro/remotefs/vault/parts/*
echo

echo "Extracting ./maestro-scc-files/..."
# use -a when copying files to preserve file timestamps
# TODO untar to fully qualified directory (e.g. give fully qualified directory as parameter to script)
tar -xzf ./maestro-scc-files-1.2.0.tar.gz 

# execute rest of procedure from inside maestro-scc-files dir
cd ./maestro-scc-files
echo "maestro-scc-files/"
ls -l
echo

# -----------------
# iteration 1
# -----------------

echo "Iteration 1..."

# don't copy - no csv created yet!
#echo " Copying csv/* to csv.old/* ..."
#cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/

echo " restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./pv-1.mdb /home/samba/maestro/remotefs/pv.mdb

echo " restoring vault contents to (simulated) remote fs..."
cp -a ./vault-1/* /home/samba/maestro/remotefs/vault/

echo " running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh

echo " rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro_run_iteration_rsync-1.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault

echo " clearing database..."
/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql

echo " running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
# -----------------
# iteration 2
# -----------------

echo "Iteration 2..."

echo " Copying csv/* to csv.old/* ..."
cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/

echo " restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./pv-2.mdb /home/samba/maestro/remotefs/pv.mdb

echo " restoring vault contents to (simulated) remote fs..."
cp -a ./vault-2/* /home/samba/maestro/remotefs/vault/

echo " running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh

echo " rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro_run_iteration_rsync-2.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault

echo " clearing database..."
/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql

echo " running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
# -----------------
# iteration 3
# -----------------

echo "Iteration 3..."

echo " Copying csv/* to csv.old/* ..."
cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/

echo " restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./pv-3.mdb /home/samba/maestro/remotefs/pv.mdb

echo " restoring vault contents to (simulated) remote fs..."
cp -a ./vault-3/* /home/samba/maestro/remotefs/vault/

echo " running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh

echo " rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro_run_iteration_rsync-3.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault

echo " clearing database..."
/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql

echo " running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
# -----------------
# iteration 4
# -----------------

echo "Iteration 4..."

echo " Copying csv/* to csv.old/* ..."
cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/

echo " restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./pv-4.mdb /home/samba/maestro/remotefs/pv.mdb

echo " restoring vault contents to (simulated) remote fs..."
cp -a ./vault-4/* /home/samba/maestro/remotefs/vault/

echo " running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh

echo " rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro_run_iteration_rsync-4.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault

echo " clearing database..."
/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql

echo " running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
# -----------------
# iteration 5
# -----------------

echo "Iteration 5..."

echo " Copying csv/* to csv.old/* ..."
cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/

echo " restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./pv-5.mdb /home/samba/maestro/remotefs/pv.mdb

echo " restoring vault contents to (simulated) remote fs..."
cp -a ./vault-5/* /home/samba/maestro/remotefs/vault/

echo " running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh

echo " rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --Suffix=-`date +%FT%T` --log-file="/tmp/maestro_run_iteration_rsync-5.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault

echo " clearing database..."
/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql

echo " running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
# -----------------
# cleanup
# -----------------

echo "Cleanup"

echo " removing maestro-scc-files/"
cd ..
rm -r ./maestro-scc-files
echo

echo " log files:"
echo
ls -l /tmp/maestro*
echo

echo "Done!"
echo
