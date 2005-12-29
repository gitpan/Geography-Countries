#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Geography::Countries' );
}

diag( "Testing Geography::Countries $Geography::Countries::VERSION, Perl $], $^X" );
