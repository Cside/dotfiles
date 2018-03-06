# 祇園精舎の鐘の音には、
# 諸行無常すなわちこの世のすべての現象は絶えず変化していくものだという響きがある。
# 沙羅双樹の花の色は、
# どんなに勢いが盛んな者も必ず衰えるものであるという道理をあらわしている。
# 世に栄え得意になっている者も、その栄えはずっとは続かず、
# 春の夜の夢のようである。
# 勢い盛んではげしい者も、結局は滅び去り、
# まるで風に吹き飛ばされる塵と同じようである。 
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
alias v 'vim'
alias vi 'vim'
alias s 'source ~/.config/fish/config.fish'
alias say 'say -r 300 -v Victoria'
alias chrome 'cd ~/Library/Application\ Support/Google/Chrome/Default/Extensions/'

## GOENV
set -x PATH $HOME/.goenv/shims $PATH
goenv rehash >/dev/null ^&1

set -Ux GOPATH $HOME/work/go
set -U fish_user_paths $fish_user_paths $GOPATH/bin

## plenv
setenv PATH '/Users/cside/.plenv/shims' $PATH
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

# peco
function fish_user_key_bindings
    bind \cr peco_select_history
    bind \cf peco_select_history
    bind \cg peco_recentd
    bind \cq peco_select_repository
end

