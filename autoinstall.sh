#!/bin/bash
#Autorice installer for Pop OS!
echo Configurating packages...
echo
sudo apt update 
sudo apt remove cosmic* -y
sudo apt install git xdg-desktop-portal* lxpolkit qt5ct qt6ct thunar scrcpy blueman kitty sway swaybg flatpak flameshot steam discord -y
flatpak install -y com.dec05eba.gpu_screen_recorder
flatpak install -y com.github.tchx84.Flatseal
flatpak install -y com.heroicgameslauncher.hgl
flatpak install -y io.github.peazip.PeaZip 
flatpak install -y org.freedownloadmanager.Manager 
flatpak install -y org.kartkrew.RingRacers
flatpak install -y org.kde.krita
flatpak install -y org.prismlauncher.PrismLauncher 
flatpak install -y org.qbittorrent.qBittorrent
flatpak install -y org.srb2.SRB2 
flatpak install -y org.vinegarhq.Sober
flatpak install -y ru.linux_gaming.PortProton 
echo Configuring Sway config...
echo
mkdir -p $HOME/.config/sway/
cat << 'EOF' > $HOME/.config/sway/config
# Default config for sway
#
# Copy this to ~/.config/sway/config and edit it to your liking.
#
# Read `man 5 sway` for a complete reference.
# mods 
xwayland enable
exec lxpolkit
exec nwg-panel
default_border none
default_floating_border none
hide_edge_borders both
bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5%
bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5%
gaps inner 5  
gaps inner 5

