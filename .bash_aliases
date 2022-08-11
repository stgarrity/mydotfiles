# bash aliases (separated for ease of modification)
alias ll='ls -al'
alias ..='cd ..'
alias vi='vim'

# these ensure that SSH key forwarding works through screen
if [ -e ~/.screen/session-variables ]; then
  alias ssh='source ~/.screen/session-variables; ssh'
fi

if [ -e ~/scratch.sh ]; then
  alias screen='./scratch.sh; screen'
fi

# Fetch and ReBase
alias frb='rc=`git stash` && if [ `git remote show | wc -l | sed "s/ //g"` == "1" ]; then rem=`git remote show`; else rem="origin"; fi; git fetch $rem && git rebase $rem/master && if [ "$rc" != "No local changes to save" ]; then git stash pop; fi;'

# Interactive ReBase
alias irb='git rebase -i origin/master'

# bypass our checks for speed
alias wip='git add . && touch bypass_lint && git commit -m "WIP"'
alias pushwip='touch bypass_lint && touch bypass_fixme && touch bypass_config && touch bypass_tests && touch bypass_gen && git push -f origin `git rev-parse --abbrev-ref HEAD`'
alias bypass_all='touch bypass_lint && touch bypass_fixme && touch bypass_config && touch bypass_tests && touch bypass_gen'

# postfix with -b [branch] to change base
# this makes some assumptions about upstream being named origin but that should be it
export REVIEWER=v-fedorov-gh

# Create Pull Request
alias cpr='BRANCH=$(git log --format=format:"%D" origin/master..HEAD | grep -v HEAD | grep -v "^$" | tr '"'"','"'"' '"'"'\n\'"'"'  | grep -v origin | grep -v tag); if [ "$BRANCH" != "" ]; then hub pull-request -r $REVIEWER -b $BRANCH && echo "created nested PR to branch $BRANCH"; else hub pull-request -r $REVIEWER; fi'

# open a list of filenames from a grep result
# should probably assert !! (actually fc -ln -1 because !! expansion happens too early) includes grep :)
alias openfiles='fc=$(fc -ln -1); f=`eval $fc | grep ":" | sed -E "s/([^:]*):.*/\1/" | xargs`; code -n $f'

# ding the window bell (sound / notify / badge depending on system config) when this runs. 
# useful for eg. `make deploy-staging && notify`
alias notify='osascript -e '"'"'display notification "Command is done running" with title "Done!"'"'"'; tput bel'

# ego script one night ... don't bother :)
alias productivity='git log -p --since=yesterday --author=Steve>tmp;P=`grep ^+[^+] tmp|wc -l`;M=`grep ^-[^-] tmp|wc -l`; echo $P-.5*$M|bc;rm tmp'
