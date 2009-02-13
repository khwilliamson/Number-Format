# -*- CPerl -*-

use Test::More tests => 5;

BEGIN { use_ok('Number::Format') }
BEGIN { use_ok('POSIX') }

SKIP:
{
    setlocale(&LC_ALL, 'de_DE')
        or setlocale(&LC_ALL, 'de_DE.utf8')
            or setlocale(&LC_ALL, 'de_DE.ISO8859-1')
                or skip("Unable to set de_DE locale", 1);
    my $german = Number::Format->new();

    # On some sysetms (notably Mac OS X) the locale data is wrong for de_DE.
    # Force it to match what we would see on Linux so the test passes.
    $german->{n_cs_precedes}  = $german->{p_cs_precedes}  = '0';
    $german->{n_sep_by_space} = $german->{p_sep_by_space} = '1';
    $german->{thousands_sep}  = '.';

    foreach my $key (sort keys %should)
    {
        next if $locale_values->{$key} eq $should{$key};
        warn "$key: '$locale_values->{$key}' != '$should{$key}'\n";
    }

    my $curr   = $german->{int_curr_symbol}; # may be EUR or DEM
    is($german->format_price(123456.789), "123.456,79 $curr", "German money");
}

SKIP:
{
    setlocale(&LC_ALL, 'en_US')
        or setlocale(&LC_ALL, 'en_US.utf8')
            or setlocale(&LC_ALL, 'en_US.ISO8859-1')
                or skip("Unable to set en_US locale", 1);
    my $english = Number::Format->new();
    is($english->format_price(123456.789), 'USD 123,456.79', 'USD');
}

setlocale(&LC_ALL, 'C')
    or skip("Unable to set en_US locale", 1);
my $c = Number::Format->new();
is($c->format_price(123456.789, 2, "currency_symbol"),
   '$ 123,456.79', 'Dollar sign');
