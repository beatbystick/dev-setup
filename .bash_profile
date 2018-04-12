#source "/usr/local/etc/bash_completion.d/git-completion.bash"
#source "/usr/local/etc/bash_completion.d/git-prompt.sh"

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"


PS1="\[$RED\]\u\[$GREEN\]\[$GREEN\]\w\[\033[m\]\[$CYAN\]\$(__git_ps1)\[$WHITE\]\$ "

