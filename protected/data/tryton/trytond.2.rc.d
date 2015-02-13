#!/bin/sh

#
# PROVIDE: trytond
# REQUIRE: DAEMON
# BEFORE:  LOGIN
#
# Created by: Christoph H. Larsen
# http://lists.gnu.org/archive/html/health-dev/2011-11/msg00008.html
#

. /etc/rc.subr

name=trytond
# for FreeBSD-9.3
#rcvar=`set_rcvar`
# for FreeBSD-10
rcvar=trytond_enable

load_rc_config $name

: ${trytond_enable="NO"}
: ${trytond_user="tryton"}
: ${trytond_group="tryton"}

start_cmd=${name}_start
stop_cmd=${name}_stop
restart_cmd=${name}_restart
status_cmd=${name}_status

command="/usr/local/bin/trytond"
required_files="/usr/local/etc/trytond.conf"

trytond_start() {
  su tryton -c "$command --config=/usr/local/etc/trytond.conf" &
}

trytond_stop() {
if [ -f /var/run/${name}/${name}.pid ]; then
  kill `cat /var/run/${name}/${name}.pid`
  fi
}

trytond_status() {
if [ -f /var/run/${name}/${name}.pid ]; then
  echo "trytond is running as pid `cat /var/run/${name}/${name}.pid`"
  fi
}

trytond_restart() {
  if [ -f /var/run/${name}/${name}.pid ]; then
  kill `cat /var/run/${name}/${name}.pid`
  sleep 1
  fi
  su tryton -c "$command --config=/usr/local/etc/trytond.conf" &
}

run_rc_command "$1"

