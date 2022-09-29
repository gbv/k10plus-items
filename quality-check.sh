#!/usr/bin/bash

TSV=kxp-libraries.tsv

echo "# Kaputte Zeilen"
awk -F'\t' 'NF != 4 {print}' $TSV

echo
echo "# Formal falsche ISIL"
awk -F'\t' '$4 && $4 != "--" && $4 !~ /^[A-Z]{1,4}-[A-Za-z0-9:/-]{1,11}$/ {print $4}' $TSV

echo
echo "# ISLN mit mehreren ILN"
awk -F'\t' '$4 && $4 != "--" {print $2,$4}' $TSV | uniq -D -f 1

