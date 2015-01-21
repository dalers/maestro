#!/bin/sh
####################################
#
# Dump filesystem backup
# - creates dated backup dump of / (root, 
# - assumes GPT drive partition with only root data partition
# - may be prudent to boot into single-user mode before running
#   - should not be used on live fs without -L option, but 
#     creating snapshot of / gives error if using non-SU+J file system
#
#     - this may not be true! No error now using -L on what
#       mount reports is (ufs, local, soft-updates)
#
# - dump parameters
#    -0 = dump level (full backup)
#    -a = auto-size (write until end-of-media)
#    -L = dump from live file system (snap then dump) (not used)
#    -f = write dump to specified file
#

echo Backup Started `date` >> /backup/backuplog

# stop db servers before dump
#/usr/local/etc/rc.d/postgresql stop
#/usr/local/etc/rc.d/mysql-server stop

#dump -0 -a -L -f /backup/`date +%Y%m%d%S`-root.ada0p2.dump /
dump -0 -a -f /backup/`date +%Y%m%d%S`-root.ada0p2.dump /

# re-start db servers
#/usr/local/etc/rc.d/postgresql start
#/usr/local/etc/rc.d/mysql-server start

echo Backup Completed `date` >> /backup/backuplog

exit 0
