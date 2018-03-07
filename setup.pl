#!perl
use strict;
use warnings;
use FindBin qw($Bin);

for (qw(
    .vimrc
    .vim
    .screenrc
    .gitconfig
                )) {
    if (-e "$ENV{HOME}/$_") {
        unlink "$ENV{HOME}/$_" or warn "failed to unlink: " . "$ENV{HOME}/$_";
    }
    symlink("$Bin/$_", "$ENV{HOME}/$_");
}
