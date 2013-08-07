export MACOSX_DEPLOYMENT_TARGET=10.7
#export CFLAGS="-arch x86_64"
#export LDFLAGS="-arch x86_64 -Wall -undefined dynamic_lookup -bundle"
#export FFLAGS="-arch x86_64"
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"

plugins=(git, osx, tmux, mvn, npm, pip, sublime)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#export LANGUAGE=en_US.UTF-8

#export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:$PATH
export PATH=/Users/chang.wang/Servers/mysql/bin:/opt/python/bin:/usr/local/apache2/bin:/Users/chang.wang/Libraries/maven/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:$PATH
#export PS1="%~%# "

# switch JAVA home.
function jh() {
	if [ $1 -eq 7 ]; then
		export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
		echo "Switching to Java 1.7"
	elif [ $1 -eq 8 ]; then
		export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
		echo "Switching to Java 1.8"
	else
		echo "No Java home specified"
		exit;
	fi
}
export jh

# alias
alias untar="tar -xf"
alias ls="ls -lo"
alias cls="clear"
alias tx="tmux"
alias ipython="ipython qtconsole &"
alias mvim="mvim --remote-tab-silent"
alias vim="mvim"

# powerline-shell configuration

function powerline_precmd()
{
	export PS1="$(~/.zsh/powerline-shell/powerline-shell.py $? --shell zsh --cwd-only)"
}

function install_powerline_precmd()
{
	for s in "${precmd_function[@]}"; do
		if [ "$s" = "powerline_precmd" ]; then
			return
		fi
	done
	precmd_functions+=(powerline_precmd)
}

install_powerline_precmd

# start tmux immediately once zsh is started.
[[ -z "$TMUX" ]] && exec tmux

# disable auto correct, since there are a bunch of alias.
unsetopt correct
unsetopt correct_all

PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

