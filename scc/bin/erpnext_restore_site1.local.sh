#!/bin/sh
####################################
#
# Restore scc ERPNext site
# - MariaDB dump + files tarball
#

# restore database
# create backup and drop database first
gunzip < site1.local.sql.gza | mysql -u root -pbVUJVRiRBjNAc2mL

# restore files
cd /home/frappe/frappe-bench/sites/site1.local/public
mv files files.bak
mkdir files
tar -xzf /root/site1.local.files.tar.gz
chown -R frappe:frappe files
