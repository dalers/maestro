#!/bin/sh
#
# Load current data into Maestro
# - MUST be executed from /usr/local/www/maestro/protected/data/
# - CANNOT SCHEDULE USING CRON AT THIS TIME - SEE TODO
#
# SCC demo/test data
# - runs all iterations sequentially
# - DELETES all files in vault
#     .../vault/material/*
#     .../vault/parts/*
#     .../remotefs/*
# - HARDCODED current-data file (maestro-scc-files-x.y.z.tar.gz)
# - HARDCODED file paths (assumes Maestro reference server)
# - CURRENT DATA REPLACES OLD DATA EACH ITERATION
#   TODO determine if iteration occurs based on rules
#     e.g. identify iteration if change to parts list or part file
#          list, otherwise current data overwrites existing data
#
# Production deployment
# - edit as needed to rsync from current files in existing smb file
#   shares 
# - schedule using cron (e.g. nightly), which will determine the
#   resolution of an iteration.
#
# File structure
# --------------
#    maestro-scc-files/
#    +-- pv-1.mdb                   Parts&Vendors(TM) iteration database
#    +-- pv-2.mdb
#    +-- pv-3.mdb
#    *-- pv-n.mdb
#    +---csv-1/						mdb-export from pv-1.mdb
#    +---csv-2/
#    +---csv-3/
#    +---csv-n/
#    +---excel/
#    +---vault-1/
#    |   \---parts/
#    |       +---10000001/			related files
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
rm /tmp/maestro_run_iteration*.log
echo

echo "Removing files from smb file share vault and simulated remote file system..."
rm -r /home/samba/maestro/vault/material/*
rm -r /home/samba/maestro/vault/parts/*
rm -r /home/samba/maestro/remotefs/*
echo

echo "Extracting ./maestro-scc-files/..."
# use -a when copying files to preserve file timestamps
# TODO untar to fully qualified directory (e.g. give fully qualified directory as parameter to script)
tar -xzf ./maestro-scc-files-1.2.0.tar.gz 
echo

# -----------------
# iteration 1
# -----------------

echo "Iteration 1..."

# don't copy - no csv created yet!
#echo " Copying csv/* to csv.old/* ..."
#cp /usr/home/samba/maestro/csv/* /usr/home/samba/maestro/csv.old/

echo " restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./pv-1.mdb /home/samba/maestro/pv.mdb

echo " restoring vault contents..."
cp -a ./vault-1/* /home/samba/maestro/remotefs

echo " running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh

echo " rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro_run_iteration_rsync-1.log" /usr/home/samba/maestro/remotefs/ /usr/home/samba/maestro/vault >> /tmp/maestro_run_iteration.log

echo " running clear_tables.sql (deleting existing data from database)..."
/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql

echo " running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
# -----------------
# iteration 2
# -----------------

echo "Iteration 2..."

echo " Copying csv/* to csv.old/* ..."
cp /usr/home/samba/maestro/csv/* /usr/home/samba/maestro/csv.old/

echo " restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./pv-2.mdb /home/samba/maestro/pv.mdb

echo " restoring vault contents..."
cp -a ./vault-2/* /home/samba/maestro/remotefs

echo " running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh

echo " rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro_run_iteration_rsync-2.log" /usr/home/samba/maestro/remotefs/ /usr/home/samba/maestro/vault >> /tmp/maestro_run_iteration.log

echo " running clear_tables.sql (deleting existing data from database)..."
/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql

echo " running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
# -----------------
# iteration 3
# -----------------

echo "Iteration 3..."

echo " Copying csv/* to csv.old/* ..."
cp /usr/home/samba/maestro/csv/* /usr/home/samba/maestro/csv.old/

echo " restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./pv-3.mdb /home/samba/maestro/pv.mdb

echo " restoring vault contents..."
cp -a ./vault-3/* /home/samba/maestro/remotefs

echo " running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh

echo " rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro_run_iteration_rsync-3.log" /usr/home/samba/maestro/remotefs/ /usr/home/samba/maestro/vault >> /tmp/maestro_run_iteration.log

echo " running clear_tables.sql (deleting existing data from database)..."
/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql

echo " running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
# -----------------
# iteration 4
# -----------------

echo "Iteration 4..."

echo " Copying csv/* to csv.old/* ..."
cp /usr/home/samba/maestro/csv/* /usr/home/samba/maestro/csv.old/

echo " restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./pv-4.mdb /home/samba/maestro/pv.mdb

echo " restoring vault contents..."
cp -a ./vault-4/* /home/samba/maestro/remotefs

echo " running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh

echo " rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro_run_iteration_rsync-4.log" /usr/home/samba/maestro/remotefs/ /usr/home/samba/maestro/vault >> /tmp/maestro_run_iteration.log

echo " running clear_tables.sql (deleting existing data from database)..."
/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql

echo " running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
# -----------------
# iteration 5
# -----------------

echo "Iteration 5..."

echo " Copying csv/* to csv.old/* ..."
cp /usr/home/samba/maestro/csv/* /usr/home/samba/maestro/csv.old/

echo " restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./pv-5.mdb /home/samba/maestro/pv.mdb

echo " restoring vault contents..."
cp -a ./vault-5/* /home/samba/maestro/remotefs

echo " running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh

echo " rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro_run_iteration_rsync-5.log" /usr/home/samba/maestro/remotefs/ /usr/home/samba/maestro/vault >> /tmp/maestro_run_iteration.log

echo " running clear_tables.sql (deleting existing data from database)..."
/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql

echo " running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
# -----------------
# cleanup
# -----------------

echo "Done!"
echo ""
