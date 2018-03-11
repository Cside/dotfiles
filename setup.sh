#!/bin/bash -x

# ======================================================================
# Setup
# ======================================================================

pwd=`pwd`
for f in .vimrc .vim .tmux.conf .gitconfig; do
    rm ~/$f
    ln -s $pwd/$f ~/$f
done

mkdir -p ~/.config

for d in fish powerline; do
    ln -s $pwd/config/$d ~/.config/
done

# fisher
## install fishfish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
## install plugins
fisher

# powerline fonts
cd /tmp
git clone git@github.com:powerline/fonts.git
./fonts/install.sh

# ~/work/bin
mkdir -p ~/work/bin
cp ~/Dropbox/work_bin/* ~/work/bin/

# ======================================================================
# Install libs
# ======================================================================

# pip
curl -kL https://bootstrap.pypa.io/get-pip.py | python
cat ./backup_libs/pip | xargs -L 1 pip install

# homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
cat ./backup_libs/brew | xargs -L 1 brew install

# cpan
cat ./backup_libs/cpan | xargs -L 1 cpanm -n

# gem
cat ./backup_libs/gem | xargs -L 1 gem install

# npm (global)
cat ./backup_libs/npm | xargs -L 1 npm i -g

# ghq
./backup_libs/ghq | xargs -L 1 ghq get

