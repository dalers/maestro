#!/bin/sh
#
# Sync 'current' part and material documents
#
#   parts/    -> parts.rsync/
#   material/ -> material.rsync/
#
# - if a file already exists in [parts|material].rsync/ and has been
#   modified in source directory, rename the file in [parts|material].rsync/
#   first by adding current datetime suffix (e.g. "somedoc.pdf-YYYYMMDDHHMMSS"),
#   then copy modified file from source/
# - files deleted in a source directory are not deleted from [parts|material].rsync/
#
# Schedule in /etc/crontab:
#   - rsync_current_files.sh
#   - export_current_to_csv.sh
#   - send_current_change_report.sh
#   - load_current_from_csv.sh
#

#
# parts
#
echo "rsync_current_files: delete old rsync part log file"
rm /home/maestro/scc/work/rsync-parts.log
echo "rsync_current_files: rsync 'current' part documents"
/usr/local/bin/rsync -a --itemize-changes --include-from=/usr/local/www/maestro/protected/data/bin/rsync_include --exclude-from=/usr/local/www/maestro/protected/data/bin/rsync_exclude --backup --suffix=-`date +%FT%H%M%S` --log-file="/home/maestro/scc/work/rsync-parts.log" /home/maestro/scc/parts/ /home/maestro/scc/parts.rsync > /dev/null

#
# material
#
#echo "rsync_current_files: delete old rsync material log file"
#rm /home/maestro/scc/work/rsync-material.log
#echo "rsync_current_files: rsync 'current' material documents"
#/usr/local/bin/rsync -a --itemize-changes --include-from=/usr/local/www/maestro/protected/data/bin/ --exclude-from=/usr/local/www/maestro/protected/data/bin/rsync_exclude --backup --suffix=-`date +%FT%H%M%S` --log-file="/home/maestro/scc/work/rsync-material.log" /home/maestro/scc/material/ /home/maestro/scc/material.rsync > /dev/null

exit 0
