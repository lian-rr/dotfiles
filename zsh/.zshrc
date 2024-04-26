export PATH=$PATH:/opt/homebrew/bin
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/libtool/libexec/gnubin:$PATH"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-abbr/zsh-abbr.zsh

# -----------------------FZF config-----------------------------
eval "$(fzf --zsh)"

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
export BAT_THEME=tokyonight_night
alias cat="bat"

# ----- Abbr Expansion -------
ABBR_SET_EXPANSION_CURSOR=1

# ------ Other exports --------
export PATH="$PATH:$(go env GOPATH)/bin"

# ------ Overrides ----------
alias vim="nvim"

# Start starship shell
eval "$(starship init zsh)"
