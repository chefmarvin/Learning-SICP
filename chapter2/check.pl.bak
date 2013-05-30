#! /usr/bin/perl 
# Check the process
$TOTAL = 97;
$FINISHED = 0;
$UNFINISHED = 97;

@showlist = `ls`;

&finished;
&unfinished;

sub check {
	for (my $id = 1; $id <= 97; $id++) {
		foreach (@showlist) {
			s/2-//;
			s/.scm//;
			s/.org//;
			s/-.$//;
			
			if ($id == $_) {
				$FINISHED++;
				$UNFINISHED--;
				# print $id." ";
				last;
			}
		}
	}
	# print "\n\n";
}

sub finished {
	&check("finished");
	print "Finished: ".$FINISHED."\n";
	print "\n";
	$FINISHED = 0;
	$UNFINISHED = 97;
}

sub unfinished {
	&check("unfinished");
	print "Unfinished: ".$UNFINISHED."\n";
	print "\n";
	&rate;
	$FINISHED = 0;
	$UNFINISHED = 97;
}

sub rate {
    print "Done: ".($FINISHED / $TOTAL * 100)."%";
	print "\n";
}
