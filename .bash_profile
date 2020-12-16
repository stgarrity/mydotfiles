# called for all terminals on OSX

# hide the catalina+ zsh reminder :)
export BASH_SILENCE_DEPRECATION_WARNING=1

# up the soft file descriptor limit from 256!
ulimit -S -n 4096

# this seems to be the mac version, linux is in .bashrc and under /etc/bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# run our .mydotfiles sync check on mac as well
source ~/.profile

# for local mac development
test -e /usr/local/opt/postgresql@9.6/bin && export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# for iterm2 on mac
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# to auto-activate pyenv during virtualenv usage
# https://github.com/pyenv/pyenv-virtualenv
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