bindsym XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle
### Variables
#
# Logo key. Use Mod1 for Alt.
set $mod Mod1
# Home row direction keys, like vim
set $left h
set $down j
set $up k
set $right l
# Your preferred terminal emulator
set $term foot
# Your preferred application launcher
# Note: pass the final command to swaymsg so that the resulting window can be opened
# on the original workspace that the command was run on.
set $menu fuzzel
include /etc/sway/config-vars.d/*

### Output configuration
#
# Default wallpaper (more resolutions are available in /usr/share/backgrounds/sway/)
output * bg /home/cookie/Documents/a.png fill
#
# Example configuration:
#
#   output HDMI-A-1 resolution 1920x1080 position 1920,0
#
# You can get the names of your outputs by running: swaymsg -t get_outputs

### Idle configuration
#
# Example configuration:
#
# exec swayidle -w \
#          timeout 300 'swaylock -f -c 000000' \
#          timeout 600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
#          before-sleep 'swaylock -f -c 000000'
#
# This will lock your screen after 300 seconds of inactivity, then turn off
# your displays after another 300 seconds, and turn your screens back on when
# resumed. It will also lock your screen before your computer goes to sleep.

### Input configuration
#

# Example configuration:
#
#   input "2:14:SynPS/2_Synaptics_TouchPad" {
#       dwt enabled
#       tap enabled
#       natural_scroll enabled
#       middle_emulation enabled
#   }
#
# You can get the names of your inputs by running: swaymsg -t get_inputs
# Read `man 5 sway-input` for more information about this section.

### Key bindings
#
# Basics:
#
    # Start a terminal
    bindsym $mod+Return exec $term

    # Kill focused window
    bindsym $mod+Shift+q kill

    # Start your launcher
    bindsym $mod+d exec $menu

    # Drag floating windows by holding down $mod and left mouse button.
    # Resize them with right mouse button + $mod.
    # Despite the name, also works for non-floating windows.
    # Change normal to inverse to use left mouse button for resizing and right
    # mouse button for dragging.
    floating_modifier $mod normal

    # Reload the configuration file
    bindsym $mod+Shift+c reload

    # Exit sway (logs you out of your Wayland session)
    bindsym $mod+Shift+e exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'
#
# Moving around:
#
    # Move your focus around
    bindsym $mod+$left focus left
    bindsym $mod+$down focus down
    bindsym $mod+$up focus up
    bindsym $mod+$right focus right
    # Or use $mod+[up|down|left|right]
    bindsym $mod+Left focus left
    bindsym $mod+Down focus down
    bindsym $mod+Up focus up
    bindsym $mod+Right focus right
    bindsym $mod+m output eDP-1 disable
    bindsym $mod+x exec flameshot gui 
    # Move the focused window with the same, but add Shift
    bindsym $mod+Shift+$left move left
    bindsym $mod+Shift+$down move down
    bindsym $mod+Shift+$up move up
    bindsym $mod+Shift+$right move right
    # Ditto, with arrow keys
    bindsym $mod+Shift+Left move left
    bindsym $mod+Shift+Down move down
    bindsym $mod+Shift+Up move up
    bindsym $mod+Shift+Right move right
#
# Workspaces:
#
    # Switch to workspace
    bindsym $mod+1 workspace number 1
    bindsym $mod+2 workspace number 2
    bindsym $mod+3 workspace number 3
    bindsym $mod+4 workspace number 4
    bindsym $mod+5 workspace number 5
    bindsym $mod+6 workspace number 6
    bindsym $mod+7 workspace number 7
    bindsym $mod+8 workspace number 8
    bindsym $mod+9 workspace number 9
    bindsym $mod+0 workspace number 10
    # Move focused container to workspace
    bindsym $mod+Shift+1 move container to workspace number 1
    bindsym $mod+Shift+2 move container to workspace number 2
    bindsym $mod+Shift+3 move container to workspace number 3
    bindsym $mod+Shift+4 move container to workspace number 4
    bindsym $mod+Shift+5 move container to workspace number 5
    bindsym $mod+Shift+6 move container to workspace number 6
    bindsym $mod+Shift+7 move container to workspace number 7
    bindsym $mod+Shift+8 move container to workspace number 8
    bindsym $mod+Shift+9 move container to workspace number 9
    bindsym $mod+Shift+0 move container to workspace number 10
    # Note: workspaces can have any name you want, not just numbers.
    # We just use 1-10 as the default.
#
# Layout stuff:
#
    # You can "split" the current object of your focus with
    # $mod+b or $mod+v, for horizontal and vertical splits
    # respectively.
    bindsym $mod+b splith
    bindsym $mod+v splitv

    # Switch the current container between different layout styles
    bindsym $mod+s layout stacking
    bindsym $mod+w layout tabbed
    bindsym $mod+e layout toggle split

    # Make the current focus fullscreen
    bindsym $mod+f fullscreen

    # Toggle the current focus between tiling and floating mode
    bindsym $mod+Shift+space floating toggle

    # Swap focus between the tiling area and the floating area
    bindsym $mod+space focus mode_toggle

    # Move focus to the parent container
    bindsym $mod+a focus parent
#
# Scratchpad:
#
    # Sway has a "scratchpad", which is a bag of holding for windows.
    # You can send windows there and get them back later.

    # Move the currently focused window to the scratchpad
    bindsym $mod+Shift+minus move scratchpad

    # Show the next scratchpad window or hide the focused scratchpad window.
    # If there are multiple scratchpad windows, this command cycles through them.
    bindsym $mod+minus scratchpad show
#
# Resizing containers:
#
mode "resize" {
    # left will shrink the containers width
    # right will grow the containers width
    # up will shrink the containers height
    # down will grow the containers height
    bindsym $left resize shrink width 10px
    bindsym $down resize grow height 10px
    bindsym $up resize shrink height 10px
    bindsym $right resize grow width 10px

    # Ditto, with arrow keys
    bindsym Left resize shrink width 10px
    bindsym Down resize grow height 10px
    bindsym Up resize shrink height 10px
    bindsym Right resize grow width 10px

    # Return to default mode
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+r mode "resize"

#
# Status Bar:
#

xwayland enable

include /etc/sway/config.d/*

EOF

echo Setting up misc stuff...
echo
sudo apt install git curl bluez-tools gir1.2-gtklayershell-0.1 libgtk-3-0 pulseaudio-utils gir1.2-dbusmenu-gtk3-0.4 gir1.2-playerctl-2.0 playerctl python3-dasbus python3-gi-cairo python3-i3ipc python3-pydbus python3-xlib -y
git clone https://github.com/nwg-piotr/nwg-panel
git clone https://github.com/nwg-piotr/nwg-icon-picker
cd nwg-panel
sudo ./install.sh && cd ../nwg-icon-picker && sudo ./install.sh

sudo apt install build-essential libpam0g-dev libxcb-xkb-dev xauth xserver-xorg brightnessctl zig -y
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
zig build
sudo systemctl enable ly@tty2.service

wget https://raw.githubusercontent.com/Cookieisepik/setup-/refs/heads/main/a.png
mv a.png $HOME/Documents/ 
curl -sS https://starship.rs/install.sh | sh
cat << 'EOF' > $HOME/.bashrc
eval "$(starship init bash)"
EOF

echo finished!!
