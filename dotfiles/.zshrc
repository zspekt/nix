################################################################################
# bloated theme ################################################################
################################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# to measure startup times
# zmodload zsh/zprof

################################################################################
# wayland stuff ################################################################
################################################################################

# export WLR_EGL_NO_MODIFIERS=1
# this breaks hyprland. DO NOT EXPORT

# possible this shouldn't be here
# export XDG_CURRENT_DESKTOP=Hyprland
# export XDG_SESSION_TYPE=wayland
# export XDG_SESSION_DESKTOP=Hyprland
# tell firefox to run natively in wayland
MOZ_ENABLE_WAYLAND=1

# without this u have no cursor on hyprland
export WLR_NO_HARDWARE_CURSORS=1

# # Without this IDEA won't work
export _JAVA_AWT_WM_NONREPARENTING=1

################################################################################
# SSH and GPG ##################################################################
################################################################################

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
    gpgconf --create-socketdir
else
    export GPG_TTY="$(tty)"
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
fi


################################################################################
# misc #########################################################################
################################################################################

# interactive cd on tab with fzf
# source /home/zspekt/.cache/antidote/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

export XDG_CACHE_HOME=$HOME/.cache

export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh

# History in cache directory:
setopt SHARE_HISTORY
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt HIST_EXPIRE_DUPS_FIRST
setopt APPENDHISTORY
setopt SHAREHISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS


################################################################################
# aliases ######################################################################
################################################################################

# alias cat=bat

alias d=docker
alias dc=docker-compose

alias kc=kubectl

alias lzd=lazydocker

alias startx="Hyprland"

alias vb="VBox"
alias vbm="vboxmanage"

alias gcsmsp="gcsm 'submodule' && gp"
alias gs="git switch"

alias du="du -hc"
alias rwb="killall waybar; waybar & disown"
alias p=passmenu
# alias vim=nvim
# alias vi=nvim
alias ls='ls -l'
alias nvlog="journalctl | nvim"

alias gmi="go mod init"
alias gor="go run"

alias gipv6="ifconfig |  grep -o 'inet6 [^fde:].*global>' | awk '{print \$2}'"
alias int="ping -c 3 ping.archlinux.org"

################################################################################
# plugins ######################################################################
################################################################################

# antidote
source ~/.zsh/zsh_plugins.zsh

bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

setopt HIST_IGNORE_ALL_DUPS

# bindings for history-substring-search-up
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# yazi or lfcd

if hash yazi 2>/dev/null; then
  bindkey -s '^o' 'yazi\n'
else
  # Use lf to switch directories and bind it to ctrl-o
  lfcd () {
      tmp="$(mktemp)"
      lf -last-dir-path="$tmp" "$@"
      if [ -f "$tmp" ]; then
          dir="$(cat "$tmp")"
          rm -f "$tmp"
          [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
      fi
  }
  bindkey -s '^o' 'lfcd\n'
fi



################################################################################
# paths ########################################################################
################################################################################

GOPATH=$HOME/go

export PATH=$PATH:/home/zspekt/.local/bin

export PATH=$PATH:$GOPATH

export PATH=$PATH:$GOPATH/bin

################################################################################
#### go ########################################################################
################################################################################
export GOPATH

################################################################################
#### sesh ######################################################################
################################################################################

function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -it -ic | fzf --color=fg+:#fc9c3a,current-bg:-1,border:#fc9c3a,pointer:#f6758d,marker:#f6758d,prompt:#7eb041,label:#fc9c3a --ansi --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    [[ -z "$session" ]] && return
    sesh connect "$session"
  }
}

zle     -N             sesh-sessions
# bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions

export FZF_DEFAULT_OPTS="--color=fg+:#fc9c3a,current-bg:-1,border:#fc9c3a,pointer:#f6758d,marker:#f6758d,separator:#807e71,prompt:#7eb041 --pointer=' ' --marker=' ' --prompt=' '"


################################################################################
#### more p10k #################################################################
################################################################################

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


################################################################################
#### zoxide ####################################################################
################################################################################

eval "$(zoxide init --cmd cd zsh)"
