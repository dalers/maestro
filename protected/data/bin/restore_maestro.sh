#!/bin/sh
####################################
#
# Restore Maestro system
#   Maestro
#   TODO OpenLDAP directory (Maestro "Users")
#   TODO Mail (Maestro user mail )
#   OpenDocMan (Maestro "Documents")
#   WordPress DB (Maestro "Desktop")
#   Mantis DB (Maestro "Issues")
#   /home/maestro directory (file store, change management working files...)
#
# !! Backup current databases and datafiles first !!
#

# drop and create empty maestro database
mysql -u root -pappleton -e 'DROP DATABASE `maestro`'
mysql -u root -pappleton -e 'CREATE DATABASE `maestro`'

# load database
gunzip < maestro-yyyymmddhhmmss.sql.gz | mysql -u root -pappleton maestro

# restore files
cd /home
mv maestro maestro.bak
tar -xzf /backup/maestro-yyyymmddhhmmss-files.tar.gz
