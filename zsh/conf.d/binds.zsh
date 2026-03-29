# Custom Keybindings
# Only load in interactive shells
if [[ $- == *i* ]]; then
    bindkey "^[[1;5C" forward-word      # Ctrl+Right
    bindkey "^[[1;5D" backward-word     # Ctrl+Left
    bindkey "^[[5C" forward-word        # Ctrl+Right (alternate)
    bindkey "^[[5D" backward-word       # Ctrl+Left (alternate)
    bindkey "^[OC" forward-word         # Alt+Right
    bindkey "^[OD" backward-word        # Alt+Left
    bindkey "^[[H" beginning-of-line
    bindkey "^[[1~" beginning-of-line
    bindkey "^[[F" end-of-line
    bindkey "^[[4~" end-of-line
fi
