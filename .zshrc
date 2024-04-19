eval "$(starship init zsh)"

# source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

alias ls='exa --icons -F -H --group-directories-first --git -1'
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
