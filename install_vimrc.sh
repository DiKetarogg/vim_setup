#!/bin/bash
if [ -f ~/.vimrc -o -d ~/.vimrc ]; then
	printf "\e[33;1m[Warning]\e[0m: .vimrc exists."
	declare -i i
	i=0
	newfile="$HOME/old.vimrc($i)"
	while [ -f $newfile -o -d $newfile ]; do
		i+=1
		newfile="$HOME/old.vimrc($i)"
	done
	mv "$HOME/.vimrc" "$newfile"
	echo "Old .vimrc saved to $newfile"
fi

touch ~/.vimrc

echo "set nu" > ~/.vimrc
echo "set smartindent" >> ~/.vimrc
