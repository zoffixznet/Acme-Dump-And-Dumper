#!perl -T

use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

use Acme::Dump::And::Dumper;

my $data_orig = {
    foo => "bar\nber",
    ber => {
        beer => [qw/x y z/],
        obj  => bless([], 'Foo::Bar'),
    },
};

my $output_DnD = <<'END';
$VAR1 = {
          'ber' => {
                     'obj' => 'obj[Foo::Bar]',
                     'beer' => [
                                 'x',
                                 'y',
                                 'z'
                               ]
                   },
          'foo' => 'bar
ber'
        };
END

is( DnD($data_orig), $output_DnD, q{Is it dumping?} );

