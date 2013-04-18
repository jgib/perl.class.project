#!/usr/bin/perl
use strict;
use LWP::Simple;
my ($url,@url);
my $i=1;

sub input {
  print "\nEnter URL: ";
	$url = <>;
	chomp $url;
	$url[0]="http://".$url;
}
sub get {
	getstore("http://".$url,"tmp");
}
sub open_tmp {
	open (TMP, "<tmp") or die "Can not open temp file.";
}
sub close_tmp {
	close TMP;
	unlink "tmp";
}
sub search {
	while(<TMP>) {
		#if($_=~m/href="(https?:\/\/\w*?\.?$url.*?)">/g) {
		if($_=~m/href="(.*?)">/g){
		$url[$i]=$1;
			$i++;
		}
	}
}
sub main {
	&input;
	&get;
	&open_tmp;
	&search;
	&close_tmp;
	&printout;
}
sub printout{
	print "\n";
	for(my $n=0;$n<=$#url;$n++){
		print $url[$n]."\n";
	}
	print "\n";
}
&main;
exit 0;
