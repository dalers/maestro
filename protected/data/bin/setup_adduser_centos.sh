#!/bin/sh
#
# Setup system users
# - create account, set password, send welcome email 
# - run as root
#

adduser bjenks -c "Barcoe Jenks" ; echo bjenks:appleton | chpasswd ; mail bjenks@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser bswift -c "Barton Swift" ; echo bswift:appleton | chpasswd ; mail bswift@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser barmstrong -c "Bub Armstrong" ; echo barmstrong:appleton | chpasswd ; mail barmstrong@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser fmason -c "Frank Mason" ; echo fmason:appleton | chpasswd ; mail fmason@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser gjackson -c "Garret Jackson" ; echo gjackson:appleton | chpasswd ; mail gjackson@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser hbaldwin -c "Hank Baldwin" ; echo hbaldwin:appleton | chpasswd ; mail hbaldwin@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser hrandall -c "Helen Randall" ; echo hrandall:appleton | chpasswd ; mail hrandall@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser jwood -c "Jacab Wood" ; echo jwood:appleton | chpasswd ; mail jwood@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser jperiod -c "James Period" ; echo jperiod:appleton | chpasswd ; mail jperiod@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser jhaddon -c "Jennie Haddon" ; echo jhaddon:appleton | chpasswd ; mail jhaddon@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser jmorse -c "Jennie Morse" ; echo jmorse:appleton | chpasswd ; mail jmorse@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser jsharp -c "John Sharp" ; echo jsharp:appleton | chpasswd ; mail jsharp@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser mbaggert -c "Martha Baggert" ; echo mbaggert:appleton | chpasswd ; mail mbaggert@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser mnestor -c "Mary Nestor" ; echo mnestor:appleton | chpasswd ; mail mnestor@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser mblair -c "Minnie Blair" ; echo mblair:appleton | chpasswd ; mail mblair@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser mdelazes -c "Miquel DeLazes" ; echo mdelazes:appleton | chpasswd ; mail mdelazes@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser nnewton -c "Ned Newton" ; echo nnewton:appleton | chpasswd ; mail nnewton@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser rsampson -c "Rad Sampson" ; echo rsampson:appleton | chpasswd ; mail rsampson@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser smalloy -c "Sarah Malloy" ; echo smalloy:appleton | chpasswd ; mail smalloy@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser tswift -c "Tom Swift" ; echo tswift:appleton | chpasswd ; mail tswift@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser wdamon -c "Wakefield Damon" ; echo wdamon:appleton | chpasswd ; mail wdamon@swiftconstructioncompany.net < ./setup_adduser_msg.txt
adduser wcrawford -c "William Crawford" ; echo wcrawford:appleton | chpasswd ; mail wcrawford@swiftconstructioncompany.net < ./setup_adduser_msg.txt

exit 0
