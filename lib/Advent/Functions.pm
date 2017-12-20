package Advent::Functions;
require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw(h t);

sub h { $_[0]; }
sub t { shift; @_ };

1;
