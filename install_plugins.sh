#!/bin/bash

mkdir -p ~/.vim/pack/vendor/start

git clone --depth 1 \
	https://github.com/preservim/nerdtree.git \
	~/.vim/pack/vendor/start/nerdtree

git clone --depth=1 https://github.com/bfrg/vim-cpp-modern ~/.vim/pack/git-plugins/start

