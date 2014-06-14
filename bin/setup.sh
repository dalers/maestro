#!/bin/sh
#
# Setup file share
#

rm -r /home/samba/scc/*
mkdir /home/samba/scc/csv/
mkdir /home/samba/scc/csv.old/
mkdir /home/samba/scc/excel/
mkdir /home/samba/scc/pv/
mkdir /home/samba/scc/work/

# part documents
# ad hoc document directory
mkdir /home/samba/scc/parts
# rsync document directory (preserves original file when overwritten with modified file)
mkdir /home/samba/scc/parts.rsync

# material documents
# ad hoc document directory
mkdir -p /home/samba/scc/material/
# rsync document directory (preserves original file when overwritten with modified file)
mkdir -p /home/samba/scc/material.rsync/

exit 0
