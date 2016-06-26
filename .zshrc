HISTFILE=~/.zshhistory
SAVEHIST=16384
setopt APPEND_HISTORY
setopt SHARE_HISTORY

autoload -U compinit
compinit

autoload -U colors && colors
PROMPT="%{$fg_bold[cyan]%}%n%{%b$reset_color%}@%m %# "
RPROMPT="%~ %T"

setopt AUTO_CD
setopt CORRECTALL

if [[ -r ~/.zshalias ]]; then
	source ~/.zshalias
fi
