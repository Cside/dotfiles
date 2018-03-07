function peco_open_recent_file
    # TODO: 頑張れば perl 使わなくてもできそうだけど、そこまでやるかっていう...
    set -l filter_exists '
        say for
            grep { -f }
            map {
                chomp;
                s/^~/$ENV{HOME}/e;
                -l $_ ? readlink $_ : $_;
            } <STDIN>'

    set -l selected (egrep '^>' ~/.viminfo | cut -c3- | perl -E $filter_exists | awk '!a[$0]++' | sed "s!$HOME!~!" | peco)
    if [ $selected ]
        echo "vim $selected"
        vim (echo $selected | sed "s!~!$HOME!")
    end
end
