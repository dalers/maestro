#!/bin/sh
#
# Create server system accounts for users
# - must be executed by root from script directory
#
# !! "setup_adduser.txt" and "setup_adduser_msg.txt" must be writeable ONLY by root
#

# add employees to group "scc" if desired (group must already exist!)
# adduser -G scc -f ./setup_adduser.txt -m ./setup_adduser_msg.txt -w yes
adduser -f ./setup_adduser.txt -m ./setup_adduser_msg.txt -w yes

#       -G additional groups (to put user in besides default group)
#       -f user file (list of users and account parameters)
#       -m message file (mail content to user)
#       -w password type (yes = password supplied)

exit 0
