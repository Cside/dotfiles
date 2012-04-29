#!/usr/bin/env perl
use strict;
use warnings;
use FindBin qw($Bin);
use lib "./$Bin/lib";
use Cache::FileCache;
use File::Zglob qw(zglob);

my $DEFAULT_EXPIRES = 60 * 60 * 24; # 1 day
my $CLEAR_MODE = defined($ARGV[0]) && $ARGV[0] =~ /clear/i;

sub get_or_set {
    my ($key, $cb, $expires) = @_;
    $expires = $DEFAULT_EXPIRES unless defined $expires;
    my $cacher = Cache::FileCache->new(+{
        namespace => '.unite-script-inc',
        default_expires_in => $expires,
    });
    $cacher->clear && exit if $CLEAR_MODE;
    if (my $cache = $cacher->get($key, $expires)) {
        return $cache;
    }
    my $ret = $cb->();
    $cacher->set($key, $ret, $expires);
    return $ret;
}

my $ret = get_or_set('inc', sub {
    my @rets;
    for my $path (sort @INC) {
        for my $file (zglob("$path/**/*.pm")) {
            my $package = $file;
            $package =~ s!$path/(.+)!$1!;
            $package =~ s!\.pm$!!o;
            $package =~ s!darwin-2level/!!o;
            $package =~ s!/!::!go;
            push @rets, +{
                package => $package,
                file => $file,
            };
        }
    }
    [sort { $a->{package} cmp $b->{package} } @rets];
});

for my $one (@$ret) {
    printf "%s\te %s\n", $one->{package}, $one->{file};
}
