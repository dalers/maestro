#!/bin/sh
#
# Create current csv from source files (mdb, xlsx...)
# - copies master data spreadsheet csv from maestro/remotesfs to maestro/csv
# - programatically exports csv from sources to epd2/csv
# - file paths HARDCODED
# - REQUIRES /home/samba/maestro/remotefs/, maestro/csv/, maestro/csv.old/
#

echo "export_current_to_csv: person spreadsheet - NOT exported"
echo
echo "  Manually Save/As from person.xlsx to X:\remotefs\person.csv"
echo "  before running this script."
echo
cp -af /home/samba/maestro/remotefs/person.csv /home/samba/maestro/csv/

echo "export_current_to_csv: issue spreadsheet - NOT exported"
echo
echo "  Manually Save/As from issue.xlsx to X:\remotefs\issue.csv"
echo "  before running this script."
echo
cp -af /home/samba/maestro/remotefs/issue.csv /home/samba/maestro/csv/

echo "export_current_to_csv: project spreadsheet - NOT exported"
echo
echo "  Manually Save/As from project.xlsx to X:\remotefs\project.csv"
echo "  before running this script."
echo
cp /home/samba/maestro/remotefs/project.csv /home/samba/maestro/csv/

echo "export_current_to_csv: stock location spreadsheet - NOT exported"
echo
echo "  Manually Save/As from stock_location.xlsx to X:\remotefs\stock_location.csv"
echo "  before running this script."
echo
cp /home/samba/maestro/remotefs/stock_location.csv /home/samba/maestro/csv/

echo "export_current_to_csv: serial number spreadsheet - NOT exported"
echo
echo "  Manually Save/As from stock_serial.xlsx to X:\remotefs\stock_serial.csv"
echo "  before running this script."
echo
cp /home/samba/maestro/remotefs/stock_serial.csv /home/samba/maestro/csv/

echo "export_current_to_csv: Parts (Parts&Vendors) - exporting...."
echo
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb AL    > /home/samba/maestro/csv/pv_al.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb CNV   > /home/samba/maestro/csv/pv_cnv.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb COST  > /home/samba/maestro/csv/pv_cost.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb CU    > /home/samba/maestro/csv/pv_cu.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb CUR   > /home/samba/maestro/csv/pv_cur.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb FIL   > /home/samba/maestro/csv/pv_fil.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb HIST  > /home/samba/maestro/csv/pv_hist.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb HPREF > /home/samba/maestro/csv/pv_hpref.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb JOB   > /home/samba/maestro/csv/pv_job.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb LIN   > /home/samba/maestro/csv/pv_lin.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb LNK   > /home/samba/maestro/csv/pv_lnk.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb MF    > /home/samba/maestro/csv/pv_mf.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb MFR   > /home/samba/maestro/csv/pv_mfr.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb MFRPN > /home/samba/maestro/csv/pv_mfrpn.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb ORG   > /home/samba/maestro/csv/pv_org.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb PL    > /home/samba/maestro/csv/pv_pl.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb PLL   > /home/samba/maestro/csv/pv_pll.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb PN    > /home/samba/maestro/csv/pv_pn.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb PO    > /home/samba/maestro/csv/pv_po.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb POD   > /home/samba/maestro/csv/pv_pod.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb POM   > /home/samba/maestro/csv/pv_pom.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb RPX   > /home/samba/maestro/csv/pv_rpx.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb SHIP  > /home/samba/maestro/csv/pv_ship.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb SU    > /home/samba/maestro/csv/pv_su.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb TASK  > /home/samba/maestro/csv/pv_task.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb TYPE  > /home/samba/maestro/csv/pv_type.csv
/usr/local/bin/mdb-export -D "%F" /home/samba/maestro/remotefs/pv.mdb UN    > /home/samba/maestro/csv/pv_un.csv
echo

exit 0
