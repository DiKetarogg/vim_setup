#!/bin/bash
FORCE=$1

mkdir -p ~/.vim/after/plugin
if [[ $FORCE = "force" ]]; then
	printf "\e[36;1m[Force]\e[0m: Old files will be deleted if exist.\n"
	rm ~/.vim/after/plugin/42header.vim
	cp 42header/42header.vim ~/.vim/after/plugin/42header.vim
else #force

if [ ! -f ~/.vim/after/plugin/42header.vim -a ! -d ~/.vim/after/plugin/42header.vim ]; then
	cp 42header/42header.vim ~/.vim/after/plugin/42header.vim
else
	printf "\e[33;1m[Warning]\e[0m: 42header.vim file already exists. Skipping. Use force to replace.\n"
fi

fi #force
