#!/bin/sh

# function to create a symlink
symlink () { # srcdir destdir [srcItem] item
	# even though the links point to the absolute path
	if [ -e "$1/$3" ]; then
		if [ ! -z "$4" ]; then
			ln -sFi "$1/$3" "$2/$4"
		else
			ln -sFi "$1/$3" "$2/$3"
		fi
	else
		echo "no file: $1/$3"
	fi
}

MY_PATH=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

symlink "${MY_PATH}" "${HOME}" "aliases" ".aliases"
symlink "${MY_PATH}" "${HOME}" "inputrc" ".inputrc"
symlink "${MY_PATH}" "${HOME}" "bash_profile" ".bash_profile"
symlink "${MY_PATH}" "${HOME}" "bashrc" ".bashrc"
symlink "${MY_PATH}" "${HOME}" "zshrc" ".zshrc"
