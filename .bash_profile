# If id command returns zero, you’ve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\[\e[1;31m\][\u@\h \T] \w \[\e[0;33m\]\$\[\e[0m\]"
else # normal
  PS1="\[\e[0;32m\][\u@\h \T] \w \[\e[0;33m\]\$\[\e[0m\]"
fi

CLICOLOR="YES"; export CLICOLOR
LSCOLORS="ExGxFxdxCxDxDxhbadExEx"; export LSCOLORS

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
