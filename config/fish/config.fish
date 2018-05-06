## cd後にls
function cd
    builtin cd $argv; and ls
end

## PATH
set -x PATH $HOME/work/bin $PATH
set -x PATH '/Applications/Visual Studio Code.app//Contents/Resources/app/bin/' $PATH

set -x PATH /usr/local/opt/openssl/bin $PATH
set -x LD_LIBRARY_PATH /usr/local/opt/openssl/lib $LD_LIBRARY_PATH
set -x CPATH /usr/local/opt/openssl/include $CPATH

 ##alias
alias q 'exit'
alias ff 'findf'
alias ffg 'findf | grep'
alias gti 'git'
alias fd 'findd'
alias grep 'egrep -i --color --line-buffered'
alias s 'source ~/.config/fish/config.fish'
alias say 'say -r 300 -v Victoria'
alias chrome 'cd ~/Library/Application\ Support/Google/Chrome/Default/Extensions/'
alias mkdir 'mkdir -p'
alias vscode 'open -a /Applications/Visual\ Studio\ Code.app'
alias vs 'vscode'
alias x1 'xargs -L 1'
alias pe 'xargs perl -i -pe'
alias perldoc 'perldoc -MPod::Text::Color::Delight'
alias cal 'xcal'
alias w 'which'

alias gg 'git grep'
alias gs 'git status'
alias gst 'git status'
alias v  'vim'

alias v  'vim'
alias vi 'vim'
alias vo 'vim -o'
alias vO 'vim -O'
alias vp 'vim -p'

alias g  'egrep --color'
alias gv 'egrep -v'
alias p  'peco'
alias l  'less'

# git
set -x GIT_MERGE_AUTOEDIT 'no'

# ===================================
# plugins
# ===================================

## theme-bobthefish
set -g theme_display_date no
set -g theme_newline_cursor yes
set -g theme_display_cmd_duration no

## peco
function fish_user_key_bindings
    bind \cf peco_select_history
    bind \cg peco_recentd
    bind \cq peco_select_repository
    bind \cv peco_open_recent_file
    bind \ch peco_recent_branch
end

## done
set -U __done_min_cmd_duration 3000
set -U __done_exclude '(git (?!push|pull)|vim|vi|v|vo|vO|vp|less|tig|ssh|fg|perldoc)' # accepts a regex

# ===================================
# languages
# ===================================

## GOENV
set -x PATH $HOME/.goenv/shims $PATH
goenv rehash >/dev/null ^&1

set -Ux GOPATH $HOME/work/go
set -U fish_user_paths $fish_user_paths $GOPATH/bin

## plenv
set -x PATH $HOME/.plenv/shims $PATH
plenv rehash >/dev/null ^&1
setenv PLENV_SHELL fish
. '/usr/local/Cellar/plenv/2.2.0/libexec/../completions/plenv.fish'

function plenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    eval (plenv "sh-$command" $argv)
  case '*'
    command plenv "$command" $argv
  end
end
