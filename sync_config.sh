#!/bin/bash -x
rsync -v -r --delete ~/.config/fish      ./config/
rsync -v -r --delete ~/.config/fisherman ./config/
