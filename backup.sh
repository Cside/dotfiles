#!/bin/bash -x

dir="./backup_libs"
brew list          > $dir/brew
plenv list-modules > $dir/cpan
pip list | awk '{ print $1 }' > $dir/pip
gem list | awk '{ print $1 }' > $dir/gem
npm ls -g --depth=0 | grep @ | grep -v UNMET | awk '{ print $2 }' | awk -F'@' '{ print $1 }' > $dir/npm
ghq list | grep Cside | perl -nlE 'say "git\@${_}.git" =~ s!/!:!r' > $dir/ghq

rsync -av --delete ~/work/bin/ ~/Dropbox/work_bin/
