# Set vi key bindings
set --global fish_key_bindings fish_vi_key_bindings

if status is-interactive
    init_ssh_agent
end

alias l "LC_COLLATE=C ls -lF"
alias ll "l -a"
alias lh "l -h"
alias llh "ll -h"
