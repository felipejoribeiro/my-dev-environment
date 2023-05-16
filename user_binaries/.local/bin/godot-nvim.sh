#!/bin/bash
# Create symlink from nvim to nvim-godot in a place that is in your $PATH
# like with the command below:
# ln -s /usr/bin/nvim /usr/bin/nvim-godot

## echo all env variables
[ -n "$1" ] && file=$1
if ! pgrep -x "nvim-godot" > /dev/null; then
  alacritty -e nvim-godot 
  alacritty -e zsh -c "source /home/fejori/.zshrc && nvim-godot --listen ~/.cache/nvim/godot.pipe $file"
fi
nvim-godot --server ~/.cache/nvim/godot.pipe --remote-send ':e '$file'<CR>'
