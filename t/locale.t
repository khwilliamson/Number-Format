# -*- CPerl -*-

use Test::More tests => 4;

BEGIN { use_ok('Number::Format') }
BEGIN { use_ok('POSIX') }

SKIP:
{
    setlocale(&LC_ALL, 'de_DE')
        or skip("Unable to set de_DE locale", 1);

    my $german = Number::Format->new();
    my $marks_or_euros = $german->format_price(123456.789);

    ok(($marks_or_euros eq '123.456,79 DEM ' ||
        $marks_or_euros eq '123.456,79 EUR ' ||

        # Fix for broken locale on Macs
        (( $^O eq 'MacOS' || $^O eq "darwin" ) &&
         ($marks_or_euros eq 'DEM 123456,79 DEM' ||
          $marks_or_euros eq 'EUR 123456,79'))

       ),
       'marks or euros');
}

SKIP:
{
    setlocale(&LC_ALL, 'en_US')
        or skip("Unable to set en_US locale", 1);
    my $english = Number::Format->new();
    is($english->format_price(123456.789), 'USD 123,456.79', 'dollars');
}
