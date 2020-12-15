#!/bin/awk
{
    if($1 ~ "NAME"){
        n=NF
        NAME = $n;
        FULLNAME = $2" "$3" "$4;
    }
    else if($1 ~ "ACCOUNT"){
        EMAIL = $2;
        TITLE = $3;
        AMOUNT = $4;
    }
    else if($1 ~ "DATE"){
        DATE = $2"-"$3"-"$4;
    printf("s/FULLNAME/%s/g\ns/EMAIL/%s/g\ns/TITLE/%s/g\ns/NAME/%s/g\ns/AMOUNT/%0.2f/g\ns/DATE/%s/g\n", FULLNAME, EMAIL, TITLE, NAME, AMOUNT, DATE);
    }

}
