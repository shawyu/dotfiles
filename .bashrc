# Bash command-line aliases to make life easier
alias lsl='ls -lp'
alias lsa='ls -Alp'
alias lsal='ls -Alp'
alias lss='ls'
alias ls='ls -p'
alias reload='source ~/.bash_profile'
# Make history search more useful
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
# Ignore case in tab completion
bind 'set completion-ignore-case on'
# Only need 1 tab when there is >1 match
bind 'set show-all-if-ambiguous on'

# Append to the history file, don't overwrite it
shopt -s histappend
# Check the window size after each command and update value of LINES and
# COLUMNS, if necessary
shopt -s checkwinsize
# Enable programmatic completion features
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Add machine specific paths if paths file exists
if [ -f ~/.paths ]; then
  source ~/.paths
fi

# Add machine specific bash config if file exists
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi
