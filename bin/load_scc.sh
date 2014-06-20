#!/bin/sh
#
# Load SCC data sequentially iteration 1, 2, 3... 
#
# MUST RUN from .../maestro/bin/ (e.g. /usr/local/maestro/bin/)
#
# Creates scc file share and sub-directory structure
# - /usr/home/samba/scc MUST EXIST with r/w permission
# - RUNS setup.sh to delete and recreate scc/ file structure
#
# Description
# ------------------------------------------
# Steps through successive iterations of data as if processed in real
# time (e.g. scheduled nightly using cron). For each iteration:
#
#   * restore master data spreadsheets
#   * restore Parts&Vendors(TM) database
#   * restore current part documents
#   * run get_current_and_review.sh (normally run nightly by cron)
#   * pause (operator must press [Enter] to continue)
#
# SCC git repo directory structure
# ------------------------
#    scc/
#    +-- csv[-n]/                 csv P&V + master data spreadsheet export iteration n (not used, csv re-created on-the-fly) 
#    +-- doc/                     arbitrary SCC documents not specifically part or material-related
#    +-- excel/                   master data spreadsheets (xlsx and csv)
#    +-- logo/                    SCC artwork
#    +-- parts/                   stub directory - developer convenience for temp consolidated parts/ (has .gitignore)
#    +-- parts[-n]/               documents related to parts iteration n, document revision in filename
#    |   +-- 10000001/
#    |   |   \-- Doc.pdf          part document related to PN 10000001
#    |   +-- 20000001/
#    |   +-- 20000002/
#    |   ...
#    +-- parts[-n]-nover/         documents related to parts iteration n, document revision NOT in filename
#    |-- material[-n]/            documents related to parts iteration n
#    |   +...
#    |-- pv/                      Parts&Vendors database iteration files
#    |   +-- pv-1.mdb             iteration 1
#    |   +-- pv-2.mdb
#    |   +-- pv-3.mdb
#    |   +-- pv-n.mdb
#    \-- README.txt               readme for file share (may be accessed by MS Windows-type clients)
#
# SCC file share structure (only differences from repo are noted)
# ------------------------
#    scc/
#    +-- doc/
#    +-- excel/                   master data spreadsheets (xlsx and csv)
#    +-- logo/                    SCC artwork
#    +-- csv/                     current P&V and master data spreadsheet csv export
#    +-- csv.old/                 previous csv export
#    +-- parts/                   current part documents
#    +-- parts.rsync/             rsync current part documents
#    |-- material/                current material documents
#    |-- material.rsync/          rsync material documents
#    |-- pv/                      
#    |   \-- pv.mdb               current Parts&Vendors database
#    \-- README.txt               file share readme
#

if test $# = 1
then
    version=$1
    echo "load_scc: using '$version' "
else
	echo
    echo "  Usage: $0 VER | NOVER" 1>&2
	echo
	exit 1
fi

echo
echo "======================================="
echo "Setup"
echo "======================================="
echo

echo "load_scc: running setup.sh (create clean scc/ fileshare structure)"
./setup.sh
echo

echo "load_scc: copy README.txt file to scc file share..."
cp -a ../scc/README.txt /home/samba/scc/
# ensure Windows-type EOL
#flip -m /home/samba/scc/README.txt
echo

echo "load_scc: running fix_iteration_datetime.sh (force document modified datetime)"
./fix_iteration_datetime.sh
echo

echo "======================================="
echo "Iteration 1 (with csv.old/ bootstrap)"
echo "======================================="
echo

