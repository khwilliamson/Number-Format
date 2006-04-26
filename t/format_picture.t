# -*- Perl -*-
# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl (testname).t'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

use POSIX;
setlocale(&LC_ALL, "en_US");

BEGIN { $| = 1; print "1..13\n"; }
END {print "not ok 1\n" unless $loaded;}
use Number::Format qw(:subs);
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

$pic = 'US$##,###,###.##';
my $x = new Number::Format;
$x->{neg_format}='-x';
print "not " unless ($x->format_picture(123456.512, $pic) eq 
		     'US$    123,456.51');
print "ok 2\n";

print "not " unless ($x->format_picture(-1234567.509, $pic) eq 
		     'US$ -1,234,567.51');
print "ok 3\n";

print "not " unless ($x->format_picture(12345678.5, $pic) eq 
		     'US$ 12,345,678.50');
print "ok 4\n";

print "not " unless ($x->format_picture(123456789.51, $pic) eq 
		     'US$ **,***,***.**');
print "ok 5\n";

print "not " unless ($x->format_picture(-123456789.51, $pic) eq 
		     'US$-**,***,***.**');
print "ok 6\n";

print "not " unless ($x->format_picture(1023012.34, $pic) eq 
		     'US$  1,023,012.34');
print "ok 7\n";

print "not " unless ($x->format_picture(120450.789012, $pic) eq 
		     'US$    120,450.79');
print "ok 8\n";

print "not " unless ($x->format_picture(-120450.789012, $pic) eq 
		     'US$   -120,450.79');
print "ok 9\n";

$x->{neg_format}='(x)';
print "not " unless ($x->format_picture(120450.789012, $pic) eq 
		     'US$    120,450.79 ');
print "ok 10\n";

print "not " unless ($x->format_picture(-120450.789012, $pic) eq 
		     'US$   (120,450.79)');
print "ok 11\n";

$pic = '#';
print "not " unless ($x->format_picture(1, $pic) eq 
		     ' 1 ');
print "ok 12\n";
print "not " unless ($x->format_picture(2, $pic) eq 
		     ' 2 ');
print "ok 13\n";
