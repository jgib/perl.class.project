#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;

print "\nEnter URL: ";
my $url = <>;
chomp $url;
my $html = get("http://".$url."/robots.txt");
print "\n\n\n";
getprint($html);
print "\n";
exit 0;
