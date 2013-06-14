#! /usr/bin/perl
# Useage: chmod 700 compile.pl
# Useage: ./compile.pl [number] [guile/racket]
use Switch;
$chapter = "2";
$id = "$ARGV[0]";
$compiler = "$ARGV[1]";

if (!$compiler) {
    if ($id) {
	&Guile;
	&Racket;
    } else {
	print "Argument lost.\n";
    }
} else {
    switch ($compiler) {
	case "guile" { &Guile }
	case "racket" { &Racket }
    }
}

# Guile
sub Guile {
    print "========== *Guile* ==========\n";
    $guile = "guile ".$chapter."-".$id.".scm";
    system($guile);
}

# Racket
sub Racket {
    print "========== *Racket* ==========\n";
    $racket = "mzscheme -r ".$chapter."-".$id.".scm";
    system($racket);
}
