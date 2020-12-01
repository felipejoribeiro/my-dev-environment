# To update things
sudo apt update
sudo apt upgrade

# To be certain we have right version of vim and other important programs
sudo apt install python
sudo apt install python3-pip
sudo apt install python-dev python3-dev -yqq
sudo apt install git
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
