function init_ssh_agent
    if test -d "$XDG_RUNTIME_DIR" -a -w "$XDG_RUNTIME_DIR"
        set SSH_AGENT_ENV_FILE "$XDG_RUNTIME_DIR/ssh-agent.env.fish"
    else
        echo "XDG_RUNTIME_DIR is not set to a writable directory, using /tmp for ssh-agent env file" >&2
        set SSH_AGENT_ENV_FILE "/tmp/ssh-agent.env.fish"
    end
    
    # if SSH_AUTH_SOCK is already set and valid, we're done
    if test -S "$SSH_AUTH_SOCK"
        return
    end
    # if not, try sourcing the ssh-agent env file
    source "$SSH_AGENT_ENV_FILE" 2>/dev/null
    # if SSH_AUTH_SOCK is now set and valid, we're done
    if test -S "$SSH_AUTH_SOCK"
        return
    end
    # if not, start ssh-agent, save output to the env file and source it
    ssh-agent -c >"$SSH_AGENT_ENV_FILE"
    source "$SSH_AGENT_ENV_FILE"
    # if SSH_AUTH_SOCK is now set and valid, we're done
    if test -S "$SSH_AUTH_SOCK"
        return
    end
    # if not, something went wrong
    echo "Failed to start ssh-agent" >&2
    return 1
end
