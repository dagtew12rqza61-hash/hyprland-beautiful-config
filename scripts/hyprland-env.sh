#!/bin/bash
# Hyprland Environment Setup Script
# This script sets up necessary environment variables for Hyprland

# Wayland environment variables
export WAYLAND_DISPLAY=wayland-0
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export SDL_VIDEODRIVER=wayland
export CLUTTER_BACKEND=wayland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland

# GTK settings
export GTK_IM_MODULE=fcitx
export GTK_USE_PORTAL=1

# Performance optimization
export LIBVA_DRIVER_NAME=iHD
export VDPAU_DRIVER=va_gl

# Java applications fix
export _JAVA_AWT_WM_NONREPARENTING=1

# Fix for some applications
export GDK_BACKEND=wayland
export ELECTRON_OZONE_PLATFORM_HINT=auto

# XDG directories
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

# Theme settings
export QT_STYLE_OVERRIDE=Adwaita
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# Start systemd user session if not already running
if ! systemctl --user is-active --quiet; then
    systemctl --user start graphical-session
fi
