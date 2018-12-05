1) make sure there aren't overlapping files (eg. rename .bashrc and .profile in ~)
2) change directory into .mydotfiles
3) run ./install.sh
4) profit


git completion is indexed to the git --version ... currently 2.17.2 is Mojave and checked in 

visit https://github.com/git/git/blob/v2.17.2/contrib/completion/git-completion.bash and adjust tag to version as appropriate, then
grab the RAW url and curl <url> > .git-completion to update.
