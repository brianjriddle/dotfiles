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
plugins=(git sdk ssh-agent)

# Customize to your needs...
if [ -f $HOME/.zshrc-local ]; then
    source $HOME/.zshrc-local
fi

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:$HOME/bin

#set up zsh variables
setopt RM_STAR_SILENT
unsetopt correct_all
unsetopt auto_name_dirs
unsetopt nomatch
export LC_ALL=en_US.UTF-8

if [ -f /usr/bin/xdg-open ]; then
    alias open=/usr/bin/xdg-open
fi

#mac specific settings
if [[ "Darwin" == `uname -s` ]]; then
    #remove LSCOLORS and GREP_COLOR so solarized and iterm are readable
    unset LSCOLORS
    unset GREP_COLOR
    #check homebrew coreutils are installed
    if [[ -f /usr/local/bin/gls ]]; then
        eval "`gdircolors -b ~/.DIR_COLORS`"
        alias ls="gls --color=auto"
    fi
    if [[ -d /usr/local/Cellar/android-sdk/$ANDROID_SDK_VERSION ]]; then
        export ANDROID_SDK=/usr/local/Cellar/android-sdk/$ANDROID_SDK_VERSION
    fi
elif [[ "Linux" == `uname -s` ]]; then
	if [[ $TERM == "xterm" ]]; then
		export TERM=xterm-256color
	elif [[ $TERM == "tmux" ]]; then
		export TERM=screen-256color
	fi
    if [[ "$TERM" != "dumb" ]] && [[ -x /usr/bin/dircolors ]]; then
        eval "`dircolors -b ~/.DIR_COLORS`"
        alias ls='ls --color=auto'
    fi
    if [[ ! -z "$DISPLAY" ]]; then
        zsh $HOME/.xinitrc
    fi
fi

export EDITOR=vim
export LESS="-FRX"
export GPG_TTY=$(tty)
#set up aliases
alias ant='ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger" ANT_OPTS="-Dant.logger.defaults=$HOME/.antopts" ant'
alias gsb="git status -s -b"
alias less="less $LESS"
alias more=less
alias tmux="tmux -2"
alias vi=$EDITOR
alias vim=$EDITOR
alias gll='git log --decorate --graph --date=short --format="%C(auto)%h%C(reset) %C(green)%ar%C(reset) %C(blue)(%an)%C(reset) %C(auto)%d%C(reset) - %s"'
alias gnm='git log --decorate --graph --no-merges --date=short --format="%C(auto)%h%C(reset) %C(green)%ar%C(reset) %C(blue)(%an)%C(reset) %C(auto)%d%C(reset) - %s"'

#initialize rbenv
if [[ -f $HOME/.rbenv/bin/rbenv ]]; then
	eval "$($HOME/.rbenv/bin/rbenv init -)"
elif [[ -f /usr/local/bin/rbenv ]]; then
	eval "$(/usr/local/bin/rbenv init -)"
elif [[ -f /opt/homebrew/bin/rbenv ]]; then
	eval "$(/opt/homebrew/bin/rbenv init -)"
fi

# Add my precmd hook
function brris_precmd_hook {
    local bar=""
    local separator="-"
    local i=0;
    for ((i = 0; i < ${COLUMNS}; i++)) ; do
        bar="${bar}${separator}"
    done
    echo $fg_bold[yellow]${bar}
}

[[ -z $precmd_functions ]] && precmd_functions=()

precmd_functions=($precmd_functions brris_precmd_hook)
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/Users/bririd/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/bririd/.sdkman/bin/sdkman-init.sh"

