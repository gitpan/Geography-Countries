#!perl

use Test::More tests => 18;

BEGIN {
    use Geography::Countries qw /:DEFAULT :LISTS :FLAGS :INDICES/;
    $loaded = 1;
}
END { print "not ok 1\n" unless $loaded; }

cmp_ok("Germany", "eq", country("DE"), "Germany is DE");

cmp_ok("Netherlands", "eq", country("NLD"), "Netherlands is NLD");

cmp_ok("Mali", "eq", country(466), "Mali is 466");

cmp_ok("Europe", "eq", country(150, CNT_F_ANY),
       "Europe is 150, CNT_F_ANY (" . CNT_F_ANY . ")" );

cmp_ok("Federal Republic of Germany", "eq", country(280, CNT_F_OLD),
       "Federal Republic of Germany is 280, CNT_F_OLD (" . CNT_F_OLD . ")");

cmp_ok("Germany", "eq", country("DE"), "Germany is DE");

my $e = country 150;
ok(!defined($e), "country(150) returned undefined");

my @list = country "United Kingdom";

cmp_ok($list[CNT_I_CODE2], "eq", "GB",
      "(country('United Kingdom'))[" .CNT_I_CODE2. "] is GB");

cmp_ok($list[CNT_I_CODE3], "eq", "GBR",
      "(country('United Kingdom'))[" .CNT_I_CODE3. "] is GBR");

cmp_ok($list[CNT_I_NUMCODE], '==', 826,
      "(country('United Kingdom'))[" . CNT_I_NUMCODE
       . "] is 826");

cmp_ok($list[CNT_I_COUNTRY], "eq", "United Kingdom",
      "(country('United Kingdom'))[" . CNT_I_COUNTRY
       . "] is United Kingdom");

cmp_ok( scalar code2(), '==', 242,
        "There are 242 codes in code2()");

cmp_ok( scalar code3(), '==', 242,
        "There are 242 codes in code3()");

cmp_ok( scalar numcode(), '==', 288,
        "There are 288 codes in numcode()");

cmp_ok( scalar countries(), '==', 289,
        "There are 289 codes in countries()");



my %count;
$count{$_}++ for code3();
ok(! (grep { /^[^1]$/ } values %count),
   "No duplication in code3()");

# diag( join", ", code3() ); # if you wanna see

eval { my $c = &country(1, 2, 3); };

ok( $@ =~ /^Too many arguments/,
    "country(1, 2, 3) throws fatal, \"Too many arguments...\"");

eval { my $c = &country(1, "foobah") };
ok( $@ =~ /^Illegal second argument/,
    "country(1, \"foobah\") throws fatal, \"Illegal second argument...\"");


__END__



eval {my $c = country 1, "foobah"};
printf "%sok %d\n", $@ =~ /^Illegal second argument/
                    ? "" : "not ", ++ $test;

printf "%sok %d\n", defined $Geography::Countries::VERSION
                    ? "" : "not ", ++ $test;

