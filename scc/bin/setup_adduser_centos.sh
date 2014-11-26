#!/bin/sh
#
# Setup system users
#
# - run as root
# - to delete user: userdel {-r} username
#   r = remove home dir
#

adduser bjenks -c "Barcoe Jenks" ; echo bjenks:appleton | chpasswd
adduser bswift -c "Barton Swift" ; echo bswift:appleton | chpasswd
adduser barmstrong -c "Bub Armstrong" ; echo barmstrong:appleton | chpasswd
adduser fmason -c "Frank Mason" ; echo fmason:appleton | chpasswd
adduser gjackson -c "Garret Jackson" ; echo gjackson:appleton | chpasswd
adduser hbaldwin -c "Hank Baldwin" ; echo hbaldwin:appleton | chpasswd
adduser hrandall -c "Helen Randall" ; echo hrandall:appleton | chpasswd
adduser jwood -c "Jacab Wood" ; echo jwood:appleton | chpasswd
adduser jperiod -c "James Period" ; echo jperiod:appleton | chpasswd
adduser jhaddon -c "Jennie Haddon" ; echo jhaddon:appleton | chpasswd
adduser jmorse -c "Jennie Morse" ; echo jmorse:appleton | chpasswd
adduser jsharp -c "John Sharp" ; echo jsharp:appleton | chpasswd
adduser mbaggert -c "Martha Baggert" ; echo mbaggert:appleton | chpasswd
adduser mnestor -c "Mary Nestor" ; echo mnestor:appleton | chpasswd
adduser mblair -c "Minnie Blair" ; echo mblair:appleton | chpasswd
adduser mdelazes -c "Miquel DeLazes" ; echo mdelazes:appleton | chpasswd
adduser nnewton -c "Ned Newton" ; echo nnewton:appleton | chpasswd
adduser rsampson -c "Rad Sampson" ; echo rsampson:appleton | chpasswd
adduser smalloy -c "Sarah Malloy" ; echo smalloy:appleton | chpasswd
adduser tswift -c "Tom Swift" ; echo tswift:appleton | chpasswd
adduser wdamon -c "Wakefield Damon" ; echo wdamon:appleton | chpasswd
adduser wcrawford -c "William Crawford" ; echo wcrawford:appleton | chpasswd

exit 0
