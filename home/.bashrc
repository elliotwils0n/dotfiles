source /etc/skel/.bashrc

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind 'set colored-stats on'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias vim="nvim"

export EDITOR="nvim"

[[ -s "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

[[ -d "/usr/local/go/bin" ]] && PATH=$PATH:/usr/local/go/bin

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
