#!/bin/bash
FORCE=$1
mkdir -p ~/.vim/pack/vendor/start


nothing() {
	echo 'I do nothing'
}

git clone --depth 1 \
	https://github.com/preservim/nerdtree.git \
	~/.vim/pack/vendor/start/nerdtree



if [ -f ~/.vimrc -o -d ~/.vimrc ]; then
	echo "[Warning]: .vimrc exists."
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
echo "set smartindent" > ~/.vimrc



mkdir -p ~/.vim/ftdetect
if [ $FORCE = "force" ]; then
	echo "Force. Old files will be deleted if exist."
	rm ~/.vim/ftdetect/scs.vim
	rm ~/.vim/syntax/scs.vim
	echo "au BufRead,BufNewFile *.scs set filetype=scs" > ~/.vim/ftdetect/scs.vim
	cp scs.vim ~/.vim/syntax/scs.vim
else #force

if [ ! -f ~/.vim/ftdetect/scs.vim -a ! -d ~/.vim/ftdetect/scs.vim ]; then
	touch ~/.vim/ftdetect/scs.vim
	echo "au BufRead,BufNewFile *.scs set filetype=scs" > ~/.vim/ftdetect/scs.vim
else
	echo "[Warning] ftdetect file already exists. Skipping."
fi
if [ ! -f ~/.vim/syntax/scs.vim -a ! -d ~/.vim/syntax/scs.vim ]; then
	mkdir -p ~/.vim/syntax
	cp scs.vim ~/.vim/syntax/scs.vim
else
	echo '[Warning] syntax file already exists. Skipping.'
fi

fi #force













