export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Cargar Oh My Zsh
source $ZSH/oh-my-zsh.sh


# Ejecutar fastfetch al inicio
if command -v fastfetch &> /dev/null
then
    fastfetch -l ~/.config/fastfetch/custom_ascii/skull.txt 
fi

# Starship Prompt
eval "$(starship init zsh)"

# Enable starship transient Prompt
set_transient_prompt() {
  PROMPT=$(STARSHIP_CONFIG=~/.config/transient.toml starship prompt)
}

set_full_prompt() {
  PROMPT=$(starship prompt)
}

precmd_functions+=(set_full_prompt)
preexec_functions+=(set_transient_prompt)

zle-line-finish() {
  set_transient_prompt
  zle reset-prompt
}
zle -N zle-line-finish

zle-line-init() {
  if [[ $CONTEXT == start ]]; then
    set_full_prompt
    zle reset-prompt
  fi
}
zle -N zle-line-init

# Path configuration
export PATH="$PATH:/Users/enrique/Library/Python/3.9/bin"
export PATH="/opt/homebrew/bin/pandoc:$PATH"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Configuración de zsh-syntax-highlighting (instalado con Homebrew)
if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # Configuración de colores para zsh-syntax-highlighting
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
    ZSH_HIGHLIGHT_STYLES[command]='fg=green'
    ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
fi

# FZF configuration
if command -v fzf &> /dev/null; then
    eval "$(fzf --zsh)"
    alias fzfp='fzf --preview="bat --color=always {}"'
fi

# FZF Search history
source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt appendhistory

#Yazi configurations

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Aliases personalizados
alias cat='bat'
alias ls='eza'
alias urlpick='tmux capture-pane -J -p | grep -oE "(https?):\/\/.*[^>]" | sort --unique | fzf-tmux -d20 --multi --bind alt-a:select-all,alt-d:deselect-all | xargs open'
. "/Users/enrique/.deno/env"
# bun completions
[ -s "/Users/enrique/.bun/_bun" ] && source "/Users/enrique/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
