ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

source "${ZINIT_HOME}/zinit.zsh"

zstyle :compinstall filename '/home/vasea/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -Uz compinit && compinit

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Custom variables
if [ -f ~/.bash_variables ]; then
    . ~/.bash_variables
fi

# If in a git repository and has a CMakeLists.txt file, automatically start in the repo/build directory
if [ -d .git -a -r CMakeLists.txt ]; then
  mkdir -p build && cd build
fi

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

setopt rmstarsilent
