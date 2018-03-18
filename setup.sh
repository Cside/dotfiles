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
ln ~/Dropbox/work_bin ~/work/bin

# vscode
## settings
vscode_dir="$HOME/Library/Application Support/Code"
mv $vscode_dir/User $vscode_dir/_User
ln -s $pwd/vscode $vscode_dir/

## color theme
mv "/Applications/Visual Studio Code.app/Contents/Resources/app/extensions/theme-monokai/themes/monokai-color-theme.json" \
   "/Applications/Visual Studio Code.app/Contents/Resources/app/extensions/theme-monokai/themes/_monokai-color-theme.json"
ln -s $pwd/vscode/monokai-color-theme.json '/Applications/Visual Studio Code.app/Contents/Resources/app/extensions/theme-monokai/themes/'

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

# vscode
./backup_libs/vscode | xargs -L 1 code --install-extension

