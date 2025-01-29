# History file configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

# History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Key bindings
bindkey -v # Vi mode
bindkey "^?" backward-delete-char # Backspace
bindkey "^[^?" backward-kill-word # Alt + Backspace
bindkey "^[[3;3~" kill-word       # Alt + Delete
bindkey "^[[1;3D" backward-word   # Alt + Left
bindkey "^[[1;3C" forward-word    # Alt + Right

# Search history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" up-line-or-beginning-search

# Search history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

# Word style
autoload -U select-word-style
select-word-style bash

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Colors
autoload colors && colors
function colored() {
    m_text=$1; m_color=$2; m_style=$3
    if [[ "$m_style" == "bold" ]]; then
        echo "%{$fg_bold[$m_color]%}$m_text%{$reset_color%}"
    else
        echo "%{$fg[$m_color]%}$m_text%{$reset_color%}"
    fi
}

# Version control system info
autoload -Uz vcs_info
precmd() {
    vcs_info
}
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' unstagedstr " $(colored 'U' 'red')"
zstyle ':vcs_info:*' stagedstr " $(colored 'S' 'green')"
zstyle ':vcs_info:*' formats "[$(colored '%s' 'blue' 'bold'): $(colored '%b' 'magenta' 'bold')%m%u%c] "

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[misc]+=" %{$fg[red]%}?%{$reset_color%}"
    fi
}

# Prompt
setopt PROMPT_SUBST
PROMPT="%(?:$(colored '>' 'green' 'bold') :$(colored '>' 'red' 'bold') )"
PROMPT+="$(colored '%c' 'cyan' 'bold') "
PROMPT+='$vcs_info_msg_0_'

# Cleanup
unfunction colored
