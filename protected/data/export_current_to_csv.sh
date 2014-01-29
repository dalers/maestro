#!/bin/sh
#
# Create CSV-format demo data from source files (mdb, xlsx...)
# - file paths hardcoded for reference server
# - assumes /usr/home/samba/maestro/csv/ and .../csv.old/
# - execute using cron for scheduled periodic updating
#

echo
echo "Exporting current data to CSV..."
echo

# Person spreadsheet
# network ID, email address and nick (Parts&Vendors ReqBy)
# csv file will have Windows EOL (SaveAs from Excel to CIFS share)
echo "Persons - NOT EXPORTED. Manually Save/As from Excel person.xlsx"
echo "  to csv\person.csv before running this script."
echo

# Issue spreadsheet
# csv file will have Windows EOL (SaveAs from Excel to Maestro Windows/CIFS share)
echo "Issues - NOT EXPORTED. Manually SaveAs from Excel issue.xlsx"
echo "  to csv\issue.csv before running this script."
echo

# Project spreadsheet
# csv file will have Windows EOL (SaveAs from Excel to Maestro Windows/CIFS share)
echo "Projects - NOT EXPORTED. Manually SaveAs from Excel project.xlsx"
echo "  to csv\project.csv before running this script."
echo

# Stock location spreadsheet
# csv file will have Windows EOL (SaveAs from Excel to Maestro Windows/CIFS share)
echo "Stock locations - NOT EXPORTED. Manually Save/As from Excel stock_location.xlsx"
echo "  to csv\stock_location.csv before running this script."
echo

# Serial number spreadsheet
# csv file will have Windows EOL (SaveAs from Excel to Maestro Windows/CIFS share)
echo "Serial numbers - NOT EXPORTED. Export manually from Excel serial_number.xlsx"
echo "  to csv\serial_number.csv before running this script."
echo

# Parts&Vendors
# comma-delimited csv will have Unix EOL (output from mdb-export on Unix system)
# prevent access to P&V database during export or export may not be consistent
# Export date format: yyyy-mm-dd
echo "Parts - exporting to CSV...."
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
echo

# cleanup
# -------
echo "Done!"
exit 0
