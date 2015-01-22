#!/bin/sh
#
# "run" Aircraft Wireless PLM iterations sequentially
# - run from /home/maestro/maestro-repo/scc/bin/
# - /home/maestro/ MUST exist with r/w permission
# - select either versioned or un-versioned document filenames
# - select either part data from repo or regenerated (from P&V mdb using mdbtools)
#
# Process Aircraft Wireless PLM iterations in order
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
# SCC repo structure
# ------------------------
#    /home/maestro/maestro-repo/scc/
#    +-- csv-[n]/                 csv P&V + master data spreadsheet export iteration [n]
#    +-- docs-[n]/                ad-hoc documents (not specifically part or material-related)
#    +-- ods/                     master data spreadsheet/csv
#    +-- logo/                    artwork
#    +-- parts/                   stub directory to create temp consolidated parts/ for developer convenience (.gitignore)
#    +-- parts-[n]/               documents related to parts iteration n, document revision in filename
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
#    /home/maestro/scc/
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

if test $# = 0
then
    echo
    echo "  ERROR: no arguments"
    echo "  Usage: $0 [ VER | NOVER ]  { MDBTOOLS }" 1>&2
    echo
    exit 1
elif test $# = 1
then
    version=$1
    mdbtools="NOMDBTOOLS"
    echo "Maestro - running iterations for '$version' documents and '$mdbtools'"
elif test $# = 2
then
    version=$1
    mdbtools=$2
    echo "Maestro - running iterations for '$version' documents and '$mdbtools'"
else
    echo
    echo "  ERROR: too many arguments"
    echo "  Usage: $0 [ VER | NOVER ]  { MDBTOOLS }" 1>&2
    echo
    exit 1
fi

echo
echo "Setup"
echo "======================================="

echo "delete/re-create vault filesystem /home/maestro/scc/... (setup_file_share.sh)"
./setup_file_share.sh
echo "This directory is used by Maestro" > /home/maestro/scc/README.txt
# ensure README has Windows-type EOL
# BSD flip -m /home/maestro/scc/README.txt
unix2dos /home/maestro/scc/README.txt

echo "run setup_fix_iteration_datetime.sh"
./setup_fix_iteration_datetime.sh

