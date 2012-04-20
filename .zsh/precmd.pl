#!/usr/bin/env perl

use strict;
use warnings;
use FileHandle;

my $lastcmd = join ' ', @ARGV;

my $window = $ENV{WINDOW};

my $windows = qx{ screen -Q windows } or die "Your screen doesn't support -Q";
qx{ screen -X redisplay };

my $active;
for my $win (split "\x20\x20", $windows) {
    my ($num, $flag, $title) = $win =~ /^(\d+)(.)? (.+)/;

    if ($flag and $flag eq '*') {
        $active = $num;
        last;
    }
}

if (defined $active && $window != $active) {
    open my $fh, "|/usr/local/bin/growlnotify -t 'GNU screen window $window'" or die $!;
    print $fh sprintf 'command done: "%s"', $lastcmd;
    print $fh "\n";
    close $fh;
}
