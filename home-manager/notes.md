# Things to do when installing Arch Linux
- [x] Disable bell
- [ ] Passwordless sudo
    - module doesn't work?
## Install packages
    - [ ] git
    - [ ] ansible
    - [ ] stow
    - [ ] qtile
    - [ ] dunst
    - [ ] rofi
    - [ ] alacritty
    - [ ] firefox
    - [ ] dbus
    - [ ] feh
    - [ ] picom
    - [ ] xorg-xinit
    - [ ] xorg-server
    - [ ] xorg-xbacklight
    - [ ] xorg-xsetroot
    - [ ] xorg-xrandr
    - [ ] xscreensaver
    - [ ] xterm
    - [x] ttf-firacode-nerd
    - [x] noto-fonts-emoji
    - [x] ttf-ms-win11-auto
    - [ ] adobe-source-han-sans-jp-fonts
    - [ ] flameshot
    - [ ] playerctl
    - [ ] udiskie
    - [ ] network-manager-applet
    - [ ] pulsemixer
        - maybe enable systemd service
## add system icons (idk which ones yet)
## gtk and qt themes
## clone dotfiles
- create directories like `~/.local/share/`?
- add background
## change default shell
## Install cli tools
    - [x] fish
    - [x] zoxide
    - [x] starship
    - [x] tmux
    - [x] man-db
    - [x] fzf
    - [x] fd
    - [x] bat
    - [x] lf / ranger
        - need `perl-file-mimeinfo` to open files
    - [x] neofetch
    - [x] htop
    - [x] libqalculate
    - [x] neovim
    - [x] neomutt
    - [x] ncmpcpp
    - [x] sxiv
    - [x] xclip
    - [x] zathura
    - [x] zathura-pdf-mupdf
    - [x] newsboat
## Install neovim dependencies 
- [x] unzip
- [x] wget
- [x] npm
- [x] python-pip
- [x] ripgrep
## Install basic system packages
- julia
- jdk-openjdk
- python
- rust
- r
- c
- docker
- gdb
## Install and Configure ssh and keys
## Install git config
## Configure `/etc/pacman.conf`
- add `ParallelDownloads = 5`
- add `ILoveCandy`
- add `Color`
- add yay and ansible for it
    - `ansible-galaxy collection install kewlfft.aur`
## Install yay and closed source software
- [x] rstudio-desktop-bin
- [x] spotify
- [x] zoom
## Setup firefox
## Setup bluetooth and devices
- bluez
- blueman
- bluez-utils for cli interface
- `systemctl start bluetooth.service`
- `systemctl enable bluetooth.service`
- add airpods to devices
## Setup wifi and networks
## Setup home directories (maybe use syncthing)
## backlight for laptop
- just need this package `xf86-video-intel`
    - idk about other distributions
- [forum](https://askubuntu.com/questions/715306/xbacklight-no-outputs-have-backlight-property-no-sys-class-backlight-folder)
- [arch-wiki](https://wiki.archlinux.org/title/backlight#ACPI)
- add `/etc/udev/rules.d/backlight.rules`
- add user to video group
## auto configure firefox
