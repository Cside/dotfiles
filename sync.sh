#!/bin/bash -x
brew list | sort | xargs -L 1 echo > brew
plenv list-modules > cpan
