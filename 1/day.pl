#!/usr/bin/env perl

use strict;
use warnings;
use feature ":5.14";

open(F, 'input') or die;
my @lines = <F>;

chomp(my $fl = $lines[0]);


my $same = 0;
my $b = 0;
my $ilen = length($fl) - 1;
my $half = length($fl) / 2;

#say "ilen: $ilen, half is $half";

for(my $place = 0; $place <= $ilen; $place++) {
    my $first = substr($fl, $place, 1);
    my $second = $place != $ilen ? substr($fl, $place + 1, 1) : substr($fl, 0, 1);
    my $halfway_around = ($place + $half) % length($fl);
    my $b_part = substr($fl, $halfway_around, 1);
    #say "$place, $halfway_around: $first, $second, $b_part";
    $same += $first if $first eq $second;
    $b += $first if $first eq $b_part;
}

say $same;
say $b;
