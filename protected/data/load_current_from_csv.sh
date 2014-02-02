#!/bin/sh
#
# Load current data into Maestro from CSV
# - DATABASE USER PASSWORD IN PLAIN TEXT
# - HARDCODED file paths (assumes Maestro reference server)
#

#echo "Confirming required EOL in CSV files..."
# force when flip found to misinterpret file type
# TODO - this should not be required normal operation but may
# avoid errors in development if files are copied to/from
# unix/win systems with auto-conversion (e.g. using WinSCP)
#/usr/local/bin/flip -mvb /usr/home/samba/maestro/csv/issue.csv
#/usr/local/bin/flip -mv  /usr/home/samba/maestro/csv/person.csv
#/usr/local/bin/flip -uvb /usr/home/samba/maestro/csv/project.csv
#/usr/local/bin/flip -mv  /usr/home/samba/maestro/csv/stock_serial.csv
#/usr/local/bin/flip -mv  /usr/home/samba/maestro/csv/stock_location.csv

#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_al.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_cnv.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_cost.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_cu.csv
#/usr/local/bin/flip -uvb /usr/home/samba/maestro/csv/pig_cur.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_fil.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_hist.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_hpref.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_job.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_lin.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_lnk.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_mf.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_mfr.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_mfrpn.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_org.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_pl.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_pll.csv
#/usr/local/bin/flip -uvb /usr/home/samba/maestro/csv/pig_pn.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_po.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_pod.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_pom.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_rpx.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_ship.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_su.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_task.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_type.csv
#/usr/local/bin/flip -uv  /usr/home/samba/maestro/csv/pig_un.csv
#echo

echo "Loading CSV files..."
#/usr/local/bin/mysql -uroot -pappleton --local-infile=1 --show-warnings --verbose < /usr/local/www/maestro/protected/data/load_current_from_csv.sql
/usr/local/bin/mysql -uroot -pappleton --local-infile=1 < /usr/local/www/maestro/protected/data/load_current_from_csv.sql
echo

exit 0
