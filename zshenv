export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
#set up vim
if [[ "Darwin" == `uname -s` ]]; then
    export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
    export CC=/usr/bin/gcc-4.2
else
    export EDITOR=vim
fi
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$JAVA_HOME/Command:~/work/apps/ant/bin:$PATH
export ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger"
export ANT_OPTS="-Dant.logger.defaults=$HOME/.antopts"

#set up aliases
alias less='less -XR'
alias more=less
alias vi=$EDITOR
alias vim=$EDITOR

#set up zsh variables
setopt RM_STAR_SILENT
unsetopt correct_all
unsetopt auto_name_dirs
#add rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
