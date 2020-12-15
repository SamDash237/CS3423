#!/bin/bash

echo -e "$1" > dateOriginal.txt
awk -f proj4Date.awk dateOriginal.txt >dateModified.txt

awk -f proj4a.awk p4Customer.txt > p4CustomerSpace.txt

File=$(find -name "Emails")
if [ -z "$File" ]; then
   mkdir Emails
else
   rm -r Emails
   mkdir Emails
fi

./proj4b.bash < p4CustomerSpace.txt
