source $HOME/bin/init.zsh

[[ -x "/usr/bin/dircolors" ]] && eval "$(dircolors -b)"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

alias ls="ls --color=auto"
alias vim="nvim"

export EDITOR="nvim"

if [[ -z "$(echo $XDG_CURRENT_DESKTOP | awk '/GNOME/')" ]]; then
    alias toggle-animations='gsettings set org.gnome.desktop.interface enable-animations \
        $(if [[ "$(gsettings get org.gnome.desktop.interface enable-animations)" == "true" ]]; \
        then echo "false"; else echo "true"; fi)'
fi

[[ -s "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

[[ -d "/usr/local/go/bin" ]] && PATH=$PATH:/usr/local/go/bin

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
