#!/usr/bin/zsh
# 文字コードの設定
export LC_CTYPE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export JLESSCHARSET=japanese-sjis
export OUTPUT_CHARSET=utf-8

# Perl
source ~/perl5/perlbrew/etc/bashrc
export PATH=/usr/local/mysql/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$PATH:/sbin:$PATH
export PATH=$PATH:/usr/sbin:$PATH
export PATH=$PATH:/usr/local/sbin:$PATH
#export PATH=$HOME/perl5/perlbrew/perls/current/bin:$PATH

# ruby
if [[ -s $HOME/.rvm/scripts/rvm ]] then
    source $HOME/.rvm/scripts/rvm
fi

## keychain
#keychain ~/.ssh/id_rsa
#source ~/.keychain/$HOST-sh

#----------------------------------------------------------
# エイリアス
#----------------------------------------------------------
# 補完される前にオリジナルのコマンドまで展開してチェックする
alias ls='ls -hF -G'
alias ll='ls -ltr'
alias la='ls -A'
alias lr='ls -R'
#alias rmd='rm -fr'
# alias ps='ps -fU`whoami` --forest'
alias df='df -h'
alias du='du -h'
alias sudo='env PATH=${PATH}:/sbin:/usr/sbin:/usr/local/sbin \sudo'
alias gls='git branch'
alias gla='git branch -a'
alias gst='git status'
alias gdi='git diff'
alias sc='screen'
alias scl='screen -ls'
alias scd='screen -dRRS'
alias chrome='cd ~/Library/Application\ Support/Google/Chrome/Default/Extensions'
alias start_mysqld='sudo chown -R mysql /usr/local/mysql; sudo /usr/local/mysql/bin/mysqld_safe &'
alias hide_icon='defaults write com.apple.finder CreateDesktop -boolean false;killall Finder'
alias show_icon='defaults delete com.apple.finder CreateDesktop;killall Finder'
alias findf="find . -type f"
alias findff="find . -type f -print0"
alias findd="find . -type d"
alias printpl="perl ~/print.pl"
alias cpanm="sudo cpanm"
alias gem="sudo gem"
alias brew="sudo brew"
alias npm="sudo npm"
alias grep="egrep --color"
alias dim init="dim init --no-dist-init"
alias KILL="kill -KILL"
alias zrc="vim ~/.zshrc"
# alias rm='mv -f --backup=numbered --target-directory ~/.Trash'
alias vi='vim -u ~/dotfiles/.vimrc.read'
alias scrc="vim ~/.screenrc"
alias vrc="vim ~/.vimrc"
alias vrcw="vim ~/dotfiles/.vimrc.write"
alias vrcr="vim ~/dotfiles/.vimrc.read"
alias sz="source ~/.zshrc"
alias pad="plackup -MPlack::App::Directory -e 'Plack::App::Directory->new->to_app'"
alias perld="perl -MDevel::SimpleTrace"
alias gch="git checkout"
alias px='ps ax'
alias fin="; echo 'Complete!'"
alias sv="sudo vim"
alias vim_httpd="sudo vim /etc/httpd/conf/httpd.conf"
alias vim_apache="sudo vim /etc/httpd/conf/httpd.conf"
alias vim_ipconfig="sudo vim /etc/sysconfig/iptables"
alias re-httpd="sudo service httpd restart"
alias re-apache="sudo service httpd restart"
alias re-iptables="sudo /etc/rc.d/init.d/iptables restart"
alias SSH='ssh cside.me'
alias js='node'
alias gpom='git push origin master'
alias youtube-audio='youtube-dl --audio-format mp3 --extract-audio --title'
alias ti='~/Library/Application\ Support/Titanium/mobilesdk/osx/1.8.2/iphone/builder.py'
alias titanium='~/Library/Application\ Support/Titanium/mobilesdk/osx/1.8.2/titanium.py'
alias pe='xargs -L 1 perl -i -pe'
alias q='exit'
alias quit='exit'

alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'
alias -g W='| wc'
alias -g X='| xargs -i -0'
alias -g V='| vim -'

#----------------------------------------------------------
# 基本
#----------------------------------------------------------
# 色を使う
autoload -U colors; colors
# ビープを鳴らさない
setopt nobeep
# エスケープシーケンスを使う
setopt prompt_subst
# コマンドラインでも#以降をコメントと見なす
setopt interactive_comments
# vi風のキーバインド
bindkey -v
# C-s, C-qを無効にする
setopt no_flow_control
# 日本語のファイル名を表示可能
setopt print_eight_bit 
# C-wで直前の/までを削除する
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
# ディレクトリを水色にする
export LS_COLORS='di=01;36'

#----------------------------------------------------------
# 補完関連
#----------------------------------------------------------
# 補完機能を強化
autoload -Uz compinit; compinit
# URLを自動エスケープ
autoload -Uz url-quote-magic; zle -N self-insert url-quote-magic

# TABで順に補完候補を切り替える
setopt auto_menu
# 補完候補を一覧表示
setopt auto_list
# 補完候補をEmacsのキーバインドで動けるように
zstyle ':completion:*:default' menu select=1
# --prefix=/usrなどの=以降も補間
setopt magic_equal_subst
# ディレクトリ名の補間で末尾の/を自動的に付加し、次の補間に備える
setopt auto_param_slash
# 補完候補の色付け
#eval `dircolors`
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# 補完候補を詰めて表示
setopt list_packed
# 補完候補一覧でファイルの種別をマーク表示
setopt list_types
# 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash
# スペルチェック
setopt correct
# killコマンドでプロセスを補完
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'
# キャッシュ(perldocの高速化)
zstyle ':completion:*' use-cache true

