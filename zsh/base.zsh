zmodload zsh/terminfo
typeset -gA key
key=(
    Up        "${terminfo[kcuu1]}"
    Down      "${terminfo[kcud1]}"
)

# history
[ -f ~/.config/dotfiles/zsh/history.zsh ] && source ~/.config/dotfiles/zsh/history.zsh

[ -f ~/.config/dotfiles/zsh/aliases.zsh ] && source ~/.config/dotfiles/zsh/aliases.zsh

export HOMEBREW_NO_AUTO_UPDATE=1
