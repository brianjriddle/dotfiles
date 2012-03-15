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
plugins=(ant brew bundler git rails3)

source $ZSH/oh-my-zsh.sh
export LC_CTYPE=en_US.UTF-8

# Customize to your needs...
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/System/Library/Frameworks/JavaVM.framework/Home/Command:$HOME/work/apps/ant/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:$HOME/.rvm/bin
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
fi
