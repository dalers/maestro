#!/bin/sh
#
# Run through iterations in fast motion
# - execute from parent of extracted SCC demo data tar file
#
# - assumes maestro fileshare directory structure exists
#   /usr/home/samba/maestro					- root of fileshare
#   /usr/home/samba/maestro/remotefs/       - simulated remote fs (optional)
#   /usr/home/samba/maestro/vault           - document vault
#   /usr/home/samba/maestro/vault.backup    - document backups (optional)
#
#  - assumes SCC demo data tar file extracted to current directory
#    > tar -xzf maestro-scc-files.tar.gz
#
#    maestro
#    |-- pv-1.mdb                      P&V mdb after iteration
#    |-- pv-2.mdb
#    |-- pv-3.mdb
#    |-- pv-4.mdb
#    |-- pv-1.csv.tar.gz               csv mdb-export from P&V mdb after iteration
#    |-- pv-2.csv.tar.gz
#    |-- pv-3.csv.tar.gz
#    |-- pv-4.csv.tar.gz
#    |-- vault-1                       vault state after iteration
#    |   |-- 20000001
#    |   |   |-- 20000001_WI-00.odt
#    |   |   |-- 20000001_WI-00.pdf
#    |   |   `-- 20000001_WI-00_graphics.odg
#    |   |-- 20000002
#    |   |-- 20000003
#    |   |...
#    |   `-- 90000013
#    |-- vault-2
#    |   `...
#    |-- vault-3
#    |   `...
#    `-- vault-4
#        `...

# -----------------
# startup
# -----------------

# remove any existing files from simulated remote fs
rm -r /home/samba/maestro/remotefs/*

# remove any existing files from maestro file share
rm -r /home/samba/maestro/vault/*
rm -r /home/samba/maestro/vault.backup/*

# ensure required fileshare owner/mod (web server must have read/write permission)
chown -R www:www /home/samba/maestro/

# set access/modification dates for each iteration vault
find ./vault-1 -exec touch -t 200412231300 {} \;
find ./vault-2 -exec touch -t 200501101300 {} \;
find ./vault-3 -exec touch -t 200502241300 {} \;
find ./vault-4 -exec touch -t 200503151300 {} \;

# -----------------
# iteration 1
# -----------------

# copy Parts&Vendors(TM) database after iteration
cp /home/dale/pv-1.mdb /usr/home/samba/maestro/pv.mdb
./export_current_to_csv.sh
#tar -zcvf /home/dale/pv-1.tar.gz /home/samba/maestro/csv/

# copy iteration files on top of remotefs
# preserve file times -p
cp -r -p ./vault-1/* /usr/home/samba/maestro/remotefs

# rsync remote fs to vault
echo "rsync - iteration 1"
cp -a ./vault-scc-1/* /usr/home/samba/maestro/remotefs/
rsync -a --itemize-changes --backup --backup-dir="./backup" --suffix=-`date +%FT%T` --log-file="./sync-1.log" /usr/home/samba/maestro/remotefs/ /usr/home/samba/maestro/vault > sync.out
echo ""
 
# -----------------
# iteration 2
# -----------------

cp /home/dale/pv-2.mdb /home/samba/maestro/pv.mdb
./export_current_to_csv.sh
#tar -zcvf /home/dale/pv-2.tar.gz /home/samba/maestro/csv/

# copy iteration files on top of remotefs
# preserve file times -p
cp -r -p ./vault-2/* /usr/home/samba/maestro/remotefs

# rsync remote fs to vault
echo "rsync - iteration 2"
rm -r ./remotefs/*
cp -a ./vault-scc-2/* ./remotefs/
rsync -a --itemize-changes --backup --backup-dir="./backup" --suffix=-`date +%FT%T` --log-file="./sync-2.log" remotefs/ vault >> sync.out
echo ""

# -----------------
# iteration 3
# -----------------

cp /home/dale/pv-3.mdb /home/samba/maestro/pv.mdb
./export_current_to_csv.sh
#tar -zcvf /home/dale/pv-3.tar.gz /home/samba/maestro/csv/

# copy iteration files on top of remotefs
# preserve file times -p
cp -r -p ./vault-3/* /usr/home/samba/maestro/remotefs

# rsync remote fs to vault
echo "rsync - iteration 3"
rm -r ./remotefs/*
cp -a ./vault-scc-3/* ./remotefs/
rsync -a --itemize-changes --backup --backup-dir="./backup" --suffix=-`date +%FT%T` --log-file="./sync-3.log" remotefs/ vault >> sync.out
echo ""

# -----------------
# iteration 4
# -----------------

cp /home/dale/pv-4.mdb /home/samba/maestro/pv.mdb
./export_current_to_csv.sh
#tar -zcvf /home/dale/pv-4.tar.gz /home/samba/maestro/csv/

# copy iteration files on top of remotefs
# preserve file times -p
cp -r -p ./vault-4/* /usr/home/samba/maestro/remotefs

# rsync remote fs to vault
echo "rsync - iteration 4"
rm -r ./remotefs/*
cp -a ./vault-scc-4/* ./remotefs/
rsync -a --itemize-changes --backup --backup-dir="./backup" --suffix=-`date +%FT%T` --log-file="./sync-4.log" remotefs/ vault >> sync.out
echo ""

# -----------------
# cleanup
# -----------------

echo "Done!"
echo ""
