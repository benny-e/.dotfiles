# Enable completion system
autoload -Uz compinit
compinit

# Starship
eval "$(starship init zsh)"

# Autosuggestions plugin
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Keybindings
bindkey '^I' autosuggest-accept      # Tab → accept grey suggestion
bindkey '^[[Z' expand-or-complete    # Shift+Tab → normal completion

# Aliases
alias vim="nvim"
# alias ls="ls --color=auto"
alias ls="lsd"

#Auto start tmux
if [[ -z "$TMUX" && -o interactive && -t 0 && -t 1 ]]; then
    exec tmux new-session -A -s main
fi
