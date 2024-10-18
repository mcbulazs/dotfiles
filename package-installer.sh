!#/usr/bin/bash


confirmation() {
    read -p "$1 (Y/N): " confirm
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        return 0
    fi
    return 1
}

confirmation "This will take several minutes. Are you sure you want to continue?" || exit 1

#yay installation
if ! which yay &> /dev/null; then
    if confirmation "Do you want to install yay (unofficial package manger)?"; then
        sudo pacman -S --needed git base-devel
        git clone https://aur.archlinux.org/yay-bin.git "$HOME/yay-bin"
        cd "$HOME/yay-bin"
        makepkg -si
    fi
fi

confirmation "Do you want to install must-have packages?" &&
  sudo pacman -S --needed git zip unzip make fzf stow fd less man-db iwd pulseaudio brightnessctl ripgrep vim wget xclip xdg-utils xorg xorg-xinit tree make base-devel

confirmation "Do you want to install BLUETOOTH specific packages?" &&
    sudo pacman -S --needed pulseaudio pulseaudio-bluetooth blueberry
confirmation "Do you want to install personal config packages?" && {
  sudo pacman -S --needed bspwm sxhkd polybar kitty dunst pavucontrol fastfetch rofi rofi-calc rofi-emoji yazi neovim picom feh flameshot starship ttf-jetbrains-mono-nerd hyprland waybar hyprlock hypridle xwaylandvideobridge xorg-xwayland hyprpaper xdg-desktop-portal-hyprland xautolock
  yay -S rofi-greenclip hyprshot betterlockscreen
}
confirmation "Do you want to install zsh?" && {
    sudo pacman -S zsh
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}
