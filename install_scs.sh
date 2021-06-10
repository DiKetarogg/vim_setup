#!/bin/bash
FORCE=$1

mkdir -p ~/.vim/ftdetect
if [[ $FORCE = "force" ]]; then
	printf "\e[36;1m[Force]\e[0m: Old files will be deleted if exist.\n"
	rm ~/.vim/ftdetect/scs.vim
	rm ~/.vim/syntax/scs.vim
	rm ~/.vim/indent/scs.vim
	echo "au BufRead,BufNewFile *.scs set filetype=scs" > ~/.vim/ftdetect/scs.vim
	cp scs/syntax.vim ~/.vim/syntax/scs.vim
	cp scs/indent.vim ~/.vim/indent/scs.vim
else #force

if [ ! -f ~/.vim/ftdetect/scs.vim -a ! -d ~/.vim/ftdetect/scs.vim ]; then
	touch ~/.vim/ftdetect/scs.vim
	echo "au BufRead,BufNewFile *.scs set filetype=scs" > ~/.vim/ftdetect/scs.vim
else
	printf "\e[33;1m[Warning]\e[0m: ftdetect file already exists. Skipping. Use force to replace.\n"
fi
if [ ! -f ~/.vim/syntax/scs.vim -a ! -d ~/.vim/syntax/scs.vim ]; then
	mkdir -p ~/.vim/syntax
	cp scs/syntax.vim ~/.vim/syntax/scs.vim
else
	printf "\e[33;1m[Warning]\e[0m: syntax file already exists. Skipping. Use force to replace.\n"
fi
if [ ! -f ~/.vim/indent/scs.vim -a ! -d ~/.vim/indent/scs.vim ]; then
	mkdir -p ~/.vim/indent
	cp scs/indent.vim ~/.vim/indent/scs.vim
else
	printf "\e[33;1m[Warning]\e[0m: indent file already exists. Skipping. Use force to replace.\n"
fi

fi #force


