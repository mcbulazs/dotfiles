export ZSH="$HOME/.oh-my-zsh"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
#ZSH_THEME="random"

#ZSH_THEME="robbyrussell"

eval "$(starship init zsh)"

#plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias p='sudo pacman'

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    Hyprland
	#startx
fi
fastfetch -c ~/.config/fastfetch/conf -l arch_small

#yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
