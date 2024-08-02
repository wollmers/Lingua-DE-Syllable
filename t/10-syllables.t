#!/usr/bin/env perl
#
use 5.006;
use strict;
use warnings FATAL => 'all';
use utf8;

use lib qw(
../lib/
./lib/
);

use Test::More;
use Test::More::UTF8;

use Lingua::DE::Syllable;

use Text::Hyphen::DE;
my $hyphenator = Text::Hyphen::DE->new;

# Vocal a,e,i,o,u,ä,ö,ü,y,é,è,ë,ï
# Diphthong   ej,
#   aa,ai,au,ay,ee,ei,eu,ey,ie,ui,äu,

# Hiat Cha-os, Rotari-er, Radi-o, Bo-a, Ru-ine
# Spray und Schwejk
#  Ziesar Lienz  Dienten  Brienz  Spiez

my %tests = (
    ''  => 0,
    'b' => 1,
    'paar'          => 1,
    # klimaanlage 5
    # rafael 3
    # naiv 2 # naïve
    # Citroën
    # aquitanien 5
    'Bahre'         => 2, # Bah-re
    'Pavian'        => 3, # Pa-vi-an
    'Dokumente'     => 4, # Do-ku-men-te
    'Violine'       => 4, # Vi-o-li-ne
    'Helikopter'    => 4, # He-li-kop-ter
    'Café'          => 2,
    'Idè'           => 2, # I-de (normalized)
    'Mayer'         => 2, #
    'Restaurant'    => 3, # Rest-au-rant
    'Tyrannosaurus' => 5, # Tyr-ann-o-sau-rus
);



for my $key ( keys %tests ) {
    is( syllables($key), $tests{$key}, "'" . $key . "'" . ': ' . $tests{$key} );
}

for my $key ( keys %tests ) {
    is( syllables1($key), $tests{$key}, "'" . $key . "'" . ': ' . $tests{$key} );
}

for my $key ( keys %tests ) {
    is( syllables2($key), $tests{$key}, "'" . $key . "'" . ': ' . $tests{$key} );
}

for my $key ( keys %tests ) {
    is( syllables3($key), $tests{$key}, "'" . $key . "'" . ': ' . $tests{$key} );
}

for my $key ( keys %tests ) {
    is( syllables0($key), $tests{$key}, "'" . $key . "'" . ': ' . $tests{$key} );
}

#for my $key ( keys %tests ) {
#    my @syll = $hyphenator->hyphenate($key);
#    is( scalar(@syll), $tests{$key}, "'" . $key . "'" . ': ' . $tests{$key} );
#}

done_testing;
