#!/bin/sh

# checkout my configuration repo
cd /tmp
git clone https://github.com/changwang/Configfiles.git

# install my vim config and bundles
cd Configfiles

# 1. config shell
echo "***************** configuring shell *****************"

# 1.1 change default shell to zsh (this may ask password)
chsh -s $(which zsh)

# 1.2 install prezto
cd ~
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# 1.3 go back to my config dir, and copy my zsh config file
cd -
cp ./zshrc ~/.zshrc

# 2. install vim pathogen
echo "***************** installing pathogen *****************"

mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors

curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# 3. install my vim config
echo "***************** installing vim configuration *****************"
cp ./vimrc ~/.vimrc

# 4. install all bundles
echo "***************** installing vim bundles *****************"
cd ~/.vim/bundle

# SearchComplete
  Fetch URL: https://github.com/vim-scripts/SearchComplete.git
# ag.vim
  Fetch URL: https://github.com/rking/ag.vim.git
# ctrlp.vim
  Fetch URL: https://github.com/kien/ctrlp.vim.git
# delimitMate
  Fetch URL: https://github.com/Raimondi/delimitMate.git
# emmet-vim
  Fetch URL: https://github.com/mattn/emmet-vim.git
# goyo.vim
  Fetch URL: https://github.com/junegunn/goyo.vim.git
# indentLine
  Fetch URL: https://github.com/Yggdroot/indentLine.git
# matchit
  Fetch URL: https://github.com/tmhedberg/matchit.git
# neocomplete.vim
  Fetch URL: https://github.com/Shougo/neocomplete.vim.git
# nerdcommenter
  Fetch URL: https://github.com/scrooloose/nerdcommenter.git
# python-syntax
  Fetch URL: https://github.com/hdima/python-syntax.git
# rainbow_parentheses.vim
  Fetch URL: https://github.com/kien/rainbow_parentheses.vim.git
# supertab
  Fetch URL: https://github.com/ervandew/supertab.git
# syntastic
  Fetch URL: https://github.com/scrooloose/syntastic.git
# tagbar
  Fetch URL: https://github.com/majutsushi/tagbar.git
# tlib_vim
  Fetch URL: https://github.com/tomtom/tlib_vim.git
# ultisnips
  Fetch URL: https://github.com/SirVer/ultisnips.git
# vim-addon-mw-utils
  Fetch URL: https://github.com/MarcWeber/vim-addon-mw-utils.git
# vim-airline
  Fetch URL: https://github.com/bling/vim-airline.git
# vim-autoformat
  Fetch URL: https://github.com/Chiel92/vim-autoformat.git
# vim-easymotion
  Fetch URL: https://github.com/Lokaltog/vim-easymotion.git
# vim-flake8
  Fetch URL: https://github.com/nvie/vim-flake8.git
# vim-fugitive
  Fetch URL: https://github.com/tpope/vim-fugitive.git
# vim-mark
  Fetch URL: https://github.com/Yggdroot/vim-mark.git
# vim-multiple-cursors
  Fetch URL: https://github.com/terryma/vim-multiple-cursors.git
# vim-sensible
  Fetch URL: https://github.com/tpope/vim-sensible.git
# vim-signify
  Fetch URL: https://github.com/mhinz/vim-signify.git
# vim-sleuth
  Fetch URL: https://github.com/tpope/vim-sleuth.git
# vim-snippets
  Fetch URL: https://github.com/honza/vim-snippets.git
# vim-surround
  Fetch URL: https://github.com/tpope/vim-surround.git

# 5 vim color theme
echo "***************** install vim color theme *****************"
cd /tmp

git clone https://github.com/noahfrederick/vim-hemisu.git
cd vim-hemisu/colors
cp hemisu.vim ~/.vim/colors

cd /tmp

