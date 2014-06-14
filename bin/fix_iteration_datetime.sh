#!/bin/sh
#
# Modifies directory and file timestamps according to
# iteration dates.
# - execute from in .../maestro/bin/
# - root user is required to set root as file owner
#
# Iteration:
# 1  Prototype                   2013-01-01
# 2  PCB Revision                2013-01-02
# 3  Product Release             2013-01-03
# 4  Manufacturing Improvements  2013-01-04
# 5  Field spares kit            2013-01-05
#
# Refer to the Maestro project Wiki for more information.
#

# master data spreadsheets currently do not change with iteration
touch -t 201301010101 ../scc/excel/*

echo "Iteration 1..."
touch -t 201301010101 ../scc/pv/pv-1.mdb
touch -t 201301010101 ../scc/csv-1/*
find ../scc/parts-1 -exec touch -t 201301010101 {} \;
find ../scc/parts-1-nover -exec touch -t 201301010101 {} \;

echo "Iteration 2..."
touch -t 201301020101 ../scc/pv/pv-2.mdb
touch -t 201301020101 ../scc/csv-2/*
find ../scc/parts-2 -exec touch -t 201301020101 {} \;
find ../scc/parts-2-nover -exec touch -t 201301020101 {} \;

echo "Iteration 3..."
touch -t 201301030101 ../scc/pv/pv-3.mdb
touch -t 201301030101 ../scc/csv-3/*
find ../scc/parts-3 -exec touch -t 201301030101 {} \;
find ../scc/parts-3-nover -exec touch -t 201301030101 {} \;

echo "Iteration 4..."
touch -t 201301040101 ../scc/pv/pv-4.mdb
touch -t 201301040101 ../scc/csv-4/*
find ../scc/parts-4 -exec touch -t 201301040101 {} \;
find ../scc/parts-4-nover -exec touch -t 201301040101 {} \;

echo "Iteration 5..."
touch -t 201301050101 ../scc/pv/pv-5.mdb
touch -t 201301050101 ../scc/csv-5/*
find ../scc/parts-5 -exec touch -t 201301050101 {} \;
find ../scc/parts-5-nover -exec touch -t 201301050101 {} \;
