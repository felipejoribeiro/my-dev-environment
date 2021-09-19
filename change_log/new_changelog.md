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

# first error log after initialization:
I runned `sudo journalctl -p 3 -xb` and got these errors:
- kernel: x86/cpu: SGX disabled by BIOS 
- kernel: bluetooth: hci0: BCM: firmware Patch file not found, tried:
- kernel: bluetooth: hci0: BCM: 'brcm/BCM20702A1-0b05-180a.hcd'
- kernel: bluetooth: hci0: BCM: 'brcm/BCM-0b05-180a.hcd'
- wpa_supplicant[449]: bgscan simple: Failed to enable signal strength monitoring



