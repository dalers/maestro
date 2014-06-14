#!/bin/sh
#
# Sync to current part and material documents
# - files added to source directory will be added to target directory
# - a file in the target directory which has been modified in the source
#   directory will have its file name suffixed with a timestamp for being
#   superseded (e.g. document-yyyy-mm-dd-x-hh-mm-ss.pdf), before the
#   modified file is copied.
# - files deleted from source directory are retained in target directory.
#

echo
echo "rsync_current_files: "
# create new log file
echo "rsync_current_files: " > /tmp/scc-rsync.log

#
# parts
#
/usr/local/bin/rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/scc-rsync.log" /home/samba/scc/parts/ /home/samba/scc/parts.rsync > /dev/null

#
# material
#
#rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/scc-rsync.log" /home/samba/scc/material/ /home/samba/scc/material.rsync > /dev/null

#
# copy rsync log file to file share
#
echo "rsync_current_files: copy rsync log file"
cp -a /tmp/scc-rsync.log /home/samba/scc/work/rsync.log
rm /tmp/scc-rsync.log
echo

exit 0
