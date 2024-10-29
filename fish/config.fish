set fish_greeting

bind \cf accept-autosuggestion
bind \cy accept-autosuggestion execute
bind \cj history-prefix-search-forward
bind \ck history-prefix-search-backward

alias c=clear
alias ff=fastfetch
alias ls="eza --icons=always"
alias tree="ls --tree"
alias httpd="python -m http.server 80"
alias v=nvim

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
