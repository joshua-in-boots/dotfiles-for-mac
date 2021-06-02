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

export PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '


