#!/bin/sh
#
# Process single iteration. This script is provided primarily for
# developer use. This script could be scheduled by cron, instead of
# scheduling the individual scripts separately by cron (but logging
# information may not be as detailed in the event of an error).
#

# synchronize controlled document file system to file share
/usr/local/www/maestro/protected/data/bin/rsync_current_files.sh

# export 'current' data from master spreadsheets and other sources to csv/
/usr/local/www/maestro/protected/data/bin/export_current_to_csv.sh

# mail changes report
/usr/local/www/maestro/protected/data/bin/send_current_change_report.sh

# load maestro with 'current' data
/usr/local/www/maestro/protected/data/bin/load_current_from_csv.sh

exit 0