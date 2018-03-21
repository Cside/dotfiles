#!/bin/bash -x

# ======================================================================
# Setup
# ======================================================================

pwd=`pwd`
for f in .vimrc .vim .tmux.conf .gitconfig; do
    rm -f ~/$f
    ln -s $pwd/$f ~/$f
done

mkdir -p ~/.config

for d in fish powerline; do
    rm -rf ~/.config/$d
    ln -s $pwd/config/$d ~/.config/
done

ln -s ~/dotfiles/ssh/config ~/.ssh/

# fisher
## install fishfish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
## install plugins
fisher

# powerline fonts
cd /tmp
git clone git@github.com:powerline/fonts.git
./fonts/install.sh

# change shell
sudo vim /etc/shells  # /usr/local/bin/fish を追記
chsh -s /usr/local/bin/fish

# ~/work/bin
mkdir -p ~/work/bin
ln -s ~/Dropbox/work_bin ~/work/bin

# vscode
## settings
vscode_dir="$HOME/Library/Application Support/Code"
mv $vscode_dir/User $vscode_dir/_User
ln -s $pwd/vscode $vscode_dir/User

## color theme
mv "/Applications/Visual Studio Code.app/Contents/Resources/app/extensions/theme-monokai/themes/monokai-color-theme.json" \
   "/Applications/Visual Studio Code.app/Contents/Resources/app/extensions/theme-monokai/themes/_monokai-color-theme.json"
ln -s $pwd/vscode/monokai-color-theme.json '/Applications/Visual Studio Code.app/Contents/Resources/app/extensions/theme-monokai/themes/'

# goenv

goenv install -l

echo 'export PATH="$HOME/.goenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(goenv init -)"'               >> ~/.bash_profile

goenv global x.xx.xx

# plenv

plenv install 5.18.0
plenv global 5.18.0
plenv install-cpanm

# dein.vim
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim

# show hidden file
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

# ======================================================================
# Install libs
# ======================================================================

# pip
curl -kL https://bootstrap.pypa.io/get-pip.py | python3
cat ./backup_libs/pip | xargs -L 1 pip3 install

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
cat ./backup_libs/ghq | xargs -L 1 ghq get

# vscode
cat ./backup_libs/vscode | xargs -L 1 code --install-extension
