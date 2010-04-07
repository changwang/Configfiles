export LANG=en_US.UTF-8

export CLICOLOR="xterm-256color"
# export TERM="xterm-256color"
# Turn on some options
setopt auto_cd
setopt extended_glob
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE
# Set some variables.
# Use 1000 history lines internally, save all of them
# to the file ~/.history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

alias ..='cd ..'
alias ...='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias work='cd ~/workspace'
alias lib='cd ~/opensource'
alias ll='ls -l'
alias la='ls -a'
alias pu=pushd
alias hu='hg pull -u'
alias untar='tar xzf'
alias gp='git pull'
alias bu='bzr update'


autoload -U compinit
compinit

export PATH=/opt/python/bin:/opt/ruby/bin:/opt/pgsql/bin:/usr/local/bin:/usr/local/sbin:/Users/changwang/opensource/google_appengine:/Users/changwang/opensource/play:$PATH

export PS1="%~%# "

export DJANGO_COLORS='dark'

if [[ -s /Users/changwang/.rvm/scripts/rvm ]] ; then source /Users/changwang/.rvm/scripts/rvm ; fi

