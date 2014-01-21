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

# 4.1 ag.vim
git clone https://github.com/rking/ag.vim.git

# 4.2 ctrlp.vim
git clone https://github.com/kien/ctrlp.vim.git

# 4.3 delimiteMath
git clone https://github.com/Raimondi/delimitMate.git

# 4.4 emmet-vim
git clone https://github.com/mattn/emmet-vim.git

# 4.5 indentLine
git clone https://github.com/Yggdroot/indentLine.git

# 4.6 nerdcommenter.vim
git clone https://github.com/scrooloose/nerdcommenter.git

# 4.7 nerdtree
git clone https://github.com/scrooloose/nerdtree.git

# 4.8 rainbow_parentheses.vim
git clone https://github.com/kien/rainbow_parentheses.vim.git

# 4.9 snipmate.vim
git clone https://github.com/ervandew/snipmate.vim.git

# 4.10 supertab
git clone https://github.com/ervandew/supertab.git

# 4.11 syntastic
git clone https://github.com/scrooloose/syntastic.git

# 4.12 tagbar
git clone https://github.com/majutsushi/tagbar.git

# 4.13 tlib_vim
git clone https://github.com/tomtom/tlib_vim.git

# 4.14 vim-addon-mw-utils
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git

# 4.15 vim-airline
git clone https://github.com/bling/vim-airline.git

# 4.16 vim-snipmate
git clone https://github.com/garbas/vim-snipmate.git

# 4.17 vim-surround
git clone https://github.com/tpope/vim-surround.git

# 4.18 vim auto format
git clone https://github.com/Chiel92/vim-autoformat.git

# 4.19 python vim-flake8
git clone https://github.com/nvie/vim-flake8.git

# 5 vim color theme
echo "***************** install vim color theme *****************"
cd /tmp

git clone https://github.com/noahfrederick/vim-hemisu.git
cd vim-hemisu/colors
cp hemisu.vim ~/.vim/colors

cd /tmp

