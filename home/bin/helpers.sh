if [[ -n "$(echo $XDG_CURRENT_DESKTOP | awk '/GNOME/')" ]]; then
    alias toggle-animations='gsettings set org.gnome.desktop.interface enable-animations \
        $(if [[ "$(gsettings get org.gnome.desktop.interface enable-animations)" == "true" ]]; \
        then echo "false"; else echo "true"; fi)'
fi

node-enable() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}
