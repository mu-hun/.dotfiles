# MacBook Pro setup methods

## [`brew`](https://brew.sh)

- tmux fzf
- hub yarn neovim
- python scrpy pandoc
- node hugo

## [`brew cask`](https://caskroom.github.io/)

- alfred iterm2 karabiner-elements keyboard-maestro
- atom visual-studio-code oni
- google-chrome firefox vivaldi
- minecraft steam
- pdfexpert typora calibre muse
- processing android-platform-tools
- telegram-desktop discord keybase

## `eazy_install`

- trash-cli

## KeyBoard Maestro

`../Macros.kmmacros` import

## `crontab`

### `sudo vi /usr/lib/cron/tabs/root`

`30 */6 *** rm /Library/Caches/com.apple.desktop.admin.png`

### `crontab -e`

> Temporary file error occurring in nvim use `env EDITOR=vim crontab -e` instead of `crontab -e`

`0 9-23/3 * * * cd ~/github/BetaFish/commit-telegram-bot/ && pipenv run python index.py`
