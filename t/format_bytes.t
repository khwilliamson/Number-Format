# -*- Perl -*-
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl (testname).t'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..5\n"; }
END {print "not ok 1\n" unless $loaded;}
use Number::Format qw(:all);
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

print "not " unless (format_bytes(123.51) eq '123.51');
print "ok 2\n";

print "not " unless (format_bytes(1234567.509) eq '1.18M');
print "ok 3\n";

print "not " unless (format_bytes(1234.51, 3) eq '1.206K');
print "ok 4\n";

print "not " unless (format_bytes(123456789.1) eq '117.74M');
print "ok 5\n";
