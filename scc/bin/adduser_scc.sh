#!/bin/sh
#
# Create server system accounts for users
# - must be executed by root from script directory
# - "adduser_scc.txt" and "adduser_scc_msg.txt" must be writable ONLY by root
#

# add employees to group "scc" if desired (group scc must already exist!)
# adduser -G scc -f ./adduser_scc.txt -m ./adduser_scc_msg.txt -w yes
adduser -f ./adduser_scc.txt -m ./adduser_scc_msg.txt -w yes

#       -G additional groups (to put user in besides default group)
#       -f user file (list of users and account parameters)
#       -m message file (mail content to user)
#       -w password type (yes = password supplied)

exit 0
