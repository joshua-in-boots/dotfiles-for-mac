export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
#               1 2 3 4 5 6 7 8 9 0 1
#               1 directory: Ex
#                 2 symbolic link: Fx
#                   3 socket: Bx
#                     4 pipe: Dx
#                       5 executable: Cx
#                         6 block special: eg
#                           7 character special: ed
#                             8 executable /w setuid: ab
#                               9 executable /w setgid: ag
#                                 10 directory writable to others, with sticky bit: ac
#                                   11 directory writable to others, with sticky bit: ad
# ANSI Color code
# a     black
# A     bold black, usually shows up as dark grey
# b     red
# B     bold red
# c     green
# C     bold green
# d     brown
# D     bold brown, usually shows up as yellow
# e     blue
# E     bold blue
# f     magenta
# F     bold magenta
# g     cyan
# G     bold cyan
# h     light grey
# H     bold light grey; looks like bright white
# x     default foreground or background

export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTFILE="$HOME/.bash_history"

# exclude ._* Files when building tar archives
export COPYFILE_DISABLE=true
export EDITOR='subl -w'

export PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '

# direnv specific config
eval "$(direnv hook bash)"

# Add tab completion for bash completion 2
if command -v brew 2&>/dev/null; then
 	for COMPLETION in $(brew --prefix)/etc/bash_completion.d/*; do
			[[ -f "$COMPLETION" ]] && source "$COMPLETION"
	done
	if [[ -f "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]]; then
		source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
  	fi
fi

if [ -f "$HOME/.aliases" ]; then
	source "$HOME/.aliases"
fi

# pyenv specific config
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# functions
# if there is a single argument, open its man page using the URL
# this opens the 'yellow' single window man page in Terminal.app

# if there are two arguments, interpret the first as the section
# for unknown reasons the section has to come _first_ in the URL

if [[ -z $2 ]]; then
	open x-man-page://"$1"
else
	open x-man-page://"$2"/"$1"
fi
