#!/bin/sh
#
# Sync to current part and material documents
# - files added in source will be added to vault (i.e. new files)
# - files updated in source will retain name, existing document
#     in vault will be modified with a timestamp suffix i.e. the
#     date the document was superseded by an update
#     e.g. document-yyyy-mm-dd-x-hh-mm-ss
# - files deleted in source will be retained in vault
#

echo
echo "rsync_current_files: "
# create new log file
echo "rsync_current_files: " > /tmp/scc-rsync.log

#
# parts
#
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/scc-rsync.log" /home/samba/scc/parts/ /home/samba/scc/parts.rsync > /dev/null

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
