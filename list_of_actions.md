# To update things
sudo apt update
sudo apt upgrade

# To be certain we have right version of vim and other important programs
sudo apt install python
sudo apt install python3-pip
sudo apt install python-dev python3-dev -yqq
sudo apt install git
sudo apt install nvim
sudo apt install tmux 
sudo apt install vim-nox
sudo apt install vim-gtk
sudo apt install openssh-client
sudo apt install curl
sudo apt install gnupg
sudo apt install htop
sudo apt install jq
sudo apt install pass
sudo apt install pwgen
sudo apt install ripgrep
sudo apt install rsync
sudo apt install shellcheck
sudo apt install unzip
sudo apt install fzf
sudo apt install gnome-terminal
sudo apt install -y zathura
sudo apt-get install curl wget git build-essential libssl-dev
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# To enhance the terminal experience (remember to install the recommended fonts)
sudo apt-get install zsh
chsh -s $(which zsh) 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# To Enable vim Google search 
sudo apt-get install xdg-utils --fix-missing

# The configure files for the vim, zsh and tmux must be done. By copy and replace maybe

# To clone the work
- place the ssh key in ~/.ssh/ and make it ready only with the command "chmod 400 ~/.ssh/id_rsa".
- than run the git clone programs. (this task was automated partially with the python script)

# Is interesting too to compile the vim that you use. Not so if you use neovim
This is important because makes possible to enable lots of interesting features like python and ruby support.
Those things as necessary for a better execution of plugins and other things. And is really easy to do.
For that we may follow this tutorial from YouCompleteMe. Just execute the shell file in this directory. It can be called from other scripts or it can be implemented in other program. 
It is in "clone_compile_install_vim.sh"

# The neovim editor is magnificent. 
I installed the Neovim editor and this was awesome. The alt key is functional now and things are great with the asynchronous stuff. New very important file init.vim. It is located in .config/nvim with other great things to keep in the radar. Ale, jedi, everything works great. Great Markdown support too. Latex development is now incredible and complete. With no compromisses and really incredible stuff.
The installation of the zathura package must be better documented, but works like a charm. The forward and backward search is awesome and the zathura configuration to combine with the console theme is fantastic. I even modified the airline theme to look well with the rest of the build. Now i am  happy.
There are some problems even now. Specially with some bugs with freezing of the x410 xserver and resulting freezing of the nvim session. But i hope thing can get better given the time. For now the build looks pretty promising.
