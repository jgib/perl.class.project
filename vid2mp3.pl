#!/usr/bin/perl
use strict;			#required ffmpeg to be installed and in path
use warnings;			#it should also require libmp3lame
use Shell;

sub main {

print "Will convert all videos within the directory to mp3s.\nPresss C to convert, D to convert and delete the original, or Q to quit. ";
chomp(my $choice=<>);
if($choice =~ m/^q$/i) {
	exit 0;
}elsif($choice =~ m/^[cd]$/i){

my $name;
my $ext;

opendir (DIR,".") or die "Failed to open the present working directory.";

while (my $file = readdir(DIR)) {

if($file =~ m/^(.+)\.(.+)$/) {
	$name = $1;
	$ext = $2;
	 if ($ext =~ m/(flv)|(mp4)|(mpeg)|(avi)/){ 
		ffmpeg(qq{-i $name.$ext -vn $name.mp3});
		if($choice =~ m/^d$/i){
			unlink $file;
			}
			}
	}	
}
closedir(DIR);
}else{
	print "\nIncorrect input.\n";
	exit 0;
}
}
&main;
exit 0;
