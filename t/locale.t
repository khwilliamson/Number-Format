# -*- Perl -*-
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl (testname).t'

$| = 1;

use Number::Format qw(:vars);
use POSIX;
if ($@)
{
    print "1..0\n";
    exit;
}

print "1..3\n";
END {print "not ok 1\n" unless $loaded;}
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

if (setlocale(&LC_ALL, "de_DE"))
{
    my $german = new Number::Format();
    my $marks_or_euros = $german->format_price(123456.789);

    print "not "
        unless ($marks_or_euros eq 'DEM 123.456,79' ||
                $marks_or_euros eq 'EUR 123.456,79');
}
print "ok 2\n";

setlocale(&LC_ALL, "en_US");
my $english = new Number::Format();
print "not " unless ($english->format_price(123456.789) eq 'USD 123,456.79');
print "ok 3\n";
