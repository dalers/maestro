#!/bin/sh
#
# Install SCC data
# - MUST RUN from .../maestro/bin/ (e.g. /usr/local/maestro/bin/)
#
# Creates scc file share and sub-directory structure
# - /usr/home/samba/scc MUST EXIST with r/w permission
# - deletes and recreates /home/samba/scc/* file structure
# - "runs" through iterations 1, 2, 3..., processing changes and
#   generating reports as if happening in real-time
#
# Description
# ------------------------------------------
# Steps through successive iterations of data as if processed in real
# time (e.g. scheduled nightly using cron). For each iteration:
#
#   * restore bootstrap master data spreadsheets
#   * restore Parts&Vendors(TM) database
#   * restore current part documents
#       - TODO fix this - does NOT support material/ and docs/ directories
#   * run get_current_and_review.sh (normally run nightly by cron)
#   * pause (operator must press [Enter] to continue)
#
# SCC git repo structure
# ------------------------
#    scc/
#    +-- csv[-n]/                 csv P&V + master data spreadsheet export iteration n (not used, csv re-created on-the-fly) 
#    +-- docs[-n]/                ad-hoc documents (not specifically part or material-related)
#    +-- ods/                     master data spreadsheet/csv
#    +-- logo/                    artwork
#    +-- parts/                   stub directory to create temp consolidated parts/ for developer convenience (.gitignore)
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
#    \-- README.txt               readme for file share (MS format for access by MS Windows-type clients)
#
# SCC file share structure
# ------------------------
#    scc/
#    +-- ods/                     master data spreadsheet/csv
#    +-- csv/                     current P&V and master data spreadsheet csv export
#    +-- csv.old/                 previous csv export
#    +-- doc/                     current ad-hoc documents
#    +-- docs.rsync/                  ad-hoc document file version history
#    +-- parts/                   current part documents
#    +-- parts.rsync/                 part document file version history
#    +-- material/                current material documents
#    +-- material.rsync/              material document file version history
#    +-- pv.mdb                   current Parts&Vendors database
#    \-- README.txt               file share readme
#

if test $# = 1
then
    version=$1
    echo "install: using '$version' "
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

echo "install: run setup_file_share.sh to delete/re-create /home/samba/scc/ directory structure"
./setup_file_share.sh
echo

echo "install: copy README.txt file to scc file share..."
cp -a ../README.txt /home/samba/scc/
# ensure Windows-type EOL
#flip -m /home/samba/scc/README.txt
echo

echo "install: running fix_iteration_datetime.sh"
./fix_iteration_datetime.sh
echo

echo "======================================="
echo "Iteration 1 (with csv.old/ bootstrap)"
echo "======================================="
echo

