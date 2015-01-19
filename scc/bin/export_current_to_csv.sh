#!/bin/sh
#
# Copy 'current' CSV data to csv/
# - first copy csv/ to csv.old/
# - programatically export csv from source to csv/ when possible
# - copy csv manually-exported from spreadsheets to csv/
#
# Schedule using cron in following order:
#   1. rsync_current_files.sh
#   2. export_current_to_csv.sh
#   3. send_current_change_report.sh
#      - rsync_current_files.sh and export_current_to_csv.sh MUST complete first
#
# csv.old MUST contain valid data; bootstrap csv.old with "null" data prior to running for first time:
#
#   head -n 1 /home/maestro/maestro-repo/scc/csv-1/pv_pn.csv > /home/maestro/scc/csv.old/pv_pn.csv
#   /home/maestro/maestro-repo/scc/bin/pndetails.py /home/maestro/scc/csv.old/pv_pn.csv /home/maestro/scc/csv.old/pv_pn_details.csv
#   sort /home/maestro/scc/csv.old/pv_pn_details.csv  > /home/maestro/scc/csv.old/pv_pn_details_sort.csv
#   #chown -R nobody:wheel /home/maestro/scc/csv.old/
#   chmod ugo+rw /home/maestro/scc/csv.old/*
#   echo
#

echo
echo "export_current_to_csv: copy csv/* to csv.old/"
cp -a /home/maestro/scc/csv/* /home/maestro/scc/csv.old/
echo

echo "export_current_to_csv: person spreadsheet - NOT exported"
# Manually Save/As Z:\ods\person.ods to Z:\ods\person.csv
# before running this script.
#
cp -af /home/maestro/scc/ods/person-tryton-user.csv /home/maestro/scc/csv/
echo

echo "export_current_to_csv: issue spreadsheet - NOT exported"
# Manually Save/As Z:\ods\issue.ods to Z:\ods\issue.csv
# before running this script.
# 
cp -af /home/maestro/scc/ods/issue-tryton.csv /home/maestro/scc/csv/
echo

echo "export_current_to_csv: project spreadsheet - NOT exported"
# Manually Save/As Z:\ods\project.ods to Z:\ods\project.csv
# before running this script.
cp /home/maestro/scc/ods/project-tryton.csv /home/maestro/scc/csv/
echo

echo "export_current_to_csv: stock location spreadsheet - NOT exported"
# Manually Save/As from Z:\ods\stock_location.ods to Z:\ods\stock_location-tryton.csv"
# before running this script."
# 
cp /home/maestro/scc/ods/stock_location-tryton.csv /home/maestro/scc/csv/
echo

echo "export_current_to_csv: stock serial number spreadsheet - NOT exported"
# Manually Save/As from Z:\ods\stock_serial.ods to Z:\ods\stock_serial-tryton.csv"
# before running this script."
# 
cp /home/maestro/scc/ods/stock_serial.csv /home/maestro/scc/csv/
echo

echo "export_current_to_csv: parts (Parts&Vendors) - exporting...."
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb AL    > /home/maestro/scc/csv/pv_al.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb CNV   > /home/maestro/scc/csv/pv_cnv.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb COST  > /home/maestro/scc/csv/pv_cost.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb CU    > /home/maestro/scc/csv/pv_cu.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb CUR   > /home/maestro/scc/csv/pv_cur.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb FIL   > /home/maestro/scc/csv/pv_fil.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb HIST  > /home/maestro/scc/csv/pv_hist.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb HPREF > /home/maestro/scc/csv/pv_hpref.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb JOB   > /home/maestro/scc/csv/pv_job.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb LIN   > /home/maestro/scc/csv/pv_lin.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb LNK   > /home/maestro/scc/csv/pv_lnk.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb MF    > /home/maestro/scc/csv/pv_mf.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb MFR   > /home/maestro/scc/csv/pv_mfr.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb MFRPN > /home/maestro/scc/csv/pv_mfrpn.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb ORG   > /home/maestro/scc/csv/pv_org.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb PL    > /home/maestro/scc/csv/pv_pl.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb PLL   > /home/maestro/scc/csv/pv_pll.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb PN    > /home/maestro/scc/csv/pv_pn.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb PO    > /home/maestro/scc/csv/pv_po.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb POD   > /home/maestro/scc/csv/pv_pod.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb POM   > /home/maestro/scc/csv/pv_pom.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb RPX   > /home/maestro/scc/csv/pv_rpx.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb SHIP  > /home/maestro/scc/csv/pv_ship.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb SU    > /home/maestro/scc/csv/pv_su.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb TASK  > /home/maestro/scc/csv/pv_task.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb TYPE  > /home/maestro/scc/csv/pv_type.csv
/usr/local/bin/mdb-export -D "%F" /home/maestro/scc/pv/pv.mdb UN    > /home/maestro/scc/csv/pv_un.csv
echo

# MUST bootstrap csv.old/ with PN change history on first-time run
#
# On first-time run, csv.old/ will be empty and send_current_change_report.sh
# will fail due to missing files for current-vs-previous analysis.
#
# Uncomment following commands for first-time run (and re-comment after), or
# execute commands manually.
#
#head -n 1 /home/samba/bhi/csv/pv_pn.csv > /home/maestro/scc/csv.old/pv_pn.csv
#/usr/local/maestro/bin/pndetails.py /home/maestro/scc/csv.old/pv_pn.csv /home/maestro/scc/csv.old/pv_pn_details.csv
#sort /home/maestro/scc/csv.old/pv_pn_details.csv  > /home/maestro/scc/csv.old/pv_pn_details_sort.csv

exit 0
