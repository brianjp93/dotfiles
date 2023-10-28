export VISUAL=nvim;
export EDITOR=nvim;

alias gs="git status"
alias ls="ls -A"
alias vim="nvim"
alias rr="ranger"
alias ca="conda activate"
alias cad="conda deactivate"
alias pm="python manage.py"

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
