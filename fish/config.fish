set fish_greeting

bind \cy accept-autosuggestion execute
bind \cj history-prefix-search-forward
bind \ck history-prefix-search-backward

alias v=nvim
alias vv="v ."
alias vf="v ~/.local/share/fish/fish_history"
alias c=clear
alias ff=fastfetch
alias lg=lazygit
alias ls="eza --icons=always"
alias tree="ls --tree"
alias mpd="mpd >/dev/null 2>&1"
alias ncmpcpp="ncmpcpp -q"
alias tldr="tldr -q"
alias aa=aria2c
alias mpvg="mpv -vo=gpu-next"
alias mpvl="mpv -vd-lavc-skipframe=nonref"
alias pactree1="pactree -r -d 1"
alias ager="age -r age1u3frz9qq9am9ahwk3k5v297kaqp29ua6ypg9ekf6xnepxn7etqfq5kmtaj"
alias aged="age -d -i /home/kosaka/Encryption/pass.key"

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
