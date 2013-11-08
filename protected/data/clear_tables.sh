#!/bin/sh
#
# Clear tables
# - execute from maestro/protected/data/
#
# History
# ------------------------------
# 2012-11-02	dale scott	creation
#

echo
echo "Deleting tables from maestro..."
mysql -uroot -p --force maestro < ./clear_tables.sql

exit 0
