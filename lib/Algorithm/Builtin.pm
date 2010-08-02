package Algorithm::Builtin;
use strict;
use warnings;

sub sort {
    my ($class, @values) = @_;
    CORE::sort { $a <=> $b } @values;
}

1;
