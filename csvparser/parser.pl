#!/usr/bin/perl

use Data::Dumper qw(Dumper);

sub pad {
  return sprintf("%02d", @_);
}

sub year {
  if (@_ < 18) {
    return 20;
  }
    return 19;
}

sub effectiveDate {
  my ($data) = @_;
  print "processing: $data... to: ";
  if ($data =~ /^(\d{1,2})\/(\d{1,2})\/(\d{1,2})$/) {
    return pad($1) . qq(/) . pad($2) . qq(/) . year($3) . pad($3) ;
  }
  return "error"
}

while(<STDIN>) {
  my @cols = split /,/;
#  print Dumper $cols[0];
  print effectiveDate($cols[0]) . "\n";
}


