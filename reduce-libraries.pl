#!/usr/bin/env perl
use v5.14.1;

my %isil2iln;

while (<>) {
    chomp;
    my ( $iln, $eln, $name, $isil ) = split "\t";
    next if $isil !~ /^[A-Z]{1,4}-[A-Za-z0-9:\/-]{1,11}$/;

    # ISIL looks like sub-library with same ILN
    if ( $isil2iln{ ( $isil =~ s/-[^-]+$//r ) } eq $iln ) {
        next;
    }

    $name =~ s/\s+$//;
    say join "\t", $iln, $isil, $name;

    $isil2iln{$isil} = $iln;
}

