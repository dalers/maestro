#!/bin/sh
#
# Setup system users
#
# - run as root
# - to delete user: userdel {-r} username
#   r = remove home dir
#

adduser bjenks -c "Barcoe Jenks" ; echo bjenks:sTr@temeyer | chpasswd
adduser bswift -c "Barton Swift" ; echo bswift:sTr@temeyer | chpasswd
adduser barmstrong -c "Bub Armstrong" ; echo barmstrong:sTr@temeyer | chpasswd
adduser fmason -c "Frank Mason" ; echo fmason:sTr@temeyer | chpasswd
adduser gjackson -c "Garret Jackson" ; echo gjackson:sTr@temeyer | chpasswd
adduser hbaldwin -c "Hank Baldwin" ; echo hbaldwin:sTr@temeyer | chpasswd
adduser hrandall -c "Helen Randall" ; echo hrandall:sTr@temeyer | chpasswd
adduser jwood -c "Jacab Wood" ; echo jwood:sTr@temeyer | chpasswd
adduser jperiod -c "James Period" ; echo jperiod:sTr@temeyer | chpasswd
adduser jhaddon -c "Jennie Haddon" ; echo jhaddon:sTr@temeyer | chpasswd
adduser jmorse -c "Jennie Morse" ; echo jmorse:sTr@temeyer | chpasswd
adduser jsharp -c "John Sharp" ; echo jsharp:sTr@temeyer | chpasswd
adduser mbaggert -c "Martha Baggert" ; echo mbaggert:sTr@temeyer | chpasswd
adduser mnestor -c "Mary Nestor" ; echo mnestor:sTr@temeyer | chpasswd
adduser mblair -c "Minnie Blair" ; echo mblair:sTr@temeyer | chpasswd
adduser mdelazes -c "Miquel DeLazes" ; echo mdelazes:sTr@temeyer | chpasswd
adduser nnewton -c "Ned Newton" ; echo nnewton:sTr@temeyer | chpasswd
adduser rsampson -c "Rad Sampson" ; echo rsampson:sTr@temeyer | chpasswd
adduser smalloy -c "Sarah Malloy" ; echo smalloy:sTr@temeyer | chpasswd
adduser tswift -c "Tom Swift" ; echo tswift:sTr@temeyer | chpasswd
adduser wdamon -c "Wakefield Damon" ; echo wdamon:sTr@temeyer | chpasswd
adduser wcrawford -c "William Crawford" ; echo wcrawford:sTr@temeyer | chpasswd

exit 0
