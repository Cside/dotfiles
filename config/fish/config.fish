## cd後にls
function cd
    builtin cd $argv; and ls
end

## PATH
set -x PATH $HOME/work/bin $PATH

## alias
alias q 'exit'
alias ff 'findf'
alias grep 'egrep -i --color --line-buffered'
alias s 'source ~/.config/fish/config.fish'
alias say 'say -r 300 -v Victoria'
alias chrome 'cd ~/Library/Application\ Support/Google/Chrome/Default/Extensions/'
alias mkdir 'mkdir -p'
alias vscode 'open -a /Applications/Visual\ Studio\ Code.app'
alias vs 'vscode'
alias x1 'xargs -L 1'
alias pe 'xargs perl -i -pe'

alias g  'git'
alias gg 'git grep'
alias gs 'git status'

alias v  'vim'
alias vi 'vim'
alias vo 'vim -o'
alias vO 'vim -O'
alias vp 'vim -p'

## TODO: seems doesn't work ...
## global alias
bind \r 'replace_then_execute'
function replace_then_execute
    set -l new_command ( \
        commandline \
            | sed 's/ G / | grep /g' \
            | sed 's/ H$/ | head/g' \
    )
    commandline -r $new_command
    commandline -f execute
end

# ===================================
# plugins
# ===================================

## theme-bobthefish
set -g theme_display_date no
set -g theme_newline_cursor yes

## peco
function fish_user_key_bindings
    bind \cf peco_select_history
    bind \cg peco_recentd
    bind \cq peco_select_repository
    bind \cv peco_open_recent_file
end

## done
set -U __done_min_cmd_duration 3000
set -U __done_exclude '(git (?!push|pull)|vim|vi|less)' # accepts a regex

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
