setopt AUTO_CD
setopt NO_CASE_GLOB
# make zsh add a bit more data
# (timestamp in unix epoch time and elapsed time of the command)
setopt EXTENDED_HISTORY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# update the history file after every command
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
# ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# make a guess of what you meant to type and
# ask whether you want do that instead
setopt CORRECT
setopt CORRECT_ALL
CORRECT_IGNORE_FILE='.*'

# exclude ._* Files when building tar archives
export COPYFILE_DISABLE=true
export EDITOR='subl -w'

# direnv specific config
eval "$(direnv hook zsh)"

PROMPT='%F{yellow}%n%f %F{blue}%~%f $(git_super_status) %# '

source /usr/local/opt/zsh-git-prompt/zshrc.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

if type brew &>/dev/null; then
	fpath=($(brew --prefix)/share/zsh-completions $fpath)
fi

zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit -i

# History
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
bindkey -e

# Bindkey for History Search
# when you start typing a command and then hit the up key, rather than just 
# replacing what you already typed with the previous command, the shell will 
# instead search for the latest command in the history starting with what you 
# already typed.
bindkey $'^[[A' up-line-or-search    # up arrow
bindkey $'^[[B' down-line-or-search  # down arrow

# Aliases
if [ -f "$HOME/.aliases" ]; then
	source "$HOME/.aliases"
fi

if [ -f "$HOME/.aliases-private" ]; then
	source "$HOME/.aliases-private"
fi

# Functions
manpdf() {
	man -t "${1}" | open -f -a /System/Applications/Preview.app/
}

man() {
	if [[ -z $2 ]]; then
		open x-man-page://"$1"
	else
		open x-man-page://"$2"/"$1"
	fi
}

# Java
unset JAVA_HOME; export JAVA_HOME=$(/usr/libexec/java_home -v 11.0.11)

# Package managers / utilities
# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"

# pyenv-virtualenv
if command -v pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

neofetch

# Always keep this line at last
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
