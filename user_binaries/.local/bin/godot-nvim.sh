#!/bin/bash
# Create symlink from nvim to nvim-godot in a place that is in your $PATH
# like with the command below:
# ln -s /usr/bin/nvim /usr/bin/nvim-godot

source ~/.zshrc


THIS_TERM=wezterm

[ -n "$1" ] && file=$1
[ -n "$2" ] && col=$2
[ -n "$3" ] && line=$3

is_nvim_godot_running=$(pgrep -x 'nvim-godot')

# project path
file_path=$(dirname $file)
while [ ! -f $file_path/project.godot ]; do
  file_path=$(dirname $file_path)
  if [ $file_path = "/" ]; then
    file_path=$(dirname $file)
    break
  fi
done
cd $file_path


if [ -z "$col" ]; then
  if [ -n "$is_nvim_godot_running" ]; then
    nvim --server /tmp/nvim.pipe --remote-send ':e '$file'<CR>'
    exit 0
  fi

  if THIS_TERM=wezterm; then
    wezterm start --cwd $file_path -- nvim-godot --listen /tmp/nvim.pipe $file
  else
    alacritty -e zsh -c "source /home/fejori/.zshrc; nvim-godot --listen /tmp/nvim.pipe $file"
  fi
elif [ -z "$line" ]; then
  if [ -n "$is_nvim_godot_running" ]; then
    nvim --server /tmp/nvim.pipe --remote-send ':e '$file'<CR>'
    nvim --server /tmp/nvim.pipe --remote-send ':call cursor(0,'$col')<CR>'
    exit 0
  fi

  if THIS_TERM=wezterm; then
    wezterm start --cwd $file_path -- nvim-godot --listen /tmp/nvim.pipe $file '+normal '$line'G^'$col'|'
  else
    alacritty -e zsh -c "source /home/fejori/.zshrc; nvim-godot +'call cursor($line,$col)' --listen /tmp/nvim.pipe $file"
  fi
else
  if [ -n "$is_nvim_godot_running" ]; then
    nvim --server /tmp/nvim.pipe --remote-send ':e '$file'<CR>'
    nvim --server /tmp/nvim.pipe --remote-send ':call cursor('$line','$col')<CR>'
    exit 0
  fi

  if THIS_TERM=wezterm; then
    wezterm start --cwd $file_path -- nvim-godot --listen /tmp/nvim.pipe $file '+normal '$line'G'
  else
    alacritty -e zsh -c "source /home/fejori/.zshrc; nvim-godot +'call cursor($line,1)' --listen /tmp/nvim.pipe $file"
  fi
fi
