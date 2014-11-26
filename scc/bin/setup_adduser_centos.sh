#!/bin/sh
#
# Setup system users
# - create account, set password, send welcome email 
# - run as root
#

adduser bjenks -c "Barcoe Jenks" ; echo bjenks:appleton | chpasswd ; mail bjenks@whizzer.local < ./setup_adduser_msg.txt
adduser bswift -c "Barton Swift" ; echo bswift:appleton | chpasswd ; mail bswift@whizzer.local < ./setup_adduser_msg.txt
adduser barmstrong -c "Bub Armstrong" ; echo barmstrong:appleton | chpasswd ; mail barmstrong@whizzer.local < ./setup_adduser_msg.txt
adduser fmason -c "Frank Mason" ; echo fmason:appleton | chpasswd ; mail fmason@whizzer.local < ./setup_adduser_msg.txt
adduser gjackson -c "Garret Jackson" ; echo gjackson:appleton | chpasswd ; mail gjackson@whizzer.local < ./setup_adduser_msg.txt
adduser hbaldwin -c "Hank Baldwin" ; echo hbaldwin:appleton | chpasswd ; mail hbaldwin@whizzer.local < ./setup_adduser_msg.txt
adduser hrandall -c "Helen Randall" ; echo hrandall:appleton | chpasswd ; mail hrandall@whizzer.local < ./setup_adduser_msg.txt
adduser jwood -c "Jacab Wood" ; echo jwood:appleton | chpasswd ; mail jwood@whizzer.local < ./setup_adduser_msg.txt
adduser jperiod -c "James Period" ; echo jperiod:appleton | chpasswd ; mail jperiod@whizzer.local < ./setup_adduser_msg.txt
adduser jhaddon -c "Jennie Haddon" ; echo jhaddon:appleton | chpasswd ; mail jhaddon@whizzer.local < ./setup_adduser_msg.txt
adduser jmorse -c "Jennie Morse" ; echo jmorse:appleton | chpasswd ; mail jmorse@whizzer.local < ./setup_adduser_msg.txt
adduser jsharp -c "John Sharp" ; echo jsharp:appleton | chpasswd ; mail jsharp@whizzer.local < ./setup_adduser_msg.txt
adduser mbaggert -c "Martha Baggert" ; echo mbaggert:appleton | chpasswd ; mail mbaggert@whizzer.local < ./setup_adduser_msg.txt
adduser mnestor -c "Mary Nestor" ; echo mnestor:appleton | chpasswd ; mail mnestor@whizzer.local < ./setup_adduser_msg.txt
adduser mblair -c "Minnie Blair" ; echo mblair:appleton | chpasswd ; mail mblair@whizzer.local < ./setup_adduser_msg.txt
adduser mdelazes -c "Miquel DeLazes" ; echo mdelazes:appleton | chpasswd ; mail mdelazes@whizzer.local < ./setup_adduser_msg.txt
adduser nnewton -c "Ned Newton" ; echo nnewton:appleton | chpasswd ; mail nnewton@whizzer.local < ./setup_adduser_msg.txt
adduser rsampson -c "Rad Sampson" ; echo rsampson:appleton | chpasswd ; mail rsampson@whizzer.local < ./setup_adduser_msg.txt
adduser smalloy -c "Sarah Malloy" ; echo smalloy:appleton | chpasswd ; mail smalloy@whizzer.local < ./setup_adduser_msg.txt
adduser tswift -c "Tom Swift" ; echo tswift:appleton | chpasswd ; mail tswift@whizzer.local < ./setup_adduser_msg.txt
adduser wdamon -c "Wakefield Damon" ; echo wdamon:appleton | chpasswd ; mail wdamon@whizzer.local < ./setup_adduser_msg.txt
adduser wcrawford -c "William Crawford" ; echo wcrawford:appleton | chpasswd ; mail wcrawford@whizzer.local < ./setup_adduser_msg.txt

exit 0
