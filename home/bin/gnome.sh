#!/bin/sh

if [[ "$DESKTOP_SESSION" != "gnome" ]]; then
    echo "Abort: not a gnome desktop environment."
    return 1 2>/dev/null
    exit 1 # This will get executed if the above failed.
fi

for i in {1..9}; do
    gsettings set "org.gnome.shell.keybindings" "switch-to-application-$i" "[]"
    gsettings set "org.gnome.desktop.wm.keybindings" "switch-to-workspace-$i" "['<Super>$i']"
done
