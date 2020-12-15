#!/usr/bin/perl -w
use File::Copy 'move';
my $directory1 = "DataB";
if (!-d $directory1) {
    mkdir $directory1 or die ("could not create directory");
}
my @filelist = glob("$directory1/*");
foreach my $file(@filelist){
    ($directory2, $filename) = split(/\//,$file);
    if($filename =~ m/.*proj(.*)\../){
        my $folder1 = "./$directory2/assignment$1";
        if(-d $folder1){
            move($file, "$folder1/$filename") or die;
            opendir(ASSIGN, $folder1) or die;
            closedir ASSIGN;
    }
    else{
        mkdir $folder1;
        move($file, "$folder1/$filename") or die;
        opendir(ASSIGN, $folder1) or die;
        closedir ASSIGN;
    }
}
elsif($filename !~ m/.*proj(.*)\../){
    my $folder2 = "./$directory2/misc";
    if(-d $folder2){
        move($file, "$folder2/$filename") or die;
        opendir(MISC, $folder2) or die;
        closedir MISC;
    }
    else{
        mkdir $folder2;
        move($file, "$folder2/$filename");
        opendir(MISC, $folder2) or die;
       closedir MISC;
    }
  }
}
