#!/usr/bin/perl
use Shodan::WebAPI;

$SHODAN_API_KEY = "gmjxNIoA0EgKbkxjxCYXMQx6PiZsutu9";

$api = new Shodan::WebAPI($SHODAN_API_KEY);



sub ask{
print "\nSHODAN-->";
chomp($ask=<>);
&choice;
}
sub choice{
print "\nCreate Output File? (Y/N): ";
chomp($choice=<>);
if($choice!~m/^[yn]$/i){
  print "\nIncorrect Input!";
	&choice;
	}
if($choice=~m/^y$/i){
	open(OUTPUT,">shodan.".$ask.".lst") or die "Cant Create Output File!";
	}
}






sub main{
&ask;
&shodan;
&exploitdb;
if($choice=~m/^y$/i){
	close OUTPUT;
	}
}

sub shodan{
# Search Shodan
$results = $api->search($ask);

# Check for errors
if ( $result->{'error'} ) {
print "Error: " . $result->{'error'} . "\n";
         }
         else {
                 @matches = @{$results->{'matches'}};
                         for ( $i = 0; $i < $#matches; $i++ ) {
                                         print "IP: $matches[$i]->{ip}\n";
                                                         print "$matches[$i]->{data}\n\n";
                                                                 }
                                                                 }
if($choice=~m/^y$/i){
		print OUTPUT "======\nSHODAN\n======\n\n\n";
                         for ( $i = 0; $i < $#matches; $i++ ) {
                                         print OUTPUT "IP: $matches[$i]->{ip}\n";
                                                         print OUTPUT "$matches[$i]->{data}\n\n";
                                                                 }

	}

}





sub exploitdb{
# Search Exploit DB
$results = $api->exploitdb_search($ask);

print "Results found: ".$results->{total}."\n";
@matches = @{ $results->{matches} };
for ( $i = 0; $i < $#matches; $i++ ) {
        print "$matches[$i]{id}: $matches[$i]{description}\n";
        }
if($choice=~m/^y$/i){
	print OUTPUT "\n\n\n==========\nExploit DB\n==========\n\n\nResults found: ".$results->{total}."\n";
for ( $i = 0; $i < $#matches; $i++ ) {
        print OUTPUT "$matches[$i]{id}: $matches[$i]{description}\n";
	        }

	}
}

&main;

exit 0;
