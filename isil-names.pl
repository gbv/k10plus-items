#!/usr/bin/env perl
use v5.14.1;

my ( $iln0, $isil0 );

while (<>) {
    chomp;
    my ( $iln, $eln, $name, $isil ) = split "\t";
    next if $isil !~ /^[A-Z]{1,4}-[A-Za-z0-9:\/-]{1,11}$/;

    # ISIL looks like sub-library with same ILN
    if ( $iln eq $iln0 && $isil0 ) {
        next if ( 0 == rindex $isil, "$isil0-", 0 );
    }

    $name .= "\n";

#    $name =
#`curl -s https://sigel.staatsbibliothek-berlin.de/api/org/$isil.jsonld | jq -r .member[].name`;
    print join "\t", $iln, $isil, $name;

    # previous line
    $iln0  = $iln;
    $isil0 = $isil;
}

