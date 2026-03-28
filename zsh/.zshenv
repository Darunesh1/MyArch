#!/usr/bin/env zsh

# Load all configuration files from conf.d/
for file in "${ZDOTDIR:-$HOME/.config/zsh}/conf.d/"*.zsh; do
    [ -r "$file" ] && source "$file"
done
