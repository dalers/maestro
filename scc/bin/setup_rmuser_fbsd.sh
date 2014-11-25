#!/bin/sh
#
# Delete server system accounts for users
# - must be executed by root from script directory
# - "rmuser_scc.txt" must be writable ONLY by root
#

rmuser -yv -f ./setup_rmuser_fbsd.txt

#        -y  implicitly answer "yes" to any and all prompts
#        -v  be verbose about actions taken
#        -f  user file

exit 0
