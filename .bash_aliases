# bash aliases (separated for ease of modification)
alias ll='ls -al'
alias ..='cd ..'
alias vi='vim'

alias f='pushd ~/projects/HearsayLabs/fanmgmt'
alias dev='pushd ~/projects/HearsayLabs/dev/sgarrity'

alias apache_restart='sudo /etc/init.d/apache2 restart'

if [ -e ~/.screen/session-variables ]; then
  alias ssh='source ~/.screen/session-variables; ssh'
fi

if [ -e ~/scratch.sh ]; then
  alias screen='./scratch.sh; screen'
fi

alias frb='rc=`git stash` && git fetch upstream && git rebase upstream/master && if [ "$rc" != "No local changes to save" ]; then git stash pop; fi;'

alias productivity='git log -p --since=yesterday --author=Steve>tmp;P=`grep ^+[^+] tmp|wc -l`;M=`grep ^-[^-] tmp|wc -l`; echo $P-.5*$M|bc;rm tmp'
