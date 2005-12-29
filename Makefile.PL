use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Geography::Countries',
    AUTHOR              => 'Ashley <ashley@cpan.org>',
    VERSION_FROM        => 'lib/Geography/Countries.pm',
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Geography-Countries-*' },
);
