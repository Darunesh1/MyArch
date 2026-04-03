# User Configuration
# Add your custom configurations here

# Editor
export EDITOR=code

# Uncomment to prevent searching for commands not found in package manager
# unset -f command_not_found_handler

# pnpm
export PNPM_HOME="/home/darriour/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# For Game Mode
if [ -f /tmp/game_mode_state ]; then
    export MESA_GLTHREAD=true
    export MESA_NO_ERROR=1
fi
