set fish_greeting

bind \cf accept-autosuggestion
bind \cy accept-autosuggestion execute
bind \cj history-prefix-search-forward
bind \ck history-prefix-search-backward

alias v=nvim
alias c=clear
alias ff=fastfetch
alias lg=lazygit
alias ls="eza --icons=always"
alias tree="ls --tree"
alias syncthing="syncthing serve --no-upgrade --no-browser"
alias qr="qrencode -t ansi"
alias mpd="mpd >/dev/null 2>&1"
alias ncmpcpp="ncmpcpp -q"
alias tldr="tldr -q"
alias aa=aria2c
alias mpvg="mpv -vo=gpu-next"

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

eval "$(zoxide init fish)"
eval "$(fzf --fish)"
eval "$(starship init fish)"
