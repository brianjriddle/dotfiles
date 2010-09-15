export RUBYOPT=rubygems
export EDITOR=/usr/bin/vim
export JAVA_HOME=/usr/lib/jvm/java-6-sun
export JDK_HOME=$JAVA_HOME
export PATH=$JAVA_HOME/bin:$PATH:~/jruby/jruby/bin:~/work/apps/ant/bin
export TZ=`cat /etc/timezone`
export ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger"
export ANT_OPTS="-Dant.logger.defaults=$HOME/.antopts"
alias ack='ack-grep'
setopt RM_STAR_SILENT
