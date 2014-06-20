#!/bin/sh
#
# Sync [parts|material].rsync/ from source directories
# - copy "new" files in source directory to [parts|material].rsync/
# - if a file already exists in [parts|material].rsync/ and has been
#   modified in source directory, rename the file in [parts|material].rsync/
#   first by adding current datetime suffix (e.g. "somedoc.pdf-YYYYMMDDHHMMSS"),
#   then copy modified file from source/
# - files deleted in a source directory are not deleted from [parts|material].rsync/
#
# Schedule using cron as follows:
#   1. rsync_current_files.sh
#      - rsync MUST complete before send_current_change_report.sh runs
#   2. export_current_to_csv.sh
#   3. send_current_change_report.sh
#

#
# parts
#
/usr/local/bin/rsync -a --itemize-changes --include-from=/usr/local/maestro/bin/rsync_include --exclude-from=/usr/local/maestro/bin/rsync_exclude --backup --suffix=-`date +%FT%H%M%S` --log-file="/home/samba/bhi/work/rsync-parts.log" /home/samba/scc/parts/ /home/samba/scc/parts.rsync > /dev/null

#
# material
#
#/usr/local/bin/rsync -a --itemize-changes --include-from=/usr/local/maestro/bin/rsync_include --exclude-from=/usr/local/maestro/bin/rsync_exclude --backup --suffix=-`date +%FT%H%M%S` --log-file="/home/samba/bhi/work/rsync-material.log" /home/samba/scc/material/ /home/samba/scc/material.rsync > /dev/null

exit 0
