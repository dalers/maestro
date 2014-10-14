#!/bin/sh
#
# Create or copy "current" csv to csv/
# - copy csv/ to csv.old/
# - export csv from source db to csv/ when possible
# - copy manually-exported csv to csv/
#
# MUST perform bootstrap if first-time run (see bottom of file)
#
# Schedule using cron as follows:
#   1. rsync_current_files.sh
#      - rsync MUST complete before send_current_change_report.sh runs
#   2. export_current_to_csv.sh
#   3. send_current_change_report.sh
#

echo
echo "export_current_to_csv: copy csv/ to csv.old/"
cp -a /home/samba/scc/csv/ /home/samba/scc/csv.old/
echo

echo "export_current_to_csv: person spreadsheet - NOT exported"
# Manually Save/As Z:\ods\person.ods to Z:\ods\person.csv
# before running this script.
#
cp -af /home/samba/scc/ods/person-tryton-user.csv /home/samba/scc/csv/
echo

echo "export_current_to_csv: issue spreadsheet - NOT exported"
# Manually Save/As Z:\ods\issue.ods to Z:\ods\issue.csv
# before running this script.
# 
cp -af /home/samba/scc/ods/issue-tryton.csv /home/samba/scc/csv/
echo

echo "export_current_to_csv: project spreadsheet - NOT exported"
# Manually Save/As Z:\ods\project.ods to Z:\ods\project.csv
# before running this script.
cp /home/samba/scc/ods/project-tryton.csv /home/samba/scc/csv/
echo

echo "export_current_to_csv: stock location spreadsheet - NOT exported"
# Manually Save/As from Z:\ods\stock_location.ods to Z:\ods\stock_location-tryton.csv"
# before running this script."
# 
cp /home/samba/scc/ods/stock_location-tryton.csv /home/samba/scc/csv/
echo

echo "export_current_to_csv: stock serial number spreadsheet - NOT exported"
# Manually Save/As from Z:\ods\stock_serial.ods to Z:\ods\stock_serial-tryton.csv"
# before running this script."
# 
cp /home/samba/scc/ods/stock_serial.csv /home/samba/scc/csv/
echo

echo "export_current_to_csv: parts (Parts&Vendors) - exporting...."
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb AL    > /home/samba/scc/csv/pv_al.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb CNV   > /home/samba/scc/csv/pv_cnv.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb COST  > /home/samba/scc/csv/pv_cost.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb CU    > /home/samba/scc/csv/pv_cu.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb CUR   > /home/samba/scc/csv/pv_cur.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb FIL   > /home/samba/scc/csv/pv_fil.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb HIST  > /home/samba/scc/csv/pv_hist.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb HPREF > /home/samba/scc/csv/pv_hpref.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb JOB   > /home/samba/scc/csv/pv_job.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb LIN   > /home/samba/scc/csv/pv_lin.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb LNK   > /home/samba/scc/csv/pv_lnk.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb MF    > /home/samba/scc/csv/pv_mf.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb MFR   > /home/samba/scc/csv/pv_mfr.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb MFRPN > /home/samba/scc/csv/pv_mfrpn.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb ORG   > /home/samba/scc/csv/pv_org.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb PL    > /home/samba/scc/csv/pv_pl.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb PLL   > /home/samba/scc/csv/pv_pll.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb PN    > /home/samba/scc/csv/pv_pn.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb PO    > /home/samba/scc/csv/pv_po.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb POD   > /home/samba/scc/csv/pv_pod.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb POM   > /home/samba/scc/csv/pv_pom.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb RPX   > /home/samba/scc/csv/pv_rpx.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb SHIP  > /home/samba/scc/csv/pv_ship.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb SU    > /home/samba/scc/csv/pv_su.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb TASK  > /home/samba/scc/csv/pv_task.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb TYPE  > /home/samba/scc/csv/pv_type.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/scc/pv/pv.mdb UN    > /home/samba/scc/csv/pv_un.csv
echo

# MUST bootstrap csv.old/ with PN change history on first-time run
#
# On first-time run, csv.old/ will be empty and send_current_change_report.sh
# will fail due to missing files for current-vs-previous analysis.
#
# Uncomment following commands for first-time run (and re-comment after), or
# execute commands manually.
#
#head -n 1 /home/samba/bhi/csv/pv_pn.csv > /home/samba/scc/csv.old/pv_pn.csv
#/usr/local/maestro/bin/pndetails.py /home/samba/scc/csv.old/pv_pn.csv /home/samba/scc/csv.old/pv_pn_details.csv
#sort /home/samba/scc/csv.old/pv_pn_details.csv  > /home/samba/scc/csv.old/pv_pn_details_sort.csv

exit 0
