#! /usr/bin/perl -w
$chapter = "1";
$number = "$ARGV[0]";

# Racket
print "========== *Racket* ==========\n";
$racket = "mzscheme -r ".$chapter."-".$id.".scm";
system($racket);

# Guile
print "========== *Guile* ==========\n";
$guile = "guile ".$chapter."-".$id.".scm";
system($guile);
