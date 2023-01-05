#!/usr/bin/env perl
use v5.14.1;

while (<>) {
    chomp;
    my ( $iln, $eln, $name, $isil ) = split "\t";
    next if $isil !~ /^[A-Z]{1,4}-[A-Za-z0-9:\/-]{1,11}$/;
    $name =
`curl -s https://sigel.staatsbibliothek-berlin.de/api/org/$isil.jsonld | jq -r .member[].name`;
    print join "\t", $iln, $isil, $name;
}

