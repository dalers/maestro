#!/bin/sh
#
# Setup ldap (OpenLDAP) directory
#
# OpenLDAP directory manager (/usr/local/etc/openldap/slapd.conf)
#   Login DN: cn=Manager,dc=root,dc=org
#   Password: appleton
#
# SCC users (for example)
#   Login DN: cn=Helen Randall,ou=People,dc=root,dc=org
#   Password: appleton
#
# ldapadd
# -v    be verbose
# -x    use simple authentication (instead of SASL)
# -D    use binddn to bind to LDAP directory
# -w    simple password (-W causes prompt for password)
# -c    continuous operation mode (report errors but continue)
# -f    read entry modification from file
#

# add domain and manager to new OpenLDAP directory
ldapadd -v -x -D "cn=Manager,dc=root,dc=org" -w appleton -c -f /usr/local/www/maestro/protected/data/openldap/domainmgr.ldif

# add organizational unit to OpenLDAP directory
ldapadd -v -x -D "cn=Manager,dc=root,dc=org" -w appleton -c -f /usr/local/www/maestro/protected/data/openldap/people.ldif

# convert master user spreadsheet csv to ldif
/usr/local/www/maestro/protected/data/bin/csv2ldif2.pl -b 'ou=People,dc=root,dc=org' < /home/maestro/scc/ods/user-ldap.csv > /home/maestro/scc/ods/user-ldap.csv.ldif

# add users to OpenLDAP directory
ldapadd -v -x -D "cn=Manager,dc=root,dc=org" -w appleton -c -f /home/maestro/scc/ods/user-ldap.csv.ldif

exit 0
