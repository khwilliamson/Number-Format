# -*- CPerl -*-

use Test::More qw(no_plan);
use POSIX;
setlocale(&LC_ALL, 'en_US');

BEGIN { use_ok('Number::Format', ':subs') }

is(format_bytes(123.51),        '123.51',       'no change');
is(format_bytes(1234567.509),   '1.18M',        'mega');
is(format_bytes(1234.51, 3),    '1.206K',       'kilo');
is(format_bytes(123456789.1),   '117.74M',      'bigger mega');
is(format_bytes(1234567890.1),  '1.15G',        'giga');
