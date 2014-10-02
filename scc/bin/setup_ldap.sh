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

# create LDAP domain and manager
ldapadd -v -x -D "cn=Manager,dc=root,dc=org" -w appleton -c -f /usr/local/maestro/scc/ldif/domainmgr.ldif

# create LDAP organizational unit
ldapadd -v -x -D "cn=Manager,dc=root,dc=org" -w appleton -c -f /usr/local/maestro/scc/ldif/people.ldif

# convert csv export from people master spreadsheet to ldif format
csv2ldif2.pl -b 'ou=People,dc=root,dc=org' < /usr/local/maestro/scc/ods/person-ldap.csv > /usr/local/maestro/scc/ldif/person-ldap.csv.ldif

# MANUALLY add attribute "uid: admin" to "dn: cn=Administrator User,ou=People,dc=root,dc=org" entry
# SAVE-AS person-ldap.csv.edit1-admin.ldif

# add scc users
#ldapadd -v -x -D "cn=Manager,dc=root,dc=org" -w appleton -c -f /usr/local/maestro/scc/ldif/person-ldap.csv.ldif
# use edited file
ldapadd -v -x -D "cn=Manager,dc=root,dc=org" -w appleton -c -f /usr/local/maestro/scc/ldif/person-ldap.csv.edit1-admin.ldif

exit 0
