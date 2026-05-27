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

## Colima (Docker runtime)

Auto-start Colima at login via LaunchAgent. Handled by `install-macos` automatically.

Starts with: `--cpu 1 --memory 2 --vm-type vz`

Logs: `/tmp/colima.startup.log`, `/tmp/colima.startup.err`

