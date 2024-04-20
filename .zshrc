#various
setopt glob_dots                # include dotfiles in globbing
unsetopt bg_nice                # no lower prio for background jobs
unsetopt list_beep              # no bell on ambiguous completion
unsetopt hist_beep              # no bell on error in history
unsetopt beep                   # no bell on error

#env
source "$HOME/.alias"
source "$HOME/.env"

#antigen (oh-my-zsh)
#DISABLE_AUTO_UPDATE=false
source $HOME/.local/share/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
git
systemadmin
zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen theme robbyrussell
antigen apply
