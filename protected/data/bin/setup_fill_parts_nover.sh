#!/bin/sh
#
# Delete parts/ directories
# Copy all parts-x-nover/ to parts/
#
# Execute from bin/
#

rm -r  ../parts/[1,2,3,,4,5,6,7,8,9]*
cp -r ../parts-1-nover/* ../parts/
cp -r ../parts-2-nover/* ../parts/
cp -r ../parts-3-nover/* ../parts/
cp -r ../parts-4-nover/* ../parts/
cp -r ../parts-5-nover/* ../parts/
