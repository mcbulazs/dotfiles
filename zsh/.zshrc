export ZSH="$HOME/.oh-my-zsh"

export RANGER_LOAD_DEFAULT_RC=FALSE
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
