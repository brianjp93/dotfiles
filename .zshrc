# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export VISUAL=nvim;
export EDITOR=nvim;

alias gs="git status"
alias ls="ls -A"
alias vim="nvim"
alias rr="ranger"
alias ca="conda activate"
alias cad="conda deactivate"
alias pm="python manage.py"

alias goh='cd ~'
alias goc='cd ~/Documents/code'
alias god='cd ~/Documents/code/dotfiles'
alias gol='cd ~/Documents/code/django/lolsite'
alias goiwd='cd ~/Documents/code/iwdsync'
alias gorustaoc='/Users/brian/Documents/code/aoc/rust/aoc2019'

# added by Anaconda3 5.1.0 installer
# export PATH="/Users/brian/anaconda3/bin:$PATH"
export PATH=/Library/flutter/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/brian/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME="fwalch"
# ZSH_THEME="random"
# powerline
ZSH_THEME="powerlevel10k/powerlevel10k"

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
conda activate base

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
