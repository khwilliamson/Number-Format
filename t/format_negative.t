# -*- Perl -*-
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl (testname).t'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..7\n"; }
END {print "not ok 1\n" unless $loaded;}
use Number::Format;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

my $x = new Number::Format;
$x->{neg_format}='-x';
print "not " unless ($x->format_negative(123456.51) eq '-123456.51');
print "ok 2\n";

print "not " unless ($x->format_number(-.509) eq '-0.51');
print "ok 3\n";

$x->{decimal_digits}=5;
print "not " unless ($x->format_negative(.5555) eq '-0.5555');
print "ok 4\n";

$x->{decimal_fill}=1;
print "not " unless ($x->format_number(-.5555) eq '-0.55550');
print "ok 5\n";

$x->{neg_format}='(x)';
print "not " unless ($x->format_number(-1) eq '(1.00000)');
print "ok 6\n";

print "not " unless ($x->format_number(-.5) eq '(0.50000)');
print "ok 7\n";

