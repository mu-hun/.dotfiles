# MacBook Pro setup methods

## karabiner-elements

```
ln -sf ~/.dotfiles/macOS/karabiner.json ~/.config/karabiner/karabiner.json
```

### iterm2

Download [`GitHub Dark Default.itermcolors`](https://raw.githubusercontent.com/cdalvaro/github-theme-iterm/HEAD/GitHub%20Dark%20Default.itermcolors) and open it.

## App Store

- Alt Tab
- Command X
- BandiZip
- alfred
- [GPG Suite](https://gpgtools.org/)

## Enable AAC and aptX Audio Codecs

1. Go to [apple developer page](https://developer.apple.com/download/more/) and download 'Hardware IO Tools for Xcode'
2. Move `Bluethooth Explorer.app` to Applications Folder
3. Open Bluethooth Explorer and Click Tools > Audio Options..
4. Check 'Force use of aptX' and 'Enable AAC'
5. <kbd>⇧ shift</kbd> <kbd>⌥ option</kbd> with click bluetooth icon on menu bar, Debug > Reset the Bluetooth module
