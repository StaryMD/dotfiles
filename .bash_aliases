if [ -x "$(command -v eza)" ]; then
  alias ls='eza --icons=always --no-user'
  alias ll='eza -la --icons=always --no-user'
  alias lt='eza -l --icons=always --no-user -T'
  alias la='eza -l --icons=always --no-user --total-size'
fi

if [ -x "$(command -v eza)" ]; then
  alias code=codium
fi

alias alert='notify-send --urgency=critical "alert"'

if [ -x /usr/bin/dircolors ]; then
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
