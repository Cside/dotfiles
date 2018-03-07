#!/bin/bash -x
rsync -ar --copy-unsafe-links --delete ~/.config/fish ./config/;
brew list | sort | xargs -L 1 echo > brew
plenv list-modules
