#!/bin/sh
#
# Load SCC Demo/Test data into Maestro
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
# Description
# ------------------------------------------
# Steps through successive iterations of data as if processed in real
# time (e.g. scheduled nightly using cron). For each iteration:
#
#   * restores master data spreaseheets
#   * restore Parts&Vendors(TM) database
#   * restore current files
#   * run get_current_and_review.sh (normally run nightly by cron)
#   * pause (operator must press [Enter] to continue)
#
# SCC Demo/Test tar.gz structure
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

if test $# = 1
then
	infilename=$1
    version="ver"
    echo "load_demo: using data file: '$infilename' "
    echo "load_demo: using filenames: '$version' "
elif test $# = 2
then
	infilename=$1
    version=$2
    echo "load_demo: using data file: '$infilename' "
    echo "load_demo: using filenames: '$version' "
else
	echo
    echo "  Usage $0: filename.tar.gz [ver|nover]" 1>&2
	echo
	exit 1
fi

echo
echo "======================================="
echo "Setup"
echo "======================================="
echo

echo "load_demo: delete and re-create maestro CIFS file share structure"
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

echo "load_demo: ls /home/samba/maestro/*"
ls -ld /home/samba/maestro/*
echo

echo "load_demo: extract ./maestro-scc-files/..."
# use -a when copying files to preserve file timestamps
#tar -xzf ./maestro-scc-files-1.2.0.tar.gz 
tar -xzf ./$1 
echo "load_demo: ls ./maestro-scc-files/*"
ls -l maestro-scc-files/
echo

echo "load_demo: copy README.txt file to maestro CIFS file share..."
cp -a ./maestro-scc-files/README.txt /usr/home/samba/maestro/
# ensure README.txt uses Windows-type EOL
#flip -m /usr/home/samba/maestro/remotefs/README.txt
echo

echo "======================================="
echo "Iteration 1 (with csv.old/ bootstrap)"
echo "======================================="
echo

echo "load_demo: restore 'current' master data spreadsheets (with csv) to remotefs"
# -a archive mode preserves file times
cp -a ./maestro-scc-files/excel/*.xlsx /home/samba/maestro/remotefs/
cp -a ./maestro-scc-files/excel/*.csv  /home/samba/maestro/remotefs/
echo

echo "load_demo: restore 'current' Parts&Vendors(TM) database to remotefs"
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-1.mdb /home/samba/maestro/remotefs/pv.mdb
echo

echo "load_demo: bootstrap csv.old/ with empty pv_pn.csv, pv_pn_details.csv, pv_pn_details_sort.csv"
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb PN    > /tmp/pv_pn.csv
head -n 1 /tmp/pv_pn.csv > /home/samba/maestro/csv/pv_pn.csv ; rm /tmp/pv_pn.csv
python /usr/local/www/maestro/protected/data/pndetails.py /home/samba/maestro/csv/pv_pn.csv /home/samba/maestro/csv/pv_pn_details.csv
sort /home/samba/maestro/csv/pv_pn_details.csv  > /home/samba/maestro/csv/pv_pn_details_sort.csv
echo

# copy either vault-x/ or vault-x-norev/
if test $version = "ver"
then
	echo "load_demo: restore 'current' files (versioned filenames) to remotefs/"
	cp -a ./maestro-scc-files/vault-1/* /home/samba/maestro/remotefs/vault/
elif test $version = "nover"
then
	echo "load_demo: restore 'current' files (unversioned filenames) to remotefs/"
	cp -a ./maestro-scc-files/vault-1-nover/* /home/samba/maestro/remotefs/vault/
else
	echo "load_demo: invalid ver|nover"
	echo
	exit 1
fi

chown -R www:www /usr/home/samba/maestro/remotefs/
chmod -R a+rw    /usr/home/samba/maestro/remotefs/
echo

echo "load_demo: get_current_and_review.sh"
/usr/local/www/maestro/protected/data/get_current_and_review.sh
echo

read -t 60 -p "load_demo: iteratation 1 complete - Press [Enter] to continue..." key
echo

echo "======================================="
echo "Iteration 2"
echo "======================================="
echo

echo "load_demo: restore 'current' master data spreadsheets (with csv) to remotefs"
# -a archive mode preserves file times
cp -a ./maestro-scc-files/excel/*.xlsx /home/samba/maestro/remotefs/
cp -a ./maestro-scc-files/excel/*.csv /home/samba/maestro/remotefs/
echo

echo "load_demo: restore 'current' Parts&Vendors(TM) database to remotefs"
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-2.mdb /home/samba/maestro/remotefs/pv.mdb
echo

# copy either vault-x/ or vault-x-norev/
if test $version = "ver"
then
	echo "load_demo: restore 'current' files (versioned filenames) to remotefs/"
	cp -a ./maestro-scc-files/vault-2/* /home/samba/maestro/remotefs/vault/
elif test $version = "nover"
then
	echo "load_demo: restore 'current' files (unversioned filenames) to remotefs/"
	cp -a ./maestro-scc-files/vault-2-nover/* /home/samba/maestro/remotefs/vault/
else
	echo "load_demo: invalid ver|nover"
	echo
	exit 1
fi

chown -R www:www /usr/home/samba/maestro/remotefs/
chmod -R a+rw    /usr/home/samba/maestro/remotefs/
echo

echo "load_demo: get_current_and_review.sh"
/usr/local/www/maestro/protected/data/get_current_and_review.sh
echo

read -t 60 -p "load_demo: iteratation 2 complete - Press [Enter] to continue..." key
echo

echo "======================================="
echo "Iteration 3"
echo "======================================="
echo

echo "load_demo: restore 'current' master data spreadsheets (with csv) to remotefs"
# -a archive mode preserves file times
cp -a ./maestro-scc-files/excel/*.xlsx /home/samba/maestro/remotefs/
cp -a ./maestro-scc-files/excel/*.csv /home/samba/maestro/remotefs/
echo

echo "load_demo: restore 'current' Parts&Vendors(TM) database to remotefs"
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-3.mdb /home/samba/maestro/remotefs/pv.mdb
echo

# copy either vault-x/ or vault-x-norev/
if test $version = "ver"
then
	echo "load_demo: restore 'current' files (versioned filenames) to remotefs/"
	cp -a ./maestro-scc-files/vault-3/* /home/samba/maestro/remotefs/vault/
elif test $version = "nover"
then
	echo "load_demo: restore 'current' files (unversioned filenames) to remotefs/"
	cp -a ./maestro-scc-files/vault-3-nover/* /home/samba/maestro/remotefs/vault/
else
	echo "load_demo: invalid ver|nover"
	echo
	exit 1
fi

chown -R www:www /usr/home/samba/maestro/remotefs/
chmod -R a+rw    /usr/home/samba/maestro/remotefs/
echo

echo "load_demo: get_current_and_review.sh"
/usr/local/www/maestro/protected/data/get_current_and_review.sh
echo

read -t 60 -p "load_demo: iteratation 3 complete - Press [Enter] to continue..." key
echo

echo "======================================="
echo "Iteration 4"
echo "======================================="
echo

echo "load_demo: restore 'current' master data spreadsheets (with csv) to remotefs"
# -a archive mode preserves file times
cp -a ./maestro-scc-files/excel/*.xlsx /home/samba/maestro/remotefs/
cp -a ./maestro-scc-files/excel/*.csv /home/samba/maestro/remotefs/
echo

echo "load_demo: restore 'current' Parts&Vendors(TM) database to remotefs"
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-4.mdb /home/samba/maestro/remotefs/pv.mdb
echo

# copy either vault-x/ or vault-x-norev/
if test $version = "ver"
then
	echo "load_demo: restore 'current' files (versioned filenames) to remotefs/"
	cp -a ./maestro-scc-files/vault-4/* /home/samba/maestro/remotefs/vault/
elif test $version = "nover"
then
	echo "load_demo: restore 'current' files (unversioned filenames) to remotefs/"
	cp -a ./maestro-scc-files/vault-4-nover/* /home/samba/maestro/remotefs/vault/
else
	echo "load_demo: invalid ver|nover"
	echo
	exit 1
fi

chown -R www:www /usr/home/samba/maestro/remotefs/
chmod -R a+rw    /usr/home/samba/maestro/remotefs/
echo

echo "load_demo: get_current_and_review.sh"
/usr/local/www/maestro/protected/data/get_current_and_review.sh
echo

read -t 60 -p "load_demo: iteratation 4 complete - Press [Enter] to continue..." key
echo

echo "======================================="
echo "Iteration 5"
echo "======================================="
echo

echo "load_demo: restore 'current' master data spreadsheets (with csv) to remotefs"
# -a archive mode preserves file times
cp -a ./maestro-scc-files/excel/*.xlsx /home/samba/maestro/remotefs/
cp -a ./maestro-scc-files/excel/*.csv /home/samba/maestro/remotefs/
echo

echo "load_demo: restore 'current' Parts&Vendors(TM) database to remotefs"
# -a archive mode preserves file times
cp -a ./maestro-scc-files/pv-5.mdb /home/samba/maestro/remotefs/pv.mdb
echo

# copy either vault-x/ or vault-x-norev/
if test $version = "ver"
then
	echo "load_demo: restore 'current' files (versioned filenames) to remotefs/"
	cp -a ./maestro-scc-files/vault-5/* /home/samba/maestro/remotefs/vault/
elif test $version = "nover"
then
	echo "load_demo: restore 'current' files (unversioned filenames) to remotefs/"
	cp -a ./maestro-scc-files/vault-5-nover/* /home/samba/maestro/remotefs/vault/
else
	echo "load_demo: invalid ver|nover"
	echo
	exit 1
fi

chown -R www:www /usr/home/samba/maestro/remotefs/
chmod -R a+rw    /usr/home/samba/maestro/remotefs/
echo

echo "load_demo: get_current_and_review.sh"
/usr/local/www/maestro/protected/data/get_current_and_review.sh
echo

read -t 60 -p "load_demo: iteratation 5 complete - Press [Enter] to continue..." key
echo

echo "======================================="
echo "Cleanup"
echo "======================================="
echo

echo "Removing maestro-scc-files/"
rm -r ./maestro-scc-files
echo

exit 0
