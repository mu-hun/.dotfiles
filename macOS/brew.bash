/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

ln -sf ~/.dotfiles/macOS/Brewfile ~
brew bundle --file ~/Brewfile

corepack enable && corepack install --global pnpm

ln -sf ~/.dotfiles/macOS/karabiner.json ~/.config/karabiner

ln -sf ~/.dotfiles/macOS/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty
