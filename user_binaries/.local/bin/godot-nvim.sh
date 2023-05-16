#!/bin/bash
# Create symlink from nvim to nvim-godot in a place that is in your $PATH
# like with the command below:
# ln -s /usr/bin/nvim /usr/bin/nvim-godot

[ -n "$1" ] && file=$1
if ! pgrep -x "nvim-godot" > /dev/null; then
  alacritty -e nvim-godot --listen ~/.cache/nvim/godot.pipe $file
fi
echo $file >> ~/temp.txt
nvim-godot --server ~/.cache/nvim/godot.pipe --remote-send ':e '$file'<CR>'
