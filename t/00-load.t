#!/usr/bin/env perl
#
use 5.006;
use strict;
use warnings FATAL => 'all';

use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Lingua::DE::Syllable' ) || print "Bail out!\n";
}

diag( "Testing Lingua::DE::Syllable $Lingua::DE::Syllable::VERSION, Perl $], $^X" );

done_testing;
