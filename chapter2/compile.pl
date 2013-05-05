#! /usr/bin/perl -w
# Guile
$number = "$ARGV[0]";
print "==========Racket==========\n";
$racket = "mzscheme -r 2-".$number.".scm";
system($racket);

# Racket
print "==========Guile==========\n";
$guile = "guile 2-".$number.".scm";
system($guile);
