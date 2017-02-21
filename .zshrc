# Created by newuser for 5.0.7

export LC_CTYPE=en_US.UTF-8

alias asapp='cd ~/asapp && source misc/source-asapp-dev.sh'

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
antigen bundle command-not-found
antigen bundle git
antigen bundle fasd
#
## OS specific plugins
antigen bundle brew
antigen bundle brew-cask
antigen bundle osx
antigen bundle vi-mode

antigen apply

# Alias
alias v='f -e vim' # quick opening files with vim
alias gq='grep -inIr --exclude="*.swp" --exclude="*.py~" --exclude="*.orig"'
alias -g G='| gq --color'

# Git
alias gdt='git difftool'
alias gdtc='gdt --cached'
alias gla='git la'


