#! /usr/bin/perl
use strict;
use warnings;
my $lst = shift;
open I,"<$lst" or die "Usage: perl $0 lst select_chr";

my $chr = shift;
open O,">$chr.lst" or die "";

my @header;
while(<I>)
{
        #chomp;
        if(/pos/)
        {
                print O;
        }
        else
        {
                if (/$chr\t/)
                {
                        print O "$_";
                }       
        }
}
