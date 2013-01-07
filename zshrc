# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
export RPROMPT='[%*]'

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ant brew bundler git gpg-agent heroku rails3 ssh-agent)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#set up zsh variables
setopt RM_STAR_SILENT
unsetopt correct_all
unsetopt auto_name_dirs
export LC_CTYPE=en_US.UTF-8

if [ -f /usr/bin/xdg-open ]; then
    alias open=/usr/bin/xdg-open
fi

#mac specific settings

if [[ "Darwin" == `uname -s` ]]; then
    if [[ "12.2.0" != `uname -r` ]]; then
        export EDITOR="$HOME/Applications/MacVim.app/Contents/MacOS/Vim"
    else
        EDITOR=vim
    fi
    #remove LSCOLORS and GREP_COLOR so solarized and iterm are readable
    unset LSCOLORS
    unset GREP_COLOR
    export JAVA_HOME=$(/usr/libexec/java_home)
    #check homebrew coreutils are installed
    if [[ -f /usr/local/bin/gls ]]; then
        eval "`gdircolors -b ~/.DIR_COLORS`"
        alias ls="gls --color=auto"
    fi
    #add grc integration
    source /usr/local/etc/grc.bashrc
elif [[ "Linux" == `uname -s` ]]; then
    export TERM=screen-256color
    export EDITOR=vim
    if [[ "$TERM" != "dumb" ]] && [[ -x /usr/bin/dircolors ]]; then
        eval "`dircolors -b ~/.DIR_COLORS`"
        alias ls='ls --color=auto'
    fi
    if [[ ! -z "$DISPLAY" ]]; then
        zsh $HOME/.xinitrc
    fi
    #add grc integration
    source /etc/grc.conf
else
    export EDITOR=vim
fi

export ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger"
export ANT_OPTS="-Dant.logger.defaults=$HOME/.antopts"

export GPG_TTY=$(tty)
#set up aliases
alias gsb="git status -s -b"
alias less="less -XR"
alias more=less
alias tmux="tmux -2"
alias vi=$EDITOR
alias vim=$EDITOR

#add grc integration
source /usr/local/etc/grc.bashrc
