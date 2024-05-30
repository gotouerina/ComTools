#! /usr/bin/perl
########make by Kogoori Masaki###########
##--------------------------------------#
use strict;
use warnings;
my @subpopulation1 = ("Bsu","Gca","Cho") ;
my @subpopulation2 = ("Hgl", "Fme");
my @outgroup = ("Scy");

my $vcf = shift;
my $output = shift

open I, "<$vcf" or die "Usage: perl $0 VCF";
open O, ">$output" or die "Usage: perl $0 VCF";

my @data;
while (<I>)
{
	if (/^#/)
       	{
		print O $_;
		if (/^#CHRO/)
		{
			chomp;
			my @line = split(/\t/);
			@data = @line[9..$#line];
			last;
		}
	}
}
print "....................Species:@data....................\n";
print "............Data loaded successfully.................\n";

my @sub1number;
my @sub2number;
my @sub3number;

foreach my $sub1 (@subpopulation1)
{
	for (my $i=0; $i <= $#data; $i++)
	{
		if ($sub1 eq $data[$i])
		{
			my $d = $i + 9;
			push @sub1number,$d;
		}
	}
}


foreach my $sub2 (@subpopulation2)
{
	for (my $i=0; $i <= $#data; $i++)
	{
		if ($sub2 eq $data[$i])
		{
			my $d = $i + 9;
			push @sub2number,$d;
		}
	
	}
}


foreach my $sub3 (@outgroup)
{
	for (my $i=0; $i <= $#data; $i++)
	{
		if ($sub3 eq $data[$i])
		{
			my $d = $i + 9;
			push @sub3number,$d;
		}
	}
}
print "Stored:@sub1number\n";
print "Stored:@sub2number\n";
print "Stored:@sub3number\n";
print "................Convergent Idenfication Started.................\n";
close I;
open I, "<$vcf" or die "Usage: perl $0 VCF";
while (<I>)
{	#print $_;
		if (/^#/) {}
	else
	{
		chomp;
		my @line = split (/\t/);
		my @sub1;
		my @sub2;
		my @sub3 ;
		foreach my $sub1 (@sub1number)
			{
				push @sub1,$line[$sub1];
			}
		foreach my $sub2 (@sub2number)
			{
				push @sub2,$line[$sub2];
			}
		foreach my $sub3 (@sub3number)
			{
				
				push @sub3,$line[$sub3];
			}
		my @sortedsub1 = sort @sub1;
		my @sortedsub2 = sort @sub2;
		my @sortedsub3 = sort @sub3;		
		if ($sortedsub1[0] eq  $sortedsub1[-1] &&  $sortedsub2[0] eq  $sortedsub2[-1] && $sortedsub3[0] eq $sortedsub3[-1])
		{
			if ($sortedsub1[0] ne $sortedsub2[0] && $sortedsub1[0] ne $sortedsub3[0] && $sortedsub2[0] ne $sortedsub3[0])
			{			
				if (/PASS/)
				{
					print O  "$_\n";
				}
			}
		}
	}
}
close I;
close O;
print "................Convergent Idenfication Finished................\n";
