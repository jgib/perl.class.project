#!/usr/bin/perl
use strict;
use warnings;
use Net::DNS;



print "Enter domain: ";
chomp(my $name=<>);
print "\n";

my $res   = Net::DNS::Resolver->new;
my $query = $res->query($name, "MX");
my $dns=$query->string;
my @dns = split("\n",$dns);


for(my $i=0;$i<=$#dns;$i++){
  if($dns[$i]=~m/^.+MX\s\d{1,3}\s(.+)$/){
		print $1."\n";
	}
}

print "\n";

exit 0;
