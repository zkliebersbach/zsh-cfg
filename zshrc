# source configuration file
source-safe ~/.zshcfg

CFGDIR=$HOME/.local/share/zsh-cfg
HISTFILE=~/.zshhistory
SAVEHIST=16384
setopt APPEND_HISTORY
setopt SHARE_HISTORY # share history amongst all active sessions

autoload -U compinit && compinit # enable completion
setopt COMPLETE_ALIASES # complete aliases
autoload bashcompinit && bashcompinit # enable bash completions
source $CFGDIR/wp-completion.bash # enable wp-cli completion

autoload -U colors && colors # enable colors
setopt PROMPT_SUBST # enable prompt substitution
PROMPT='%(?..[%B%F{red}%?%b%f] )%B%F{$ZSH_CFG_COLOR}%n%b%f@%m %# '

autoload -Uz vcs_info # enable vcs_info
precmd() { vcs_info }
RPROMPT='%1~ ${vcs_info_msg_0_}%T'
# set vcs_info style
zstyle ':vcs_info:*'	check-for-changes	true
zstyle ':vcs_info:*'	enable			git
zstyle ':vcs_info:*'	actionformats		'(%b|%a%m) [%u%c] '
zstyle ':vcs_info:*'	formats			'(%b%m) [%u%c] '
### git: Show +N/-N when your local branch is ahead-of or behind remote HEAD.
# Make sure you have added misc to your 'formats':  %m
zstyle ':vcs_info:git*+set-message:*' hooks git-st
function +vi-git-st() {
	local ahead behind
	local -a gitstatus

	ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
	(( $ahead )) && gitstatus+=( "+${ahead}" )

	behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
	(( $behind )) && gitstatus+=( "-${behind}" )

	hook_com[misc]+=${(j:/:)gitstatus}
}

setopt AUTO_CD # if a command can't be executed and is a path, cd to it

# source aliases file
source-safe ~/.zshalias
