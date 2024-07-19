/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

brew install node neovim
brew install --cask iterm2 visual-studio-code firefox@developer-edition google-chrome minecraft steam pdf-expert muse telegram-desktop discord raycast gpg-suite

# ln -sf ~/.dotfiles/macOS/karabiner.json ~/.config/karabiner/karabiner.json
