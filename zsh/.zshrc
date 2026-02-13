# zmodload zsh/zprof # uncomment for debugging startup

# Cache brew prefix to avoid multiple slow calls
if [[ -z "$HOMEBREW_PREFIX" ]]; then
  export HOMEBREW_PREFIX="/opt/homebrew"  # Hardcode it! It never changes
fi

export PATH=$PATH:$HOMEBREW_PREFIX/bin
export PATH="$HOMEBREW_PREFIX/sbin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/libtool/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/openssh/bin:$PATH"
export PATH="$PATH:$HOMEBREW_PREFIX/opt/libpq/bin"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Smart compinit with daily cache refresh
autoload -Uz compinit
typeset -g compfile="${ZDOTDIR:-$HOME}/.zcompdump"

if [[ -n "$compfile"(#qN.mh+24) ]]; then
  # Regenerate once per day
  compinit -i -d "$compfile"
else
  # Use cache, skip all checks
  compinit -C -d "$compfile"
fi

# Add in zsh plugins with proper wait timing
zinit ice wait'0a' lucid atinit'zicompinit; zicdreplay'
zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice wait'0b' lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice wait'0c' lucid blockf
zinit light zsh-users/zsh-completions

zinit ice wait'1' lucid
zinit light Aloxaf/fzf-tab

zinit ice wait'2' lucid src:"$HOMEBREW_PREFIX/share/zsh-abbr/zsh-abbr.zsh"
zinit light zdharma-continuum/null

# Add in snippets with staggered loading
zinit ice wait'0' lucid
zinit snippet OMZP::git

zinit ice wait'0' lucid
zinit snippet OMZP::sudo

zinit ice wait'2' lucid
zinit snippet OMZP::command-not-found

zinit ice wait'3' lucid
zinit snippet OMZP::kubectl

zinit ice wait'3' lucid
zinit snippet OMZP::kubectx

# Atuin history
zinit ice wait'0a' lucid atload'eval "$(atuin init zsh)"'
zinit light zdharma-continuum/null

# Direnv - deferred
zinit ice wait'0b' lucid atload'eval "$(direnv hook zsh)"'
zinit light zdharma-continuum/null

# FZF - deferred
zinit ice wait'0c' lucid atload'eval "$(fzf --zsh)"'
zinit light zdharma-continuum/null

# Thefuck - defer 1s (rarely needed immediately)
zinit ice wait'1' lucid atload'eval $(thefuck --alias); eval $(thefuck --alias fk)'
zinit light zdharma-continuum/null

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# ----- Bat (better cat) -----
if type "bat" > /dev/null; then
    export BAT_THEME=tokyonight_night
    alias cat="bat"
fi

# ----- Abbr Expansion -------
ABBR_SET_EXPANSION_CURSOR=1
function load_expansions() {
    if [ -f ~/.config/zsh/.abbrs ]; then
        source ~/.config/zsh/.abbrs 
    fi
}

# ---- Local config
if [ -f ~/.config/zsh/.local ]; then
    source ~/.config/zsh/.local 
fi

# ------ Aliases --------
alias v="nvim"
alias zshconfig="v ~/.zshrc"
alias zshrestart="source ~/.zshrc"

# ------ Other exports --------
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH=$PATH:$GOPATH/bin
export PATH="$PATH:$HOME/.local/bin"

. "$HOME/.clio/bin/env"

# Start starship shell 
eval "$(starship init zsh)"
# zprof
