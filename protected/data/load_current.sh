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
#    |   +---parts/
#    |       +---10000001/         files related to parts
#    |       +---20000001/
#    |       +---20000002/
#    |       ...
#    |   \---material/
#    |       +...
#    +---vault-2/
#    |   +---parts/
#    |   \---material/
#    +---vault-3/
#    |   +---parts/
#    |   \---material/
#    \---vault-n/
#        +---parts/
#        \---material/
#

# -----------------
# startup
# -----------------

echo
echo "======================================="
echo "Removing old log files..."
echo "======================================="
rm /tmp/maestro*
echo

echo "======================================="
echo "Cleaning maestro vault..."
echo "======================================="
rm /home/samba/maestro/*
rm -r /home/samba/maestro/csv/*
rm -r /home/samba/maestro/csv.old/*
rm -r /home/samba/maestro/vault/material/*
rm -r /home/samba/maestro/vault/parts/*
echo

echo "======================================="
echo "Cleaning simulated remote file system..."
echo "======================================="
rm  /home/samba/maestro/remotefs/*
rm -r /home/samba/maestro/remotefs/vault/material/*
rm -r /home/samba/maestro/remotefs/vault/parts/*
echo

echo "Extracting ./maestro-scc-files/..."
# use -a when copying files to preserve file timestamps
tar -xzf ./maestro-scc-files-1.2.0.tar.gz 
ls -l maestro-scc-files/
echo

echo "======================================="
echo "Iteration 1..."
echo "======================================="
echo

# don't copy csv/ to csv.old/ on first iteration (nothing to copy yet!)
#echo "Copying csv/* to csv.old/* ..."
#cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/
#echo

echo "Restoring master data spreadsheets..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/excel/* /home/samba/maestro/remotefs/
echo

echo "Restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-1.mdb /home/samba/maestro/remotefs/pv.mdb
echo

echo "Restoring vault contents to (simulated) remote fs..."
cp -a ./maestro-scc-files/vault-1/* /home/samba/maestro/remotefs/vault/
echo

echo "Running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh
echo

echo "Hacking required files to bootstrap initial iteration..."
# -a archive mode preserves file times
head -n 1 /home/samba/maestro/csv/pv_pn.csv > /home/samba/maestro/csv.old/pv_pn.csv
echo

echo "Rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro-rsync.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault > null
cp /tmp/maestro-rsync.log /home/samba/maestro/rsync.log
cp /tmp/maestro-rsync.log /home/samba/maestro/rsync-1.log
rm /tmp/maestro-rsync.log
echo

echo "reporting changes from current to previous..."
/usr/local/www/maestro/protected/data/send_plm_change_report.sh
echo

echo "clearing database tables..."
#/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql
/usr/local/bin/mysql -uroot -pappleton --force < /usr/local/www/maestro/protected/data/clear_tables.sql
echo

echo "running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
echo "======================================="
echo "Iteration 2..."
echo "======================================="
echo

echo "Copying csv/* to csv.old/* ..."
cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/
echo

echo "Restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-2.mdb /home/samba/maestro/remotefs/pv.mdb
echo

echo "Restoring vault contents to (simulated) remote fs..."
cp -a ./maestro-scc-files/vault-2/* /home/samba/maestro/remotefs/vault/
echo

echo "Running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh
echo

echo "Rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro-rsync.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault  > null
cp /tmp/maestro-rsync.log /home/samba/maestro/rsync.log
cp /tmp/maestro-rsync.log /home/samba/maestro/rsync-2.log
rm /tmp/maestro-rsync.log
echo

echo "Reporting changes from current to previous..."
/usr/local/www/maestro/protected/data/send_plm_change_report.sh
echo

echo "Clearing database..."
#/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql
/usr/local/bin/mysql -uroot -pappleton --force < /usr/local/www/maestro/protected/data/clear_tables.sql
echo

echo "Running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
echo "======================================="
echo "Iteration 3..."
echo "======================================="
echo

echo "Copying csv/* to csv.old/* ..."
cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/
echo

echo "Restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-3.mdb /home/samba/maestro/remotefs/pv.mdb
echo

echo "Restoring vault contents to (simulated) remote fs..."
cp -a ./maestro-scc-files/vault-3/* /home/samba/maestro/remotefs/vault/
echo

echo "Running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh
echo

echo "Rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro-rsync.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault  > null
cp /tmp/maestro-rsync.log /home/samba/maestro/rsync.log
cp /tmp/maestro-rsync.log /home/samba/maestro/rsync-3.log
rm /tmp/maestro-rsync.log
echo

echo "Reporting changes from current to previous..."
/usr/local/www/maestro/protected/data/send_plm_change_report.sh
echo

echo "Clearing database..."
#/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql
/usr/local/bin/mysql -uroot -pappleton --force < /usr/local/www/maestro/protected/data/clear_tables.sql
echo

echo "Running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
echo "======================================="
echo "Iteration 4..."
echo "======================================="
echo

echo "Copying csv/* to csv.old/* ..."
cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/
echo

echo "Restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-4.mdb /home/samba/maestro/remotefs/pv.mdb
echo

echo "Restoring vault contents to (simulated) remote fs..."
cp -a ./maestro-scc-files/vault-4/* /home/samba/maestro/remotefs/vault/
echo

echo "Running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh
echo

echo "Rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro-rsync.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault  > null
cp /tmp/maestro-rsync.log /home/samba/maestro/rsync.log
cp /tmp/maestro-rsync.log /home/samba/maestro/rsync-4.log
rm /tmp/maestro-rsync.log
echo

echo "Reporting changes from current to previous..."
/usr/local/www/maestro/protected/data/send_plm_change_report.sh
echo

echo "Clearing database..."
#/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql
/usr/local/bin/mysql -uroot -pappleton --force < /usr/local/www/maestro/protected/data/clear_tables.sql
echo

echo "Running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
echo "======================================="
echo "Iteration 5..."
echo "======================================="
echo

echo "Copying csv/* to csv.old/* ..."
cp /home/samba/maestro/csv/* /home/samba/maestro/csv.old/
echo

echo "Restoring Parts&Vendors(TM) database..."
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-5.mdb /home/samba/maestro/remotefs/pv.mdb
echo

echo "Restoring vault contents to (simulated) remote fs..."
cp -a ./maestro-scc-files/vault-5/* /home/samba/maestro/remotefs/vault/
echo

echo "Running export_current_to_csv.sh..."
/usr/local/www/maestro/protected/data/export_current_to_csv.sh
echo

echo "Rsyncing from (simulated) remotefs..."
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro-rsync.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault  > null
cp /tmp/maestro-rsync.log /home/samba/maestro/rsync.log
cp /tmp/maestro-rsync.log /home/samba/maestro/rsync-5.log
rm /tmp/maestro-rsync.log
echo

echo "Reporting changes from current to previous..."
/usr/local/www/maestro/protected/data/send_plm_change_report.sh
echo

echo "Clearing database..."
#/usr/local/bin/mysql -uroot -pappleton --show-warnings --verbose --force < /usr/local/www/maestro/protected/data/clear_tables.sql
/usr/local/bin/mysql -uroot -pappleton --force < /usr/local/www/maestro/protected/data/clear_tables.sql
echo

echo "Running load_current_from_csv.sh"
/usr/local/www/maestro/protected/data/load_current_from_csv.sh
echo
 
echo "======================================="
echo "Cleanup..."
echo "======================================="
echo

echo "Removing maestro-scc-files/"
rm -r ./maestro-scc-files
echo

echo "Rsync iteration log files:"
ls -l /tmp/maestro*
echo

exit 0
