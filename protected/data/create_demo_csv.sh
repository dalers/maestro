#!/bin/sh
#
# Export source data and import to Maestro
# - file paths hardcoded for server
# - execute by root using cron
#
# History
# ------------------------------
# 2012-11-02	dale scott	creation
#

echo
echo "Exporting to CSV data files...."
echo ""

# re-create csv directory
echo "Deleting csv/..."
rm -rfv /usr/home/samba/maestro/csv
echo ""
echo "Creating new empty csv/ with ugo+rwx permissions..."
mkdir /usr/home/samba/maestro/csv
chmod a+xrw /usr/home/samba/maestro/csv
echo ""

# Serial number spreadsheet
# csv file will have Windows EOL (SaveAs from Excel to Maestro Windows/CIFS share)
echo "Serial numbers - not exported, export manually from Excel serial_number.xlsx"
echo "  - Save/As from Excel to: csv\serial_number.csv"
echo ""

# Project spreadsheet
# csv file will have Windows EOL (SaveAs from Excel to Maestro Windows/CIFS share)
echo "Projects - not exported, export manually from Excel project.xlsx"
echo "  - Save/As from Excel to: csv\project.csv"
echo ""

# Issue spreadsheet
# csv file will have Windows EOL (SaveAs from Excel to Maestro Windows/CIFS share)
echo "Issues - not exported, export manually from Excel issue.xlsx"
echo "  - Save/As from Excel to: csv\issue.csv"
echo ""

# Stock location spreadsheet
# csv file will have Windows EOL (SaveAs from Excel to Maestro Windows/CIFS share)
echo "Stock locations - not exported, export manually from Excel stock_location.xlsx"
echo "  - Save/As from Excel to: csv\stock_location.csv"
echo ""

# Person spreadsheet
# network ID, email address and nick (Parts&Vendors ReqBy)
# csv file will have Windows EOL (SaveAs from Excel to CIFS share)
echo "Person - not exported, export manually from Excel person.xlsx"
echo "  - Save/As from Excel to csv\person.csv (e.g. X:\csv\person.csv)"
echo ""

# Parts&Vendors
# comma-delimited csv will have Unix EOL (output from mdb-export on Unix system)
# prevent access to P&V database during export or export may not be consistent
# Export date with format yyyy-mm-dd
echo "Parts&Vendors - exporting to CSV...."
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb AL    > /usr/home/samba/maestro/csv/pv_al.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb CNV   > /usr/home/samba/maestro/csv/pv_cnv.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb COST  > /usr/home/samba/maestro/csv/pv_cost.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb CU    > /usr/home/samba/maestro/csv/pv_cu.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb CUR   > /usr/home/samba/maestro/csv/pv_cur.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb FIL   > /usr/home/samba/maestro/csv/pv_fil.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb HIST  > /usr/home/samba/maestro/csv/pv_hist.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb HPREF > /usr/home/samba/maestro/csv/pv_hpref.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb JOB   > /usr/home/samba/maestro/csv/pv_job.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb LIN   > /usr/home/samba/maestro/csv/pv_lin.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb LNK   > /usr/home/samba/maestro/csv/pv_lnk.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb MF    > /usr/home/samba/maestro/csv/pv_mf.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb MFR   > /usr/home/samba/maestro/csv/pv_mfr.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb MFRPN > /usr/home/samba/maestro/csv/pv_mfrpn.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb ORG   > /usr/home/samba/maestro/csv/pv_org.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb PL    > /usr/home/samba/maestro/csv/pv_pl.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb PLL   > /usr/home/samba/maestro/csv/pv_pll.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb PN    > /usr/home/samba/maestro/csv/pv_pn.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb PO    > /usr/home/samba/maestro/csv/pv_po.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb POD   > /usr/home/samba/maestro/csv/pv_pod.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb POM   > /usr/home/samba/maestro/csv/pv_pom.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb RPX   > /usr/home/samba/maestro/csv/pv_rpx.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb SHIP  > /usr/home/samba/maestro/csv/pv_ship.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb SU    > /usr/home/samba/maestro/csv/pv_su.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb TASK  > /usr/home/samba/maestro/csv/pv_task.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb TYPE  > /usr/home/samba/maestro/csv/pv_type.csv
/usr/local/bin/mdb-export -D "%F" /usr/home/samba/maestro/pv.mdb UN    > /usr/home/samba/maestro/csv/pv_un.csv
echo ""

# cleanup
# -------
echo "Done!"
exit 0
