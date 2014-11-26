BASE=`dirname "$0"`
shopt -s dotglob
for file in *
do
    # need to ignore .git as well
    if [ "$file" != "install.sh" ] && [ "$file" != ".git" ]; then
	ln -s .mydotfiles/"$file" ~/"$file"
    fi
done
