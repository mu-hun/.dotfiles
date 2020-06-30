# MacBook Pro setup methods

## remove the "last login" message

`touch ~/.huslogin`

## [`brew`](https://brew.sh)

- tmux fzf shpotify fasd neofetch
- hub yarn neovim
- python scrpy pandoc
- node hugo

## [`brew cask`](https://caskroom.github.io/)

- alfred iterm2 karabiner-elements
- visual-studio-code
- google-chrome firefox vivaldi
- minecraft steam
- pdf-expert typora muse
- android-platform-tools
- telegram-desktop discord

## `eazy_install`

- trash-cli

## `crontab`

### `sudo vi /usr/lib/cron/tabs/root`

`30 */6 *** rm /Library/Caches/com.apple.desktop.admin.png`

### `crontab -e`

> Temporary file error occurring in nvim use `env EDITOR=vim crontab -e` instead of `crontab -e`

## Enable AAC and aptX Audio Codecs

1. Go to [apple developer page](https://developer.apple.com/download/more/) and download 'Hardware IO Tools for Xcode'
2. Move `Bluethooth Explorer.app` to Applications Folder
3. Open Bluethooth Explorer and Click Tools > Audio Options..
4. Check 'Force use of aptX' and 'Enable AAC'
5. <kbd>⇧ shift</kbd> <kbd>⌥ option</kbd> with click bluetooth icon on menu bar, Debug > Reset the Bluetooth module

## Alfred

[`Dark.alfredappearance`](../Dark.alfredappearance)