#----------------------------------------------------------
# 移動関連
#----------------------------------------------------------
# ディレクトリ名でもcd
setopt auto_cd
# cdのタイミングで自動的にpushd.直前と同じ場合は無視
setopt auto_pushd
setopt pushd_ignore_dups

#----------------------------------------------------------
# 履歴関連
#----------------------------------------------------------
# 履歴の保存先
# HISTFILE=$HOME/.zsh-history
HISTFILE=$HOME/.zsh-cdr
# メモリに展開する履歴の数
HISTSIZE=10000
# 保存する履歴の数
SAVEHIST=10000
# ヒストリ全体でのコマンドの重複を禁止する
setopt hist_ignore_dups
# コマンドの空白をけずる
setopt hist_reduce_blanks
# historyコマンドはログに記述しない
setopt hist_no_store
# 先頭が空白だった場合はログに残さない
setopt hist_ignore_space
# 履歴ファイルに時刻を記録
setopt extended_history
# シェルのプロセスごとに履歴を共有
setopt share_history
# 複数のzshを同時に使うときなどhistoryファイルに上書きせず追加
setopt append_history
# 履歴をインクリメンタルに追加
setopt inc_append_history
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 履歴検索機能のショートカット設定
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
# インクリメンタルサーチの設定
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

# 全履歴の一覧を出力する
function history-all { history -E 1 }

#----------------------------------------------------------
# プロンプト表示関連
#----------------------------------------------------------
function git_info() { 
	local info 
	if test -z $(git rev-parse --git-dir 2> /dev/null); then 
		info='' 
	else 
		info="${$(git symbolic-ref HEAD 2> /dev/null)#refs/heads/}" 
	fi
	echo -n "$info"
}
local GREEN=$'%{[32m%}'
local ORANGE=$'%{[33m%}'
local BLUE=$'%{[34m%}'
local MAGENTA=$'%{[35m%}'
local DEFAULT=$'%{[m%}'
PROMPT=$ORANGE'%n@%m '$MAGENTA'%~'$BLUE' $(git_info)'$GREEN$'\n$ '

function precmd() {
    #$HOME/.zsh/precmd.pl `history -n -1 | head -1` # 終わったらGrowlNotify TODO
}

#----------------------------------------------------------
# incr.zsh / zaw.zsh
#----------------------------------------------------------
source ~/.zsh/incr.zsh

# zaw.zsh
bindkey '^F' zaw-history
# zaw-cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

zstyle ':filter-select' case-insensitive yes # case-insensitive search
bindkey '^G' zaw-cdr

source ~/.zsh/zaw/zaw.zsh

#----------------------------------------------------------
# その他
#----------------------------------------------------------
# ログアウト時にバックグラウンドジョブをkillしない
setopt no_hup
# ログアウト時にバックグラウンドジョブを確認しない
setopt no_checkjobs
# バックグラウンドジョブが終了したら(プロンプトの表示を待たずに)すぐに知らせる
setopt notify

# makeのエラー出力に色付け
e_normal=`echo -e "\033[0;30m"`
e_RED=`echo -e "\033[1;31m"`
e_BLUE=`echo -e "\033[1;36m"`
function make() {
    LANG=C command make "$@" 2>&1 | sed -e "s@[Ee]rror:.*@$e_RED&$e_normal@g" -e "s@cannot\sfind.*@$e_RED&$e_normal@g" -e "s@[Ww]arning:.*@$e_BLUE&$e_normal@g"
}

#----------------------------------------------------------
# hitode909
#----------------------------------------------------------
# Gitのリポジトリのトップから相対パスでcd
function u() {
    cd ./$(git rev-parse --show-cdup)
    if [ $# = 1 ]; then
        cd $1
    fi
}
# screenを開いた場所から相対パスでcd
export __session_from=$PWD
function f() {
    cd $__session_from
    if [ $# = 1 ]; then
        cd $1
    fi
}
# ホームディレクトリからの相対パスでcd
function h() {
    cd
    if [ $# = 1 ]; then
        cd $1
    fi
}
function up() {
    i=0
    while [ $i -lt $1 ]
    do
        cd ../
        i=`expr $i + 1`
    done
}
# Perl
export PERLDOC_PAGER=lv
function pl() {
    if [ $# = 1 ]; then
        vim `perldoc -l $1`
    fi
} 
function is_core() {
    if [ $# = 1 ]; then
        perl -e 'use Module::CoreList; print Module::CoreList->first_release('$1'), "\n";'
    fi
}
function pm() {
  [ -n "$1" ] && perldoc -m $1
}
function pv() {
  [ -n "$1" ] && perl -e "use $1;print qq|$1: \$$1::VERSION\n|;";
}
function pmgrep() {
  [ -n "$1" ] && [ -n "$2" ] && grep -C3 -n "$1" `perldoc -l $2` | less -r;
}
#complete -C perldoc-complete -o nospace -o default perldoc
#complete -C perldoc-complete -o nospace -o default pm
#complete -C perldoc-complete -o nospace -o default pv
#complete -C perldoc-complete -o nospace -o default pmgrep

#----------------------------------------------------------
# 環境依存対応
#----------------------------------------------------------
# .zshrc.mineがあれば読み込む
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

