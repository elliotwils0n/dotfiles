#!/bin/bash

if [[ -z "$(echo $XDG_CURRENT_DESKTOP | awk '/GNOME/')" ]]; then
    echo "Abort: not a gnome desktop environment."
    exit 1
fi

gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

for i in {1..9}; do
    gsettings set org.gnome.shell.keybindings "switch-to-application-$i" "[]"
    gsettings set org.gnome.desktop.wm.keybindings "switch-to-workspace-$i" "['<Super>$i']"
done

gnome-extensions disable ubuntu-dock@ubuntu.com 2>/dev/null || true

gsettings set org.gnome.Terminal.Legacy.Settings headerbar false
