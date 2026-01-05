# dotfiles

Personal macOS development setup (Ruby on Rails).

## Installation

```bash
git clone git@github.com:inicolas69/dotfiles.git
cd dotfiles
./install.sh
```

## Makefile

Alternative rapide aux scripts:

- `make install` : Brew + symlinks + defaults macOS
- `make brew` : installe les paquets du Brewfile
- `make brew-dump` : régénère le Brewfile depuis la machine
- `make links` : crée les symlinks (~/.zshrc, ~/.gitconfig...)
- `make macos` : applique les réglages macOS si `macos/defaults.sh` existe
- `make update` : brew update/upgrade/cleanup
- `make doctor` : vérifications (brew doctor + brew bundle check)
