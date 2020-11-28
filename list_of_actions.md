# To update things
sudo apt update
sudo apt upgrade

# To be certain we have right version of vim and other important programs
sudo apt install vim-nox
sudo apt install tmux 
sudo apt install git
sudo apt install openssh-client

# To enhance the terminal experience (remember to install the recommended fonts)
sudo apt-get install zsh
chsh -s $(which zsh) 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

