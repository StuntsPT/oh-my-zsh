# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="nanotech"
#ZSH_THEME="bira"
#ZSH_THEME="alanpeabody"
ZSH_THEME="candy"

alias upgrade='yaourt -Syu --aur'
alias cleanup='yaourt -Qtd'
alias itxroot='ssh -Y root@192.168.2.2'
alias itxme='ssh -Y 192.168.2.2'
alias Tagis='rdesktop -k pt -g 1280x800 10.101.134.93 -r clipboard:CLIPBOARD -r disk:FPM=/home/francisco/ -r sound:local:alsa'

# Set to this to use case-sensitive completion
#CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#Vi like keybinds
bindkey -v

#BRUNO OPTIONS:
setopt SH_WORD_SPLIT # Pra fazer split estilo bash (obriga\ a\ escrever\ assim\ pa\ não\ partir, mas torna compativel com scripts bash)
#History search
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

###############
#Edited By me:#
###############
zstyle ':completion:*:match:*' match-original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
### The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
eval `dircolors -b`
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#unsetopt beep
#Colour man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#Taken from Bruno and altered:

# tab completion for PID 
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:kill:*:processes' command "ps x"

#Remove autocorrect "feature":
unsetopt correct_all
