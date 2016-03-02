use strict;
use warnings;
my %seq;

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
    my $seq = $_;
	if(exists $seq{"$seq\.1"}){
		if(length($seq{"$seq\.1"})>8){
    			print ">$seq\n".$seq{"$seq\.1"}."\n";
		}
	}
}
close FILE;
