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
    # Validate that the month is between 1-12
    # Validate that the days is between 1-31
    return pad($1) . qq(/) . pad($2) . qq(/) . year($3) . pad($3) ;
  }
  return "error"
}

sub processStatus {
  return "x";
}

sub processEmployeeID {
  return "x";
}

# Read from stdin - must pipe CSV into program
while(<STDIN>) {
  # Split each line into an array by commas
  my @cols = split /,/;

  # See what is in each array 
  # print Dumper \@cols;

  # Process the date (first element in the @cols array)
  print effectiveDate($cols[0]) . "\n";

  print effectiveDate($cols[0]) .
    processStatus($cols[0]) .
    processEmployeeID($cols[0]);
}


