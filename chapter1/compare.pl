#! /usr/bin/perl -w
@py_test = `python 1-13.py`;
@lisp_test = `guile 1-13.scm`;
print "\nPython:\n";
foreach (@py_test) {
	print;
}
print "\nScheme:\n";
foreach (@lisp_test) {
	print;
}
