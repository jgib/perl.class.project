#!/usr/bin/perl
use strict;
use warnings;
use feature qw(say switch);

sub main {

print "Enter hash: ";
my $hash = <>;
chomp $hash;

given ($hash) {
  when (/[a-zA-F0-9]{128}/)	{ say "SHA 512 or Whirlpool\n" }
	when (/[a-zA-F0-9]{96}/)	{ say "SHA 384\n" }
	when (/[a-zA-F0-9]{64}/)	{ say "SHA 256\n" }
	when (/[a-fA-F0-9]{56}/)	{ say "SHA 224\n" }
	when (/[a-fA-F0-9]{40}/)	{ say "SHA-1\n" }
	when (/[a-fA-F0-9]{32}/)	{ say "Possibly MD2/4/5\n" }
	default				{ say "Unknown hash\n" }
	}
}

&main;

exit 0;
