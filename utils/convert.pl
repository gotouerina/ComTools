use strict;
use warnings;

my $nametxt = shift;
my $gff = shift;
open I, "<$nametxt" or die "Usage: perl $0 convert_txt gff3";

my %data;
while (<I>) 
{
        chomp;
        my @row = split(/\t/);
        $data{$row[0]} = $row[1];
}

open I1, "<$gff" or die "";
while (<I1>)
{
        #chomp;
        foreach my $key (keys %data)
        {
                $_ =~ s/$key/$data{$key}/g;
        }
        print;
}
