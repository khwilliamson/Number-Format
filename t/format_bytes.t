
BEGIN { $| = 1; print "1..6\n"; }
END {print "not ok 1\n" unless $loaded;}
use Number::Format qw(:all);
$loaded = 1;
print "ok 1\n";

print "not " unless (format_bytes(123.51) eq '123.51');
print "ok 2\n";

print "not " unless (format_bytes(1234567.509) eq '1.18M');
print "ok 3\n";

print "not " unless (format_bytes(1234.51, 3) eq '1.206K');
print "ok 4\n";

print "not " unless (format_bytes(123456789.1) eq '117.74M');
print "ok 5\n";

print "not " unless (format_bytes(1234567890.1) eq '1.15G');
print "ok 6\n";
