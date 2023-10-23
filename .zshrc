# source antidote
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
# source ${ZDOTDIR:-~}/.antidote/antidote.zsh # for linux

autoload -Uz compinit && compinit
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
antidote load ${zsh_plugins}.txt
antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh

# history
alias history="history 1"
HISTFILE=~/.zsh_history
HISTSIZE=100000000000
SAVEHIST=100000000000
setopt SHARE_HISTORY
setopt histignoredups

# you may need to manually set your language environment
export LANG=en_US.UTF-8

# preferred editor for everything
# export EDITOR='nvim'

# aliases
alias uni="cd $HOME/Desktop/Dropbox/university"
alias bup="brew update && brew upgrade && brew cleanup"
alias ls="eza"
alias tree="tree -C"
alias icloud="cd $HOME/Library/Mobile\ Documents"
alias gaa="git add --all"
alias gcm="git commit -m"
alias gp="git push"
alias create-url="echo '[InternetShortcut]\nURL=' > repo.url"
alias tmux-enter="tmux attach-session -t 0 || tmux"

# path for go
export PATH=$HOME/go/bin:$PATH

# path for brew
export PATH=/opt/homebrew/bin:$PATH

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
alias g="$GOPATH/bin/g"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

# haskell ghcup
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# load starship
eval "$(starship init zsh)"

