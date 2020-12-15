#!/bin/bash

read email name
read aptnum rent accbal nextdue
accbal2=`echo $accbal + $payamount | bc`
echo "New balance: " $accbal2
exit
