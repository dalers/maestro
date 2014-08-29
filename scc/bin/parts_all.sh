#!/bin/sh
#
# Copy all parts-x/ to parts/
# Execute from maestro/scc/bin/
# Usage: ./parts_all.sh
#

#mkdir ../scc/parts

rm -r ../scc/parts/*
cp -r ../scc/parts-1/* ../scc/parts/
cp -r ../scc/parts-2/* ../scc/parts/
cp -r ../scc/parts-3/* ../scc/parts/
cp -r ../scc/parts-4/* ../scc/parts/
cp -r ../scc/parts-5/* ../scc/parts/
