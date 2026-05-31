# Remove the default shadow from screenshots
defaults write com.apple.screencapture "disable-shadow" -bool "true"

# Set default screenshot location to ~/Pictures/Screenshots
mkdir -p ~/Pictures/Screenshots
defaults write com.apple.screencapture "location" -string "~/Pictures/Screenshots" && killall SystemUIServer
