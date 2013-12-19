#!/bin/sh
#
# Step through iteration 1 to 4
# - TODO add maestro "load current" after each iteration
#
# To use first extract SCC demo data tar file to current directory
# $ cd /home/dirname
# $ tar -xzf maestro-scc-files.tar.gz
# $ cd maestro
# $ cp /usr/local/www/maestro/protected/data/run_iterations.sh .
# $ chmod a+x ./run_iterations.sh
#
# Assumes fileshare directory structure:
#   /usr/home/samba/maestro					- root of fileshare
#   /usr/home/samba/maestro/remotefs/       - simulated remote fs (optional)
#   /usr/home/samba/maestro/vault           - document vault
#   /usr/home/samba/maestro/vault.backup    - document backups (optional)
#
#    maestro
#    |-- pv-1.mdb                      P&V(TM) mdb
#    |-- pv-2.mdb
#    |-- pv-3.mdb
#    |-- pv-4.mdb
#    |-- csv-1                         mdb-export from P&V(TM) mdb
#    |   |-- issue.csv
#    |   |-- person.cvs
#    |   |-- ...
#    |   `-- stock_serial.csv
#    |-- csv-2
#    |   `-- ...
#    |-- csv-3
#    |   `-- ...
#    |-- csv-4
#    |   `-- ...
#    |-- vault-1                       file vault
#    |   |-- 20000001
#    |   |   |-- 20000001_WI-00.odt
#    |   |   |-- 20000001_WI-00.pdf
#    |   |   `-- 20000001_WI-00_graphics.odg
#    |   |-- 20000002
#    |   |-- 20000003
#    |   |-- ...
#    |   `-- 90000013
#    |-- vault-2
#    |   `-- ...
#    |-- vault-3
#    |   `...
#    `-- vault-4
#        `...

# -----------------
# startup
# -----------------

# remove any output files in current directory
rm ./run_iterations_rsync*.log

# remove any existing files
rm /home/samba/maestro/*
# simulated remote fs
rm -r /home/samba/maestro/remotefs/*
# file vault
rm -r /home/samba/maestro/vault/*
#rm -r /home/samba/maestro/vault.backup/*
# current and previous csv
rm /home/samba/maestro/csv/*
rm /home/samba/maestro/csv.old/*

# ensure required fileshare owner/mod (web server must have read/write permission)
chown -R www:www /home/samba/maestro/

# set local files as if created by owner www:www
chown -R www:www ./*

# copy spreadsheets to maestro share
cp ./excel/*.xlsx /home/samba/maestro/

# set access/modification dates for each iteration vault
find ./vault-1 -exec touch -t 200412231300 {} \;
find ./vault-2 -exec touch -t 200501101300 {} \;
find ./vault-3 -exec touch -t 200502241300 {} \;
find ./vault-4 -exec touch -t 200503151300 {} \;

# -----------------
echo "Iteration 1..."
# -----------------

# copy Parts&Vendors(TM) database
# archive mode preserves file times
cp -a ./pv-1.mdb /home/samba/maestro/pv.mdb
# copy csv
cp -a ./csv-1/* /home/samba/maestro/csv
# re-generate pv csv from mdb
#./export_current_to_csv.sh

# copy iteration files on top of remotefs
cp -a ./vault-1/* /home/samba/maestro/remotefs

# rsync remote fs to vault
#rsync -a --itemize-changes --backup --backup-dir="./backup" --suffix=-`date +%FT%T` --log-file="./sync-1.log" /usr/home/samba/maestro/remotefs/ /usr/home/samba/maestro/vault > sync.out
echo ""; echo "Iteration 1" > run_iterations_rsync.log
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="./run_iterations_rsync-1.log" /usr/home/samba/maestro/remotefs/ /usr/home/samba/maestro/vault >> ./run_iterations_rsync.log
echo ""
 
# -----------------
echo "Iteration 2..."
# -----------------

# copy Parts&Vendors(TM) database
# archive mode preserves file times
cp -a ./pv-2.mdb /home/samba/maestro/pv.mdb
# copy csv
cp -a ./csv-2/* /home/samba/maestro/csv
# re-generate pv csv from mdb
#./export_current_to_csv.sh

# copy iteration files on top of remotefs
cp -a ./vault-2/* /home/samba/maestro/remotefs

# rsync remote fs to vault
#rsync -a --itemize-changes --backup --backup-dir="./backup" --suffix=-`date +%FT%T` --log-file="./sync-1.log" /usr/home/samba/maestro/remotefs/ /usr/home/samba/maestro/vault > sync.out
echo ""; echo "Iteration 2" >> run_iterations_rsync.log
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="./run_iterations_rsync-2.log" /usr/home/samba/maestro/remotefs/ /usr/home/samba/maestro/vault >> ./run_iterations_rsync.log
echo ""

# -----------------
echo "Iteration 3..."
# -----------------

# copy Parts&Vendors(TM) database
# archive mode preserves file times
cp -a ./pv-3.mdb /home/samba/maestro/pv.mdb
# copy csv
cp -a ./csv-3/* /home/samba/maestro/csv
# re-generate pv csv from mdb
#./export_current_to_csv.sh

# copy iteration files on top of remotefs
cp -a -p ./vault-3/* /home/samba/maestro/remotefs

# rsync remote fs to vault
#rsync -a --itemize-changes --backup --backup-dir="./backup" --suffix=-`date +%FT%T` --log-file="./sync-1.log" /usr/home/samba/maestro/remotefs/ /usr/home/samba/maestro/vault > sync.out
echo ""; echo "Iteration 3" >> run_iterations_rsync.log
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="./run_iterations_rsync-3.log" /usr/home/samba/maestro/remotefs/ /usr/home/samba/maestro/vault >> ./run_iterations_rsync.log
echo ""

# -----------------
echo "Iteration 4..."
# -----------------

# copy Parts&Vendors(TM) database
# archive mode preserves file times
cp -a ./pv-4.mdb /home/samba/maestro/pv.mdb
# copy csv
cp -a ./csv-4/* /home/samba/maestro/csv
# re-generate pv csv from mdb
#./export_current_to_csv.sh

# copy iteration files on top of remotefs
cp -a -p ./vault-4/* /home/samba/maestro/remotefs

# rsync remote fs to vault
#rsync -a --itemize-changes --backup --backup-dir="./backup" --suffix=-`date +%FT%T` --log-file="./sync-1.log" /usr/home/samba/maestro/remotefs/ /usr/home/samba/maestro/vault > sync.out
echo ""; echo "Iteration 4" >> run_iterations_rsync.log
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="./run_iterations_rsync-4.log" /usr/home/samba/maestro/remotefs/ /usr/home/samba/maestro/vault >> ./run_iterations_rsync.log
echo ""

# -----------------
# cleanup
# -----------------

echo "Done!"
echo ""
