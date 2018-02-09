#!/usr/bin/perl

use strict;
use warnings;

sub main
{
my $filename = IFT383_TO_IA_CAD_20180204.csv;

open(INPUT, $filename)  or die "Couldn't open $filename : $!\n";

my $line = <INPUT>;

$line = ~s/EffectiveDate/Effective Date/g;

print "Effective Date";
