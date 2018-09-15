# .dotfiles

Requires `git` and `zsh`

```bash
git clone https://github.com/BetaF1sh/.dotfiles.git --depth=1 ~/.dotfiles

ln -sf ~/.dotfiles/.zshrc ~

mkdir -p ~/.gnupg; ln -sf ~/.dotfiles/gpg-agent.conf ~/.gnupg
ln -sf .dotfiles/.vimrc ~
ln -sf .dotfiles/.gitconfig ~
ln -sf .dotfiles/.gitexclude ~

# Optional dotfiles
cp ~/.dotfiles/.gitconfig.local ~

# chips     https://github.com/kinoru/chips

# mkdir -p ~/.config/fish;  ln -sf ~/.dotfiles/config.fish ~/.config/fish/
# mkdir -p ~/.config/chips; ln -sf ~/.dotfiles/plugin.yaml ~/.config/chips/
# mkdir -p ~/.config/fish;  ln -sf ~/.dotfiles/fishfile    ~/.config/fish/
```

--------
*dotfiles* was inspired by [simnalamburt/.dotfiles](https://github.com/simnalamburt/.dotfiles).

*dotfiles* is primarily distributed under the terms of the MIT license. See [LICENSE](./LICENSE) for details.
