defaults write com.apple.HIToolbox AppleFnUsageType -int 0

# F1, F2, etc. behave as standard function keys.
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# Choose to enable moving focus with Tab and Shift Tab in modal dialogs
defaults write NSGlobalDomain AppleKeyboardUIMode -int "2"

# Turn off the language indicator while switching input sources.
defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled -bool "false"
