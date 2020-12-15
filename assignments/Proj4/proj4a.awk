BEGIN { FS = ",";}
{
    paid = $4;
    EMAIL = $1;
    FULLNAME = $2;
    TITLE = $3;
    AMOUNT = $5;

    if(AMOUNT > paid){

        printf("%s\nNAME %s \nACCOUNT %s %s %d\n", EMAIL, FULLNAME, EMAIL, TITLE, AMOUNT);
    }
}
