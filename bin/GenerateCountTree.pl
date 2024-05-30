#! /usr/bin/perl
#2024.5.30 v1.0
use strict;
use warnings;

my $input = shift or die "Usage : perl $0 input_Maf Outgroup Out_treefile";
my $Outgroup = shift or die "Usage : perl $0 input_Maf Outgroup Out_treefile";
my $treefile = shift or die "Usage : perl $0 input_Maf Outgroup Out_treefile";

open O,">GenerateCountTree.log" or die "Error: Can't Output Configure File";
print O "input.file=$input\ninput.format=Maf\ninput.file.compression=none\noutput.log=GenerateCountTree.log\n";
print O "maf.filter =  DistanceEstimation(  \\\n method=count,\\\n   gap_option=no_double_gap,      \\\nunresolved_as_gap=no, \\\nextended_names=yes), \\\n";
print O "DistanceBasedPhylogeny( \\\n method=bionj, \\\n dist_mat=CountDistance), \\\n ";
print O "NewOutgroup( \\\n tree_input=BioNJ, \\\n tree_output=NioNJ_rooted, \\\n outgroup=$Outgroup), \\\n";
print O "OutputTrees(\\\n tree=NioNJ_rooted,  \\\n file=$treefile, \\\n compression=none), ";

exec ("maffilter param=GenerateCountTree.log")
