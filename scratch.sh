#!/bin/bash
# Wrapper script for screen

echo 'saving out screen vars from ~/scratch.sh'
if [ -n "$SSH_CLIENT" ]; then
  mkdir -p "$HOME/.screen"

  # Variables to save
  SSHVARS="SSH_CLIENT SSH_TTY SSH_AUTH_SOCK SSH_CONNECTION DISPLAY"

  for x in ${SSHVARS} ; do
    (eval echo $x=\$$x) | sed  's/=/="/
s/$/"/
s/^/export /'
  done 1> "$HOME/.screen/session-variables"
fi

#exec screen -d -R -A
