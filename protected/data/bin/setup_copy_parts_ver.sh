#!/bin/sh
#
# Delete all parts/ directories
# Copy all parts-x/ to parts/
#
# cd .../maestro/bin/
# ./parts_all.sh
#

rm -r  ../parts/[1,2,3,,4,5,6,7,8,9]*
cp -r ../parts-1/* ../parts/
cp -r ../parts-2/* ../parts/
cp -r ../parts-3/* ../parts/
cp -r ../parts-4/* ../parts/
cp -r ../parts-5/* ../parts/
