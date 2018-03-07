#!/bin/bash -x
for dir in ~/.config/fish ~/.config/fisherman; do
    rsync -ar --copy-unsafe-links --delete $dir ./config/;
done
