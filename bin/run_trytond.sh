#!/bin/sh
# Run trytond daemon
# - temporary shortcut until rc.d script works

/usr/local/bin/trytond -c /usr/local/etc/trytond.conf &
