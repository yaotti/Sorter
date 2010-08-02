package Sorter;
use strict;
use warnings;

use UNIVERSAL::require;

use base qw/Class::Accessor::Fast/;


__PACKAGE__->mk_accessors(qw/values algorithm/);

sub new {
    my $class  = shift;
    bless {}, $class;
}

sub get_values {
    @{shift->values||[]};
}

sub set_values {
    my $self = shift;
    $self->values(\@_);
}

sub sort {
    my $self = shift;
    my $algo = $self->algorithm || 'builtin';
    my $class = "Algorithm::".ucfirst($algo);
    $class->require or die $@;
    $self->set_values($class->sort($self->get_values));
}

1;
