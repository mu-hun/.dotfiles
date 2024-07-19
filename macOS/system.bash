# macOS defaults document: https://macos-defaults.com
# I referenced defaults tool scripts from https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# System Prefrences
system_preferences=(
  general
  dock
  mission-control
  keyboard
  trackpad
	input
	finder
)

# Sources all the preference files
for pane in "${system_preferences[@]}"; do
  file=("./macOS/system/${pane}.bash")
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
