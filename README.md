# My personal Arch config

![preview](./config.png)

## Installation

### Prerequisites

`git` `stow` 
I only recommend the installation for fresh profiles or for those who really do know what they are doing.

### yay
```sh
git clone https://aur.archlinux.org/yay-bin.git "$HOME/yay-bin"
cd "$HOME/yay-bin"
makepkg -si
```

### Must have packages

```sh
sudo pacman -S --needed git zip unzip make fzf stow fd less man-db iwd pipewire pipewire-pulse pipewire-alsa brightnessctl ripgrep vim wget xclip xdg-utils xorg tree make base-devel
```

### Personal packages
```sh
sudo pacman -S --needed kitty pavucontrol fastfetch rofi rofi-calc rofi-emoji yazi neovim ttf-jetbrains-mono-nerd

#hyprland specific
sudo pacman -S --needed hyprland waybar hyprlock hypridle xwaylandvideobridge xorg-xwayland hyprpaper hyprshot xdg-desktop-portal-hyprland swaync

yay -S rofi-greenclip oh-my-posh
```

### ZSH
I am using zinit
```sh
sudo pacman -S zsh
```

### Config

Clone this repo:
```sh
git clone --recurse-submodules https://github.com/mcbulazs/dotfiles.git
cd dotfiles
```
If you choose to download all of the packages:
```sh
stow */
```
If you want to stow specific packages (name of dir):
```sh
#stow <package_name>
#eg: stow nvim
```
Now everything has been installed just reboot
```sh
sudo reboot now
```

## Packages

### Config specific packages
#### Hyprland
- `hyprland`
- `waybar`
- `hyprlock`
- `hypridle`
- `hyprpaper`
- `hyprshot`
- `swaync`

#### Other
- `kitty`
- `pavucontrol`
- `rofi`
- `yazi`
- `neovim`
- `fastfetch`
- `oh-my-posh`
- `ttf-jetbrains-mono-nerd`

### "Must" have packages

- `git`
- `zip`
- `unzip`
- `make`
- `fzf`
- `stow`
- `less`
- `man-db`
- `iwd`
- `neofetch`
- `ripgrep`
- `vim`
- `wget`
- `xclip`
- `xdg-utils`
- `xorg`
- `make`
- `base-devel`

