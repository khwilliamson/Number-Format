# -*- CPerl -*-

use Test::More qw(no_plan);
use POSIX;
setlocale(&LC_ALL, 'en_US');

BEGIN { use_ok('Number::Format', ':subs') }

use constant PI => 4*atan2(1,1);

cmp_ok(round(0),                'eq', 0,            'identity');
cmp_ok(round(1),                'eq', 1,            'identity');
cmp_ok(round(-1),               'eq', -1,           'identity');
cmp_ok(round(PI,2),             'eq', 3.14,         'pi with precision=2');
cmp_ok(round(PI,3),             'eq', 3.142,        'pi with precision=3');
cmp_ok(round(PI,4),             'eq', 3.1416,       'pi with precision=4');
cmp_ok(round(PI,5),             'eq', 3.14159,      'pi with precision=5');
cmp_ok(round(PI,6),             'eq', 3.141593,     'pi with precision=6');
cmp_ok(round(PI,7),             'eq', 3.1415927,    'pi with precision=7');
cmp_ok(round(123456.512),       'eq', 123456.51,    'precision=0' );
cmp_ok(round(-1234567.509, 2),  'eq', -1234567.51,  'negative thousandths' );
cmp_ok(round(-12345678.5, 2),   'eq', -12345678.5,  'negative tenths' );
cmp_ok(round(-123456.78951, 4), 'eq', -123456.7895, 'precision=4' );
cmp_ok(round(123456.78951, -2), 'eq', 123500,       'precision=-2' );
is(    round(1.005, 2),               1.01,         'string-eq' );
