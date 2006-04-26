# -*- Perl -*-
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl (testname).t'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

use POSIX;
setlocale(&LC_ALL, "en_US");

BEGIN { $| = 1; print "1..6\n"; }
END {print "not ok 1\n" unless $loaded;}
use Number::Format qw(:all);
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

# TODO Here we could do some conditional tests based
#      on current locale

my $usd = new Number::Format(-int_curr_symbol => 'USD');

print "not " unless ($usd->format_price(123456.51) eq 'USD 123,456.51');
print "ok 2\n";

print "not " unless ($usd->format_price(1234567.509) eq 'USD 1,234,567.51');
print "ok 3\n";

print "not " unless ($usd->format_price(1234.51, 3) eq 'USD 1,234.510');
print "ok 4\n";

print "not " unless ($usd->format_price(123456789.1) eq 'USD 123,456,789.10');
print "ok 5\n";

print "not " unless ($usd->format_price(100, "0") eq 'USD 100');
print "ok 6\n";
