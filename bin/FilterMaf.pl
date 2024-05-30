#! /usr/bin/perl
use strict;
use warnings;
#Remain all speceis in speciesList
#Filter out length < 150 bp
my $maf = shift;
my $filtermaf = shift;
my $speciesList = shift;
my $minlength = shift;
my @species;
open I, "<$speciesList" or die "Usage: perl $0 MAF NewMAF speciesList minlength";
while (<I>)
{
	chomp;
	push @species, $_;
}
my $group = join(",", @species);
print "....Stored @species....\n";
print "Set the $species[0] as Reference Genome\n";
print "....Start Filter block with all species....\n";
open O, ">Filter.log" or die "Usage: perl $0 MAF NewMAF speciesList minlength"; 
print O "input.file=$maf\ninput.format=Maf\ninput.file.compression=none\noutput.log=Filter.log\n";
print O "maf.filter = SelectOrphans(       \\ \n";
print O "species=($group),  \\ \n";
print O "strict=yes,   \\ \n";
print O "remove_duplicates=yes), \\ \n";
print O  "MinBlockLength(min_length=150), \\ \n";
print O "Output(  \\ \n";
print O "file=$filtermaf, \\ \n";
print O "compression=none,\\  \n";
print O "mask=yes), \\ \n";
exec "maffilter  param=Filter.log";
