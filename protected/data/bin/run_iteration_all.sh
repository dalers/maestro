#!/bin/sh
#
# "run" Aircraft Wireless PLM iterations
# - run from /home/maestro/maestro-repo/scc/bin/
# - /home/maestro/ MUST exist with r/w permission
# - select either versioned or un-versioned document filenames
# - select csv data from repo or exported live via mdbtools
#
# TODO fix script to copy master spreadsheet csv to csv/ if NOMDBTOOLS
#
# Steps through successive iterations of data as if processed in real
# time (e.g. as if scheduled nightly using cron with one iteration per
# day).
#
# For each iteration:
#   - copy csv/* -> csv.old/ (except for initial iteration)
#   - restore 'current' master spreadsheets and csv files
#   - restore 'current' part documents
#   - restore 'current' parts&vendors database
#   - restore and/or re-generate 'current' csv files (export_current_to_csv.sh)
#       !!! master spreadsheet csv is restored ONLY if MDBTOOLS
#   - control 'current' part files (rsync_current_files.sh)
#   - send change report (send_current_change_report.sh)
#   - TODO load 'current' into maestro db
#
# SCC data structure in Maestro git repo
# ------------------------
#    /usr/local/www/maestro/protected/data
#    +-- bin/                     shell scripts and referenced sql scripts
#    +-- doc/                     scc ad-hoc documents (not specifically part or material-related)
#    +-- doc-logo/                scc logo graphics
#    +-- ldap/                    OpenLDAP related files
#    +-- ganttproject/            GanttProject project-planning-related files
#    +-- mantis/                  Mantis Bugtracker related files
#    +-- ods/                     master data spreadsheets with export csv
#    +-- parts/                   stub directory to create temp consolidated parts/ for developer convenience (.gitignore)
#    +-- parts-1..5/              part documents by iteration WITH revision in filename
#    |   +-- 10000001/
#    |   |   \-- 10000001_PBS-00.pdf
#    |   ...
#    +-- parts-1..5-nover/         part documents by iteration WITHOUT revision in filename
#    |   +-- 10000001/
#    |   |   \-- 10000001_PBS.pdf
#    |   ...
#    |-- pv/                      parts&vendors database for each iteration
#    |   +-- pv-1.mdb             iteration 1
#    |   +-- pv-2.mdb
#    |   +-- pv-3.mdb
#    |   +-- pv-n.mdb
#    +-- squirrelmail             SquirrelMail related files
#    +-- tdl/                     ToDoList related files
#    +-- web/                     simple HTML portal
#    \-- wp/                      WordPress related files
#    \-- README.txt               readme for file share (MS format for access by MS Windows-type clients)
#
# SCC file share structure
# ------------------------
#    /home/maestro/scc/
#    +-- csv/                     current P&V and master data spreadsheet csv export
#    +-- csv.old/                 previous csv export
#    +-- docs/                    current ad-hoc documents
#    +-- docs.rsync/              controlled ad-hoc documents
#    +-- material/                current material documents
#    +-- material.rsync/          controlled material documents
#    +-- ods/                     current master spreadsheets with csv
#    +-- parts/                   current part documents
#    +-- parts.rsync/             controlled part documents
#    +-- pv/                      parts&vendors database files
#    \-- work/                    iteration change management working files 
#

if test $# = 0
then
    echo
    echo "  ERROR: no arguments"
    echo "  Usage: $0 [ VER | NOVER ]" 1>&2
    echo
    exit 1
elif test $# = 1
then
    version=$1
    echo "Using '$version' documents"
else
    echo
    echo "  ERROR: too many arguments"
    echo "  Usage: $0 [ VER | NOVER ]" 1>&2
    echo
    exit 1
fi

echo
echo "Setup"
echo "======================================="

echo "run setup_file_share.sh (delete/re-create /home/maestro/scc/...)"
./setup_file_share.sh

echo "This directory is used by Maestro" > /home/maestro/scc/README.txt
# ensure README has Windows-type EOL
flip -m /home/maestro/scc/README.txt

echo "run setup_fix_iteration_datetime.sh"
./setup_fix_iteration_datetime.sh

