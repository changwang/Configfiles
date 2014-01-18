#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GOROOT=/usr/local/go
export GOPATH=/Users/chang/workspace/goworkspace

export PATH=/Users/chang/Libs/mongodb/bin:$GOROOT/bin:/Users/chang/Libs/maven/bin:/Users/chang/Libs/pypy/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/opt/local/bin:$PATH

# alias
alias untar="tar -xf"
alias ls="ls -loG"
alias cls="clear"
alias tx="tmux"
# alias mvim="mvim --remote-tab-silent"
alias vim="mvim"
alias mongod="mongod --dbpath=/Users/chang/Libs/mongodb/data"

# disable auto correct, since there are a bunch of alias.
unsetopt correct
unsetopt correct_all

PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
