#! /usr/bin/perl
use strict;
use warnings;
my @species = ("Scaptochirus","Condylura","Dymecodon","Euroscaptor","Galemys","Neurotrichus","Parascalops","Parascaptor","Scalopus","Scapanulus","Scapanus","Scaptonyx","Sorex","Teuropaea","Toccidentalis","Uropsilus","Mogera","Urotrichus");
my $lst = shift;
#open I, "<$lst" or die "Usage: perl $0 lst fasta";

my $i = 2;
for ($i=2; $i<=@species; $i++)
{
        my $d = 1;
        open I, "<$lst" or die "Usage: perl $0 lst fasta";
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
