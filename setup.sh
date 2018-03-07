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
cat ./brew | xargs -L 1 brew install

# perl
cat ./cpan | xargs -L 1 cpanm -n

# ~/work/bin
mkdir -p ~/work/bin
cp ~/Dropbox/work_bin/* ~/work/bin/
