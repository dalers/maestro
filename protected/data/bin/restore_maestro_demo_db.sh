#!/bin/sh
####################################
#
# Restore Maestro demo database
#   run nightly by cron to re-create db for live demo
#

# drop and create empty maestro database
#mysql -u root -pappleton -e 'DROP DATABASE `maestro`'
#mysql -u root -pappleton -e 'CREATE DATABASE `maestro`'

# load database
#gunzip < /usr/local/www/maestro/protected/data/sql/demo.sql.gz | mysql -u root -pappleton maestro
mysql -u root -pappleton maestro < /usr/local/www/maestro/protected/data/sql/demo.sql 

# restore files
#cd /home
#mv maestro maestro.bak
#tar -xzf /backup/maestro-yyyymmddhhmmss-files.tar.gz
