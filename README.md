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
For the linux part I'm using an Arch distribution, currently from the 2021.02.01 iso. The objective is to manage an operating system focused on security and with maximum keyboard accessibility. The routine of optimized initialization will be created to enable a recently installed Arch Linux for production with one line of code. Such endeavor is important as arch is knowingly an instable system for new users and I'm trying to make this process less painful.

### Installation
First is important to register the installation process. The one i followed was https://www.youtube.com/watch?v=PQgyW10xD8s from **distrotube** with the arch installation guide from ArchWiki https://wiki.archlinux.org/index.php/Installation_guide . 
For wifi connection use the  wiki again: https://wiki.archlinux.org/index.php/Network_configuration/Wireless . This is a must due to required downloads during arch installation. So first thing is to enable the internet.

#### Keymaps
The default keymap is the American US one. To change that you must first see all the available ones. For that enter in the terminal the command: `ls /usr/share/kbd/keymaps/**/*.map.gz | less`. Than you can go reading the entries and pressing enter to advance. These are the ones i use, with the command to enable then:

- `loadkeys /usr/share/kbd/keymaps/1386/qwerty/us-acentos.map.gz`
- `loadkeys /usr/share/kbd/keymaps/1386/qwerty/us.map.gz`

Create a shortcut to swap between then is a must for the future. Would be nice to create a key binding system wide for this.
You can access the lynx web browser from the terminal  to see the arch installation guide alongside the installation process pressing **Alt + left**. Then run the command `lynx https://wiki.archlinux.org/index.php/Installation_guide`

#### Time and Date
To set the time and date for your machine you must set your time zone. For that run the command: `timedatectl set-ntp true`, then check if it worked with `timedatetcl status`. Now, first we must create the system Arch linux before configure the right time zone. So let's continue.

#### Partitioning the disc
To create the disk partitions you must run the **fdisk** program. For that we use the following commands:
- `fdisk -l` To list all disks that are available.
- `fdisk /dev/<disk>` From the list you can choose one to initiate the process.
- `g` This command must be given from the **fdisk** command prompt. It will create an empty SGI partition table, this is important as we are in a EFI process. For us to populate with our preferences. You can press `m` to see all available options.
- `n` This will add a new partition to the disk. You must add a number for the partition, but the default is fine. You must add where in the memory the partition begins and ends. As this is the first, de default is fine. And where it ends you can insert an incremental measure of memory like **+550M**, giving 550 megabytes for our partition. This is our EFI partition. By default it creates it in Linux filesystem what is wrong. But after adding all partitions we will change this.
- For the swap you can repeat the entire process, de default for the number will be 2 now, which is fine, the initial block of the memory will be the end of the last, which is fine and the size was **+2G**. And the file system type again isn't correct but we will change that later.
- For the last partition, where our system will leave, you can press all the defaults. The number will be 3, the initial memory block will be where the 2 ends, and the end by default will reach all available memory in the disk. For this the linux file system is fine. But we will need to change the other two.
- `t` To change the type of the partition. It will ask for the partition number. We will first change the EFI one, so press `1`. And then you cam press `L` to list all available options of file systems. For this we will set the **EFI System** that is callable from the key 1, so we press `1` again.
- `t` Now we will change the swap partition. So press `2`. Then press `L` again. And search for **Linux swap** and press the corresponding key which is `19`. 
- `w` Then, finally, we can right that to the table pressing this key.

#### Making our file system
We need to make three file systems for the three partitions we created. For the EFI partition we must make it FAT32. For that we run the command `mkfs.fat -F32 /dev/sda1`. For the swap partition we run the command `mkswap /dev/sda2` to create it and `swapon /dev/sda2` to enable it. And lastly we make the file system for the system partition with the command `mkfs.ext4 /dev/sda3` and then we must mount this partition with the command `mount /dev/sda3 /mnt`.

#### Installing the base Linux system
Now has come the time to install the base Arch Linux system in the mounted disk. But for stability sake, we will install the LTS kernel that is the version of long time support. It features less updates than the normal kernel but receive all security updates.
The microcode is a program that is present in your processor. While it is possible to update it in the bios, the linux kernel is capable to upgrade it while the boot happens. For this, install `intel-ucode` for intel processors and `linux-firmware` for amd processors. Install these things with:

```
    
    pacstrap /mnt base linux-lts linux-lts-headers linux-firmware intel-ucode

```

This command can take a moment as it downloads the data from the internet and installs it on /mnt.

#### Creating the file system
Them we must create a file system for our Linux installation by running the `genfstab -U /mnt >> /mnt/etc/fstab` command. Now we can change to the root of our recently installed system (remember, we are logged in the bootable flash drive at the moment). We can do that by running the `arch-chroot /mnt` command. 

You can see if the command worked by seeing the change in the bash command line.

#### Setting our time zone
Now that we are in the right system we can set the timezone. For that you can reference the right region with the command `ln -sf /usr/share/zoneinfo/Brazil/East /etc/localtime` for my case given the place i reside. Than you can set the hardware clock with the command `hwclock --systohc`. Than you must define the locale by editing the file `/etc/locale.gen`. This can be done with vim, but you must install it first with `pacman -S vim`. Then find the right locale and uncomment it. After that you must run the command `locale-gen`. You can uncomment how much locales you need. You can see the ones activated with the command `locale -a`.

