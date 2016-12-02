# source configuration file
if [[ -r ~/.zshcfg ]]; then
	source ~/.zshcfg
fi

HISTFILE=~/.zshhistory
SAVEHIST=16384
setopt APPEND_HISTORY
setopt SHARE_HISTORY # share history amongst all active sessions

autoload -U compinit && compinit # enable completion
setopt COMPLETE_ALIASES # complete aliases

autoload -U colors && colors # enable colors
PROMPT='%(?..[%B%F{red}%?%b%f] )%B%F{$ZSH_CFG_COLOR}%n%b%f@%m %# '
setopt PROMPT_SUBST # enable prompt substitution
ZLE_RPROMPT_INDENT=0 # disable space after RPROMPT
# load git-prompt.sh to show current branch
local SCRIPT_GIT_PROMPT=/usr/share/git-core/contrib/completion/git-prompt.sh
if [[ -r $SCRIPT_GIT_PROMPT ]]; then
	source $SCRIPT_GIT_PROMPT
	GIT_PS1_SHOWDIRTYSTATE=true # show unstaged (*) and staged (+) changes
	GIT_PS1_SHOWSTASHSTATE=true # show stash ($) state
	GIT_PS1_SHOWUNTRACKEDFILES=true # show untracked (%) files
	GIT_PS1_SHOWUPSTREAM="verbose" # show upstream differences
	RPROMPT='%1~ $(__git_ps1 "(%s) ")%T'
else
	RPROMPT='%1~ %T'
fi

setopt AUTO_CD # if a command can't be executed and is a path, cd to it
setopt CORRECT_ALL # try to correct spelling of all arguments in a line

# source aliases file
if [[ -r ~/.zshalias ]]; then
	source ~/.zshalias
fi

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
