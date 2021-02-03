# My development environment
A place for the documentation of my development environment. Here i list the tools for a more comfortable and productive workflow. These softwares and solutions are the best i found for my specific needs, and may serve you well as well. 

If you have suggestions or corrections fell free to create a pull request, or send-me an email (felipejoribeiro1@gmail.com). Which will be pretty much appreciated.

Last updated on **February/2021**. 

## Windows:
It's a **Windows 10 Home edition**, with the **2004** (may of 2020) build. 

My  reasons of using **Windows** are academic mostly. In engineering a bunch of proprietary software are required, most of which doesn't run natively in linux. Like CAD programs and in the fluid and structural simulation software realm. As this document focus on the programming side of things, like web and game development, these engineering tools will not be listed here, but they are the reason i don't run just vanilla linux.

On this OS i work with **WSL2** with an **UBUNTU 20.04** kernel as an additional development environment. The reasons are that, in my believe, the **UNIX** environment is much suited for web and **FORTRAN** development (with the *gfortran* compiler) with *multi-threading* and **OpenGL** capabilities right out of the box. As so, this suits perfectly with my academic and professional needs.

For setting this up, the windows 10's 2004 build is necessary, alongside some other configurations. And, aside that, some tweaking is necessary for solving some clipboard problems between Linux and windows and making it capable of launching graphical applications. These things will be discussed further. For now, let's make an overview of all things used:

- **WSL2** with a UBUNTU 20.04 instance (Windows side of things);
- **WSLtty** as a terminal emulator (Windows side of things);
- **X410** as the X server for graphics visualization from linux(Windows side of things);
- **Windows Powertoys**, because it features some nice tools for a more keyboard centrist environment (Windows side of things);
- **zsh** shell is installed and is set as default on the installed **Ubuntu** (Linux side of things);
- **Oh my zsh** is used for bash superpowers (Linux side of things);
- **vim** as the default text editor as it is the most customizable and time proofed editor(linux side of things);
- **Tmux** as the terminal multiplexer(Linux lide of things);
- **ImageGlass** as the default image visualization tool(Windows side of things);
- **brave** as the default web browser(Windows side of things);
- **TreeSize** as a memory analysis solution (Windows side of things);

### Solving the graphicall application's problem:

For this, it's necessary to install an X Window server for Windows 10, like Xming or X410. I installed X410, so i will show how to configure wsl2 to work with the software to solve both the graphical problem and the clipboard problem. Now and then is possible to find problems regarding instability. Some atention has to be given to this. 

### Solving Tmux graphical glitches:


### Making vim and Tmux yank system work system wide:


### Some Tmux key configurations 

### Some Vim key configurations
First of all, i install vim-nox with **sudo apt install vim-nox** to enable ruby support and multithreading in vim. Them i install the plugin manager that i must like which is vim-plug. I do so with the following commands:


curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

The .vimrc file is already prepared for this Plugin. It has the benefit of making use the vim's multithreading capabilities for faster package instalation and updates.



## Linux
For the linux part I'm using an Arch distribution, currently from the 2021.02.01 iso. The objective is to manage an operating system focused on security and on the keyboard. The routine of optimized initialization will be created to enable a recently installed Arch Linux for production with one line of code. Such endeavor is important as arch is knowingly an instable system for now users and I'm trying to make this process easier.

### Window manager:
For managing the windows of the system the program that i chose  was **Spectrwm**. For installing the program in Arch systems this is easy. One line is enough: `sudo pacman -S spectrwm`.


