#!/bin/bash -x
pwd=`pwd`
for f in .vimrc .vim .screenrc .gitconfig; do
    rm ~/$f
    ln -s "$pwd/$f" ~/$f
done

# fish
mv ./config ~/.config
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher # install plugins

# pip
curl -kL https://bootstrap.pypa.io/get-pip.py | sudo python

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
