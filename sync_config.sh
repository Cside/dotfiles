#!/bin/bash -x
rsync -r --delete ~/.config/fish      ./config/
rsync -r --delete ~/.config/fisherman ./config/
