autoload -Uz compinit && compinit
# Case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# history
[ -f ~/.config/dotfiles/zsh/history.zsh ] && source ~/.config/dotfiles/zsh/history.zsh

[ -f ~/.config/dotfiles/zsh/aliases.zsh ] && source ~/.config/dotfiles/zsh/aliases.zsh

# chat
[ -f ~/.config/dotfiles/zsh/chat.zsh ] && source ~/.config/dotfiles/zsh/chat.zsh

export HOMEBREW_NO_AUTO_UPDATE=1
