BASE=`dirname "$0"`
shopt -s dotglob
for file in *
do
    if [ "$file" != "install.sh" ]; then
	ln -s .mydotfiles/"$file" ~/"$file"
    fi
done
