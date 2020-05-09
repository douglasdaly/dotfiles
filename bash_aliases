# Shortcuts

alias reload="source ~/.bashrc"


# Default options

alias rsync="rsync -vh"
alias json="json -c"
alias psgrep="psgrep -i"


# Directory listing/traversal

# LS_COLORS=$(is-supported "ls --color" --color -G)
# LS_GROUPDIRSFIRST=$(is-supported "ls --group-directories-first" --group-directories-first)

# alias l="ls -lahA $LS_COLORS $LS_GROUPDIRSFIRST"
alias l="ls -lahA"

# unset LS_COLORS LS_GROUPDIRSFIRST

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"

# Overwrite vim
alias vim="nvim"

