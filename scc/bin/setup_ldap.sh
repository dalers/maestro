#!/bin/sh
#
# Setup ldap directory
#
# ldapadd
# -v    be verbose
# -x    use simple authentication (instead of SASL)
# -D    use binddn to bind to LDAP directory
# -w    simple password (-W causes prompt for password)
# -c    continuous operation mode (report errors but continue)
# -f    read entry modification from file
#

# create LDAP domain, manager and organizational units
ldapadd -v -x -D "cn=Manager,dc=root,dc=org" -w appleton -c -f /usr/local/maestro/scc/ldif/domainmgr_scc_People.ldif

# convert csv export from people master spreadsheet to ldif format
csv2ldif2.pl -b 'ou=People,ou=scc,dc=root,dc=org' < /usr/local/maestro/scc/ods/person-ldap.csv > /usr/local/maestro/scc/ldif/person-ldap.csv.ldif

# MANUALLY add uid=auth attribute to dn=Administrator User
# TODO programatically add uid=auth attribute to dn=Administrator User

# create LDAP users
#ldapadd -v -x -D "cn=Manager,dc=root,dc=org" -w appleton -c -f /usr/local/maestro/scc/ldif/person-ldap.csv.corrected-admin.ldif
# use edited file
ldapadd -v -x -D "cn=Manager,dc=root,dc=org" -w appleton -c -f /usr/local/maestro/scc/ldif/person-ldap.csv.corrected-admin.ldif

exit 0
