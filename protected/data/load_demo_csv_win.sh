#!/bin/sh
#
# Load demo data in CSV-format
# - use on Windows dev system, execute from maestro/protected/data/
# - first confirms csv files have correct EOL marker for import on
#   windows system
#
# History
# ------------------------------
# 2012-11-02	dale scott	creation
#

echo
echo "Importing legacy data from CSV data files..."
echo
echo "Ensure expected EOL in CSV files..."
unix2dos ./csv/issue.csv
unix2dos ./csv/person.csv
dos2unix ./csv/project.csv
unix2dos ./csv/stock_serial.csv
unix2dos ./csv/stock_location.csv

dos2unix ./csv/pv_al.csv
dos2unix ./csv/pv_cnv.csv
dos2unix ./csv/pv_cost.csv
dos2unix ./csv/pv_cu.csv
dos2unix ./csv/pv_cur.csv
dos2unix ./csv/pv_fil.csv
dos2unix ./csv/pv_hist.csv
dos2unix ./csv/pv_hpref.csv
dos2unix ./csv/pv_job.csv
dos2unix ./csv/pv_lin.csv
dos2unix ./csv/pv_lnk.csv
dos2unix ./csv/pv_mf.csv
dos2unix ./csv/pv_mfr.csv
dos2unix ./csv/pv_mfrpn.csv
dos2unix ./csv/pv_org.csv
dos2unix ./csv/pv_pl.csv
dos2unix ./csv/pv_pll.csv
dos2unix ./csv/pv_pn.csv
dos2unix ./csv/pv_po.csv
dos2unix ./csv/pv_pod.csv
dos2unix ./csv/pv_pom.csv
dos2unix ./csv/pv_rpx.csv
dos2unix ./csv/pv_ship.csv
dos2unix ./csv/pv_su.csv
dos2unix ./csv/pv_task.csv
dos2unix ./csv/pv_type.csv
dos2unix ./csv/pv_un.csv
echo ""

# drop and re-create database tables (except for migration)
echo "Creating clean database tables..."
mysql -uroot -p --local-infile=1 --show-warnings --verbose < ./drop_and_create_tables.sql
echo ""

echo "Loading CSV files..."
mysql -uroot -p --local-infile=1 --show-warnings --verbose < ./load_demo_csv_win.sql
echo ""

echo "Done!"
echo ""
exit 0
