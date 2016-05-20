# Simple .zshrc file

DHOST_NAME="DOCKER"

export TERM="xterm-256color"

HISTFILE=~/.zsh_hist
HISTSIZE=1000000000
SAVEHIST=1000000000

# scripts
export PATH=~/scripts:$PATH
export PATH=~/bin:$PATH


#define commands again
alias ls="ls --color"
alias ll="ls -asl"
alias lh="ll -h"
alias rm="rm -i"
alias cd..="cd .."
alias less='less -SR'
alias grep='grep --color=always'


# Set zsh prompt
PROMPT="%F{magenta}%n%f"
PROMPT+="@"
#PROMPT+="%F{blue}${${(%):-%m}#zoltan-}%f"
PROMPT+="%F{blue}${DHOST_NAME}%f"
PROMPT+=" "
PROMPT+="%F{yellow}%1~ %f"
PROMPT+=" %# "
