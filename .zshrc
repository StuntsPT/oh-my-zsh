# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="alanpeabody"
ZSH_THEME="candy"

alias upgrade="yaourt -Syu --aur"
alias cleanup="yaourt -Qtd"
alias itxroot="ssh -Y root@10.10.10.1"
alias itxme="ssh 10.10.10.1"
alias RADGET="cat /sys/class/drm/card0/device/power_profile"
alias MIDRAD="echo mid > /sys/class/drm/card0/device/power_profile"
alias LOWRAD="echo low > /sys/class/drm/card0/device/power_profile"
alias HIGHRAD="echo high > /sys/class/drm/card0/device/power_profile"
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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#Vi like keybinds
bindkey -v

#BRUNO OPTIONS:
setopt SH_WORD_SPLIT # Pra fazer split estilo bash (obriga\ a\ escrever\ assim\ pa\ não\ partir, mas torna compativel com scripts bash)
#History search
bindkey '^[OA' history-search-backward
bindkey '^[OB' history-search-forward

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


#
# Defines transfer alias and provides easy command line file and folder sharing.
#
# Authors:
#   Remco Verhoef <remco@dutchcoders.io>
#

if (( ! $+commands[curl] )); then
  return 1
fi

transfer() { 
    # check arguments
    if [ $# -eq 0 ]; 
    then 
        echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    fi

    # get temporarily filename, output is written to this file show progress can be showed
    tmpfile=$( mktemp -t transferXXX )
    
    # upload stdin or file
    file=$1

    if tty -s; 
    then 
        basefile=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g') 

        if [ ! -e $file ];
        then
            echo "File $file doesn't exists."
            return 1
        fi
        
        if [ -d $file ];
        then
            # zip directory and transfer
            zipfile=$( mktemp -t transferXXX.zip )
            cd $(dirname $file) && zip -r -q - $(basename $file) >> $zipfile
            curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
            rm -f $zipfile
        else
            # transfer file
            curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
        fi
    else 
        # transfer pipe
        curl --progress-bar --upload-file "-" "https://transfer.sh/$file" >> $tmpfile
    fi
   
    # cat output link
    cat $tmpfile

    # cleanup
    rm -f $tmpfile
}

alias transfer=transfer

# Use nvim-qt with a decent window size and in background

function qvim {
    nvim-qt --geometry 800x600 -- "$@" &
}

alias qvim=qvim

# Source zsh-syntax-highlight
source ${ZSH}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