And, finally, create the file `/etc/locale.conf` with:
```
    LANG=en_US.UTF-8
```
And make the keyboard layout stay persistent in `/etc/vconsole.conf`:
```
    KEYMAP=us
```

#### Setting the Host name
Now we will set the computer hostname editing a file again with vim. The file is `/etc/hostname` and you can set it to whatever you want. And we must add some other hosts locally adding the following lines in the file `/etc/hosts`:

```shell
    
    127.0.0.1   localhost
    ::1         localhost
    127.0.1.1   my_second_arch.localdomain    my_second_arch    

```

#### Creating a user and a password (for the root too)
Now we must create a user and a password for the user. And we must create a password for the root. So to do that we will run the `passwd` command that change the root password.

Now we will create the user and the user password as well. For that we run the command `useradd -m felipejoribeiro`. And then create the password for the user with `passwd felipejoribeiro`.

And finally, we must add the new user in some groups to give it permissions (to run the sudo command for example). For that we run the command `usermod -aG wheel,audio,video,optical,storage felipejoribeiro` 

#### Installing SUDO
Them we can install the **sudo** program. With pacman by running the `pacman -S sudo` command. And after that you can edit the sudo configurations with the command `visudo`. Than search for the line `# %wheel ALL=(ALL) ALL` and uncomment it. That will give privileges to your new born user, as it is in the wheel group.

#### Installing the bootloader
Then BIOS checks the Master Boot Record (MBR), which is a 512 byte section located first on the Hard Drive. It looks for a bootloader (like GRUB). The hard drive's partition tables are also located here. If you remember, we created a partition for the EFI with this exact size. We will install the bootloader there now.
For installing the grub program you must run the `pacman -S grub` command. As we will manage EFI bios, we must install other programs: `pacman -S efibootmgr dosfstools os-prober mtools`.
After that we must make our EFI directory and our boot directory. For that we use the commands `mkdir /boot/EFI` to create the directory and `mount /dev/sda1 /boot/EFI` to mount the EFI partition to the newborn directory. And finally we can install grub in it with `grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck`. Than we must create a config file for the boot loader. That can be done with `grub-mkconfig -o /boot/grub/grub.cfg`. 

#### For managing internet and downloading good code
Now we can install a network manager and git. The one recommended was `pacman -S networkmanager git`. And we should enable the network manager with `systemctl enable NetworkManager`.

And thats it. You installed arch Linux. Now you can reboot. For that type `exit` to close chroot and unmount the system disk with `umount -l /mnt`. Then run `shutdown now` to close the os. Remove the flash drive and reboot.
That's it for the installation.


### After the installation


Some good packages to have installed:

- `pacman -S --needed base-devel`

#### Disable boot grub menu
Chances are that there is only arch in your machine. That means that you don't need the grub initial menu for choosing the operation system. Than we can make that operation with the following procedure:

Edit the following lines in the beginning of `sudo vim /etc/default/grub` file:

```
    # GRUB boot loader configuration

    GRUB_DEFAULT=0
    GRUB_TIMEOUT=0.0
    GRUB_HIDDEN_TIMEOUT=0.0

```

And finally you can rerun the config generator with `grub-mkconfig -o /boot/grub/grub.cfg`.

#### Enabling the AUR helper
One thing that is good is to enable the **AUR** (Arch User Repository) with **yay**. This makes possible to download packages from the told repository. For that you need git installed and then clone the repo to your machine with:

```shell

    git clone https://aur.archlinux.org/yay.git

```
After installation you can enter the directory cloned and run `makepkg -si`, and **yay** will be installed in your system. This program is an AUR helper, that facilitates the process of downloading and installing packages from the user repository.


#### For video rendering
To enable your arch distro to reder things besides the terminal, it must be installed a video driver. When in an virtual machine you can install **xf86-video-fbdev**, with `sudo pacman -S xf86-video-fbdev`, but be aware of finding the right video driver to your machine when installing in a pc. Reference can be found in https://wiki.archlinux.org/index.php/xorg.

Then you must install **Xorg** too. It's an display server, the most popular among Linux users. It can be installed with  `pacman -S xorg xorg-xinit`. The **xinit** component is important as enable the user to initialize Xorg manually. This is important to other programs like window managers, for example. Know, its important to copy the config file for your home directory with `cp /etc/X11/xinit/xinitrc /home/<user>/.xinitrc`. Then, edit this file to initiate the programs like the window manager and others. By deleting the last lines that contains:

```shell

    twm &
    xclock - geometry
    .
    .
    .

```
Then add the following lines to open the right software:

```shell
    
    nitrogen --restore &
    picom &
    exec dwm

```

#### Background setter
To enable a background for the system it's used **nitrogen**. It can be installed with `pacman -S nitrogen`.

#### Compositor and window manager
For the compositor the program **picom** was used.
For managing the windows of the system the program that i chose  was **Spectrwm**. For installing the program in Arch systems this is easy. One line is enough: `sudo pacman -S spectrwm`.

#### Web browser
For navigating on the web the **Firefox** browser was chosen. But there are some addons chromium based that i can't leave without. Like:

- Enhanced GitHub,
- Vimium,
- Octotree,
- GitHub isometric Contributions.

##### Terminal emulator
For the terminal emulator

##### Initiating the graphical interface 
Add `[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1` to your .bashrc the the graphical interface will start autonomously.
