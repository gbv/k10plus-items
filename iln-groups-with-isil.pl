#!/usr/bin/env perl
use v5.14.1;

my %libraries;

while (<>) {    # kxp-libraries-reduced.tsv
    chomp;
    my ( $iln, $isil, $name ) = split "\t";

    if ( $libraries{$iln} ) {
        push @{ $libraries{$iln}->{isil} }, $isil;
    }
    else {
        $libraries{$iln} = { name => $name, isil => [$isil] };
    }
}

while ( my ( $iln, $lib ) = each %libraries ) {
    my @isil = @{ $lib->{isil} };
    say "$iln: $lib->{name} [$isil[0]" . ( @isil > 1 ? "..." : "" ) . "]";
}
