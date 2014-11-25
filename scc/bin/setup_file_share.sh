#!/bin/sh
#
# Setup file share
#
# - run as root
# - ensure the username which will be accesing files has read/write
#   privileges to /home/maestro/scc/
#

rm -r /home/maestro/scc/*
mkdir /home/maestro/scc/csv/
mkdir /home/maestro/scc/csv.old/
mkdir /home/maestro/scc/ods/
mkdir /home/maestro/scc/pv/
mkdir /home/maestro/scc/work/

# ad-hoc documents
mkdir /home/maestro/scc/docs
# rsync document directory (preserves original files if overwritten with updated content)
mkdir /home/maestro/scc/docs.rsync

# material documents
mkdir /home/maestro/scc/material/
# rsync document directory (preserves original files if overwritten with updated content)
mkdir /home/maestro/scc/material.rsync/

# part documents
mkdir /home/maestro/scc/parts
# rsync document directory (preserves original files if overwritten with updated content)
mkdir /home/maestro/scc/parts.rsync

# make directories that will be written to from remote MS Windows clients read/write
# MUST also make files read/write if necessary when copied (e.g. pv/pv.mdb)
chmod ugo+rw /home/maestro/scc/ods/
chmod ugo+rw /home/maestro/scc/docs/
chmod ugo+rw /home/maestro/scc/material/
chmod ugo+rw /home/maestro/scc/parts/
chmod ugo+rw /home/maestro/scc/pv/

exit 0
