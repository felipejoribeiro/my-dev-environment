hostName: redspace
birthDate: 09/18/21


# partitions:
- 300Mb -> EFI
- 4Gb -> swap
- >450Gb -> linuxfs


# locales:
- pt_BR
- en_US
- fr_CA
```
/etc/locale.conf: LANG=en_US.UTF=8
/etc/vconsole.conf: KEYMAP=us
```

# user:
name: fejori
groupes: wheel,audio,video,optical,storage


# updated keys:
`sudo pacman-key --refresh-keys`


# installed:
- neovim
- xclip
- python-neovim
- broadcom-wl-dkms
- git
- sudo
- grub efibootmgr dosfstools os-prober mtools
- networkmanager network-manager-applet iwd wireless_tools ufw
- openssh
- htop
- neofetch
- nvidia nvidia-utils nvidia-settings mesa xf86-video-intel lib32-nvidia-utils lib32-opencl-nvidia opencl-nvidia libvdpau libxnvctrl vulkan-icd-loader lib32-vulkan-icd-loader
- xorg xorg-server xorg-xinit xorg-apps xorg-xrandr
- bspwm sxhkd picom nitrogen arandr alacritty


# Installed AUR packages:
- yay
- broadcom-bt-firmware-git


# first error log after initialization:
I runned `sudo journalctl -p 3 -xb` and got these errors:
- kernel: x86/cpu: SGX disabled by BIOS 
    -> reference to a encryption feature that is disabled in my cpu, but seems not important as well. In my bios it's as "software controlled". To solve this i followed this guide: http://xiangyi.pro/2020/enable-software-controled-sgx-in-ubuntu/ and this solved the problem. For safety, the necessary git repository and a pdf version of this guide is available in ./data.
- kernel: bluetooth: hci0: BCM: firmware Patch file not found, tried:
- kernel: bluetooth: hci0: BCM: 'brcm/BCM20702A1-0b05-180a.hcd'
- kernel: bluetooth: hci0: BCM: 'brcm/BCM-0b05-180a.hcd'
    -> Some problem with the broadcom wireless adapter. Installed broadcom-bt-firmware-git from AUR and it solved the problem.
- wpa_supplicant[449]: bgscan simple: Failed to enable signal strength monitoring
    -> Problem with my wifi card not having this feature. But it don't affect the internet connection so it's fine. This was the only one not solved.


# Changed some pacman configs to enabled multilib and added a transaction hook to care about nvidia drivers
Then i configured nvidia to update initramfs after any driver update. For that i created the file `/etc/pacman.d/hooks/nvidia.hook`, with:
```
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia
Target=linux
# Change the linux part above and in the Exec line if a different kernel is used

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```

# Cloned the .my_dev_environment repo
```
https://github.com/felipejoribeiro/my-dev-environment.git
```

# Created nvidia entries:
- /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf




