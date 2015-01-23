#!/bin/sh
#
# "run" Aircraft Wireless PLM iterations sequentially
# - run from /home/maestro/maestro-repo/scc/bin/
# - /home/maestro/ MUST exist with r/w permission
# - select either versioned or un-versioned document filenames
# - select csv data from repo or exported live
#
# Process Aircraft Wireless PLM iterations in order
#
# Description
# ------------------------------------------
# Steps through successive iterations of data as if processed in real
# time (e.g. scheduled nightly using cron). For each iteration:
#
#   * csv/ -> csv.old/
#   * restore current csv (from Parts&Vendors and spreadsheet data)
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
    echo "  Usage: $0 [ VER | NOVER ]  { EXPORT }" 1>&2
    echo
    exit 1
elif test $# = 1
then
    version=$1
    export="NOEXPORT"
    echo "Maestro - running iterations for '$version' documents and '$export'"
elif test $# = 2
then
    version=$1
    export=$2
    echo "Maestro - running iterations for '$version' documents and '$export'"
else
    echo
    echo "  ERROR: too many arguments"
    echo "  Usage: $0 [ VER | NOVER ]  { EXPORT }" 1>&2
    echo
    exit 1
fi

echo
echo "Setup"
echo "======================================="

echo "start with clean /home/maestro/scc/... (delete and setup_file_share.sh)"
./setup_file_share.sh
echo "This directory is used by Maestro" > /home/maestro/scc/README.txt
# ensure README has Windows-type EOL
# BSD flip -m /home/maestro/scc/README.txt
unix2dos /home/maestro/scc/README.txt

echo "run setup_fix_iteration_datetime.sh"
./setup_fix_iteration_datetime.sh

