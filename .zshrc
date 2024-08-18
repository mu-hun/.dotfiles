#
# zinit
#

### Added by Zinit's installer
if [[ ! -f ~/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "~/.local/share/zinit" && command chmod g-rwX "~/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "~/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

(( ${+_comps} )) && _comps[zinit]=_zinit

autoload -U is-at-least
if is-at-least 5.1 && [[ -d $HOME/.local/share/zinit/zinit.git ]]; then
  source ~/.local/share/zinit/zinit.git/zinit.zsh
	zinit ice depth=1

	# Load starship theme
	zinit ice as"command" from"gh-r" \
						atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
						atpull"%atclone" src"init.zsh"
	zinit light starship/starship

	zinit light-mode for \
			simnalamburt/cgitc \
			zdharma/fast-syntax-highlighting \
			agkozak/zsh-z

	# zsh-autosuggestions
  ZSH_AUTOSUGGEST_USE_ASYNC=1
  if is-at-least 5.3; then
    zinit ice silent wait'1' atload'_zsh_autosuggest_start'
  fi
	zinit light zsh-users/zsh-autosuggestions

	# zsh-yarn-autocompletions
	zinit ice atload"zpcdreplay" atclone'./zplug.zsh'
	zinit light g-plane/zsh-yarn-autocompletions

	# zsh-expand-all
  ZSH_EXPAND_ALL_DISABLE=word
  zinit light simnalamburt/zsh-expand-all

	# zsh-history-substring-search
	zinit light zsh-users/zsh-history-substring-search
	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down

	autoload -Uz compinit bashcompinit
  compinit
  bashcompinit
  zinit cdreplay
else
  # Default terminal
  case "${TERM}" in
    xterm-color|*-256color)
      PS1=$'\e[1;32m%n@%m\e[0m:\e[1;34m%~\e[0m%(!.#.$) ';;
    *)
      PS1='%n@%m:%~%(!.#.$) ';;
  esac

  autoload -Uz compinit bashcompinit
  compinit
  bashcompinit
fi

#
# zsh-sensible
#
stty stop undef

alias l='ls -lah'
alias mv='mv -i'
alias cp='cp -i'
alias mkdir='mkdir -p'

setopt auto_cd histignorealldups sharehistory
zstyle ':completion:*' menu select

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history


#
# lscolors
#
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedxbagxcad"
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=30;46:tw=0;42:ow=30;43"
export TIME_STYLE="+%y%m%d"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Put one of the following two linew in '.zshrc.local'
#
# alias ls='ls --color=tty'
# alias ls='ls -G'

#
# zsh-substring-completion
#
setopt complete_in_word
setopt always_to_end
WORDCHARS=''
zmodload -i zsh/complist

# Substring completion
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


#
# notify
#
if (( $+commands[osascript] )); then
	notify () {
		cat <<END | osascript
		display notification "$*" sound name "Glass" with title "Shell Notification"
		say "$*"
END
  }
fi


# language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#
# zshrc
#
if [[ -f ~/.fzf.zsh ]]; then source ~/.fzf.zsh; fi
if [[ "$TMUX" = "" ]]; then export TERM="xterm-256color"; fi

# bin
if [[ -d ~/.local/bin ]]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# homebrew
if [[ -d /opt/homebrew ]]; then
	export PATH="/opt/homebrew/bin:$PATH"
	export PATH="/opt/homebrew/sbin:$PATH"
fi

# iTerm2

if [[ -f ~/.iterm2_shell_integration.zsh ]] then
	source ~/.iterm2_shell_integration.zsh
fi

# Neovim
if (( $+commands[nvim] )); then
	export EDITOR=nvim
	alias vim="nvim"
	alias vi="nvim"
	alias vimdiff="nvim -d"
fi

# Golang
if (( $+commands[go] )) && [[ -d ~/go ]]; then
	export GOPATH="$HOME/go"
	export PATH="$PATH:$GOPATH/bin"
fi


# Ruby
if (( $+commands[ruby] )) && (( $+commands[gem] )); then
	GEM_HOME=$(ruby -e 'print Gem.user_dir')
	export GEM_HOME
	export PATH="$PATH:$GEM_HOME/bin"
fi

# yarn global
if (( $+commands[yarn] )); then
	export PATH="$(yarn global bin):$PATH"	
fi

# hub
if (( $+commands[hub] )); then
	alias git='hub'
fi

if (( $+commands[processing-java] )); then
	export PROCESSING_JAVA="/usr/local/bin/processing-java"
fi

# thefuck
if (( $+commands[thefuck] )); then
	eval $(thefuck --alias)
fi

# pip3
if (( $+commands[pip3] )); then
	alias pip='pip3'
fi

if (( $+commands[fzf] )); then
	function fzfpw() {
		fzf --preview '[[ $(file --mime {}) =~ binary ]] &&
		echo  {} is a binary file ||
		(highlight -O ansi -l {} ||
		coderay {} ||
		rougify {} ||
		cat {}) 2> /dev/null | head -500'
	}
fi

# npx
if (( $+commands[npx] )); then
	alias npm='npx npm'
fi



if (( $+commands[fzf-tmux] )); then
	# fe [FUZZY PATTERN] - Open the selected file with the default editor
	#   - Bypass fuzzy finder if there's only one match (--select-1)
	#   - Exit if there's no match (--exit-0)
	fe() {
		local files
		IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
		[[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
	}

	# Modified version where you can press
	#   - CTRL-O to open with `open` command,
	#   - CTRL-E or Enter key to open with the $EDITOR
	fo() {
		local out file key
		IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
		key=$(head -1 <<< "$out")
		file=$(head -2 <<< "$out" | tail -1)
		if [ -n "$file" ]; then
			[ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
		fi
	}

	# fd - cd to selected directory
	fd() {
		local dir
		dir=$(find ${1:-.} -path '*/\.*' -prune \
			-o -type d -print 2> /dev/null | fzf +m) &&
		cd "$dir"
	}

	# fda - including hidden directories
	fda() {
		local dir
		dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
	}

	# fdr - cd to selected parent directory
	fdr() {
		local declare dirs=()
		get_parent_dirs() {
			if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
			if [[ "${1}" == '/' ]]; then
				for _dir in "${dirs[@]}"; do echo $_dir; done
			else
			get_parent_dirs $(dirname "$1")
			fi
		}
		local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac)
		cd "$DIR"
	}

	# fh - repeat history
	fh() {
		print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
	}
fi

# fnm
if (( $+commands[fnm] )); then
	eval "`fnm env`"
fi
