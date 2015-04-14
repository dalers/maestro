#!/bin/sh
#
# Fixes (modifies) directory and file modified dates in repo
# according to design iteration dates.
# - MUST run as root (required to set root as file owner)
# - MUST run from /home/maestro/scc/bin/
#
# Iteration:
# 1  Prototype                   2013-01-01
# 2  PCB Revision                2013-01-02
# 3  Product Release             2013-01-03
# 4  Manufacturing Improvements  2013-01-04
# 5  Field spares kit            2013-01-05
#

# master data files that currently don't include iteration
echo "setup_fix_iteration_datetime: master, ganttproject, todolist"
touch -t 201301010101 ../master/*
touch -t 201301010101 ../tdl/*
touch -t 201301010101 ../tdl/*

echo "setup_fix_iteration_datetime: Iteration 1 pv, csv"
touch -t 201301010101 ../pv-1/pv.mdb
find ../parts-1 -exec touch -t 201301010101 {} \;
find ../parts-1-nover -exec touch -t 201301010101 {} \;

echo "setup_fix_iteration_datetime: Iteration 2 pv, csv"
touch -t 201301020101 ../pv-2/pv.mdb
find ../parts-2 -exec touch -t 201301020101 {} \;
find ../parts-2-nover -exec touch -t 201301020101 {} \;

echo "setup_fix_iteration_datetime: Iteration 3 pv, csv"
touch -t 201301030101 ../pv-3/pv.mdb
find ../parts-3 -exec touch -t 201301030101 {} \;
find ../parts-3-nover -exec touch -t 201301030101 {} \;

echo "setup_fix_iteration_datetime: Iteration 4 pv, csv"
touch -t 201301040101 ../pv-4/pv.mdb
find ../parts-4 -exec touch -t 201301040101 {} \;
find ../parts-4-nover -exec touch -t 201301040101 {} \;

echo "setup_fix_iteration_datetime: Iteration 5 pv, csv"
touch -t 201301050101 ../pv-5/pv.mdb
find ../parts-5 -exec touch -t 201301050101 {} \;
find ../parts-5-nover -exec touch -t 201301050101 {} \;
