#!/bin/bash
#bash file for running problem B

sed -f p2a.sed lastlog1.out > lastlogb1.txt
sed -f p2a.sed lastlog2.out > lastlogb2.txt
cat lastlogb2.txt lastlogb2.txt | sort | uniq -c > lastlogb.txt
sed -f p2b.sed lastlogb.txt > p2b.out