echo "load_scc: restore 'current' master data spreadsheets (with csv) to fileshare"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../scc/excel/*.xlsx /home/samba/scc/excel/
cp -a ../scc/excel/*.csv  /home/samba/scc/excel/
chown -R nobody:wheel /home/samba/scc/excel/
chmod ugo+rw /home/samba/scc/excel/*
echo

echo "load_scc: restore 'current' Parts&Vendors(TM) database to fileshare"
# -a archive mode preserves file times
cp -a ../scc/pv/pv-1.mdb /home/samba/scc/pv/pv.mdb
chown -R nobody:wheel /home/samba/scc/pv/
chmod ugo+rw /home/samba/scc/pv/*
echo

# bootstrap - only do first time through

echo "load_scc: bootstrap csv.old/ with empty pv_pn.csv, pv_pn_details.csv, pv_pn_details_sort.csv"
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb PN    > /tmp/pv_pn.csv
head -n 1 /tmp/pv_pn.csv > /home/samba/scc/csv.old/pv_pn.csv ; rm /tmp/pv_pn.csv
/usr/local/maestro/bin/pndetails.py /home/samba/scc/csv.old/pv_pn.csv /home/samba/scc/csv.old/pv_pn_details.csv
# sorting doesn't accomplish anything but required bootstrap file is created
sort /home/samba/scc/csv.old/pv_pn_details.csv  > /home/samba/scc/csv.old/pv_pn_details_sort.csv
echo

# copy part documents from either vault-[n]/ or vault-[n]-norev/
if test $version = "VER"
then
	echo "load_scc: restore 'current' files with version suffix"
	cp -a ../scc/parts-1/* /home/samba/scc/parts/
elif test $version = "NOVER"
then
	echo "load_scc: restore 'current' files (unversioned filenames) to remotefs/"
	cp -a ../scc/parts-1-nover/* /home/samba/scc/parts/
else
	echo "load_scc: invalid VER | NOVER"
	echo
	exit 1
fi

chown -R nobody:wheel /home/samba/scc/parts/
chmod -R ugo+rw         /home/samba/scc/parts/
echo

echo "load_scc: get_current_and_review.sh"
./get_current_and_review.sh
cp /home/samba/scc/work/current_changereport.txt  /home/samba/scc/work/current_changereport-1.txt
echo

read -t 60 -p "load_scc: iteration 1 complete - Press [Enter] to continue..." key
echo

echo "======================================="
echo "Iteration 2"
echo "======================================="
echo

echo "load_scc: restore 'current' master data spreadsheets (with csv) to remotefs"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../scc/excel/*.xlsx /home/samba/scc/excel/
cp -a ../scc/excel/*.csv  /home/samba/scc/excel/
chown -R nobody:wheel /home/samba/scc/excel/
chmod ugo+rw /home/samba/scc/excel/*
echo

echo "load_scc: restore 'current' Parts&Vendors(TM) database to remotefs"
# -a archive mode preserves file times
cp -a ../scc/pv/pv-2.mdb /home/samba/scc/pv/pv.mdb
chown -R nobody:wheel /home/samba/scc/pv/
chmod ugo+rw /home/samba/scc/pv/*
echo

# copy part documents from either vault-[n]/ or vault-[n]-norev/
if test $version = "VER"
then
	echo "load_scc: restore 'current' files with version suffix"
	cp -a ../scc/parts-2/* /home/samba/scc/parts/
elif test $version = "NOVER"
then
	echo "load_scc: restore 'current' files (unversioned filenames) to remotefs/"
	cp -a ../scc/parts-2-nover/* /home/samba/scc/parts/
else
	echo "load_scc: invalid VER | NOVER"
	echo
	exit 1
fi

chown -R nobody:wheel /home/samba/scc/parts/
chmod -R ugo+rw         /home/samba/scc/parts/
echo

echo "load_scc: get_current_and_review.sh"
./get_current_and_review.sh
cp /home/samba/scc/work/current_changereport.txt  /home/samba/scc/work/current_changereport-2.txt
echo

read -t 60 -p "load_scc: iteration 2 complete - Press [Enter] to continue..." key
echo

echo "======================================="
echo "Iteration 3"
echo "======================================="
echo

echo "load_scc: restore 'current' master data spreadsheets (with csv) to remotefs"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../scc/excel/*.xlsx /home/samba/scc/excel/
cp -a ../scc/excel/*.csv  /home/samba/scc/excel/
chown -R nobody:wheel /home/samba/scc/excel/
chmod ugo+rw /home/samba/scc/excel/*
echo

echo "load_scc: restore 'current' Parts&Vendors(TM) database to remotefs"
# -a archive mode preserves file times
cp -a ../scc/pv/pv-3.mdb /home/samba/scc/pv/pv.mdb
chown -R nobody:wheel /home/samba/scc/pv/
chmod ugo+rw /home/samba/scc/pv/*
echo

# copy part documents from either vault-[n]/ or vault-[n]-norev/
if test $version = "VER"
then
	echo "load_scc: restore 'current' files with version suffix"
	cp -a ../scc/parts-3/* /home/samba/scc/parts/
elif test $version = "NOVER"
then
	echo "load_scc: restore 'current' files (unversioned filenames) to remotefs/"
	cp -a ../scc/parts-3-nover/* /home/samba/scc/parts/
else
	echo "load_scc: invalid VER | NOVER"
	echo
	exit 1
fi

chown -R nobody:wheel /home/samba/scc/parts/
chmod -R ugo+rw         /home/samba/scc/parts/
echo

echo "load_scc: get_current_and_review.sh"
./get_current_and_review.sh
cp /home/samba/scc/work/current_changereport.txt  /home/samba/scc/work/current_changereport-3.txt
echo

read -t 60 -p "load_scc: iteration 3 complete - Press [Enter] to continue..." key
echo

echo "======================================="
echo "Iteration 4"
echo "======================================="
echo

echo "load_scc: restore 'current' master data spreadsheets (with csv) to remotefs"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../scc/excel/*.xlsx /home/samba/scc/excel/
cp -a ../scc/excel/*.csv  /home/samba/scc/excel/
chown -R nobody:wheel /home/samba/scc/excel/
chmod ugo+rw /home/samba/scc/excel/*
echo

echo "load_scc: restore 'current' Parts&Vendors(TM) database to remotefs"
# -a archive mode preserves file times
cp -a ../scc/pv/pv-4.mdb /home/samba/scc/pv/pv.mdb
chown -R nobody:wheel /home/samba/scc/pv/
chmod ugo+rw /home/samba/scc/pv/*
echo

# copy part documents from either vault-[n]/ or vault-[n]-norev/
if test $version = "VER"
then
	echo "load_scc: restore 'current' files with version suffix"
	cp -a ../scc/parts-4/* /home/samba/scc/parts/
elif test $version = "NOVER"
then
	echo "load_scc: restore 'current' files (unversioned filenames) to remotefs/"
	cp -a ../scc/parts-4-nover/* /home/samba/scc/parts/
else
	echo "load_scc: invalid VER | NOVER"
	echo
	exit 1
fi

chown -R nobody:wheel /home/samba/scc/parts/
chmod -R ugo+rw         /home/samba/scc/parts/
echo

echo "load_scc: get_current_and_review.sh"
./get_current_and_review.sh
cp /home/samba/scc/work/current_changereport.txt  /home/samba/scc/work/current_changereport-4.txt
echo

read -t 60 -p "load_scc: iteration 4 complete - Press [Enter] to continue..." key
echo

echo "======================================="
echo "Iteration 5"
echo "======================================="
echo

echo "load_scc: restore 'current' master data spreadsheets (with csv) to remotefs"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../scc/excel/*.xlsx /home/samba/scc/excel/
cp -a ../scc/excel/*.csv  /home/samba/scc/excel/
chown -R nobody:wheel /home/samba/scc/excel/
chmod ugo+rw /home/samba/scc/parts/*
echo

echo "load_scc: restore 'current' Parts&Vendors(TM) database to remotefs"
# -a archive mode preserves file times
cp -a ../scc/pv/pv-5.mdb /home/samba/scc/pv/pv.mdb
chown -R nobody:wheel /home/samba/scc/pv/
chmod ugo+rw /home/samba/scc/pv/*
echo

# copy part documents from either vault-[n]/ or vault-[n]-norev/
if test $version = "VER"
then
	echo "load_scc: restore 'current' files with version suffix"
	cp -a ../scc/parts-5/* /home/samba/scc/parts/
elif test $version = "NOVER"
then
	echo "load_scc: restore 'current' files (unversioned filenames) to remotefs/"
	cp -a ../scc/parts-5-nover/* /home/samba/scc/parts/
else
	echo "load_scc: invalid VER | NOVER"
	echo
	exit 1
fi

chown -R nobody:wheel /home/samba/scc/parts/
chmod -R ugo+rw         /home/samba/scc/parts/
echo

echo "load_scc: get_current_and_review.sh"
./get_current_and_review.sh
cp /home/samba/scc/work/current_changereport.txt  /home/samba/scc/work/current_changereport-5.txt
echo

read -t 60 -p "load_scc: iteration 5 complete - Press [Enter] to continue..." key
echo

exit 0