echo "bootstrap csv.old/ (pv_pn.csv, pv_pl.csv, pv_pn_details.csv, pv_pn_details_sort.csv)"
# create empty pv_pn.csv, pv_pl.csv
head -n 1 /home/maestro/maestro-repo/scc/csv-1/pv_pn.csv > /home/maestro/scc/csv.old/pv_pn.csv
head -n 1 /home/maestro/maestro-repo/scc/csv-1/pv_pl.csv > /home/maestro/scc/csv.old/pv_pl.csv
# create empty pv_pn_details.csv, pv_pn_details_sort.cvs
./pndetails.py /home/maestro/scc/csv.old/pv_pn.csv /home/maestro/scc/csv.old/pv_pn_details.csv
# sorting is irrelevant, but does create the required bootstrap file
sort /home/maestro/scc/csv.old/pv_pn_details.csv  > /home/maestro/scc/csv.old/pv_pn_details_sort.csv
#chown -R nobody:wheel /home/maestro/scc/csv.old/
chmod ugo+rw /home/maestro/scc/csv.old/*

echo "setup complete"
#read -t 60 -p "setup complete - Press [Enter] to continue..." key

echo
echo "Iteration 1 - Prototype Release"
echo "========================================"

echo "copy 'current' master data spreadsheets and csv exports"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../ods/* /home/maestro/scc/ods/
#chown -R nobody:wheel /home/maestro/scc/ods/
chmod ugo+rw /home/maestro/scc/ods/*

# copy 'current' part documents to fileshare
if test $version = "VER"
then
	echo "copy versioned 'current' part documents"
	cp -a ../parts-1/* /home/maestro/scc/parts/
elif test $version = "NOVER"
then
	echo "copy un-versioned 'current' part documents"
	cp -a ../parts-1-nover/* /home/maestro/scc/parts/
else
	echo "ERROR: invalid [ VER | NOVER ]"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/parts/
chmod -R ugo+rw       /home/maestro/scc/parts/

echo "copy 'current' Parts&Vendors(TM) database"
# -a archive mode preserves file times
cp -a ../pv/pv-1.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

# copy 'current' data (CSV format) to fileshare
if test $mdbtools = "NOMDBTOOLS"
then
	echo "copy 'current' CSV files from repo"
	cp ../csv-1/* /home/maestro/scc/csv/
elif test $mdbtools = "MDBTOOLS"
then
	echo "copy 'current' CSV files by re-generating"
	./export_current_to_csv.sh
else
	echo "ERROR: invalid { MDBTOOLS }"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/csv/
chmod -R ugo+rw       /home/maestro/scc/csv/

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh

echo "preserve change report"
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-1.txt

read -t 60 -p "completed iteration 1 (prototype release), press [Enter] to continue..." key

echo
echo "Iteration 2 - Revise PCB"
echo "========================================"

echo "move 'current' csv to 'old' csv"
cp /home/maestro/scc/csv/* /home/maestro/scc/csv.old/

echo "copy 'current' master data spreadsheets and csv exports"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../ods/* /home/maestro/scc/ods/
#chown -R nobody:wheel /home/maestro/scc/ods/
chmod ugo+rw /home/maestro/scc/ods/*

# copy 'current' part documents to fileshare
if test $version = "VER"
then
	echo "copy versioned 'current' part documents"
	cp -a ../parts-2/* /home/maestro/scc/parts/
elif test $version = "NOVER"
then
	echo "copy un-versioned 'current' part documents"
	cp -a ../parts-2-nover/* /home/maestro/scc/parts/
else
	echo "ERROR: invalid [ VER | NOVER ]"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/parts/
chmod -R ugo+rw       /home/maestro/scc/parts/

echo "copy 'current' Parts&Vendors(TM) database"
# -a archive mode preserves file times
cp -a ../pv/pv-2.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

# copy 'current' data (CSV format) to fileshare
if test $mdbtools = "NOMDBTOOLS"
then
	echo "copy 'current' CSV files from repo"
	cp ../csv-2/* /home/maestro/scc/csv/
elif test $mdbtools = "MDBTOOLS"
then
	echo "copy 'current' CSV files by re-generating"
	./export_current_to_csv.sh
else
	echo "ERROR: invalid { MDBTOOLS }"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/csv/
chmod -R ugo+rw       /home/maestro/scc/csv/

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh

echo "preserve change report"
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-2.txt

read -t 60 -p "completed iteration 2 (revise PCB), press [Enter] to continue..." key

echo
echo "Iteration 3 - Product Release"
echo "========================================"

echo "move 'current' csv to 'old' csv"
cp /home/maestro/scc/csv/* /home/maestro/scc/csv.old/

echo "copy 'current' master data spreadsheets and csv exports"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../ods/* /home/maestro/scc/ods/
#chown -R nobody:wheel /home/maestro/scc/ods/
chmod ugo+rw /home/maestro/scc/ods/*

# copy 'current' part documents to fileshare
if test $version = "VER"
then
	echo "copy versioned 'current' part documents"
	cp -a ../parts-3/* /home/maestro/scc/parts/
elif test $version = "NOVER"
then
	echo "copy un-versioned 'current' part documents"
	cp -a ../parts-3-nover/* /home/maestro/scc/parts/
else
	echo "ERROR: invalid [ VER | NOVER ]"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/parts/
chmod -R ugo+rw       /home/maestro/scc/parts/

echo "copy 'current' Parts&Vendors(TM) database"
# -a archive mode preserves file times
cp -a ../pv/pv-3.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

# copy 'current' data (CSV format) to fileshare
if test $mdbtools = "NOMDBTOOLS"
then
	echo "copy 'current' CSV files from repo"
	cp ../csv-3/* /home/maestro/scc/csv/
elif test $mdbtools = "MDBTOOLS"
then
	echo "copy 'current' CSV files by re-generating"
	./export_current_to_csv.sh
else
	echo "ERROR: invalid { MDBTOOLS }"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/csv/
chmod -R ugo+rw       /home/maestro/scc/csv/

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh

echo "preserve change report"
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-3.txt

read -t 60 -p "completed iteration 3 (product release), press [Enter] to continue..." key

echo
echo "Iteration 4 - Manufacturing Improvements"
echo "========================================"

echo "move 'current' csv to 'old' csv"
cp /home/maestro/scc/csv/* /home/maestro/scc/csv.old/

echo "copy 'current' master data spreadsheets and csv exports"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../ods/* /home/maestro/scc/ods/
#chown -R nobody:wheel /home/maestro/scc/ods/
chmod ugo+rw /home/maestro/scc/ods/*

# copy 'current' part documents to fileshare
if test $version = "VER"
then
	echo "copy versioned 'current' part documents"
	cp -a ../parts-4/* /home/maestro/scc/parts/
elif test $version = "NOVER"
then
	echo "copy un-versioned 'current' part documents"
	cp -a ../parts-4-nover/* /home/maestro/scc/parts/
else
	echo "ERROR: invalid [ VER | NOVER ]"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/parts/
chmod -R ugo+rw       /home/maestro/scc/parts/

echo "copy 'current' Parts&Vendors(TM) database"
# -a archive mode preserves file times
cp -a ../pv/pv-4.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

# copy 'current' data (CSV format) to fileshare
if test $mdbtools = "NOMDBTOOLS"
then
	echo "copy 'current' CSV files from repo"
	cp ../csv-4/* /home/maestro/scc/csv/
elif test $mdbtools = "MDBTOOLS"
then
	echo "copy 'current' CSV files by re-generating"
	./export_current_to_csv.sh
else
	echo "ERROR: invalid { MDBTOOLS }"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/csv/
chmod -R ugo+rw       /home/maestro/scc/csv/

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh

echo "preserve change report"
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-4.txt

read -t 60 -p "completed iteration 4 (mfg improvements), press [Enter] to continue..." key

echo
echo "Iteration 5 - Field Service Support"
echo "========================================"

echo "move 'current' csv to 'old' csv"
cp /home/maestro/scc/csv/* /home/maestro/scc/csv.old/

echo "copy 'current' master data spreadsheets and csv exports"
# -a archive mode preserves file times
# no iterations for master data spreadsheets
cp -a ../ods/* /home/maestro/scc/ods/
#chown -R nobody:wheel /home/maestro/scc/ods/
chmod ugo+rw /home/maestro/scc/ods/*

# copy 'current' part documents to fileshare
if test $version = "VER"
then
	echo "copy versioned 'current' part documents"
	cp -a ../parts-5/* /home/maestro/scc/parts/
elif test $version = "NOVER"
then
	echo "copy un-versioned 'current' part documents"
	cp -a ../parts-5-nover/* /home/maestro/scc/parts/
else
	echo "ERROR: invalid [ VER | NOVER ]"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/parts/
chmod -R ugo+rw       /home/maestro/scc/parts/

echo "copy 'current' Parts&Vendors(TM) database"
# -a archive mode preserves file times
cp -a ../pv/pv-5.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

# copy 'current' data (CSV format) to fileshare
if test $mdbtools = "NOMDBTOOLS"
then
	echo "copy 'current' CSV files from repo"
	cp ../csv-5/* /home/maestro/scc/csv/
elif test $mdbtools = "MDBTOOLS"
then
	echo "copy 'current' CSV files by re-generating"
	./export_current_to_csv.sh
else
	echo "ERROR: invalid { MDBTOOLS }"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/csv/
chmod -R ugo+rw       /home/maestro/scc/csv/

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh

echo "preserve change report"
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-5.txt

echo "completed iteration 5 (field service support)"
#read -t 60 -p "completed iteration 5 (field service support), press [Enter] to continue..." key
echo

# Cleanup

exit 0
