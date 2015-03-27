#!/bin/sh
####################################
#
# Backup host system to /backup directory
# - REQUIRES /backup be mounted from a separate file system
# - creates dated backup dump of complete local file system
# - logs to /backup/maestro-bkup.log
# - assumes GPT drive partition with only root data partition
#
# TODO THIS IS A HACK, CHANGE THE FILE SYSTEM TO SU+J AND
# USE SNAPSHOTS
#
# - SHOULD boot into single-user mode before running
#   - dump should not be used on live fs without -L option, but 
#     creating snapshot of / gives error if using non-SU+J file system
#
#     dump parameters
#      -0 = dump level (full backup)
#      -a = auto-size (write until end-of-media)
#      -L = dump from live file system (snap then dump) (not used)
#      -f = write dump to specified file
#

echo system backup started: `date` >> /backup/maestro-bkup.log

# stop servers
#/usr/local/etc/rc.d/postgresql stop
/usr/local/etc/rc.d/apache24 stop
/usr/local/etc/rc.d/mysql-server stop

dump -0 -a -f /backup/`date +%Y%m%d%H%M%S`-root.ada0p2.dump /

# re-start servers
#/usr/local/etc/rc.d/postgresql start
/usr/local/etc/rc.d/mysql-server start
/usr/local/etc/rc.d/apache24 start

echo system backup completed: `date` >> /backup/maestro-bkup.log

exit 0
