# Set vi key bindings
set --global fish_key_bindings fish_vi_key_bindings

if status is-interactive
    init_ssh_agent
end

if type -q eza
    alias ll='eza -aalF -icons'
else
    echo "eza not found, using ls instead"
    alias ll='LC_COLLATE=C ls -alF'
end

# Run fastfetch as greeting
if type -q fastfetch
    function fish_greeting
        fastfetch
    end
else
    echo "fastfetch not found, fish greeting not set"
end
