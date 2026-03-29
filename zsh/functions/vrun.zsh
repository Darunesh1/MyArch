vrun() {
    local current_dir="$PWD"
    local venv_names=(".venv" "venv" "env")
    local found_venv=""

    # Look for venv in current and parent directories
    while [[ "$current_dir" != "/" ]]; do
        for name in "${venv_names[@]}"; do
            if [[ -d "$current_dir/$name" && -f "$current_dir/$name/bin/activate" ]]; then
                found_venv="$current_dir/$name"
                break 2
            fi
        done
        current_dir="$(dirname "$current_dir")"
    done

    if [[ -n "$found_venv" ]]; then
        # Ask for confirmation
        echo -n "Found venv at: $found_venv"
        echo -n " - Activate? (y/n): "
        read -k 1 reply
        echo "" # Move to a new line after keypress

        if [[ "$reply" == "y" || "$reply" == "Y" ]]; then
            source "$found_venv/bin/activate"
            echo "🐍 Python environment activated!"
        else
            echo "Aborted."
        fi
    else
        echo "❌ No virtual environment (.venv, venv, or env) found in this or parent directories."
    fi
}
