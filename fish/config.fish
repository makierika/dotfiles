set fish_greeting

bind \cf accept-autosuggestion
bind \cy accept-autosuggestion execute
bind \cj history-prefix-search-forward
bind \ck history-prefix-search-backward

alias c=clear
alias ff=fastfetch
alias ls="eza --icons=always"
alias tree="ls --tree"
alias yy=yazi
alias httpd="python -m http.server 80"
alias v=nvim

eval "$(zoxide init fish)"
eval "$(fzf --fish)"
