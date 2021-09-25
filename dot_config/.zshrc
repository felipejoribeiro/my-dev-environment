# Path
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/fejori/.oh-my-zsh"

# Your theme
ZSH_THEME="gozilla"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# History style
HIST_STAMPS="mm/dd/yyyy"

# Plugins
plugins=(
		npm
		git
		vi-mode
		z
		zsh-autosuggestions
		zsh-syntax-highlighting
		web-search
	)

# Some sources
source $ZSH/oh-my-zsh.sh
source ~/.cred/*

# configurations of plugins
bindkey '^f' autosuggest-accept

# Preferred configurations for local and remote sessions
export TERMINAL='kitty'
export TERM='xterm-256color'
export EDITOR='nvim'
export SUDO_EDITOR='nvim'

# aliases
alias pi36='source ~/.virtualenvs/3_6_flask_app/bin/activate'
alias gojo='TERM=xterm-256color ssh root@felipejoribeiro.com'
alias ran='ranger --choosedir="$HOME/.rangerdir"; cd $( cat $HOME/.rangerdir );clear'
alias ls='exa'
alias vim='nvim'
