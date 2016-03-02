use strict;
use warnings;
my %seq;

#read sequences
open(FILE,"TAIR10_upstream_1000_translation_start_20101028") or die;
$/ = "\n>";
while(<FILE>){
    chomp;
    s/>//g;
    s/^(.*)\n//;
    my $name = $1;
    $name =~ s/ .*//;
    s/\n//g;
    $seq{$name} = $_;
}
close FILE;

open(FILE,$ARGV[0]) or die;
$/ = "\n";
while(<FILE>){
    chomp;
    my $seq = $_; #get id from your file
    #get sequences
	if(exists $seq{"$seq"}){
		if(length($seq{"$seq"})>8){
			if(length($seq{"$seq"})<55000){
    			print ">$seq\n".$seq{"$seq"}."\n";
			}
		}
	}
}
close FILE;
