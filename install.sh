#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Installing dotfiles from: $DOTFILES_DIR"

# 1) Command Line Tools (git/make…)
if ! xcode-select -p >/dev/null 2>&1; then
  echo "❌ Xcode Command Line Tools manquants."
  echo "➡️ Lance: xcode-select --install"
  echo "Puis relance: $DOTFILES_DIR/install.sh"
  exit 1
fi

# 2) Homebrew
if ! command -v brew >/dev/null 2>&1; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # shellenv pour que brew soit dispo dans CE shell
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# 3) Make
if ! command -v make >/dev/null 2>&1; then
  echo "❌ 'make' introuvable (bizarre si CLT installés)."
  exit 1
fi

# 4) Appel du Makefile (orchestrateur)
make -C "$DOTFILES_DIR" install
