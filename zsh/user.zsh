# Startup Commands
# Commands to execute on startup (before the prompt is shown)
if [[ $- == *i* ]]; then
    if command -v pokego >/dev/null; then
        pokego --no-title -r 1,3,6
    elif command -v pokemon-colorscripts >/dev/null; then
        pokemon-colorscripts --no-title -r 1,3,6
    elif command -v fastfetch >/dev/null; then
        if do_render "image"; then
            fastfetch --logo-type kitty
        fi
    fi
fi

# Configuration Overrides
# ZSH_NO_PLUGINS=1      # Set to 1 to disable plugin loading
# ZSH_PROMPT=           # Unset to disable prompt customization
# ZSH_COMPINIT_CHECK=1  # Set compinit check interval (hours)
# ZSH_OMZ_DEFER=1       # Defer oh-my-zsh loading

if [[ ${ZSH_NO_PLUGINS} != "1" ]]; then
    # Oh-My-Zsh Plugins
    plugins=(
        "sudo"
    )
fi
