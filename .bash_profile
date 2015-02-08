# If id command returns zero, you’ve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\]"
else # normal
  PS1="\[\e[1;32m\]\u@\h:\w \[\e[0;33m\]$\[\e[0m\]"
fi

CLICOLOR="YES"; export CLICOLOR
LSCOLORS="ExGxFxdxCxDxDxhbadExEx"; export LSCOLORS

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
