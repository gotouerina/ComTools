#! /usr/bin/perl
use strict;
use warnings;
my $maf = shift or die "Usage perl $0 maf cdsmaf ref gff";
my $cdsmaf = shift or die "Usage perl $0 maf cdsmaf ref gff";
my $ref = shift or die "Usage perl $0 maf cdsmaf ref gff";
my $gff = shift or die "Usage perl $0 maf cdsmaf ref gff";

open O, ">ExtractCDS.log" or die "Usage perl $0 $maf $cdsmaf $ref $gff";
print "....Start Extracting....";
print O "input.file=$maf\ninput.format=Maf\ninput.file.compression=none\noutput.log=ExtractCDS.log\n";
print O "maf.filter= ExtractFeature(   \\ \n";
print O "ref_species=$ref, \\ \n";
print O "feature.file=$gff, \\ \n";
print O  "feature.file.compression=none, \\ \n";
print O	 "feature.format=GFF, \\    \n";
print O	"feature.type=CDS,   \\ \n";
print O	"compression=none,   \\                \n";
print O	 "  complete=yes,    \\                   \n";
print O	  "     ignore_strand=no), \\    \n";
print O	"	Output(             \\   \n";
print O	 "      file=data.filtered.maf,    \\      \n";
print O	  "    compression=none,       \\            \n";
print O	   "   mask=yes) \\ \n";
close O;
exec ("maffilter  param=ExtractCDS.log")
