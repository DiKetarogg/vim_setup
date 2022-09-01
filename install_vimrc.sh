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
	echo " Old .vimrc saved to $newfile"
fi

touch ~/.vimrc

echo \
"colorscheme torte
set nu
set smartindent
set showcmd
let g:USER='jzoltan'
let g:MAIL='jzoltan@student.42.fr'
:command -nargs=1 Tab :set tabstop=<args> shiftwidth=<args>
:Tab4
:command -nargs=0 ClearSpace :%s/[\ \t\r\v]\+$//g

nnoremap t \"_dd
nnoremap T \"_D
vnoremap t \"_d
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=" > ~/.vimrc

#echo "set nu" > ~/.vimrc
#echo "set smartindent" >> ~/.vimrc
