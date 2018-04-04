# Reference :
# https://github.com/simnalamburt/.dotfiles/blob/master/config.fish

set fish_greeting ""

if not status --is-interactive; exit; end

function __path
  switch (count $argv)
  case 1
    if perl -e "exit(!(grep(m{^$argv[1]\$},split(':', \$ENV{PATH}))) > 0)"; return; end

    # Append to $PATH
    set PATH $PATH "$argv[1]" ^/dev/null
  case 2
    if perl -e "exit(!(grep(m{^$argv[1]\$},split(':', \$ENV{PATH}))) > 0)"; return; end
    if [ "$argv[2]" != "--force" ]; return 1; end

    # Prepend to $PATH
    set PATH "$argv[1]" $PATH ^/dev/null
  case '*'
    return 1
  end
end

if printf '%s\n' '2.2.0' $FISH_VERSION | sort --check=silent --version-sort
  # Current version ≥ 2.2.0
  function __available -a name
    command -v "$name" ^/dev/null >&2
  end
else
  # Current version < 2.2.0
  function __available -a name
    type "$name" ^/dev/null >&2
  end
end


#
# lscolors
#
set -x LSCOLORS 'Gxfxcxdxbxegedxbagxcad'
set -x LS_COLORS 'di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=30;46:tw=0;42:ow=30;43'
set -x TIME_STYLE '+%y%m%d'


#
# Fishrc
#
if not set -q TMUX; set TERM xterm-256color; end
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8

# ~/.local/bin
if [ -d ~/.local/bin ]
  __path "$HOME/.local/bin" --force
end

# Aliases
if __available tmux; alias irc='tmux attach -t irc'; end

# Neovim
if __available nvim
  set -x EDITOR nvim
  alias vi='nvim'
end

# Golang
if __available go; and [ -d "$HOME/.go" ]
  set -x GOPATH "$HOME/.go"
  __path "$GOPATH/bin"
end

# Ruby
if __available ruby; and __available gem
  set -x GEM_HOME (ruby -e 'print Gem.user_dir')
  __path "$GEM_HOME/bin"
end

# cargo install
if [ -d ~/.cargo/bin ]
  __path "$HOME/.cargo/bin"
end
# yarn global
if __available yarn
  __path "$HOME/.config/yarn/global/node_modules/.bin"
end

# chips <https://github.com/xtendo-org/chips>
# if [ -f ~/.config/chips/build.fish ] ; source ~/.config/chips/build.fish ; end

# calysto_processing
if __available processing-java
  set -x PROCESSING_JAVA /usr/local/bin/processing-java
end

# Referance : hub.github.com
if __available hub; alias git='hub'; end

# pip3
if __available pip3; alias pip='pip3'; end
