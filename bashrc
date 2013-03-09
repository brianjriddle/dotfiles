# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
export HISTFILESIZE=9000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
        ;;
    *)
        ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b ~/.DIR_COLORS`"
    alias ls='ls --color=auto'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


#less options - raw control characters and no termcap initilization
#defined here so we can use it as an alias for less and for PAGER
LESS='/usr/bin/less -XR'
###
#aliases
###
#long human readable ls output
alias ll='ls -lh'
#grep with colors :)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

alias less=$LESS

#ruby documentation on the command line in color
alias ri='/usr/bin/ri --format ansi'

#ack-grep replacement of grep
alias ack=ack-grep


#use LESS as pager
export PAGER=$LESS

# ruby options
export RUBYOPT=rubygems

# i use vim if at all possible.
export EDITOR=/usr/bin/vim
export PATH=$PATH:~/bin

alias ant='ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger" ANT_OPTS="-Dant.logger.defaults=$HOME/.antopts" ant'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
