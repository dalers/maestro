#!/bin/sh
#
# Setup file share
#
# "maestro" system user (e.g. tryton, root, etc.) must have read/write
# privileges to /home/samba/scc/
#

rm -r /home/samba/scc/*
mkdir /home/samba/scc/csv/
mkdir /home/samba/scc/csv.old/
mkdir /home/samba/scc/ods/
mkdir /home/samba/scc/pv/
mkdir /home/samba/scc/work/

# part documents
#
# ad hoc document share for access by Windows clients
mkdir /home/samba/scc/parts
# rsync document directory (preserves original files if overwritten with updated content)
mkdir /home/samba/scc/parts.rsync

# material documents
# ad hoc document directory
mkdir /home/samba/scc/material/
# rsync document directory (preserves original files if overwritten with updated content)
mkdir /home/samba/scc/material.rsync/

# make necessary directories read/write to windows users
# MUST also make files read/write if necessary when copied (e.g. pv/pv.mdb)
chmod ugo+rw /home/samba/scc/excel/
chmod ugo+rw /home/samba/scc/material/
chmod ugo+rw /home/samba/scc/parts
chmod ugo+rw /home/samba/scc/pv/

exit 0
