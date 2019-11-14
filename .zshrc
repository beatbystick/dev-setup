# Created by newuser for 5.0.7
export PATH=$PATH:/Users/oneway/go/bin
export LC_CTYPE=en_US.UTF-8
export AWS_DEFAULT_REGION=us-east-1
export HISTCONTROL=ignorespace
export EDITOR=/usr/local/bin/vim

# Load Antigen
source /usr/local/share/antigen/antigen.zsh

# Load various lib files
antigen use oh-my-zsh

# Antigen Theme
antigen theme wezm

#
# Antigen Bundles
#

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle fasd
#
## OS specific plugins
antigen bundle brew
antigen bundle brew-cask
antigen bundle vi-mode

antigen bundle jsontools
antigen bundle docker
antigen bundle docker-compose
antigen bundle kubectl
antigen bundle vault

antigen bundle zsh-users/zsh-autosuggestions
antigen apply

# Alias
alias v='f -e vim' # quick opening files with vim
alias gq='grep -inIr --exclude="*.swp" --exclude="*.py~" --exclude="*.orig"'
alias -g G='| gq --color'

# Git
alias gdt='git difftool'
alias gdtc='gdt --cached'
alias gla='git la'
alias gpo='git push origin'
alias gcom='git checkout origin/master'
alias gcod='git checkout origin/develop'
alias gcob='git checkout -b'

# qq
alias qq="~/go/src/github.com/y0ssar1an/q/q.sh"
alias rmqq="rm $TMPDIR/q"

# tmux
alias ta='tmux attach-session -t'
alias tn='tmux new -s'

# kubectl
alias kc='kubectl'
alias kgp='kc get pods'
alias kd='kc describe'

# docker
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcub='docker-compose up --build'
alias dcd='docker-compose down'

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

function loop {
    while sleep "$1"; do eval "$2"; done
}

function pjs {
    echo $1 | jq .
}

function kcdbsec {
    kubectl get secrets api -o yaml | awk -F'secrets.json: ' '{print $2}' | base64 --decode | jq .DB
}

function mypod {
    if [ -z "$1" ]; then
        IFS=' ' read -r pod_name kk <<< $(kgp | grep sw-util)
        kc exec -it "$pod_name" bash
    else
        echo "use namespace $1"
        IFS=' ' read -r pod_name kk <<< $(kgp -n "$1" | grep sw-util)
        kc exec -it "$pod_name" bash -n "$1"
    fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

