#!/bin/sh
#
# Delete system user accounts for SCC employees
# - must be executed by root from script directory
# - "rmuser_scc.txt" must be writable ONLY by root
#
# History
# ------------------------------
# 2010-09-07  dale scott  creation
#

echo
echo "Deleting SCC system user accounts"
echo

rmuser -yv -f ./rmuser_scc.txt

#        -y  implicitly answer "yes" to any and all prompts
#        -v  be verbose about actions taken
#        -f  user file

exit 0
