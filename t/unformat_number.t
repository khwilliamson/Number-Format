# -*- CPerl -*-

use Test::More qw(no_plan);
use POSIX;
setlocale(&LC_ALL, 'en_US');

BEGIN { use_ok('Number::Format', ':subs') }

cmp_ok(unformat_number('123,456.51'),        '==', 123456.51,   'num');
cmp_ok(unformat_number('US$ 12,345,678.51'), '==', 12345678.51, 'curr');

ok(! defined unformat_number('US$###,###,###.##'), 'overflow picture');

cmp_ok(unformat_number('-123,456,789.51'), '==', -123456789.51,'neg');

cmp_ok(unformat_number('1.5K'), '==', 1536,      'kilo');
cmp_ok(unformat_number('1.3M'), '==', 1363148.8, 'mega');

my $x = Number::Format->new;
$x->{neg_format} = '(x)';
cmp_ok($x->unformat_number('(123,456,789.51)'),
       '==', -123456789.51,'neg paren');
