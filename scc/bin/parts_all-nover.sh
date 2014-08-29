#!/bin/sh
#
# Copy all parts-x-nover/ to parts/
# Execute from maestro/scc/bin/
# Usage: ./parts_all-nover.sh
#

#mkdir ../scc/parts

rm -r ../scc/parts/*
cp -r ../scc/parts-1-nover/* ../scc/parts/
cp -r ../scc/parts-2-nover/* ../scc/parts/
cp -r ../scc/parts-3-nover/* ../scc/parts/
cp -r ../scc/parts-4-nover/* ../scc/parts/
cp -r ../scc/parts-5-nover/* ../scc/parts/
