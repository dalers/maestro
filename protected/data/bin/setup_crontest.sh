#!/bin/sh
# manually execute same jobs as scheduled by cron
#

# synchronize to remote file share
/home/maestro/scc/bin/rsync_current_files.sh

# export current data to csv/
/home/maestro/scc/bin/export_current_to_csv.sh

# find changes and mail report
/home/maestro/scc/bin/send_current_change_report.sh

exit 0