#################lst2fasta.pl###############
##--------------------------------------####
########make by Kogoori Masaki##############
##--------------------------------------####
####Usage: perl $0 speciesnumber lst fasta##
#! /usr/bin/perl
use strict;
use warnings;
my $species = shift;
my $lst = shift;
#open I, "<$lst" or die "Usage: perl $0 speciesnumber lst fasta";

my $i = 2;
for ($i=2; $i<=($species+1); $i++)
{
        my $d = 1;
        open I, "<$lst" or die "Usage: Usage: perl $0 speciesnumber lst fasta";
        print ">";
        while (<I>)
        {
                my @data = split(/\t/);
                print $data[$i];
                if ($d ==1)
                {
                        print "\n";
                        $d = $d +1;
                }

        }
                print "\n";
        close I;
}
