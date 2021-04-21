#!/bin/bash
mkdir -p ~/.vim/pack/vendor/start

nothing() {
	echo 'I do nothing'
}

git clone --depth 1 \
	https://github.com/preservim/nerdtree.git \
	~/.vim/pack/vendor/start/nerdtree



if [ -f ~/.vimrc -o -d ~/.vimrc ]; then
	echo "[ERROR]: .vimrc exists."
	declare -i i
	i=0
	newfile="$HOME/old.vimrc($i)"
	while [ -f $newfile -o -d $newfile ]; do
		i+=1
		newfile="$HOME/old.vimrc($i)"
	done
	mv "$HOME/.vimrc" "$newfile"
fi

touch ~/.vimrc
echo "au BufRead,BufNewFile *.scs set filetype=scs" > ~/.vimrc



mkdir -p ~/.vim/ftdetect

if [ ! -f ~/.vim/ftdetect/scs.vim -a ! -d ~/.vim/ftdetect/scs.vim ]; then
	touch ~/.vim/ftdetect/scs.vim
	echo "au BufRead,BufNewFile *.scs set filetype=scs" > ~/.vim/ftdetect/scs.vim
fi
if [ ! -f ~/.vim/syntax/scs.vim -a ! -d ~/.vim/syntax/scs.vim ]; then
	mkdir -p ~/.vim/syntax
	cp scs.vim ~/.vim/syntax/scs.vim
fi
















