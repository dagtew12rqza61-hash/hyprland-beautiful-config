# Performance Optimization Guide for Hyprland

## 🚀 Performance Tips

### GPU Acceleration

```bash
# For NVIDIA (with nvidia-utils)
export LIBVA_DRIVER_NAME=nvidia
export VDPAU_DRIVER=nvidia
export NVD_BACKEND=direct

# For Intel
export LIBVA_DRIVER_NAME=iHD
export VDPAU_DRIVER=va_gl

# For AMD
export LIBVA_DRIVER_NAME=radeonsi
```

### Hyprland Optimization

1. **Reduce blur radius** in `hyprland.conf`:
   ```bash
   # Instead of: blur_size = 20
   blur_size = 10
   ```

2. **Disable animations** for performance:
   ```bash
   animations {
       enabled = 0
   }
   ```

3. **Reduce animation quality**:
   ```bash
   animation = windows, 1, 8, default    # Faster
   # Instead of:
   animation = windows, 1, 5, default    # Slower
   ```

4. **Disable decoration shadows**:
   ```bash
   decoration {
       shadow_enabled = 0
   }
   ```

5. **Optimize cursor updates**:
   ```bash
   cursor {
       hide_on_key_press = true
       hide_on_touch = true
   }
   ```

### System-Level Optimization

1. **CPU Governor**:
   ```bash
   # Set to performance mode
   echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
   ```

2. **Disable unnecessary services**:
   ```bash
   # Check running services
   systemctl list-unit-files --state=enabled
   
   # Disable unused services
   systemctl --user mask service-name
   ```

3. **Memory swappiness**:
   ```bash
   # Reduce to 10-20 for better responsiveness
   echo 10 | sudo tee /proc/sys/vm/swappiness
   ```

### Application-Level Optimization

#### Waybar
```bash
# Reduce update frequency
"clock": {
    "interval": 60  # Update every minute instead of 1 second
}
```

#### Kitty
```bash
# Reduce repaint delay for faster response
repaint_delay = 15  # Default 10ms, increase for less CPU usage
```

#### Firefox
- Install uBlock Origin for ad blocking
- Disable hardware acceleration if causing issues
- Disable smooth scrolling for better performance

### Memory Usage Reduction

1. **Monitor process usage**:
   ```bash
   watch -n 1 'ps aux | head -n 20'
   ```

2. **Kill memory hogs**:
   ```bash
   # Check which apps use most memory
   smem -s pss -t
   ```

3. **Limit cache sizes**:
   ```bash
   # Clear Firefox cache
   rm -rf ~/.cache/firefox
   
   # Clear Chromium cache
   rm -rf ~/.cache/chromium
   ```

## 🔍 Monitoring Performance

### CPU and Memory Usage
```bash
# Real-time monitoring
htop

# Per-application monitoring
iotop

# System statistics
sysstat
```

### GPU Usage
```bash
# NVIDIA
nvidia-smi

# Intel
intel_gpu_top

# AMD
radeontop
```

### FPS and Frame Time
```bash
# Use built-in Hyprland debug
HYPRLAND_DEBUG=all Hyprland 2>&1 | grep -i fps
```

## ⚡ Power Saving

### Energy-Saving Configuration

```bash
# In hyprland.conf
monitor = HDMI-1, 1920x1080@60, 0x0, 1
# Use 60Hz instead of higher refresh rates for power saving
```

### Powertop Optimization
```bash
# Install powertop
sudo pacman -S powertop

# Auto-tune
sudo powertop --auto-tune
```

### Display Power Management
```bash
# Auto-suspend display after 5 minutes
exec-once = xset dpms 0 0 300
```

## 🎮 Gaming Optimization

For better gaming performance:

1. **Disable compositor during games**:
   ```bash
   # In hyprland.conf
   windowrulev2 = noblur,class:^(game)$
   windowrulev2 = noshadow,class:^(game)$
   ```

2. **Use Game Mode**:
   ```bash
   # Enable with:
   gamemoderun game-executable
   ```

3. **Disable animations during gameplay**:
   ```bash
   windowrulev2 = animation none,class:^(game)$
   ```

## 🔧 Debugging Performance Issues

### Check for bottlenecks
```bash
# CPU bottleneck
top -p $(pgrep -f hyprland)

# GPU bottleneck
glxinfo | grep -i rendering

# Memory bottleneck
free -h
```

### Enable performance mode
```bash
# Create a performance script
#!/bin/bash
echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo 0 > /proc/sys/kernel/sched_migration_cost_ns
```

## 📊 Benchmarking

### Measure FPS
```bash
# Use glxgears to measure performance
glxgears

# Use gfxbench for more accurate results
# Download from: https://gfxbench.com/
```

### Monitor Hyprland performance
```bash
# Check Hyprland logs
tail -f ~/.cache/hyprlandlog.txt | grep -i "fps\|frame"
```

## 💡 Best Practices

1. **Use a lightweight file manager** (Thunar, PCManFM)
2. **Limit browser tabs** to reduce memory usage
3. **Use native Wayland apps** instead of X11 apps
4. **Keep drivers updated** for better performance
5. **Use profile-sync-daemon** for faster profile I/O
6. **Enable zram** for better memory compression

## ⚠️ Common Performance Issues

| Issue | Solution |
|-------|----------|
| High CPU usage | Check running processes, reduce animation quality |
| Low FPS | Reduce blur, disable shadows, update drivers |
| Memory leak | Check Waybar config, monitor Hyprland process |
| Slow startup | Disable unnecessary exec-once commands |
| Stuttering | Enable GPU acceleration, reduce monitor refresh rate |
| Battery drain | Disable blur, reduce brightness, use power profiles |

---

For more detailed information, visit:
- [Hyprland Wiki](https://wiki.hyprland.org)
- [ArchWiki Performance](https://wiki.archlinux.org/title/performance)
