#!/usr/bin/env zsh

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

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

cp ./zshrc ~/.zshrc

# 2. install vim pathogen
echo "***************** installing pathogen *****************"

mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors

curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# 3. install my vim config
echo "***************** installing vim configuration *****************"
cp ./vimrc ~/.vimrc

# 4. install all bundles
echo "***************** installing vim bundles *****************"
cd ~/.vim/bundle

# SearchComplete
git clone https://github.com/vim-scripts/SearchComplete.git
# ag.vim
git clone https://github.com/rking/ag.vim.git
# ctrlp.vim
git clone https://github.com/kien/ctrlp.vim.git
# delimitMate
git clone https://github.com/Raimondi/delimitMate.git
# emmet-vim
git clone https://github.com/mattn/emmet-vim.git
# goyo.vim
git clone https://github.com/junegunn/goyo.vim.git
# indentLine
git clone https://github.com/Yggdroot/indentLine.git
# matchit
git clone https://github.com/tmhedberg/matchit.git
# neocomplete.vim
git clone https://github.com/Shougo/neocomplete.vim.git
# nerdcommenter
git clone https://github.com/scrooloose/nerdcommenter.git
# python-syntax
git clone https://github.com/hdima/python-syntax.git
# rainbow_parentheses.vim
git clone https://github.com/kien/rainbow_parentheses.vim.git
# supertab
git clone https://github.com/ervandew/supertab.git
# syntastic
git clone https://github.com/scrooloose/syntastic.git
# tagbar
git clone https://github.com/majutsushi/tagbar.git
# tlib_vim
git clone https://github.com/tomtom/tlib_vim.git
# ultisnips
git clone https://github.com/SirVer/ultisnips.git
# vim-addon-mw-utils
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
# vim-airline
git clone https://github.com/bling/vim-airline.git
# vim-autoformat
git clone https://github.com/Chiel92/vim-autoformat.git
# vim-easymotion
git clone https://github.com/Lokaltog/vim-easymotion.git
# vim-flake8
git clone https://github.com/nvie/vim-flake8.git
# vim-fugitive
git clone https://github.com/tpope/vim-fugitive.git
# vim-mark
git clone https://github.com/Yggdroot/vim-mark.git
# vim-multiple-cursors
git clone https://github.com/terryma/vim-multiple-cursors.git
# vim-sensible
git clone https://github.com/tpope/vim-sensible.git
# vim-signify
git clone https://github.com/mhinz/vim-signify.git
# vim-sleuth
git clone https://github.com/tpope/vim-sleuth.git
# vim-snippets
git clone https://github.com/honza/vim-snippets.git
# vim-surround
git clone https://github.com/tpope/vim-surround.git

# 5 vim color theme
echo "***************** install vim color theme *****************"
cd /tmp

git clone https://github.com/noahfrederick/vim-hemisu.git
cd vim-hemisu/colors
cp hemisu.vim ~/.vim/colors

cd /tmp

