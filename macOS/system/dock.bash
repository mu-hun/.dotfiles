# Set the icon size of Dock items to 44 pixels
defaults write com.apple.dock tilesize -int 44

defaults write com.apple.dock "orientation" -string "right"

# Autohide the Dock when the mouse is out
defaults write com.apple.dock "autohide" -bool "true"
# Remove the autohide delay, the Dock appears instantly
defaults write com.apple.dock "autohide-delay" -float "0"

# Do not display recent apps in the Dock
defaults write com.apple.dock "show-recents" -bool "false"

# Enable spring loading for all Dock items
# defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
# defaults write com.apple.dock show-process-indicators -bool true

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array

# Show only open applications in the Dock
#defaults write com.apple.dock static-only -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

killall Dock
