# Path
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH
export PATH=$HOME/Library/Python/3.8/bin:$PATH
export PATH=/usr/local/include/X11:$PATH
export PATH=$HOME/.dotnet/tools:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Your theme
ZSH_THEME="gozilla"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

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
		zsh-history-substring-search
	)

# Some sources
source $ZSH/oh-my-zsh.sh

# Rapid paste in terminal
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# configurations of plugins
bindkey '^f' autosuggest-accept
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down
ZSH_AUTOSUGGEST_STRATEGY=history
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=#2f2f2f,fg=#fff'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=none,fg=#fff'

# Preferred configurations for local and remote sessions
export TERMINAL='kitty'
export TERM='xterm-256color'
export EDITOR='nvim'
export SUDO_EDITOR='nvim'

# android studio path
export ANDROID_SDK_ROOT=$HOME/.Android/Sdk
export ANDROID_HOME=$HOME/.Android/Sdk
# export ANDROID_SDK_ROOT=$HOME/library/Android/sdk
# export ANDROID_HOME=$HOME/library/Android/sdk
# export ANDROID_HOME=/opt/android-sdk

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# aliases
alias pi36='source ~/.virtualenvs/3_6_flask_app/bin/activate'
alias gojo='TERM=xterm-256color ssh root@felipejoribeiro.com'
alias ran='ranger --choosedir="$HOME/.rangerdir"; cd $( cat $HOME/.rangerdir );clear'
alias ls='exa'
alias vim='nvim'
alias SET='export'

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/vault vault

# NVM setup in zsh
source /usr/share/nvm/init-nvm.sh --no-use
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  declare -a __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi
