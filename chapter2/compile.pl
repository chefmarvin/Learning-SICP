#! /usr/bin/perl -w
$chapter = "2";
$id = "$ARGV[0]";

if ($id) {
    # Racket
	print "========== *Racket* ==========\n";
	$racket = "mzscheme -r ".$chapter."-".$id.".scm";
	system($racket);

    # Guile
	print "========== *Guile* ==========\n";
	$guile = "guile ".$chapter."-".$id.".scm";
	system($guile);
} else {
    print "Example: ./compile.pl 1\n";
}
