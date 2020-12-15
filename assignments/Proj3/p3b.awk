#!/bin/awk
BEGIN {
    printf("%-7s %-4s  %10s %15s\n", "Name", "Flight", "Seats", "Total Cost");
    total = 0;
}
{
    if($1 ~ "CUST") {
    name =$6;
    }
    if($1 ~ "RESERVE"){
        flight = $2;
        flights[$2] += $3;
        seats = $3;
        seatPrice = seats * $4;
        printf("%-7s %-5s %8d %14.2f\n", name, flight, seats, seatPrice);
        total = total + seatPrice;
    }
    if($1 ~ "ENDCUST"){
        printf("%20sTotal:%14.2f \n", " ", total);
        total = 0;
    }

}
END{
    printf("%-7s %4s\n", "Flight", "Total Seats");
    for(key in flights){
    printf("%-7s %4s\n", key, flights[key]);
    }
}
