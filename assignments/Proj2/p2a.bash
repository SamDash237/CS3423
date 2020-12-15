#!/bin/bash
#bash file for running problem A

sed -f p2aDollar.sed lastlog1.out > lastlog1return.txt
sed -f p2a.sed lastlog2.out > lastlog2return.txt
grep -f lastlog1return.txt lastlog2return.txt  > p2a.out
