# load env variables if the file exists
if [ -f ~/.zshenv ]; then
    source ~/.zshenv
fi

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
alias uni="cd $HOME/Dropbox/university"
alias bup="brew update && brew upgrade && brew cleanup"
alias ls="eza"
alias la="ls -a"
alias ll="ls -l"
alias lh="ls -lh"
alias tree="tree -C"
alias icloud="cd $HOME/Library/Mobile\ Documents"
alias gaa="git add --all"
alias gcm="git commit -m"
alias gp="git push"
alias create-url="echo '[InternetShortcut]\nURL=' > repo.url"
alias tin="tmux attach-session -t 0 || tmux"
alias activate="source venv/bin/activate"
notify_tg() {
    if [ -z "$1" ]; then
        echo "Error: No PID provided."
        echo "Usage: notify_tg <PID>"
        return 1
    fi
    cd ~/Developer/projects/python/notify_pid_telegram
    source venv/bin/activate
    eval "nohup python3 notify.py $1 >/dev/null 2>&1 &"
    deactivate
    cd - >/dev/null
}

# path for go
export PATH="$GOPATH/bin:$PATH"

# path for brew
export PATH="/opt/homebrew/bin:$PATH"

# path for rust
export PATH="$HOME/.cargo/bin:$PATH"

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# haskell ghcup
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# load starship
eval "$(starship init zsh)"

[[ "$TERM_PROGRAM" == "CodeEditApp_Terminal" ]] && . "/Applications/CodeEdit.app/Contents/Resources/codeedit_shell_integration.zsh"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/federico/.lmstudio/bin"
