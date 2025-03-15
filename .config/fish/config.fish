if status is-interactive
    # activate ssh-agent if not enabled or active
    if not systemctl --user is-enabled ssh-agent | grep -q enabled
        or not systemctl --user is-active ssh-agent | grep -q active
        systemctl --user enable --now ssh-agent
    end

    # export SSH_AUTH_SOCK
    set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
end

alias l "LC_COLLATE=C ls -lF"
alias ll "l -a"
alias lh "l -h"
alias llh "ll -h"
