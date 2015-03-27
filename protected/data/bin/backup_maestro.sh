#!/bin/sh
####################################
#
# Backup Maestro system to /backup directory
# - creates dated backup dump of Maestro data and files
#       Maestro
#       TODO OpenLDAP directory (Maestro "Users")
#       TODO Mail (Maestro user mail )
#       OpenDocMan (Maestro "Documents")
#       WordPress DB (Maestro "Desktop")
#       Mantis DB (Maestro "Issues")
#       /home/maestro directory (file store, change management working files...)
# - logs to /backup/maestro-bkup.log
#

echo maestro backup started: `date` >> /backup/maestro-bkup.log

# dump LDAP user directory
# TODO dump OpenLDAP user directory

# dump user mail
# TODO dump user mail

# dump MySQL databases
/usr/local/bin/mysqldump -u root -pappleton --databases bugtracker | gzip > /backup/maestro-`date +%Y%m%d%H%M%S`-bugtracker.sql.gz
/usr/local/bin/mysqldump -u root -pappleton --databases maestro    | gzip > /backup/maestro-`date +%Y%m%d%H%M%S`.sql.gz
/usr/local/bin/mysqldump -u root -pappleton --databases opendocman | gzip > /backup/maestro-`date +%Y%m%d%H%M%S`-opendocman.sql.gz
/usr/local/bin/mysqldump -u root -pappleton --databases wordpress  | gzip > /backup/maestro-`date +%Y%m%d%H%M%S`-wordpress.sql.gz

# create files tarball
cd /home
tar -czf /backup/maestro-`date +%Y%m%d%H%M%S`-files.tar.gz maestro
# list tarball contents
#tar -tzf /backup/maestro-yyyymmddhhmmss-files.tar.gz

echo maestro backup completed: `date` >> /backup/maestro-bkup.log

exit 0
