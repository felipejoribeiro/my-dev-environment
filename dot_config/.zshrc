# Path
if [[ "$(uname)" == "Darwin" ]]; then
  export PATH=/opt/homebrew/:$PATH
  export PATH=$HOME/.pyenv/shims:$PATH
else
  export GOPATH=$HOME/.go
  export PATH=$PATH:$GOPATH/bin
fi
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH
export PATH=$HOME/Library/Python/3.8/bin:$PATH
export PATH=/usr/local/include/X11:$PATH
export PATH=$HOME/.dotnet/tools:$PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"

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
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
source $ZSH/oh-my-zsh.sh

# Credentials
if [ -f $HOME/.credentials.sh ]; then
  source $HOME/.credentials.sh
  # source all files in .cred folder
  for file in $HOME/.cred/*.sh; do
    source $file
  done
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

# Flutter config
export CHROME_EXECUTABLE=/usr/bin/brave

# I want to use $@ for all arguments but they don't contain space for me
function flutter-watch(){
  if [ -z "$TMUX" ]; then
    echo "You need to be in a tmux session to use this command"
    return
  fi

  tmux send-keys "flutter run $1 $2 $3 $4 --pid-file=/tmp/tf1.pid" Enter \;\
  split-window -v \;\
  send-keys 'npx -y nodemon -e dart -x "cat /tmp/tf1.pid | xargs kill -s USR1"' Enter \;
}

function flutter-start(){
  tmux send-keys "flutter run $1 $2 $3 $4 --pid-file=/tmp/tf1.pid" Enter \;\
}

# android studio path
if [[ "$(uname)" == "Darwin" ]]; then
  export ANDROID_HOME=$HOME/library/Android/sdk
  export ANDROID_SDK_ROOT=$HOME/library/Android/sdk
else
  export ANDROID_HOME=/opt/android-sdk
  export ANDROID_SDK_ROOT=/opt/android-sdk

  # Emulator hotfix for linux
  export ANDROID_EMULATOR_PATH=$ANDROID_HOME/emulator
  function emulator {
    cd /opt/android-sdk/emulator;
    ./emulator "$@";
    cd - > /dev/null;
  }
fi

export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
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
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

if [[ "$(uname)" != "Darwin" ]]; then
  # pyenv
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# gnu utils for macos
function gnutils {
  for bindir in $(find /opt/homebrew/opt -type d -follow -name gnubin -print); do
    export PATH=$bindir:$PATH
    echo "Added $bindir to PATH"
  done;
}

# aditional credentials
if [ -f ~/.zshrc.credentials ]; then
  source ~/.zshrc.credentials
fi

if [[ "$(uname)" == "Darwin" ]]; then
  export DBUS_SESSION_BUS_ADDRESS='unix:path='$DBUS_LAUNCHD_SESSION_BUS_SOCKET
fi

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
