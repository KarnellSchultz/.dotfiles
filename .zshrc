# https://www.youtube.com/watch?v=ud7YxC33Z3w&t=529s
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# XXL
export XXL_FES_PATH="/Users/karnellschultz/xxl/xxl-frontend-service"
export EDITOR="zed --wait"
export ASSUMED_ROLE="xxldev"
export JAVA_HOME="/opt/homebrew/opt/openjdk@11"
export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
# personal
export PATH="$PATH:/Users/karnellschultz/.local/bin"
# bun completions
[ -s "/Users/karnellschultz/.bun/_bun" ] && source "/Users/karnellschultz/.bun/_bun"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
# pnpm
export PNPM_HOME="/Users/karnellschultz/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# use fnm to set the default node version to 20 and quiet the output
 nvm default 21 >/dev/null 2>&1
# fnm
export PATH="/Users/karnellschultz/Library/Application Support/fnm:$PATH"
eval "`fnm env`"

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found

zinit cdreplay -q

# Load completions
autoload -Uz compinit && compinit

alias nvm="fnm"
alias pn=pnpm
alias y=yarn
alias awsume=". awsume"
alias cd=z
alias lg="lazygit"
alias vim="nvim"
alias ls='ls --color'
alias vim='nvim'
alias c='clear'

#Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
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

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"

# XXL stuff below

# Start ssh-agent
eval $(ssh-agent) >/dev/null


if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
fi
