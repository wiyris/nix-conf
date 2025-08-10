function qemu-start
    if type -f tmux &>/dev/null
        tmux new-session $argv
    else
        missing_package qemu
    end
end
