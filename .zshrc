# Created by newuser for 5.0.7

export LC_CTYPE=en_US.UTF-8
#source venv.sh

# Load Antigen
source ~/Dev/antigen/antigen.zsh

# Load various lib files
antigen use oh-my-zsh

# Antigen Theme
antigen theme wezm

#
# Antigen Bundles
#

antigen-bundle zsh-users/zsh-syntax-highlighting
antigen bundle command-not-found
antigen bundle git
antigen bundle fasd

## Node Plugins
#antigen bundle node
#antigen bundle npm
#
## Python Plugins
#antigen bundle pip
#antigen bundle python
#antigen bundle virtualenv

# OS specific plugins
antigen bundle brew
antigen bundle brew-cask
antigen bundle osx

antigen apply

bindkey -v

# Alias
alias v='f -e vim' # quick opening files with vim
alias gq='grep -inIr --exclude="*.swp" --exclude="*.py~" --exclude="*.orig"'
alias -g G='| gq --color'
alias glog='git la'

# Git
alias gla='glog'
alias gbd='gb -d'
alias gdtc='gdt --cached'

# Ansible
alias ap='ansible-playbook -i hosts'

function deploy-latest
{
        deploy_source_path=~/Dev/pave/core
        deploy_path=~/Dev/pave/core/scripts/deploy

        name=$1

        if [ -z $name ]; then
            name=prod
        fi
        source venv.sh dev && pave-nose && cd $deploy_path && fab "$name":refs/heads/master -i ~/.ssh/aws/tier1-2-keypair.pem
}

LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
  if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
    . $LUNCHY_DIR/lunchy-completion.zsh
  fi


