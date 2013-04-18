#!/usr/bin/perl
use strict;
use Net::DNS;
my ($name,$record,$res,$query,$dns,@dns);

sub input {
print "Enter domain: ";
chomp($name=<>);
print "\n";
}

sub set_record {
$res   = Net::DNS::Resolver->new;
$query = $res->query($name, $record);
$dns=$query->string;
}

sub mx {
@dns = split("\n",$dns);
for(my $i=0;$i<=$#dns;$i++){
  if($dns[$i]=~m/^.+MX\s\d{1,3}\s(.+)$/){
		print $1."\n";
		}
	}
}

sub spf {
@dns = split(' ',$dns);
for(my $i=0;$i<=$#dns;$i++){
	if($dns[$i]=~m/:(.+)/){
		print $1."\n";
		}
	}
print "\n";
}

sub main {
	&input;
	$record="MX";
	&set_record;
	print "\n============\nMail Servers\n============\n";
	&mx;
	$record="TXT";
	&set_record;
	print "\n============\nSPF  Records\n============\n";;
	&spf;
}

&main;
exit 0;
