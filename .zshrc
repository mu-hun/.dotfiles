#
# zplug
#
if [[ -f ~/.zplug/init.zsh ]]; then
	source ~/.zplug/init.zsh

	zplug "simnalamburt/zsh-expand-all"
	zplug "zsh-users/zsh-completions"
	zplug "zsh-users/zsh-autosuggestions"
	zplug "zsh-users/zsh-syntax-highlighting"
	zplug "zsh-users/zsh-history-substring-search"
	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down
	
	zplug "g-plane/zsh-yarn-autocompletions", hook-build:"./zplug.zsh", defer:2
	
	zplug "mafredri/zsh-async"
	
	zplug "simnalamburt/cgitc"
	
	zplug load
else
	PS1='%n@%m:%~%(!.#.$) '
fi

#
# zsh-sensible
#
stty stop undef

alias l='ls -lah'
alias mv='mv -i'
alias cp='cp -i'

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

#
# zshrc
#
if [[ -f ~/.fzf.zsh ]]; then source ~/.fzf.zsh; fi
if [[ "$TMUX" = "" ]]; then export TERM="xterm-256color"; fi

# zsh plugins
plugins=(
	git
	fasd
)

# ~/.local/bin
if [[ -d ~/.local/bin ]]; then
	export PATH="$HOME/.local/bin:$PATH"
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

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

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
	export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"
fi

# hub
if (( $+commands[hun] )); then
	alias git='hub'
fi

if (( $+commands[processing-java] )); then
	export PROCESSING_JAVA="/usr/local/bin/processing-java"
fi

# thefuck
if (( $+commands[thefuck] )); then
	eval $(thefuck --alias)
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

#
# pure
#
autoload -U promptinit; promptinit
prompt pure
