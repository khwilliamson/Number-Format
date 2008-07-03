# -*- CPerl -*-

use Test::More qw(no_plan);
use POSIX;

BEGIN { use_ok('Number::Format') }
BEGIN { use_ok('POSIX') }

SKIP:
{
    setlocale(&LC_ALL, 'de_DE') or skip;
    my $german = Number::Format->new();
    my $marks_or_euros = $german->format_price(123456.789);
    ok($marks_or_euros eq 'DEM 123.456,79' ||
       $marks_or_euros eq 'EUR 123.456,79', 'marks or euros');
}

SKIP:
{
    setlocale(&LC_ALL, 'en_US') or skip;
    my $english = Number::Format->new();
    is($english->format_price(123456.789), 'USD 123,456.79', 'dollars');
}
