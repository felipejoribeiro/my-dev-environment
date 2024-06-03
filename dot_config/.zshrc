# Path
if [[ "$(uname)" == "Darwin" ]]; then
  export PATH=/opt/homebrew/:$PATH
  export PATH=$HOME/.pyenv/shims:$PATH
fi
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH
export PATH=$HOME/Library/Python/3.8/bin:$PATH
export PATH=/usr/local/include/X11:$PATH
export PATH=$HOME/.dotnet/tools:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Your theme
ZSH_THEME="af-magic"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# History style
HIST_STAMPS="mm/dd/yyyy"

if [[ "$(uname)" == "Darwin" ]]; then
  # Assuring locale
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8

  # nvm
  export NVM_LAZY_LOAD=true
  export NVM_DIR="$HOME/.nvm"

  # ruby
  eval "$(rbenv init - zsh)"
fi

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
    zsh-nvm
	)

# Some sources
source $ZSH/oh-my-zsh.sh

# Credentials
if [ -f $HOME/.credentials.sh ]; then
  source $HOME/.credentials.sh
  source $HOME/.cred/dustdune.sh
fi

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
# export TERMINAL='kitty'
# export TERM='xterm-256color'
export EDITOR='nvim'
export SUDO_EDITOR='nvim'

# SSH
if [[ "$(uname)" != "Darwin" ]]; then
  export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
  export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
fi

# android studio path
if [[ "$(uname)" == "Darwin" ]]; then
  export ANDROID_SDK_ROOT=$HOME/library/Android/sdk
  export ANDROID_HOME=$HOME/library/Android/sdk
else
  export ANDROID_SDK_ROOT=$HOME/.Android/Sdk
  export ANDROID_HOME=$HOME/.Android/Sdk
fi

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# aliases
alias pi36='source ~/.virtualenvs/3_6_flask_app/bin/activate'
alias ran='ranger --choosedir="$HOME/.rangerdir"; cd $( cat $HOME/.rangerdir );clear'
alias vim='nvim'
alias SET='export'
alias ls='eza'
alias l='eza -l --icons --git -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias newsed='export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"'
alias inkscape='sudo -u $USER inkscape'
alias dust='ssh feliperibeiro.ufu@34.29.124.243'
alias gosisser='ssh ubuntu@iot.snackin.co'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# gnu utils for macos
function gnutils {
  for bindir in $(find /opt/homebrew/opt -type d -follow -name gnubin -print); do
    export PATH=$bindir:$PATH
    echo "Added $bindir to PATH"
  done;
}

export DBUS_SESSION_BUS_ADDRESS='unix:path='$DBUS_LAUNCHD_SESSION_BUS_SOCKET

# aditional credentials
if [ -f ~/.zshrc.credentials ]; then
  source ~/.zshrc.credentials
fi

export DBUS_SESSION_BUS_ADDRESS='unix:path='$DBUS_LAUNCHD_SESSION_BUS_SOCKET

# aditional credentials
source ~/.zshrc.credentials

# NVM setup in zsh
# source /usr/share/nvm/init-nvm.sh --no-use
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if [[ "$(uname)" != "Darwin" ]]; then
  source /usr/share/nvm/init-nvm.sh --no-use
fi

# make node command silently
node --version >> /dev/null
# nvm use default --silent -no-use