echo "install: restore 'current' master data spreadsheets and csv to fileshare"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../ods/* /home/samba/scc/ods/
chown -R nobody:wheel /home/samba/scc/ods/
chmod ugo+rw /home/samba/scc/ods/*
echo

echo "install: restore 'current' Parts&Vendors(TM) database to fileshare"
# -a archive mode preserves file times
cp -a ../pv/pv-1.mdb /home/samba/scc/pv/pv.mdb
chown -R nobody:wheel /home/samba/scc/pv/
chmod ugo+rw /home/samba/scc/pv/*
echo

# bootstrap - only do first time through

echo "install: bootstrap csv.old/ with empty pv_pn.csv, pv_pn_details.csv, pv_pn_details_sort.csv"
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb PN    > /tmp/pv_pn.csv
head -n 1 /tmp/pv_pn.csv > /home/samba/scc/csv.old/pv_pn.csv ; rm /tmp/pv_pn.csv
./pndetails.py /home/samba/scc/csv.old/pv_pn.csv /home/samba/scc/csv.old/pv_pn_details.csv
# sorting doesn't accomplish anything but required bootstrap file is created
sort /home/samba/scc/csv.old/pv_pn_details.csv  > /home/samba/scc/csv.old/pv_pn_details_sort.csv
echo

# copy part documents from either vault-[n]/ or vault-[n]-norev/
if test $version = "VER"
then
	echo "install: restore 'current' files (version suffix) to fileshare"
	cp -a ../parts-1/* /home/samba/scc/parts/
elif test $version = "NOVER"
then
	echo "install: restore 'current' files (NO version suffix) to fileshare"
	cp -a ../parts-1-nover/* /home/samba/scc/parts/
else
	echo "install: invalid VER | NOVER"
	echo
	exit 1
fi

chown -R nobody:wheel /home/samba/scc/parts/
chmod -R ugo+rw       /home/samba/scc/parts/
echo

echo "install: rsync_current_files.sh"
./rsync_current_files.sh
echo

echo "install: export_current_to_csv.sh"
./export_current_to_csv.sh
echo

echo "install: send_current_change_report.sh"
./send_current_change_report.sh
echo

# keep copy of change report
cp /home/samba/scc/work/current_changereport.txt  /home/samba/scc/work/current_changereport-1.txt

read -t 60 -p "install: iteration 1 complete - Press [Enter] to continue..." key
echo

echo "======================================="
echo "Iteration 2"
echo "======================================="
echo

echo "install: restore 'current' master data spreadsheets (with csv) to remotefs"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../ods/* /home/samba/scc/ods/
chown -R nobody:wheel /home/samba/scc/ods/
chmod ugo+rw /home/samba/scc/ods/*
echo

echo "install: restore 'current' Parts&Vendors(TM) database to remotefs"
# -a archive mode preserves file times
cp -a ../pv/pv-2.mdb /home/samba/scc/pv/pv.mdb
chown -R nobody:wheel /home/samba/scc/pv/
chmod ugo+rw /home/samba/scc/pv/*
echo

# copy part documents from either vault-[n]/ or vault-[n]-norev/
if test $version = "VER"
then
	echo "install: restore 'current' files (version suffix) to fileshare"
	cp -a ../parts-2/* /home/samba/scc/parts/
elif test $version = "NOVER"
then
	echo "install: restore 'current' files (NO version suffix) to fileshare"
	cp -a ../parts-2-nover/* /home/samba/scc/parts/
else
	echo "install: invalid VER | NOVER"
	echo
	exit 1
fi

chown -R nobody:wheel /home/samba/scc/parts/
chmod -R ugo+rw       /home/samba/scc/parts/
echo

echo "install: rsync_current_files.sh"
./rsync_current_files.sh
echo

echo "install: export_current_to_csv.sh"
./export_current_to_csv.sh
echo

echo "install: send_current_change_report.sh"
./send_current_change_report.sh
echo

# keep copy of change report
cp /home/samba/scc/work/current_changereport.txt  /home/samba/scc/work/current_changereport-2.txt
echo

read -t 60 -p "install: iteration 2 complete - Press [Enter] to continue..." key
echo

echo "======================================="
echo "Iteration 3"
echo "======================================="
echo

echo "install: restore 'current' master data spreadsheets (with csv) to remotefs"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../ods/* /home/samba/scc/ods/
chown -R nobody:wheel /home/samba/scc/ods/
chmod ugo+rw /home/samba/scc/ods/*
echo

echo "install: restore 'current' Parts&Vendors(TM) database to remotefs"
# -a archive mode preserves file times
cp -a ../pv/pv-3.mdb /home/samba/scc/pv/pv.mdb
chown -R nobody:wheel /home/samba/scc/pv/
chmod ugo+rw /home/samba/scc/pv/*
echo

# copy part documents from either vault-[n]/ or vault-[n]-norev/
if test $version = "VER"
then
	echo "install: restore 'current' files (version suffix) to fileshare"
	cp -a ../parts-3/* /home/samba/scc/parts/
elif test $version = "NOVER"
then
	echo "install: restore 'current' files (NO version suffix) to fileshare"
	cp -a ../parts-3-nover/* /home/samba/scc/parts/
else
	echo "install: invalid VER | NOVER"
	echo
	exit 1
fi

chown -R nobody:wheel /home/samba/scc/parts/
chmod -R ugo+rw       /home/samba/scc/parts/
echo

echo "install: rsync_current_files.sh"
./rsync_current_files.sh
echo

echo "install: export_current_to_csv.sh"
./export_current_to_csv.sh
echo

echo "install: send_current_change_report.sh"
./send_current_change_report.sh
echo

# keep copy of change report
cp /home/samba/scc/work/current_changereport.txt  /home/samba/scc/work/current_changereport-3.txt
echo

read -t 60 -p "install: iteration 3 complete - Press [Enter] to continue..." key
echo

echo "======================================="
echo "Iteration 4"
echo "======================================="
echo

echo "install: restore 'current' master data spreadsheets (with csv) to remotefs"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../ods/* /home/samba/scc/ods/
chown -R nobody:wheel /home/samba/scc/ods/
chmod ugo+rw /home/samba/scc/ods/*
echo

echo "install: restore 'current' Parts&Vendors(TM) database to remotefs"
# -a archive mode preserves file times
cp -a ../pv/pv-4.mdb /home/samba/scc/pv/pv.mdb
chown -R nobody:wheel /home/samba/scc/pv/
chmod ugo+rw /home/samba/scc/pv/*
echo

# copy part documents from either vault-[n]/ or vault-[n]-norev/
if test $version = "VER"
then
	echo "install: restore 'current' files (version suffix) to fileshare"
	cp -a ../parts-4/* /home/samba/scc/parts/
elif test $version = "NOVER"
then
	echo "install: restore 'current' files (NO version suffix) to fileshare"
	cp -a ../parts-4-nover/* /home/samba/scc/parts/
else
	echo "install: invalid VER | NOVER"
	echo
	exit 1
fi

chown -R nobody:wheel /home/samba/scc/parts/
chmod -R ugo+rw       /home/samba/scc/parts/
echo

echo "install: rsync_current_files.sh"
./rsync_current_files.sh
echo

echo "install: export_current_to_csv.sh"
./export_current_to_csv.sh
echo

echo "install: send_current_change_report.sh"
./send_current_change_report.sh
echo

# keep copy of change report
cp /home/samba/scc/work/current_changereport.txt  /home/samba/scc/work/current_changereport-4.txt
echo

read -t 60 -p "install: iteration 4 complete - Press [Enter] to continue..." key
echo

echo "======================================="
echo "Iteration 5"
echo "======================================="
echo

echo "install: restore 'current' master data spreadsheets (with csv) to remotefs"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../ods/* /home/samba/scc/ods/
chown -R nobody:wheel /home/samba/scc/ods/
chmod ugo+rw /home/samba/scc/ods/*
echo

echo "install: restore 'current' Parts&Vendors(TM) database to remotefs"
# -a archive mode preserves file times
cp -a ../pv/pv-5.mdb /home/samba/scc/pv/pv.mdb
chown -R nobody:wheel /home/samba/scc/pv/
chmod ugo+rw /home/samba/scc/pv/*
echo

# copy part documents from either vault-[n]/ or vault-[n]-norev/
if test $version = "VER"
then
	echo "install: restore 'current' files (version suffix) to fileshare"
	cp -a ../parts-5/* /home/samba/scc/parts/
elif test $version = "NOVER"
then
	echo "install: restore 'current' files (NO version suffix) to fileshare"
	cp -a ../parts-5-nover/* /home/samba/scc/parts/
else
	echo "install: invalid VER | NOVER"
	echo
	exit 1
fi

chown -R nobody:wheel /home/samba/scc/parts/
chmod -R ugo+rw       /home/samba/scc/parts/
echo

echo "install: rsync_current_files.sh"
./rsync_current_files.sh
echo

echo "install: export_current_to_csv.sh"
./export_current_to_csv.sh
echo

echo "install: send_current_change_report.sh"
./send_current_change_report.sh
echo

# keep copy of change report
cp /home/samba/scc/work/current_changereport.txt  /home/samba/scc/work/current_changereport-5.txt
echo

read -t 60 -p "install: iteration 5 complete - Press [Enter] to continue..." key
echo

exit 0
