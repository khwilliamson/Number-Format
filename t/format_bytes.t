# -*- CPerl -*-

use Test::More tests => 12;

BEGIN { use_ok('Number::Format', ':subs') }

is(format_bytes(123.51),        '123.51',       'no change');
is(format_bytes(1234567.509),   '1.18M',        'mega');
is(format_bytes(1234.51, 3),    '1.206K',       'kilo');
is(format_bytes(123456789.1),   '117.74M',      'bigger mega');
is(format_bytes(1234567890.1),  '1.15G',        'giga');

is(format_bytes(12.95),                   '12.95', 'test 12.95');
is(format_bytes(12.95, precision => 0),   '13',    'test 13 (precision 0)');
is(format_bytes(2048),                    '2K',    'test 2K');
is(format_bytes(9999999),                 '9.54M', 'test 9.54M');
is(format_bytes(9999999, precision => 1), '9.5M',  'test 9.5M, (precision 1)');

is(format_bytes(1048576, unit => 'K'), '1,024K',  'test 1,024K, unit K');
