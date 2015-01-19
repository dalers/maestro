#!/bin/sh
####################################
#
# Backup scc ERPNext site
# - MariaDB dump + files tarball
#

# dump database
mysqldump -u root -pbVUJVRiRBjNAc2mL --databases site1.local  | gzip > site1.local.sql.gza

# create file tarball
cd /home/frappe/frappe-bench/sites/site1.local/public
tar -czf /root/site1.local.files.tar.gz files

# verify file tarball
tar -czf site1.local.files.tar.gz
