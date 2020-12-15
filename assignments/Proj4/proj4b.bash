#!/bin/bash
entry=0
while [ $entry ]; do
    if ! read Ln; then
        break
    fi
    read Ln1
    read Ln2
    echo -e "$Ln1 \n$Ln2" > Ln.txt

    cat Ln.txt dateModified.txt > LnDateMod.txt

    awk -f proj4b.awk LnDateMod.txt > gProj4.sed

    sed -f gProj4.sed template.txt > ./Emails/"$Ln"
done
