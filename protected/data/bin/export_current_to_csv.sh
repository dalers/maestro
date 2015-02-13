#!/bin/sh
#
# Copy 'current' CSV data to csv/
# - obtain from source if possible (e.g. spreadsheet or other db)
#
# Schedule using cron in following order:
#   1. rsync_current_files.sh
#   2. export_current_to_csv.sh
#   3. send_current_change_report.sh
#

# persons
echo "export_current_to_csv: persons - NOT exported"
echo "  - using Z:\ods\person.csv"
cp -af /home/maestro/scc/ods/person.csv /home/maestro/scc/csv/

# issues
echo "export_current_to_csv: issues - NOT exported"
echo "  - using Z:\ods\issue.csv"
cp -af /home/maestro/scc/ods/issue.csv /home/maestro/scc/csv/

# projects
echo "export_current_to_csv: projects - NOT exported"
echo "  - using Z:\ods\project.csv"
cp /home/maestro/scc/ods/project.csv /home/maestro/scc/csv/

# stock locations
echo "export_current_to_csv: stock locations - NOT exported"
echo "  - using Z:\ods\stock_location.csv"
cp /home/maestro/scc/ods/stock_location.csv /home/maestro/scc/csv/

# stock serial numbers
echo "export_current_to_csv: stock serial numbers - NOT exported"
echo "  - using Z:\ods\stock_serial.csv"
cp /home/maestro/scc/ods/stock_serial.csv /home/maestro/scc/csv/

# part numbers and BOMs
echo "export_current_to_csv: exporting from Parts&Vendors database"
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

exit 0
