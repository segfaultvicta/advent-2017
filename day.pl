#!/usr/bin/env perl

use strict;
use warnings;
use feature ":5.14";

open(F, 'input') or die;
my @lines = <F>;

chomp(my $fl = $lines[0]);

