# My development environment
A place for the documentation of my development environment. Here i list the tools for a more comfortable and productive workflow. These softwares and solutions are the best i found for my specific needs, and may serve you well as well. 

If you have suggestions or corrections fell free to create a pull request, or send-me an email (felipejoribeiro1@gmail.com). Which will be pretty much appreciated.

Last updated on **October/2020**. 

---

## Windows:
It's a **Windows 10 Home edition**, with the **2004** (may of 2020) build. 

My  reasons of using **Windows** are academic mostly. In engineering a bunch of proprietary software are required, most of which doesn't run natively in linux. Like CAD programs and in the fluid and structural simulation software realm. As this document focus on the programming side of things, like web and game development, these engineering tools will not be listed here, but they are the reason i don't run just vanilla linux.

On this OS i work with **WSL2** with an **UBUNTU 20.04** kernel as an additional development tool. The reasons are that, in my believe, the **UNIX** environment is much suited for web and **FORTRAN** development (with the *gfortran* compiler) with *multi-threading* and **OpenGL** capabilities right out of the box. As so, this suits perfectly with my academic and professional needs.

For setting this up, the windows 10's 2004 build is necessary, alongside some other configurations. And, aside that, some tweaking is necessary for solving some clipboard problems between Linux and windows and making it capable of launching graphical applications. These things will be discussed further. For now, let's make an overview of all things used:

- **WSL2** with a UBUNTU 20.04 instance (Windows side of things);
- **Windows Terminal** configured with **bash** as default terminal (Windows side of things);
- **X410** as the X server for graphics visualization from linux(Windows side of things);
- **Windows Powertoys**, because it features some nice tools for a more keyboard centrist environment (Windows side of things);
- **zsh** shell is installed and is set as default on the installed **Ubuntu** (Linux side of things);
- **Oh my zsh** is used for bash superpowers (Linux side of things);
- **vim** as the default text editor as it is the most customizable and time proofed editor(linux side of things);
- **Tmux** as the terminal multiplexer(Linux lide of things);



### Solving the graphicall application's problem:

For this, it's necessary to install an X Window server for Windows 10, like Xming or X410. I installed X410, so i will show how to configure wsl2 to work with the software to solve both the graphical problem and the clipboard problem. 


