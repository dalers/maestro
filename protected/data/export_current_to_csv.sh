#!/bin/sh
#
# Create CSV-format demo data from source files (mdb, xlsx...)
# - gets files from maestro/remotesfs, writes csv to maestrp/csv
# - file paths HARCODED
# - REQUIRES /home/samba/maestro/remotefs, maestro/csv/, and maestro/csv.old/
#

echo "======================================="
echo "Exporting current data to CSV..."
echo "======================================="
echo

# Person spreadsheet
# network ID, email address and nick (Parts&Vendors ReqBy)
# csv file will have Windows EOL (SaveAs from Excel to CIFS share)
echo "Persons - NOT EXPORTED. Manually Save/As from person.xlsx"
echo "  in same directory before running this script."
cp /home/samba/maestro/remotefs/person.csv /home/samba/maestro/csv/
echo

# Issue spreadsheet
# csv file will have Windows EOL (SaveAs from Excel to Maestro Windows/CIFS share)
echo "Issues - NOT EXPORTED. Manually SaveAs from Excel issue.xlsx"
echo "  in same directory before running this script."
cp /home/samba/maestro/remotefs/issue.csv /home/samba/maestro/csv/
echo

# Project spreadsheet
# csv file will have Windows EOL (SaveAs from Excel to Maestro Windows/CIFS share)
echo "Projects - NOT EXPORTED. Manually SaveAs from Excel project.xlsx"
echo "  in same directory before running this script."
cp /home/samba/maestro/remotefs/project.csv /home/samba/maestro/csv/
echo

# Stock location spreadsheet
# csv file will have Windows EOL (SaveAs from Excel to Maestro Windows/CIFS share)
echo "Stock locations - NOT EXPORTED. Manually Save/As from Excel stock_location.xlsx"
echo "  in same directory before running this script."
cp /home/samba/maestro/remotefs/stock_location.csv /home/samba/maestro/csv/
echo

# Serial number spreadsheet
# csv file will have Windows EOL (SaveAs from Excel to Maestro Windows/CIFS share)
echo "Serial numbers - NOT EXPORTED. Export manually from Excel serial_number.xlsx"
echo "  in same directory before running this script."
cp /home/samba/maestro/remotefs/stock_serial.csv /home/samba/maestro/csv/
echo

# Parts&Vendors
# comma-delimited csv will have Unix EOL (output from mdb-export on Unix system)
# prevent access to P&V database during export or export may not be consistent
# Export date format: yyyy-mm-dd
echo "Parts - exporting to CSV...."
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