echo "restore spreadsheet master source data"
# -a archive mode preserves file times
# spreadsheet source data does not include iterations
cp -a ../ods/* /home/maestro/scc/ods/
#chown -R nobody:wheel /home/maestro/scc/ods/
chmod ugo+rw /home/maestro/scc/ods/*

echo
echo "setup complete"
#read -t 60 -p "setup complete, press [Enter] to continue..." key

echo
echo "Iteration 1 - Prototype Release"
echo "========================================"

echo "create bootstrap files"
# csv.old/pv_pn
head -n 1 /home/maestro/maestro-repo/scc/csv-1/pv_pn.csv > /home/maestro/scc/csv.old/pv_pn.csv
./pndetails.py /home/maestro/scc/csv.old/pv_pn.csv /home/maestro/scc/csv.old/pv_pn_details.csv
sort /home/maestro/scc/csv.old/pv_pn_details.csv  > /home/maestro/scc/csv.old/pv_pn_details_sort.csv
# csv.old/pv_pl
head -n 1 /home/maestro/maestro-repo/scc/csv-1/pv_pl.csv > /home/maestro/scc/csv.old/pv_pl.csv
# work/
touch /home/maestro/scc/work/rsync-parts.log

echo "restore 'current' Parts&Vendors database"
# -a archive mode preserves file times
cp -a ../pv/pv-1.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

echo "restore 'current' csv"
if test $export = "NOEXPORT"
then
	echo "restore Parts&Vendors csv export from mastro repo"
	cp ../csv-1/* /home/maestro/scc/csv/
	echo "restore spreadsheet master source csv from maestro repo"
    cp ../ods/*.csv /home/maestro/scc/csv
elif test $export = "EXPORT"
then
	echo "export csv from Parts&Vendors and master spreadsheets"
	./export_current_to_csv.sh
else
	echo "ERROR: invalid { EXPORT }"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/csv/
#chmod -R ugo+rw       /home/maestro/scc/csv/

# restore 'current' part documents
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

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh
# preserve current change report
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-1.txt

echo
read -t 60 -p "iteration 1 complete, press [Enter] to continue..." key

echo
echo "Iteration 2 - Revise PCB"
echo "========================================"

# csv -> csv.old/
echo "delete csv.old/ and rename /csv to csv.old/"
rm -rf /home/maestro/scc/csv.old
mv /home/maestro/scc/csv /home/maestro/scc/csv.old
mkdir /home/maestro/scc/csv

echo "restore 'current' Parts&Vendors database"
# -a archive mode preserves file times
cp -a ../pv/pv-2.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

echo "restore 'current' csv"
if test $export = "NOEXPORT"
then
	echo "restore Parts&Vendors csv export from mastro repo"
	cp ../csv-2/* /home/maestro/scc/csv/
	echo "restore spreadsheet master source csv from maestro repo"
    cp ../ods/*.csv /home/maestro/scc/csv
elif test $export = "EXPORT"
then
	echo "export csv from Parts&Vendors and master spreadsheets"
	./export_current_to_csv.sh
else
	echo "ERROR: invalid { EXPORT }"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/csv/
#chmod -R ugo+rw       /home/maestro/scc/csv/

# restore 'current' part documents
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

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh
# preserve current change report
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-2.txt

echo
read -t 60 -p "iteration 2 complete, press [Enter] to continue..." key

echo
echo "Iteration 3 - Product Release"
echo "========================================"

# csv -> csv.old/
echo "delete csv.old/ and rename /csv to csv.old/"
rm -rf /home/maestro/scc/csv.old
mv /home/maestro/scc/csv /home/maestro/scc/csv.old
mkdir /home/maestro/scc/csv

echo "restore 'current' Parts&Vendors database"
# -a archive mode preserves file times
cp -a ../pv/pv-3.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

echo "restore 'current' csv"
if test $export = "NOEXPORT"
then
	echo "restore Parts&Vendors csv export from mastro repo"
	cp ../csv-3/* /home/maestro/scc/csv/
	echo "restore spreadsheet master source csv from maestro repo"
    cp ../ods/*.csv /home/maestro/scc/csv
elif test $export = "EXPORT"
then
	echo "export csv from Parts&Vendors and master spreadsheets"
	./export_current_to_csv.sh
else
	echo "ERROR: invalid { EXPORT }"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/csv/
#chmod -R ugo+rw       /home/maestro/scc/csv/

# restore 'current' part documents
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

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh
# preserve current change report
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-3.txt

echo
read -t 60 -p "iteration 3 complete, press [Enter] to continue..." key

echo
echo "Iteration 4 - Manufacturing Improvements"
echo "========================================"

# csv -> csv.old/
echo "delete csv.old/ and rename /csv to csv.old/"
rm -rf /home/maestro/scc/csv.old
mv /home/maestro/scc/csv /home/maestro/scc/csv.old
mkdir /home/maestro/scc/csv

echo "restore 'current' Parts&Vendors database"
# -a archive mode preserves file times
cp -a ../pv/pv-4.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

echo "restore 'current' csv"
if test $export = "NOEXPORT"
then
	echo "restore Parts&Vendors csv export from mastro repo"
	cp ../csv-4/* /home/maestro/scc/csv/
	echo "restore spreadsheet master source csv from maestro repo"
    cp ../ods/*.csv /home/maestro/scc/csv
elif test $export = "EXPORT"
then
	echo "export csv from Parts&Vendors and master spreadsheets"
	./export_current_to_csv.sh
else
	echo "ERROR: invalid { EXPORT }"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/csv/
#chmod -R ugo+rw       /home/maestro/scc/csv/

# restore 'current' part documents
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

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh
# preserve current change report
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-4.txt

echo
read -t 60 -p "iteration 4 complete, press [Enter] to continue..." key

echo
echo "Iteration 5 - Field Service Support"
echo "========================================"

# csv -> csv.old/
echo "delete csv.old/ and rename /csv to csv.old/"
rm -rf /home/maestro/scc/csv.old
mv /home/maestro/scc/csv /home/maestro/scc/csv.old
mkdir /home/maestro/scc/csv

echo "restore 'current' Parts&Vendors database"
# -a archive mode preserves file times
cp -a ../pv/pv-5.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

echo "restore 'current' csv"
if test $export = "NOEXPORT"
then
	echo "restore Parts&Vendors csv export from mastro repo"
	cp ../csv-5/* /home/maestro/scc/csv/
	echo "restore spreadsheet master source csv from maestro repo"
    cp ../ods/*.csv /home/maestro/scc/csv
elif test $export = "EXPORT"
then
	echo "export csv from Parts&Vendors and master spreadsheets"
	./export_current_to_csv.sh
else
	echo "ERROR: invalid { EXPORT }"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/csv/
#chmod -R ugo+rw       /home/maestro/scc/csv/

# restore 'current' part documents
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

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh
# preserve current change report
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-5.txt

echo
#read -t 60 -p "iteration 5 complete, press [Enter] to continue..." key
echo "iteration 5 complete"

# Cleanup

echo
exit 0
