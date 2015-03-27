#!/bin/sh
#
# Setup file share
#
# - run as root, /home/maestro/scc must exist
# - ensure the username which will be accessing files in
#   /home/maestro/scc/... has necessary privileges.
#

rm -r /home/maestro/scc/*

# csv, current and previous
mkdir /home/maestro/scc/csv/
mkdir /home/maestro/scc/csv.old/

# ad-hoc documents
mkdir /home/maestro/scc/docs
mkdir /home/maestro/scc/docs.rsync

# material documents
mkdir /home/maestro/scc/material/
mkdir /home/maestro/scc/material.rsync/

# master spreadsheets
mkdir /home/maestro/scc/ods/

# part documents
mkdir /home/maestro/scc/parts
mkdir /home/maestro/scc/parts.rsync

# parts&vendors database
mkdir /home/maestro/scc/pv/

# working directory (for processing iterations)
mkdir /home/maestro/scc/work/

# make directories that will be written to from remote MS Windows clients read/write
# - MAKE files read/write if necessary when copied (e.g. pv/pv.mdb)
# - NO write access from Windows to csv/, csv.old/, work/ or *.rsync/
#
chmod ugo+rw /home/maestro/scc/docs/
chmod ugo+rw /home/maestro/scc/ods/
chmod ugo+rw /home/maestro/scc/material/
chmod ugo+rw /home/maestro/scc/parts/
chmod ugo+rw /home/maestro/scc/pv/

exit 0
