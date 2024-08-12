# ~/.zshrc

source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

# Aliases and functions
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias dev="cd ~/Development"

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
