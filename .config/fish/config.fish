# Set vi key bindings
set --global fish_key_bindings fish_vi_key_bindings

if status is-interactive
    init_ssh_agent
end

alias ll='LC_COLLATE=C ls -alF'
