# ~/.zshrc

source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


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
# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias dev="cd ~/Development"

# ls
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# Homebrew
alias brew="arch -arm64 brew"

# Docker
alias dc="docker compose"
alias dr="docker-remote"

# Git
alias gpo="git pull origin"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gcm="git checkout master"
alias gs="git status"
alias gn="git reset --hard HEAD && git clean -fd"

# Project aliases
alias ukho="cd ~/Development/work-projects/ukho-admiralty"
alias rathbones="cd ~/Development/work-projects/rathbones-v2"
alias alphera="cd ~/Development/work-projects/alphera-v2"
alias oc="cd ~/Development/work-projects/osborne-clarke"
alias pidsa="cd ~/Development/work-projects/pidsa-drupal"

# Misc
alias neofetch="zeitfetch"
alias lg='lazygit'

# LazyGit
function lg() {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

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
	docker compose down
	docker compose up -d
}

# Start Drupal Site
function startDrupal() {
	docker-composer install
	docker-drush --uri=$1 cr
	docker-drush --uri=$1 cim -y
}

# Start Site Studio
function importSiteStudio() {
	print target environment: @$1.$2
	docker-drush @$1.$2 cr
	docker-drush @$1.$2 cohesion:import
	docker-drush @$1.$2 cim $3
	docker-drush @$1.$2 sitestudio:package:import --diff $3
	docker-drush @$1.$2 cohesion:rebuild
}

export PATH=$PATH:/Users/aidan.wickes/.spicetify

eval "$(starship init zsh)"

eval $(thefuck --alias)
