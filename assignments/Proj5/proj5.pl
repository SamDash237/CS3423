#!/usr/bin/perl -w

my $date = $ARGV[0];

open (INFILE1, "<", "p5Customer.txt")  or die "Cannot open file: $!";
    while (my $line1 = <INFILE1>) {
        my ($email, $fullname, $title, $paid, $owed) = split( /,/, $line1);
        if ($owed > $paid) {
            my $amount = $owed;
        my @nameArray = split( / /, $fullname);

open(INFILE2, "<", "template.txt") or die "Cannot open file: $!";
open(OUTFILE2, ">", $email);

while (my $line2 = <INFILE2>) {
        $line2 =~ s/EMAIL/$email/g;
        $line2 =~ s/FULLNAME/$fullname/g;
        $line2 =~ s/TITLE/$title/g;
        $line2 =~ s/NAME/$nameArray[-1]/g;
        $line2 =~ s/AMOUNT/$amount/g;
        chomp($amount);
        $line2 =~ s/DATE/$date/g;

print OUTFILE2 $line2;
    }
    }
}
close(INFILE1);
close(OUTFILE2);
close(INFILE2);
