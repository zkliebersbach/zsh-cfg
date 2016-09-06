HISTFILE=~/.zshhistory
SAVEHIST=16384
setopt APPEND_HISTORY
setopt SHARE_HISTORY

autoload -U compinit
compinit

autoload -U colors && colors
PROMPT='%(?..[%{$fg_bold[red]%}%?%{$reset_color%}] )%{$fg_bold[cyan]%}%n%{$reset_color%}@%m %#  '
setopt PROMPTSUBST # enable prompt substitution
ZLE_RPROMPT_INDENT=0 # disable space after RPROMPT
# load git-prompt.sh to show current branch
local SCRIPT_GIT_PROMPT=/usr/share/git-core/contrib/completion/git-prompt.sh
if [[ -r $SCRIPT_GIT_PROMPT ]]; then
	source $SCRIPT_GIT_PROMPT
	GIT_PS1_SHOWDIRTYSTATE=true # show unstaged (*) and staged (+) changes
	GIT_PS1_SHOWSTASHSTATE=true # show stash ($) state
	GIT_PS1_SHOWUNTRACKEDFILES=true # show untracked (%) files
	GIT_PS1_SHOWUPSTREAM="verbose" # show upstream differences
	RPROMPT='%1~ $(__git_ps1 "(%s)") %T'
else
	RPROMPT='%1~ %T'
fi

setopt AUTO_CD
setopt CORRECTALL

if [[ -r ~/.zshalias ]]; then
	source ~/.zshalias
fi
