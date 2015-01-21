#!/bin/sh
####################################
#
# Backup scc ERPNext site
# - MariaDB dump + files tarball
#

# dump database
mysqldump -u root -pVXjtffqUqoLbi508 --databases site1.local  | gzip > yyyymmddhhmm.site1.local.sql.gza

# create file tarball
cd /home/frappe/frappe-bench/sites/site1.local/public
tar -czf /root/201501160935.files.tar.gz yyyymmddhhmm.site1.local.files.gz

# verify file tarball
tar -czf yyyymmddhhmm.site1.local.files.gz
