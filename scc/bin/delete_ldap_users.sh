#!/bin/sh
#
# Delete SCC users from ldap directory - typically used
#   when migrating Maestro to enterprise production
#
# ldapadd
# -v    be verbose
# -x    use simple authentication (instead of SASL)
# -D    use binddn to bind to LDAP directory
# -w    simple password (-W causes prompt for password)
# -c    continuous operation mode (report errors but continue)
# -f    read entry modification from file
#

# delete SCC users (leave admin user)
ldapdelete -v -x -D "cn=Manager,dc=root,dc=org" -c -w appleton -f /usr/local/maestro/scc/ldap/person-delete.ldif

exit 0
