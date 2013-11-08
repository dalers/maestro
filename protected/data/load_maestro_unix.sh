#!/bin/sh
#
# Import CSV data from source files
# - conversion is forced in cases where flip incorrectly interprets file as binary
#
# History
# ------------------------------
# 2012-11-02	dale scott	creation
#

echo
echo "Importing legacy data from CSV data files..."
echo
echo "Ensure expected EOL in CSV files..."
/usr/local/bin/flip -mvb /usr/home/samba/maestro/csv/issue.csv
/usr/local/bin/flip -mv  /usr/home/samba/maestro/csv/person.csv
/usr/local/bin/flip -uvb /usr/home/samba/maestro/csv/project.csv
/usr/local/bin/flip -mv  /usr/home/samba/maestro/csv/stock_location.csv
/usr/local/bin/flip -mv  /usr/home/samba/maestro/csv/stock_serial.csv

/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_al.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_cnv.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_cost.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_cu.csv
/usr/local/bin/flip -uvb /usr/home/samba/maestro/csv/pv_cur.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_fil.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_hist.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_hpref.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_job.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_lin.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_lnk.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_mf.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_mfr.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_mfrpn.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_org.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_pl.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_pll.csv
/usr/local/bin/flip -uvb /usr/home/samba/maestro/csv/pv_pn.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_po.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_pod.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_pom.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_rpx.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_ship.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_su.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_task.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_type.csv
/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pv_un.csv

echo ""

# drop and re-create database tables (except for migration)
echo "Creating clean database tables..."
/usr/local/bin/mysql -uroot -p --local-infile=1 --show-warnings --verbose < /usr/local/www/maestro/protected/data/drop_and_create_tables.sql
echo ""

# load csv data files
echo "Loading CSV files..."
/usr/local/bin/mysql -uroot -p --local-infile=1 --show-warnings --verbose < /usr/local/www/maestro/protected/data/load_maestro_unix.sql
echo ""

echo "Done!"
echo ""
exit 0