echo "create 'null' files in csv.old/ (pv_pn.csv, pv_pn_details.csv, pv_pn_details_sort.csv)"
head -n 1 ../csv-pv-1/pv_pn.csv > /home/maestro/scc/csv.old/pv_pn.csv
./get_pv_pn_details.py /home/maestro/scc/csv.old/pv_pn.csv /home/maestro/scc/csv.old/pv_pn_details.csv
# sorting doesn't accomplish anything but required bootstrap file does get created
sort /home/maestro/scc/csv.old/pv_pn_details.csv  > /home/maestro/scc/csv.old/pv_pn_details_sort.csv
#chown -R nobody:wheel /home/maestro/scc/csv.old/
chmod ugo+rw /home/maestro/scc/csv.old/*

echo
read -t 60 -p "setup complete - Press [Enter] to continue..." key

echo
echo "Iteration 1 - Prototype Release"
echo "========================================"

# don't "cp csv csv.old" on initial iteration

# restore master spreadsheets with csv
echo "restore 'current' master spreadsheets with csv"
cp ../ods/* /home/maestro/scc/ods

# restore GanttProject project file with csv
echo "restore 'current' GanttProject file with csv"
cp ../ganttproject/project.gan /home/maestro/scc/ods
# hack for development until PhpProject interface to xml is working
# manually edit GanttProject "export-as-csv" and delete resources (giving activities only)
#cp ../ganttproject/project.csv /home/maestro/scc/ods
cp ../ganttproject/project-activity.csv /home/maestro/scc/ods/project.csv

# copy 'current' part documents to fileshare
if test $version = "VER"
then
	echo "restore versioned 'current' part documents"
	cp -a ../parts-1/* /home/maestro/scc/parts/
elif test $version = "NOVER"
then
	echo "restore un-versioned 'current' part documents"
	cp -a ../parts-1-nover/* /home/maestro/scc/parts/
else
	echo "ERROR: invalid [ VER | NOVER ]"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/parts/
chmod -R ugo+rw       /home/maestro/scc/parts/

echo "restore 'current' parts&vendors database"
# -a archive mode preserves file times
cp -a ../pv/pv-1.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

echo "run export_current_to_csv.sh"
./export_current_to_csv.sh
#chown -R nobody:wheel /home/maestro/scc/csv/
chmod -R ugo+rw       /home/maestro/scc/csv/

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh
# preserve change report
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-1.txt

#echo "load_current_from_csv.sh"
#./load_current_from_csv.sh

echo
read -t 60 -p "iteration 1 complete - Press [Enter] to continue..." key

echo
echo "Iteration 2 - Revise PCB"
echo "========================================"

echo "move 'current' csv to 'old' csv"
cp /home/maestro/scc/csv/* /home/maestro/scc/csv.old/

# restore master spreadsheets with csv
echo "restore 'current' master spreadsheets and csv"
cp ../ods/* /home/maestro/scc/ods

# restore GanttProject project file with csv
echo "restore 'current' GanttProject file with csv"
cp ../ganttproject/project.gan /home/maestro/scc/ods
# hack for development until PhpProject interface to xml is working
# manually edit GanttProject "export-as-csv" and delete resources (giving activities only)
#cp ../ganttproject/project.csv /home/maestro/scc/ods
cp ../ganttproject/project-activity.csv /home/maestro/scc/ods/project.csv

# copy 'current' part documents to fileshare
if test $version = "VER"
then
	echo "restore versioned 'current' part documents"
	cp -a ../parts-2/* /home/maestro/scc/parts/
elif test $version = "NOVER"
then
	echo "restore un-versioned 'current' part documents"
	cp -a ../parts-2-nover/* /home/maestro/scc/parts/
else
	echo "ERROR: invalid [ VER | NOVER ]"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/parts/
chmod -R ugo+rw       /home/maestro/scc/parts/

echo "restore 'current' parts&vendors database"
# -a archive mode preserves file times
cp -a ../pv/pv-2.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

echo "run export_current_to_csv.sh"
./export_current_to_csv.sh
#chown -R nobody:wheel /home/maestro/scc/csv/
chmod -R ugo+rw       /home/maestro/scc/csv/

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh
# preserve change report
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-2.txt

#echo "load_current_from_csv.sh"
#./load_current_from_csv.sh

echo
read -t 60 -p "iteration 2 complete - Press [Enter] to continue..." key

echo
echo "Iteration 3 - Product Release"
echo "========================================"

# restore master spreadsheets with csv
echo "restore 'current' master spreadsheets and csv"
cp ../ods/* /home/maestro/scc/ods

echo "move 'current' csv to 'old' csv"
cp /home/maestro/scc/csv/* /home/maestro/scc/csv.old/

# restore GanttProject project file with csv
echo "restore 'current' GanttProject file with csv"
cp ../ganttproject/project.gan /home/maestro/scc/ods
# hack for development until PhpProject interface to xml is working
# manually edit GanttProject "export-as-csv" and delete resources (giving activities only)
#cp ../ganttproject/project.csv /home/maestro/scc/ods
cp ../ganttproject/project-activity.csv /home/maestro/scc/ods/project.csv

# copy 'current' part documents to fileshare
if test $version = "VER"
then
	echo "restore versioned 'current' part documents"
	cp -a ../parts-3/* /home/maestro/scc/parts/
elif test $version = "NOVER"
then
	echo "restore un-versioned 'current' part documents"
	cp -a ../parts-3-nover/* /home/maestro/scc/parts/
else
	echo "ERROR: invalid [ VER | NOVER ]"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/parts/
chmod -R ugo+rw       /home/maestro/scc/parts/

echo "restore 'current' parts&vendors database"
# -a archive mode preserves file times
cp -a ../pv/pv-3.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

echo "run export_current_to_csv.sh"
./export_current_to_csv.sh
#chown -R nobody:wheel /home/maestro/scc/csv/
chmod -R ugo+rw       /home/maestro/scc/csv/

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh
# preserve change report
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-3.txt

#echo "load_current_from_csv.sh"
#./load_current_from_csv.sh

echo
read -t 60 -p "iteration 3 complete - Press [Enter] to continue..." key

echo
echo "Iteration 4 - Manufacturing Improvements"
echo "========================================"

echo "move 'current' csv to 'old' csv"
cp /home/maestro/scc/csv/* /home/maestro/scc/csv.old/

# restore master spreadsheets with csv
echo "restore 'current' master spreadsheets and csv"
cp ../ods/* /home/maestro/scc/ods

# restore GanttProject project file with csv
echo "restore 'current' GanttProject file with csv"
cp ../ganttproject/project.gan /home/maestro/scc/ods
# hack for development until PhpProject interface to xml is working
# manually edit GanttProject "export-as-csv" and delete resources (giving activities only)
#cp ../ganttproject/project.csv /home/maestro/scc/ods
cp ../ganttproject/project-activity.csv /home/maestro/scc/ods/project.csv

# copy 'current' part documents to fileshare
if test $version = "VER"
then
	echo "restore versioned 'current' part documents"
	cp -a ../parts-4/* /home/maestro/scc/parts/
elif test $version = "NOVER"
then
	echo "restore un-versioned 'current' part documents"
	cp -a ../parts-4-nover/* /home/maestro/scc/parts/
else
	echo "ERROR: invalid [ VER | NOVER ]"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/parts/
chmod -R ugo+rw       /home/maestro/scc/parts/

echo "restore 'current' parts&vendors database"
# -a archive mode preserves file times
cp -a ../pv/pv-4.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

echo "run export_current_to_csv.sh"
./export_current_to_csv.sh
#chown -R nobody:wheel /home/maestro/scc/csv/
chmod -R ugo+rw       /home/maestro/scc/csv/

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh
# preserve change report
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-4.txt

#echo "load_current_from_csv.sh"
#./load_current_from_csv.sh

echo
read -t 60 -p "iteration 4 complete - Press [Enter] to continue..." key

echo
echo "Iteration 5 - Field Service Support"
echo "========================================"

echo "move 'current' csv to 'old' csv"
cp /home/maestro/scc/csv/* /home/maestro/scc/csv.old/

# restore master spreadsheets with csv
echo "restore 'current' master spreadsheets and csv"
cp ../ods/* /home/maestro/scc/ods

# restore GanttProject project file with csv
echo "restore 'current' GanttProject file with csv"
cp ../ganttproject/project.gan /home/maestro/scc/ods
# hack for development until PhpProject interface to xml is working
# manually edit GanttProject "export-as-csv" and delete resources (giving activities only)
#cp ../ganttproject/project.csv /home/maestro/scc/ods
cp ../ganttproject/project-activity.csv /home/maestro/scc/ods/project.csv

# restore 'current' part documents to fileshare
if test $version = "VER"
then
	echo "restore versioned 'current' part documents"
	cp -a ../parts-5/* /home/maestro/scc/parts/
elif test $version = "NOVER"
then
	echo "restore un-versioned 'current' part documents"
	cp -a ../parts-5-nover/* /home/maestro/scc/parts/
else
	echo "ERROR: invalid [ VER | NOVER ]"
	echo
	exit 1
fi
#chown -R nobody:wheel /home/maestro/scc/parts/
chmod -R ugo+rw       /home/maestro/scc/parts/

echo "restore 'current' parts&vendors database"
# -a archive mode preserves file times
cp -a ../pv/pv-5.mdb /home/maestro/scc/pv/pv.mdb
#chown -R nobody:wheel /home/maestro/scc/pv/
chmod ugo+rw /home/maestro/scc/pv/*

echo "run export_current_to_csv.sh"
./export_current_to_csv.sh
#chown -R nobody:wheel /home/maestro/scc/csv/
chmod -R ugo+rw       /home/maestro/scc/csv/

echo "run rsync_current_files.sh"
./rsync_current_files.sh

echo "run send_current_change_report.sh"
./send_current_change_report.sh

echo "preserve change report"
cp /home/maestro/scc/work/current_changereport.txt  /home/maestro/scc/work/current_changereport-5.txt

#echo "load_current_from_csv.sh"
#./load_current_from_csv.sh

echo
echo "iteration 5 complete"

echo
echo "Clean-up"
echo "========================================"

echo
exit 0
