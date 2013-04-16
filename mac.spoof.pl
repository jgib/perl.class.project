#!/usr/bin/perl

use strict;
use warnings;
use Shell;

my $mac;
my $interface;

sub ls_interfaces {
opendir(DIR,"/sys/class/net") or die "Could not determine interfaces.";
while(my $file = readdir(DIR)){
	if($file =~ m/[a-z]+[0-9]+/){
				print $file."\n";
		}
	}
closedir(DIR);
}

sub sel {
	print "\nSelect interface to spoof MAC address: ";
	chomp($interface=<>);

	print "\nEnter new MAC address for $interface: ";
	chomp($mac=<>);
}

sub spoof {
	ifconfig("$interface", "down");
	ifconfig("$interface", "hw", "ether", "$mac");
	ifconfig("$interface", "up");
}



&ls_interfaces;
&sel;
&spoof;

exit 0;

