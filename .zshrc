# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git flutter vscode)

source $ZSH/oh-my-zsh.sh
export EDITOR='nvim'

source ~/.alias

# Load local environment variables
[ -s ~/.env_local ] && source ~/.env_local

