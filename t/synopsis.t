#!perl

use strict;
use FindBin;
use lib "$FindBin::Bin/../lib";

use Test::More tests => 2;

#------------------------------------------------------------------
open F, '<', "$FindBin::Bin/../lib/Geography/Countries.pm"
    or die "Couldn't open self module to read!";

my $synopsis = '';
while ( <F> ) {
    if ( /=head1 SYNOPSIS/i .. /=head\d (?!S)/
                   and not /^=/ )
    {
        $synopsis .= $_;
    }
}
close F;

ok( $synopsis,
    "Got code out of the SYNOPSIS space to evaluate" );

# diag( $synopsis ); # if you want to see it

eval "use warnings; use strict; $synopsis";

diag( $@ . "\n" . $synopsis ) if $@;

ok( ! $@, "Synopsis code sample eval'd" );
