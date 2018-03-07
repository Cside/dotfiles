function peco_open_recent_file
    vim (egrep '^>' ~/.viminfo | cut -c3- | perl -E 'say for map { chomp; $_ =~ s/^~/$ENV{HOME}/e; -f $_ ? $_ : () } <STDIN>' | peco)
end
