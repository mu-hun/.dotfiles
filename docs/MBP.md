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
- atom visual-studio-code oni
- google-chrome firefox vivaldi
- minecraft steam
- pdfexpert typora muse microsoft-office
- processing android-platform-tools
- telegram-desktop discord keybase

# vscode

`ln -sf ~/.dotfiles/settings.json ~/Library/Application\ Support/Code/User/settings.json`

## `eazy_install`

- trash-cli

## `crontab`

### `sudo vi /usr/lib/cron/tabs/root`

`30 */6 *** rm /Library/Caches/com.apple.desktop.admin.png`

### `crontab -e`

> Temporary file error occurring in nvim use `env EDITOR=vim crontab -e` instead of `crontab -e`
