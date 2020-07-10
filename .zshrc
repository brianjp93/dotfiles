export VISUAL=nvim;
export EDITOR=nvim;

alias gs="git status"
alias ls="ls -A"
alias vim="nvim"
alias rr="ranger"
alias ca="conda activate"
alias cad="conda deactivate"

alias goh='cd ~'
alias goc='cd ~/Documents/code'
alias god='cd ~/Documents/code/dotfiles'
alias gol='cd ~/Documents/code/django/lolsite'

# added by Anaconda3 5.1.0 installer
# export PATH="/Users/brian/anaconda3/bin:$PATH"
export PATH=/Library/flutter/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/brian/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="fwalch"
# ZSH_THEME="random"

test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)
plugins=(git)
source $ZSH/oh-my-zsh.sh

# quick find files and directories
export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'

fd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d \
        -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}

. /Users/brian/anaconda3/etc/profile.d/conda.sh
