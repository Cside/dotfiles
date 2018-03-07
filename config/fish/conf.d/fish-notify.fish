function fish_notify --on-event fish_prompt
    if test $CMD_DURATION
        set secs (math "$CMD_DURATION / 1000")
        if test $secs -ge 3
            terminal-notifier -title $history[1] -message "Returned $status, took $secs seconds"
            if test $status -eq 0
                afplay /System/Library/Sounds/Ping.aiff
            else
                afplay /System/Library/Sounds/Basso.aiff
            end
        end
    end
end
