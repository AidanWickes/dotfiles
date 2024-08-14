# ~/.zshrc

source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


zstyle ':autocomplete:*' min-input 3
# Note: -e lets you specify a dynamically generated value.

# Override default for all listings
# $LINES is the number of lines that fit on screen.
zstyle -e ':autocomplete:*:*' list-lines 'reply=( $(( LINES / 3 )) )'

# Override for recent path search only
zstyle ':autocomplete:recent-paths:*' list-lines 10

# Override for history search only
zstyle ':autocomplete:history-incremental-search-backward:*' list-lines 8

# Override for history menu only
zstyle ':autocomplete:history-search-backward:*' list-lines 2000

# Aliases and functions
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias dev="cd ~/Development"

alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

alias brew="arch -arm64 brew"

alias dc="docker-compose"
alias dr="docker-remote"

alias gpo="git pull origin"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gcm="git checkout master"
alias gs="git status"

# Project aliases
alias ukho="cd ~/Development/work-projects/ukho-admiralty"
alias rathbones="cd ~/Development/work-projects/rathbones-v2"
alias alphera="cd ~/Development/work-projects/alphera-v2"
alias oc="cd ~/Development/work-projects/osborne-clarke"
alias pidsa="cd ~/Development/work-projects/pidsa-drupal"

# Restart local-dev-environment
function lde() {
	cd ~/Development/local-dev-environment
	./stop
	git pull
	./start
	cd ~
}

# Restart docker container
function restartDocker() {
	docker-compose down
	docker-compose up -d
}

# Start Drupal Site
function startDrupal() {
	docker-composer install
	docker-drush --uri=$1 cr
	docker-drush --uri=$1 cim -y
}

export PATH=$PATH:/Users/aidan.wickes/.spicetify

eval "$(starship init zsh)"

eval $(thefuck --alias)