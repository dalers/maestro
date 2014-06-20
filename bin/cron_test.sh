#!/bin/sh
# manually execute same jobs as scheduled by cron
#

# synchronize to remote file share
/usr/local/maestro/bin/rsync_current_files.sh

# export current data to csv/
/usr/local/maestro/bin/export_current_to_csv.sh

# find changes and mail report
/usr/local/maestro/send_current_change_report.sh

