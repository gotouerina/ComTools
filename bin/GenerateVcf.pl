#! /usr/bin/perl
# 2024.5.3 version 1
# Convert MAF format to VCF format and download analysis
use strict;
use warnings;
my $maf = shift or die "Usage: perl $0 MAF VCF speciesList";
my $vcf = shift or die "Usage: perl $0 MAF VCF speciesList";
##Set the First Species as the reference
my $speciesList = shift or die "Usage: perl $0 MAF VCF speciesList";
my @species;
open I, "<$speciesList" or die "Usage: perl $0 MAF VCF speciesList";

while (<I>)
{
	chomp;
	push @species, $_;
}
print "Set the $species[0] as Reference Genome\n";

my $group = join(",", @species);
open O, ">GenerateVcf.log" or die "Usage: perl $0 MAF VCF speciesList";
print O "input.file=$maf\n";
print O "input.format=Maf\n";
print O "output.log=GenerateVcf.log\n";
print O "maf.filter= VcfOutput( \\ \n";
print O "file=$vcf,  \\ \n" ;
print O	"compression=none,  \\  \n";
print O "reference=Bsu,  \\ \n";
print O "genotypes=($group),  \\      \n";
print O "all=no )";
close O;
print ".....Start Vcf Generating.....";
exec ("maffilter param=GenerateVcf.log");
