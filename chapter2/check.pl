#! /usr/bin/perl
# Check the process
$total = 97;
$finished = 0;
$unfinished = 97;


for (my $var = 1; $var < 97; $var++) {
	if (0 == system("ls 2-$var.scm")) {
		$finished++;
	} else {
		$unfinished--;
	}
}

print "FINISHED: ".$finished."\n";
print "UNFINISHED: ".$unfinished."\n";
print $finished / $total."\n";
