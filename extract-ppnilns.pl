#!/usr/bin/perl
use v5.14.1;

# Extract PPN and comma-separated list of ILN from normalized PICA+
# See also <https://format.k10plus.de/k10plushelp.pl?cmd=kat&val=0000&katalog=Standard&adm=1>
while (<>) {
    for ( split /\x1E/ ) {
        my ( $field, $tmp ) = split ' ', $_, 2;
        my ( undef, @sf ) = split /\x1F/, $tmp;

        if ( $field eq '003@' ) {
            print substr( $sf[0], 1 );
        }
        elsif ( $field eq '101@' ) {

            # ILN: $a, ISIL: $b
            my @bibs = grep { $_ } map { $1 if $_ =~ /^a(.+)/ } @sf;
            print join( ",", "", @bibs ) if @bibs;
        }
    }
    say "";
}
