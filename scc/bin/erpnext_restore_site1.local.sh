#!/bin/sh
####################################
#
# Restore scc ERPNext site
# - MariaDB dump + files tarball
#

# restore database
# create backup of current database first?
gunzip < yyyymmddhhmm.site1.local.sql.gza | mysql -u root -pVXjtffqUqoLbi508

# restore files
cd /home/frappe/frappe-bench/sites/site1.local/public
# create backup of current files first?
rm files/*
tar -xzf /root/yyyymmddhhmm.site1.local.files.gz
