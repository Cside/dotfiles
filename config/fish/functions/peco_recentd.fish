function peco_recentd
    set -l recentd (z -l | peco | perl -nlE 'say((split / {2,}/, $_)[1])')
    cd $recentd
end
