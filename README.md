# My development environment
A place for the documentation of my development environment. Here i list the tools for a more comfortable and productive workflow. These softwares and solutions are the best i've found for my specific needs, and may serve you as well. 

If you have suggestions or corrections fell free to create a pull request, or send-me an email (felipejoribeiro@gmail.com). Which will be pretty much appreciated.

Last updated in: **October/2020**. 

---

## Windows:
It's a **Windows 10 Home edition**, with the **2004** (may of 2020) build. 

My  reasons of using **Windows** are academic. In engineering it`s necessary a bunch of proprietary software, most of doesn't runs natively in linux. Like CAD programs and in the fluid and structural simulation software realm. As this document focus on the programing side of things, like web and game development, these engineering tools will not be listed here, but they are the reason i don't run just vanilla linux.

On this OS i work with **WSL2** with an **UBUNTU 20.04** kernel as an additional development tool. The reasons are that, in my believe, the **UNIX** environment is much suited for web and **FORTRAN** dev (with the *gfortran* compiler) with *multi-threading* and **OpenGL** capabilities. As so, this suits perfectly with my academic and professional needs.

For setting this up, the windows 10's 2004 build is necessary, alongside with some other configurations. And, aside that, some tweaking is necessary for solving some clipboard problems between Linux and windows. These things will be discussed further. For now, let's make an overview of all things used:

- **WSL2** with a UBUNTU 20.04 instance;
- **Windows Terminal** configured with **bash** as default terminal;
- **zsh** shell is installed and is set as default on the installed **Ubuntu**;
- **Oh my zsh** is used for bash superpowers




For the installation of the zsh shell you can follow the guide on:

https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
