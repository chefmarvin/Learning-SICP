#! /usr/bin/perl -w
# Guile
$number = "$ARGV[0]";
print "========== *Racket* ==========\n";
$racket = "mzscheme -r 1-".$number.".scm";
system($racket);

# Racket
print "========== *Guile* ==========\n";
$guile = "guile 1-".$number.".scm";
system($guile);
