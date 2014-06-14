#!/bin/sh
#
# Create consolidated plm-vault/
# Execute from maestro/scc/
# Usage: ../bin/create_consolidated_vault.sh
#

#mkdir ../scc/parts

cp -r ../scc/parts-1/* parts/
cp -r ../scc/parts-2/* parts/
cp -r ../scc/parts-3/* parts/
cp -r ../scc/parts-4/* parts/
cp -r ../scc/parts-5/* parts/
