alias ca="conda activate"
alias cad="conda deactivate"

alias gs="git status"
alias gd="git diff"
alias gb="git branch"
alias goh="cd ~"
alias goconfig="cd ~/.config"
alias rr="source ~/.zshrc"

# use ripgrep and pipe its output into nvim
nvim-rg() {
    rg --vimgrep "$@" | nvim -q - -c "copen"
}
