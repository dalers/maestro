#!/bin/sh
####################################
#
# Restore scc ERPNext site
# - MariaDB dump + files tarball
#

# restore database
# recommend backup first!
# drop and create empty site1.local database
mysql -u root -pbVUJVRiRBjNAc2mL -e 'DROP DATABASE `site1.local`'
mysql -u root -pbVUJVRiRBjNAc2mL -e 'CREATE DATABASE `site1.local`'
# load database
gunzip < database.sql.gz | mysql -u root -pbVUJVRiRBjNAc2mL site1.local

# restore files
cd /home/frappe/frappe-bench/sites/site1.local/public
mv files files.bak
mkdir files
tar -xzf /root/files.tar.gz
chown -R frappe:frappe files
