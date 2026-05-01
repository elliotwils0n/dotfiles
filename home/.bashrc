# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth
PROMPT_COMMAND='history -a; history -n'

shopt -s histappend
shopt -s cmdhist
set -o vi

bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind 'set colored-stats on'
bind 'TAB: menu-complete'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tree='tree -C'

[[ -s "/usr/share/git/git-prompt.sh" ]] && source /usr/share/git/git-prompt.sh

__get_prompt() {
    local prompt_status='$( [ $? -eq 0 ] && echo "\[\e[1;32m\]>\[\e[0m\]" || echo "\[\e[1;31m\]>\[\e[0m\]" )'
    local prompt_dir='\[\e[1;36m\]\W\[\e[0m\]'
    local prompt_host='\[\e[1;33m\]\h\[\e[0m\]'
    if [[ -n "$SSH_CONNECTION" || -n "$SSH_TTY" ]]; then
        echo "[$prompt_host] $prompt_status $prompt_dir"
    else
        echo "$prompt_status $prompt_dir"
    fi
}

if type __git_ps1 >/dev/null 2>&1; then
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWCOLORHINTS=1
    PROMPT_COMMAND='history -a; history -n; __git_ps1 "$(__get_prompt)" " "'
else
    PS1="$(__get_prompt) "
fi

if command -v gpgconf >/dev/null 2>&1; then
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
fi

command -v nvim >/dev/null 2>&1 && export EDITOR="nvim" || export EDITOR="vim"

__prepend_to_path() {
    local dir="$1"
    if [[ -d "$dir" ]]; then
	    echo "$PATH" | grep -q "$dir" || PATH="${dir}:${PATH}"
    fi
}

__prepend_to_path "$HOME/.cargo/bin"
__prepend_to_path "$HOME/go/bin"

__prepend_to_path "/usr/local/go/bin"
__prepend_to_path "$HOME/opt/jdtls/bin"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [[ -n "$(echo $XDG_CURRENT_DESKTOP | awk '/GNOME/')" ]]; then
    alias toggle-animations='gsettings set org.gnome.desktop.interface enable-animations \
        $(if [[ "$(gsettings get org.gnome.desktop.interface enable-animations)" == "true" ]]; \
        then echo "false"; else echo "true"; fi)'
fi
