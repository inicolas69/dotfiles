#!/usr/bin/env bash
set -e

echo "🚀 Installing dotfiles..."

# Homebrew
if ! command -v brew >/dev/null 2>&1; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "📦 Installing Homebrew packages..."
brew bundle --file="$HOME/dotfiles/Brewfile"

echo "🔗 Creating symlinks..."

ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
ln -sf "$HOME/dotfiles/zsh/.aliases" "$HOME/.aliases"
ln -sf "$HOME/dotfiles/git/.gitconfig" "$HOME/.gitconfig"

echo "✅ Done. Restart your terminal."
