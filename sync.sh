#!/bin/bash -x
brew list          > ./backup_libs/brew
plenv list-modules > ./backup_libs/cpan
pip list           > ./backup_libs/pip
gem list           > ./backup_libs/gem

cp ~/work/bin/* ~/Dropbox/work_bin/
