#!/bin/bash -x

dir="./backup_libs"
brew list          > $dir/brew
plenv list-modules > $dir/cpan
pip list           > $dir/pip
gem list           > $dir/gem
npm ls -g --depth=0 | grep @ | grep -v UNMET | awk '{ print $2 }' | awk -F'@' '{ print $1 }' > $dir/npm

cp ~/work/bin/* ~/Dropbox/work_bin/
