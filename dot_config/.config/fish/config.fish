# Configurations of fish

# Add bin to path
# fish_add_path $HOME/.local/bin
fish_add_path /home/fejori/.local/share/gem/ruby/3.0.0/bin

# Some general config
set fish_greeting         # Turn off the intro message
set TERM "xterm-256color" # Set the terminal type
set TERMINAL "kitty"      # My terminal
set EDITOR "nvim"          # Set nvim as editor
set VISUAL "nvim"          # Set nvim as editor
set SUDO_EDITOR "nvim"          # Set nvim as editor

# Get rid of the right prompot with time
function fish_right_prompt -d "Write out the right prompt"
end

# Abreviations
abbr atmux 'tmux attach'
abbr cl 'clear'
abbr ls 'exa'
abbr shutdown 'shutdown now'
abbr vi 'nvim'
abbr vim 'nvim'

# Aliases
alias gonew="TERM=xterm-256color ssh root@felipejoribeiro.com"
alias ran='ranger --choosedir="$HOME/.rangerdir"; cd (cat $HOME/.rangerdir);clear'

# Source bashrc
source ~/.cred/*
