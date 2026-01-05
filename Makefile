# =====================================
# Dotfiles Makefile
# =====================================

# Chemin absolu du repo (déduit automatiquement du Makefile)
DOTFILES_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

.DEFAULT_GOAL := help

.PHONY: help install brew brew-dump links macos update doctor

help:
	@echo ""
	@echo "Dotfiles commands:"
	@echo ""
	@echo "  make install    → Brew + symlinks + macOS defaults"
	@echo "  make brew       → Installe les paquets Homebrew (Brewfile)"
	@echo "  make brew-dump  → Regénère le Brewfile depuis la machine actuelle"
	@echo "  make links      → Crée les symlinks (~/.zshrc, ~/.gitconfig...)"
	@echo "  make macos      → Applique les réglages macOS"
	@echo "  make update     → brew update/upgrade/cleanup"
	@echo "  make doctor     → checks (brew doctor + brew bundle check)"
	@echo ""

install: brew links macos
	@echo "✅ Done."

brew:
	@echo "📦 Installing Homebrew packages..."
	@brew bundle --file="$(DOTFILES_DIR)/Brewfile"

brew-dump:
	@echo "💾 Regenerating Brewfile from current system..."
	@brew bundle dump --file="$(DOTFILES_DIR)/Brewfile" --force
	@echo "✅ Brewfile updated. Review/clean, then commit."

links:
	@echo "🔗 Creating symlinks..."
	@ln -sf "$(DOTFILES_DIR)/zsh/.zshrc" "$(HOME)/.zshrc"
	@ln -sf "$(DOTFILES_DIR)/zsh/.p10k.zsh" "$(HOME)/.p10k.zsh"
	@ln -sf "$(DOTFILES_DIR)/zsh/.aliases" "$(HOME)/.aliases"
	@ln -sf "$(DOTFILES_DIR)/git/.gitconfig" "$(HOME)/.gitconfig"

macos:
	@echo "🖥 Applying macOS defaults..."
	@if [ -f "$(DOTFILES_DIR)/macos/defaults.sh" ]; then bash "$(DOTFILES_DIR)/macos/defaults.sh"; else echo "ℹ️ No macos/defaults.sh"; fi

update:
	@echo "🔄 Updating Homebrew..."
	@brew update
	@brew upgrade
	@brew cleanup

doctor:
	@echo "🩺 Checking system..."
	@brew doctor || true
	@brew bundle check --file="$(DOTFILES_DIR)/Brewfile" || true
