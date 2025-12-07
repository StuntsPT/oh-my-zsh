# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Activate conda if configured
CONDA_CONFIG="${HOME}/.config/conda_init.sh"
if [ -f ${CONDA_CONFIG} ]
then
	source ${CONDA_CONFIG}
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="daft"

alias upgrade="pikaur -Syu"
alias cleanup="sudo pacman -Scc"
alias itxroot="ssh -Y root@10.10.10.1"
alias itxme="ssh 10.10.10.1"
alias scp="rsync -avP"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git transfer)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#Vi like keybinds
bindkey -v

#BRUNO OPTIONS:
setopt SH_WORD_SPLIT # Pra fazer split estilo bash (obriga\ a\ escrever\ assim\ pa\ não\ partir, mas torna compativel com scripts bash)

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

unsetopt beep
#Colour man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#Taken from Bruno and altered:

#Remove autocorrect "feature":
unsetopt correct_all

#Make End, Home, Del and Ins keys work fine:
#autoload zkbd
source ${ZSH}/zkbd/keycodes

[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line


#Temp fix for grep:
#alias grep="/usr/bin/grep $GREP_OPTIONS"
#unset GREP_OPTIONS


# Aliases for neovim
#alias kvim=nvim-gtk
#alias kvimdiff="nvim-gtk -- -d"
alias kvim=nvim-qt
alias kvimdiff="nvim-qt -- -d"
alias nvimdiff="nvim -d"
alias neovidediff="neovide --no-tabs -- -d"
alias neovide="neovide --fork"

# Alias for micromamba
alias mm=micromamba

# Add locations to $PATH
PATH=$PATH:~/.local/bin


# Added for global npm under ~/
#NPM_PACKAGES="${HOME}/.npm-packages"
#NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
#PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
# unset MANPATH # delete if you already modified MANPATH elsewhere in your config
# MANPATH="$NPM_PACKAGES/share/man:$(manpath)"


# eval $(thefuck --alias)

export SYSTEMD_EDITOR=nvim
EDITOR=nvim
VISUAL=neovide

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/usr/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/francisco/.local/share/mamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# Source zsh-syntax-highlight
source ${ZSH}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets)
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow'
