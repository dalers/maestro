#!/bin/sh
#
# Create current csv from source files (mdb, xlsx...)
# - copies master data spreadsheet csv from scc/excel to scc/csv
# - export csv from sources to scc/csv/
# - file paths HARDCODED
#

echo "export_current_to_csv: person spreadsheet - NOT exported"
echo
echo "  Manually Save/As Z:\excel\person.xlsx to Z:\excel\person.csv"
echo "  before running this script."
echo
cp -af /home/samba/scc/excel/person.csv /home/samba/scc/csv/

echo "export_current_to_csv: issue spreadsheet - NOT exported"
echo
echo "  Manually Save/As from Z:\excel\issue.xlsx to Z:\excel\issue.csv"
echo "  before running this script."
echo
cp -af /home/samba/scc/excel/issue.csv /home/samba/scc/csv/

echo "export_current_to_csv: project spreadsheet - NOT exported"
echo
echo "  Manually Save/As from project.xlsx to X:\remotefs\project.csv"
echo "  before running this script."
echo
cp /home/samba/scc/excel/project.csv /home/samba/scc/csv/

echo "export_current_to_csv: stock location spreadsheet - NOT exported"
echo
echo "  Manually Save/As from stock_location.xlsx to X:\remotefs\stock_location.csv"
echo "  before running this script."
echo
cp /home/samba/scc/excel/stock_location.csv /home/samba/scc/csv/

echo "export_current_to_csv: serial number spreadsheet - NOT exported"
echo
echo "  Manually Save/As from stock_serial.xlsx to X:\remotefs\stock_serial.csv"
echo "  before running this script."
echo
cp /home/samba/scc/excel/stock_serial.csv /home/samba/scc/csv/

echo "export_current_to_csv: Parts (Parts&Vendors) - exporting...."
echo
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

exit 0
