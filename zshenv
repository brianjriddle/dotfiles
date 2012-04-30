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
    export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
    export CC=/usr/bin/gcc-4.2
    #remove LSCOLORS and GREP_COLOR so solarized and iterm are readable
    unset LSCOLORS
    unset GREP_COLOR
    export JAVA_HOME=$(/usr/libexec/java_home)
    #check homebrew coreutils are installed
    if [[ -f /usr/local/bin/gls ]]; then
        eval "`gdircolors -b ~/.DIR_COLORS`"
        alias ls="gls --color=auto"
    fi
else
    export EDITOR=vim
fi

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/work/apps/ant/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:$HOME/.rvm/bin:$JAVA_HOME/bin:$PATH
export ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger"
export ANT_OPTS="-Dant.logger.defaults=$HOME/.antopts"

#set up aliases
alias less='less -XR'
alias more=less
alias vi=$EDITOR
alias vim=$EDITOR

#add rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
