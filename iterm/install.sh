#!/bin/sh
[ "$(uname -s)" != "Darwin" ] && exit 0
sed "s;/Users/carlos;$HOME;g" \
	"$DOTFILES"/iterm/com.googlecode.iterm2.plist.example >"$DOTFILES"/iterm/com.googlecode.iterm2.plist
defaults write com.googlecode.iterm2 "PrefsCustomFolder" -string "$DOTFILES/iterm"
defaults write com.googlecode.iterm2 "LoadPrefsFromCustomFolder" -bool true

mkdir -p ~/.local/share/iterm2
curl -L https://iterm2.com/shell_integration/zsh -o "$HOME/.local/share/iterm2/zsh_shell_integration.zsh"