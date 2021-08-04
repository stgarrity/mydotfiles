pushd ~/.mydotfiles > /dev/null

# sync git with a 4-second timeout
(git fetch origin) & pid=$!
(sleep 4 && kill -HUP $pid) 2> /dev/null & watcher=$!
wait $pid 2>/dev/null && pkill -HUP -P $watcher

REMOTE_HEAD=`git show --format="%H" origin master`
LOCAL_HEAD=`git show --format="%H"`
if [ "$REMOTE_HEAD" != "$LOCAL_HEAD" ]; then
    echo '.mydotfiles has changed upstream!'
else
    echo '.mydotfiles did not change'
fi

popd > /dev/null

# set up homebrew path before .bashrc so direnv bin is found
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# source .bashrc because on OSX, interactive shells don't get it
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
