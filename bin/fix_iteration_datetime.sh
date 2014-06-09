#!/bin/sh
#
# Modifies directory and file timestamps according to
# iteration dates.
# - execute as root from top level of file structure (same
#   directory as this file)
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

echo "Iteration 1..."
touch -t 201301010101 pv/pv-1.mdb
touch -t 201301010101 plm-csv-1/*
find ./plm-vault-1 -exec touch -t 201301010101 {} \;
find ./plm-vault-1-nover -exec touch -t 201301010101 {} \;

echo "Iteration 2..."
touch -t 201301020101 pv/pv-2.mdb
touch -t 201301020101 plm-csv-2/*
find ./plm-vault-2 -exec touch -t 201301020101 {} \;
find ./plm-vault-2-nover -exec touch -t 201301020101 {} \;

echo "Iteration 3..."
touch -t 201301030101 pv/pv-3.mdb
touch -t 201301030101 plm-csv-3/*
find ./plm-vault-3 -exec touch -t 201301030101 {} \;
find ./plm-vault-3-nover -exec touch -t 201301030101 {} \;

echo "Iteration 4..."
touch -t 201301040101 pv/pv-4.mdb
touch -t 201301040101 plm-csv-4/*
find ./plm-vault-4 -exec touch -t 201301040101 {} \;
find ./plm-vault-4-nover -exec touch -t 201301040101 {} \;

echo "Iteration 5..."
touch -t 201301050101 pv/pv-5.mdb
touch -t 201301050101 plm-csv-5/*
find ./plm-vault-5 -exec touch -t 201301050101 {} \;
find ./plm-vault-5-nover -exec touch -t 201301050101 {} \;
