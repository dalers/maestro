#!/bin/sh
# Run trytond daemon
# - run trytond manually instead of trytond rc.d script

/usr/local/bin/trytond -c /usr/local/etc/trytond.conf &
