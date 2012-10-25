# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="nanotech"
ZSH_THEME="alanpeabody"
#ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls --color=auto'
export GREP_COLOR="1;33"
alias grep='grep --color=auto'
alias upgrade='yaourt -Syu --aur'
alias cleanup='yaourt -Qtd'
alias itxroot='ssh -Y root@192.168.2.2'
alias itxme='ssh -Y 192.168.2.2'
alias Tagis='rdesktop -k pt -g 1280x800 10.101.134.93 -r clipboard:CLIPBOARD -r disk:FPM=/home/francisco/ -r sound:local:alsa'

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#Vi like keybinds
bindkey -v

# BRUNO:
eval `dircolors -b`
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# BRUNO: Cache, dá jeito pro zsh-yaourt
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

#BRUNO OPTIONS:
setopt SH_WORD_SPLIT # Pra fazer split estilo bash (obriga\ a\ escrever\ assim\ pa\ não\ partir, mas torna compativel com scripts bash)
setopt autopushd pushdminus pushdsilent pushdtohome # pra fazer algo estilo 'cd -' e TAB e ele dá-te uma lista dos path que já fizeste (tipo historico)
setopt COMPLETE_IN_WORD # pra fazer complete a meio de uma palavra tipo, f"tecla TAB"ox dar firefox

###############
#Edited By me:#
###############
bindkey '^i' expand-or-complete-prefix
zstyle ':completion:*:match:*' match-original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
### The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
eval `dircolors -b`
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

unsetopt beep
#Colour man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "^H" backward-delete-word
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm. Works with Gnome-terminal
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line

# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

# BRUNO: Isto dá jeito pro historico só mostrar os que coincidem com o k já escreveste, tipo só gedit ou mplayer
# enabling history search
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

#Taken from Bruno and altered:

# vars used by zsh
export BROWSER=firefox
export DOCVIEWER=evince
export EDITOR=gvim
export EXTRACT=file-roller
export OFFICE=soffice
export PICVIEWER=eog
export PLAYER=totem

# tab completion for PID 
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:kill:*:processes' command "ps x"

# SSH hosts tab completion
local _myhosts
_myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*' hosts $_myhosts
#Make it in English
LANG=en_GB.UTF-8
