# Shell Configuration for Hyprland
# Add these to your ~/.bashrc or ~/.zshrc

# ==============================================
# HYPRLAND ENVIRONMENT SETUP
# ==============================================

# Export Wayland environment
export WAYLAND_DISPLAY=wayland-0
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export SDL_VIDEODRIVER=wayland
export CLUTTER_BACKEND=wayland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland

# GTK Settings
export GTK_IM_MODULE=fcitx
export GTK_USE_PORTAL=1

# Java fix for Wayland
export _JAVA_AWT_WM_NONREPARENTING=1

# Electron Ozone fix
export ELECTRON_OZONE_PLATFORM_HINT=auto

# GDK Backend
export GDK_BACKEND=wayland

# Theme
export QT_STYLE_OVERRIDE=Adwaita
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# ==============================================
# ALIASES FOR HYPRLAND
# ==============================================

# Quick config access
alias hyprconfig='$EDITOR ~/.config/hypr/hyprland.conf'
alias waybarconfig='$EDITOR ~/.config/waybar/config'
alias roficonfig='$EDITOR ~/.config/rofi/config.rasi'
alias kittyconfig='$EDITOR ~/.config/kitty/kitty.conf'
alias dunstconfig='$EDITOR ~/.config/dunst/dunstrc'

# Quick commands
alias reload-hypr='hyprctl reload'
alias restart-waybar='killall waybar; waybar &'
alias check-gpu='glxinfo | grep -i rendering'
alias check-wayland='echo $WAYLAND_DISPLAY'

# View logs
alias hypr-logs='tail -f ~/.cache/hyprlandlog.txt'
alias hypr-errors='grep -i error ~/.cache/hyprlandlog.txt'

# Performance monitoring
alias monitor-perf='watch -n 1 "ps aux | head -n 20"'
alias monitor-gpu='watch -n 1 nvidia-smi'  # NVIDIA
alias monitor-memory='free -h'

# ==============================================
# FUNCTIONS FOR HYPRLAND
# ==============================================

# Screenshot function
hypr_screenshot() {
    local dir="$HOME/Pictures/Screenshots"
    mkdir -p "$dir"
    grim -g "$(slurp)" "$dir/screenshot-$(date +%s).png"
    echo "Screenshot saved to $dir"
}

# Open applications in Hyprland
hypr_terminal() {
    kitty &
}

hypr_browser() {
    firefox &
}

hypr_file_manager() {
    nautilus &
}

hypr_app_menu() {
    rofi -show drun -theme ~/.config/rofi/config.rasi
}

# Restart Hyprland safely
hypr_restart() {
    pkill -f Hyprland
    sleep 2
    Hyprland &
}

# Check Hyprland configuration syntax
hypr_check_config() {
    hyprctl syntax ~/.config/hypr/hyprland.conf
}

# View current Hyprland settings
hypr_info() {
    echo "=== Hyprland Info ==="
    echo "Monitor: $(hyprctl monitors)"
    echo "Workspaces: $(hyprctl workspaces)"
    echo "Active window: $(hyprctl activewindow)"
}

# Export functions
export -f hypr_screenshot
export -f hypr_terminal
export -f hypr_browser
export -f hypr_file_manager
export -f hypr_app_menu
export -f hypr_restart
export -f hypr_check_config
export -f hypr_info

# ==============================================
# PS1 PROMPT CUSTOMIZATION
# ==============================================

# For Bash - Add Hyprland indicator
if [ -n "$BASH_VERSION" ]; then
    if [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
        export PS1="\[\033[0;32m\][hypr]\[\033[0m\] \u@\h:\w\$ "
    fi
fi

# For Zsh - Add to .zshrc
# Uncomment if using zsh:
# PROMPT='%F{green}[hypr]%f %n@%m:%~%# '

# ==============================================
# STARTUP CHECKS
# ==============================================

# Check if running in Wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    echo "✓ Running in Wayland mode"
    
    # Check if Hyprland
    if [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
        echo "✓ Hyprland detected"
    fi
fi

# ==============================================
# ADDITIONAL OPTIMIZATIONS
# ==============================================

# Enable command completion for Hyprland
if command -v hyprctl &> /dev/null; then
    complete -C 'hyprctl' hyprctl 2>/dev/null
fi

# Use less for man pages with colors
export LESS=-R
export LESSOPEN='| /usr/bin/source-highlight -f esc256 %s 2>/dev/null'

# Enable history search in interactive shells
if [[ $- == *i* ]]; then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi

# ==============================================
# HELPFUL COMMENTS
# ==============================================

# To use this configuration:
# 1. Copy this content to your ~/.bashrc or ~/.zshrc
# 2. Or source this file: source ~/.config/hypr/shell-config.sh
# 3. Restart your terminal or run: source ~/.bashrc

# Useful keybindings for shell:
# Ctrl+A: Move to beginning of line
# Ctrl+E: Move to end of line
# Ctrl+U: Delete from cursor to beginning
# Ctrl+K: Delete from cursor to end
# Ctrl+R: Search command history

# ==============================================
# TIPS FOR POWER USERS
# ==============================================

# Create custom workspace switcher
hypr_switch_workspace() {
    local ws=$1
    hyprctl dispatch workspace $ws
}

# Create window mover
hypr_move_window() {
    local ws=$1
    hyprctl dispatch movetoworkspace $ws
}

# Create Hyprland config backup
hypr_backup_config() {
    local backup_dir="$HOME/.config/hypr/backups"
    mkdir -p "$backup_dir"
    cp ~/.config/hypr/hyprland.conf "$backup_dir/hyprland.conf.$(date +%Y%m%d_%H%M%S)"
    echo "Config backed up to $backup_dir"
}

# List all available Hyprland bindings
hypr_list_bindings() {
    grep -E "^bind" ~/.config/hypr/hyprland.conf | head -20
}

# ==============================================
# END OF SHELL CONFIGURATION
# ==============================================
