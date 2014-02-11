#!/bin/sh
#
# Synchronize maestro vault with remote file system
# - intended to be run from cron to synchronize periodically
#   e.g. every night
#
# Assumes Maestro smb file share structure
# ------------------------
#    maestro/                     root of maestro smb file share
#    +-- README.txt
#    +-- remotefs/                simulated remote file share
#    |   +-- issue.xlsx           "current" issue master data
#    |   +-- person.xlsx          "current" person master data
#    |   +-- project.xlsx         "current" project master data
#    |   +-- stock_location.xlsx  "current" stock location master data
#    |   +-- stock_serial.xlsx    "current" stock serial number master data
#    |   +-- pv.mdb               "current" Parts&Vendors database
#    |   \-- vault                "current" files relating to parts and material
#    |       +-- parts              files relating to parts (i.e. to a part number)
#    |       \-- material           files relating to material (i.e. to a lot or serial number) 
#    |
#    +-- vault/                   maestro file share "vault" (direct write access not allowed)
#    |   +-- parts                files relating to parts (i.e. to a part number)
#    |   \-- material             files relating to material (i.e. lot or serial number)
#    |
#    +-- csv/                     "current" CSV-format data, exported from current master data spreadsheets
#    +-- csv.old/                 previous "current" CSV-format data
#    \-- work/                    work to create PLM Change Report
#

echo
echo "rsync_current_files..."

#
# X:\remotefs
#

echo "rsync_current_files: X:\remotefs\" > /tmp/epd2-rsync.log
# note this has created a new log file
rsync -a --itemize-changes --backup --suffix=-`date +%FT%T` --log-file="/tmp/maestro-rsync.log" /home/samba/maestro/remotefs/vault/ /home/samba/maestro/vault > /dev/null

#
# copy rsync log file to epd2 file share
#
echo "rsync_current_files: copy rsync log file"
cp -a /tmp/epd2-rsync.log /home/samba/epd2/work/rsync.log
rm /tmp/epd2-rsync.log
echo

exit 0
echo

exit 0
