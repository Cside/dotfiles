#!perl
use 5.10.0;
use strict;
use warnings;
use Cache::FileCache;
use File::Zglob qw(zglob);
use List::UtilsBy qw(uniq_by);

my $DEFAULT_EXPIRES = 60 * 60 * 24; # 1 day
my $CLEAR_MODE = defined($ARGV[0]) && $ARGV[0] =~ /clear/i;
my $NO_CACHE   = defined($ARGV[0]) && $ARGV[0] =~ /no-?cache/i;
#my $NO_CACHE   = 1;

sub get_or_set {
    my ($key, $cb, $expires) = @_;
    $expires = $DEFAULT_EXPIRES unless defined $expires;
    my $cacher = Cache::FileCache->new(+{
        namespace => '.unite-script-inc',
        default_expires_in => $expires,
    });
    $cacher->clear && exit if $CLEAR_MODE;
    my $cache = $cacher->get($key, $expires);
    if ($cache && !$NO_CACHE) {
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
            $package =~ s#$path/(.+)#$1#;
            use Data::Dumper;
            local $Data::Dumper::Indent = 1;
            local $Data::Dumper::Terse  = 1;
            $package =~ s/\.pm$//o;
            $package =~ s#^/?darwin-2level/?##o;
            $package =~ s#/#::#go;
            push @rets, +{
                package => $package,
                file => $file,
            };
        }
    }
    [
        sort { $a->{package} cmp $b->{package} }
        uniq_by { $_->{package} }
        @rets
    ];
});

for my $one (@$ret) {
    printf "%s\tRef perldoc %s\n", $one->{package}, $one->{file};
}
