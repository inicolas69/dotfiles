# -------------------------------------------------------------------
# Powerlevel10k instant prompt (DOIT rester tout en haut)
# -------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------------------------------------------------------------------
# Oh My Zsh
# -------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  gitfast
  last-working-dir
  common-aliases
  zsh-syntax-highlighting
  history-substring-search
  zsh-autosuggestions
)

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Oh-My-Zsh: désactiver le check auto (réduit le boot time)
zstyle ':omz:update' mode disabled
DISABLE_AUTO_UPDATE="true"

source "$ZSH/oh-my-zsh.sh"
unalias rm 2>/dev/null

# -------------------------------------------------------------------
# Editors
# -------------------------------------------------------------------
export EDITOR="code -w"
export BUNDLER_EDITOR="$EDITOR"

# -------------------------------------------------------------------
# Ruby (rbenv)
# -------------------------------------------------------------------
export PATH="$HOME/.rbenv/bin:$PATH"
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - zsh)"
fi

# -------------------------------------------------------------------
# Node (nvm) - lazy load (BEAUCOUP plus rapide)
# -------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"

__load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
}

nvm() { __load_nvm; command nvm "$@"; }
node() { __load_nvm; command node "$@"; }
npm()  { __load_nvm; command npm  "$@"; }
npx()  { __load_nvm; command npx  "$@"; }
yarn() { __load_nvm; command yarn "$@"; }

# -------------------------------------------------------------------
# Rails / Node binstubs
# -------------------------------------------------------------------
export PATH="./bin:./node_modules/.bin:$PATH"

# -------------------------------------------------------------------
# Yarn (global)
# -------------------------------------------------------------------
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# -------------------------------------------------------------------
# Locale / encoding
# -------------------------------------------------------------------
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# -------------------------------------------------------------------
# Aliases perso
# -------------------------------------------------------------------
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# -------------------------------------------------------------------
# Powerlevel10k config
# -------------------------------------------------------------------
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

# -------------------------------------------------------------------
# Local machine-specific config
# -------------------------------------------------------------------
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
