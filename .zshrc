HISTFILE=~/.zshhistory
SAVEHIST=16384
setopt APPEND_HISTORY
setopt SHARE_HISTORY

autoload -U compinit
compinit

autoload -U colors && colors
PROMPT="%{$fg_bold[cyan]%}%n%{$reset_color%}@%m %{$fg_bold[white]%}%#%{$reset_color%} "
RPROMPT="%~ %T"

setopt AUTO_CD
setopt CORRECTALL

if [[ -r ~/.zshalias ]]; then
	source ~/.zshalias
fi
