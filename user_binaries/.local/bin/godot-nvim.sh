#!/bin/bash
# Create symlink from nvim to nvim-godot in a place that is in your $PATH
# like with the command below:
# ln -s /usr/bin/nvim /usr/bin/nvim-godot

[ -n "$1" ] && file=$1
[ -n "$2" ] && col=$2
[ -n "$3" ] && line=$3
is_nvim_godot_running=$(pgrep -x 'nvim-godot')

if [ -n "$is_nvim_godot_running" ]; then
  nvim --server /tmp/nvim.pipe --remote-send ':e '$file'<CR>'
else
  if [ -z "$line" ]; then
    alacritty -e zsh -c "source /home/fejori/.zshrc; nvim-godot --listen /tmp/nvim.pipe $file"
  elif [ -z "$col" ]; then
    alacritty -e zsh -c "source /home/fejori/.zshrc; nvim-godot +'call cursor($line,1)' --listen /tmp/nvim.pipe $file"
  else
    alacritty -e zsh -c "source /home/fejori/.zshrc; nvim-godot +'call cursor($line,$col)' --listen /tmp/nvim.pipe $file"
  fi
fi
