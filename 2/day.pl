#!/usr/bin/env perl

use strict;
use warnings;
use feature ":5.14";
use lib "../lib/";
use Advent::Functions qw(h t);
open(F, 'input') or die;
my @lines = <F>;

my $checksum = 0;
my $result = 0;

foreach (@lines) {
    my $line = $_;
    chomp $line;

    my @row = split(" ", $line);
    my @sort = sort { $a <=> $b } @row;
    my $diff = $sort[-1] - $sort[0];
    
    my $div = divide_divisibles(h(@row), t(@row));
    
    $checksum += $diff;
    $result += $div;

    say "@row: diff $diff, div $div";
}

say $checksum;
say $result;

sub divide_divisibles {
    my ($head, @tail) = @_;
    return 0 if not @tail;
    foreach (@tail) {
        return $head / $_ if $head % $_ == 0;
        return $_ / $head if $_ % $head == 0;
    }
    return divide_divisibles(h(@tail), t(@tail));
    0;
}
