function peco_recent_branch
    set -l b (git for-each-ref --format='%(refname:short)' --sort=-committerdate refs/heads | peco)
    git checkout $b; and git pull origin $b
end
