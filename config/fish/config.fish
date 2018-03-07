## theme-bobthefish
set -g theme_powerline_fonts no

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

alias v  'vim'
alias vi 'vim'
alias vo 'vim -o'
alias vO 'vim -O'
alias vp 'vim -p'

## globak alias
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

## peco
function fish_user_key_bindings
    bind \cr peco_select_history
    bind \cf peco_select_history
    bind \cg peco_recentd
    bind \cq peco_select_repository
    bind \cv peco_open_recent_file
end

