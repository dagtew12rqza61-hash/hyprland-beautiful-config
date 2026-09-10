# Configuration Files Directory

This directory contains all the configuration files for the Beautiful Hyprland setup.

## 📁 Directory Structure

```
.
├── hyprland/              # Hyprland window manager configuration
├── waybar/                # Waybar status bar configuration
├── rofi/                  # Rofi application launcher configuration
├── kitty/                 # Kitty terminal emulator configuration
├── dunst/                 # Dunst notification daemon configuration
├── mako/                  # Mako notification daemon (alternative)
├── gtk/                   # GTK theme settings (2.0 and 3.0+)
├── shell/                 # Shell integration and functions
├── scripts/               # Utility scripts for Hyprland
└── display-manager/       # Display manager session files
```

## 🔧 Configuration Files

### Hyprland (`hyprland/`)
- **hyprland.conf** - Main Hyprland configuration with animations and effects
- **keybindings.conf** - Extended keybindings for productivity

### Waybar (`waybar/`)
- **config** - Main Waybar status bar configuration
- **style.css** - Styling for Waybar components
- **dock-config** - Alternative dock-style configuration
- **dock-style.css** - Styling for dock layout

### Rofi (`rofi/`)
- **config.rasi** - Rofi launcher configuration
- **catppuccin.rasi** - Catppuccin color theme

### Kitty (`kitty/`)
- **kitty.conf** - Terminal emulator configuration
- **color-scheme.conf** - Catppuccin color scheme for terminal

### Dunst (`dunst/`)
- **dunstrc** - Notification daemon configuration

### Mako (`mako/`)
- **config** - Alternative notification daemon (simpler than Dunst)

### GTK (`gtk/`)
- **gtkrc-2.0** - GTK 2.0 theme settings
- **settings.ini** - GTK 3.0+ theme settings

### Shell (`shell/`)
- **shell-config.sh** - Bash/Zsh configuration with aliases and functions

### Scripts (`scripts/`)
- **hyprland-env.sh** - Environment variable setup
- **xdg-portal-startup.sh** - XDG Desktop Portal initialization

### Display Manager (`display-manager/`)
- **hyprland.desktop** - Session file for login manager integration

## 📝 How to Install

### Option 1: Automated Installation (Recommended)
```bash
cd ..  # Go to project root
chmod +x install.sh
./install.sh
```

The script will:
1. Detect your Linux distribution
2. Install all required dependencies
3. Back up existing configurations
4. Copy all configs to appropriate locations

### Option 2: Manual Installation

#### Create directories:
```bash
mkdir -p ~/.config/{hypr,waybar,rofi,kitty,dunst,gtk}
mkdir -p ~/.config/scripts
```

#### Copy configuration files:
```bash
# Hyprland
cp hyprland/hyprland.conf ~/.config/hypr/
cp hyprland/keybindings.conf ~/.config/hypr/

# Waybar
cp waybar/config ~/.config/waybar/
cp waybar/style.css ~/.config/waybar/

# Rofi
cp rofi/config.rasi ~/.config/rofi/
cp rofi/catppuccin.rasi ~/.config/rofi/

# Kitty
cp kitty/kitty.conf ~/.config/kitty/
cp kitty/color-scheme.conf ~/.config/kitty/

# Dunst
cp dunst/dunstrc ~/.config/dunst/

# GTK
cp gtk/gtkrc-2.0 ~/.gtkrc-2.0
mkdir -p ~/.config/gtk-3.0
cp gtk/settings.ini ~/.config/gtk-3.0/

# Shell
cp shell/shell-config.sh ~/.config/hypr/

# Scripts
cp scripts/*.sh ~/.config/hypr/scripts/
chmod +x ~/.config/hypr/scripts/*.sh
```

## 🎯 Quick Start

After installation:

1. **Log out from current session**
2. **Select "Hyprland" at login screen**
3. **Log in**
4. **Press `Super + Q`** to open a terminal

## ⌨️ Essential Keybindings

| Action | Keybinding |
|--------|-----------|
| Open Terminal | `Super + Q` |
| Open App Menu | `Super + Space` |
| Open File Manager | `Super + E` |
| Switch Workspace | `Super + 1-9` |
| Move Window to Workspace | `Super + Shift + 1-9` |
| Close Window | `Super + C` |
| Toggle Floating | `Super + V` |
| Fullscreen | `Super + F` |
| Screenshot | `Print` |

## 🎨 Customization Guide

### Change Colors
1. Edit the specific config file (e.g., `hyprland/hyprland.conf`)
2. Replace color values with your preferred hex codes
3. See `COLORS.md` in project root for all available colors

### Change Fonts
1. Hyprland: Edit `hyprland/hyprland.conf`
2. Waybar: Edit `waybar/style.css`
3. Kitty: Edit `kitty/kitty.conf`
4. Rofi: Edit `rofi/config.rasi`

### Change Wallpaper
1. Place wallpaper in `~/.config/hypr/wallpapers/`
2. Edit `hyprland/hyprland.conf`
3. Find line: `exec-once = swaybg -c '#1e1e2e'`
4. Change to: `exec-once = swaybg -i ~/.config/hypr/wallpapers/wallpaper.png`

### Add Keybindings
Edit `hyprland/keybindings.conf`:
```bash
bind = SUPER, X, exec, command-here
```

## 🔧 Troubleshooting

### Hyprland won't start
- Check logs: `~/.cache/hyprlandlog.txt`
- Ensure GPU drivers are installed
- Try in debug mode: `HYPRLAND_DEBUG=all Hyprland`

### Waybar not showing
```bash
# Restart Waybar
killall waybar
waybar &
```

### Rofi doesn't launch
```bash
# Test Rofi
rofi -show drun -theme ~/.config/rofi/config.rasi

# Update app database
update-desktop-database ~/.local/share/applications
```

### Terminal rendering issues
```bash
# Clear cache
rm -rf ~/.cache/kitty

# Rebuild fonts
fc-cache -f -v
```

## 📚 Additional Resources

- **README.md** - Comprehensive documentation
- **FAQ.md** - Frequently asked questions
- **PERFORMANCE.md** - Performance optimization guide
- **COLORS.md** - Color palette reference
- **CONTRIBUTING.md** - How to contribute

## 🔄 Updating Configurations

To update to the latest version:

```bash
cd .. # Go to project root
git pull origin main
./install.sh
```

The installer will back up your existing configs automatically.

## 💡 Tips

1. **Use aliases** from `shell/shell-config.sh` for quick access
2. **Check logs** when something breaks: `~/.cache/hyprlandlog.txt`
3. **Test changes** with `hyprctl reload` before permanent changes
4. **Keep backups** of custom modifications
5. **Join community** for tips and support

## 📞 Support

- Check [FAQ.md](../FAQ.md) for common issues
- Read [PERFORMANCE.md](../PERFORMANCE.md) for optimization
- Open an issue on GitHub
- Review Hyprland wiki: https://wiki.hyprland.org

## ✅ File Checklist

Before using, ensure you have:

- [ ] Created necessary directories
- [ ] Copied all configuration files
- [ ] Installed dependencies
- [ ] Tested Hyprland starts
- [ ] Verified keybindings work
- [ ] Customized as needed

## 🎓 Learning Path

1. Start with main configurations (hyprland, waybar, rofi)
2. Customize colors in COLORS.md
3. Add personal keybindings
4. Explore advanced features in each config
5. Join community and share your setup!

---

**Last Updated**: 2026-09-10

For more info, visit: https://github.com/dagtew12rqza61-hash/hyprland-beautiful-config
