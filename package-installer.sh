!#/usr/bin/bash

git clone https://aur.archlinux.org/yay-bin.git "$HOME/yay-bin"
cd "$HOME/yay-bin"
makepkg -si

sudo pacman -S --needed git zip unzip make fzf stow fd less man-db iwd pulseaudio brightnessctl ripgrep vim wget xclip xdg-utils xorg xorg-xinit tree make base-devel

sudo pacman -S --needed pulseaudio pulseaudio-bluetooth blueberry

sudo pacman -S --needed bspwm sxhkd polybar kitty dunst pavucontrol fastfetch rofi rofi-calc rofi-emoji yazi neovim picom feh flameshot starship ttf-jetbrains-mono-nerd hyprland waybar hyprlock hypridle xwaylandvideobridge xorg-xwayland hyprpaper hyprshot xdg-desktop-portal-hyprland

yay -S rofi-greenclip

sudo pacman -S zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
