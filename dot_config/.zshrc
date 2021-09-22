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

source $ZSH/oh-my-zsh.sh

# configurations of plugins
bindkey '^l' autosuggest-accept

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# aliases
alias ls="exa"
alias vim="nvim"
