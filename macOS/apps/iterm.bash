curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

DOWNLOAD_PATH=~/Downloads/GitHub\ Dark\ Default.itermcolors

curl https://raw.githubusercontent.com/cdalvaro/github-theme-iterm/HEAD/GitHub%20Dark%20Default.itermcolors -o "$DOWNLOAD_PATH"

open "$DOWNLOAD_PATH" && rm "$DOWNLOAD_PATH"
