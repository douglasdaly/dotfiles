# Shortcuts
alias reload="source ~/.bashrc"

# - Add an "alert" alias for long running commands.  Use like so:
#     sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Default options

alias rsync="rsync -vh"
alias json="json -c"
alias psgrep="psgrep -i"

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Easier directory traversal
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"

# Overwrite vim
alias vim="nvim"
