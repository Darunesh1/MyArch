#!/usr/bin/env zsh

# Prompt Configuration
# Auto-detects and loads starship or powerlevel10k

# Exit early if ZSH_PROMPT is not set to 1
if [[ "${ZSH_PROMPT}" != "1" ]]; then
    return
fi

if command -v starship &>/dev/null; then
    # Initialize Starship prompt
    eval "$(starship init zsh)"
    export STARSHIP_CACHE=$XDG_CACHE_HOME/starship
    export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
elif [ -r $HOME/.p10k.zsh ] || [ -r $ZDOTDIR/.p10k.zsh ]; then
    # Initialize Powerlevel10k theme
    POWERLEVEL10K_TRANSIENT_PROMPT=same-dir
    P10k_THEME=${P10k_THEME:-/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme}
    [[ -r $P10k_THEME ]] && source $P10k_THEME
    [[ -f $HOME/.p10k.zsh ]] && source $HOME/.p10k.zsh
    [[ -f $ZDOTDIR/.p10k.zsh ]] && source $ZDOTDIR/.p10k.zsh
fi
