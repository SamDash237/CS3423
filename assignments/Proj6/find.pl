#!/usr/bin/perl -w

if ($ARGV[0] eq "-i") {
    my $regex = $ARGV[1];
    for($j = 1; $j <= $#ARGV; $j++) {
        grep(s/DataA\/?//g, $ARGV[$j]);
        push(@filelist, $ARGV[$j]);
    }
while(<@filelist>) {
    $file = $_;
    open(IN, "< DataA/$file") or die;
    if($_ !~ /$regex/) {
        print "$file\n";
    }
}
}
else {
    my $regex = $ARGV[0];
    for($i = 1; $i <= $#ARGV; $i++) {
    grep(s/DataA\/?//g, $ARGV[$i]);
    push(@filelist, $ARGV[$i]);
}
while(<@filelist>) {
    $file = $_;
open(IN, "< DataA/$file") or die;
    if($file =~ /$regex/) {
        print "$file\n";
    }
    while(<IN>) {
        if(/$regex/) {
            print "$file:$_";
        }
    }
    close(IN);
    }
}
