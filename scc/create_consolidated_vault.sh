#!/bin/sh
#
# Creates a single plm-vault by consolidating
# plm-vault-1 .. plm-vault-5
#
# ./create_consolidated_vault.sh
#

mkdir plm-vault

cp -r plm-vault-1/* plm-vault/
cp -r plm-vault-2/* plm-vault/
cp -r plm-vault-3/* plm-vault/
cp -r plm-vault-4/* plm-vault/
cp -r plm-vault-5/* plm-vault/
