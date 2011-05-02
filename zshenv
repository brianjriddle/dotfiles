export EDITOR="/usr/local/bin/mvim -f"
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$JAVA_HOME/bin:~/work/apps/ant/bin:$PATH
export ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger"
export ANT_OPTS="-Dant.logger.defaults=$HOME/.antopts"
setopt RM_STAR_SILENT
unsetopt correct_all
unsetopt auto_name_dirs
#add rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
