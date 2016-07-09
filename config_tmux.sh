#! /bin/bash

ROOT=$(cd `dirname $0`; pwd) # path of the repo; must be absolute

# if Tmux has not been installed,
if [ -z "$(tmux -V 2> /dev/null)" ]
then
	echo "Tmux should be installed first."
	RIGHT_ANSWER=0
	until [ $RIGHT_ANSWER -eq 1 ]
	do
		echo "Do you have root or sudo privilige? [y/n]"
		read YN
		case "$YN" in
			y)
				sudo apt-get install tmux
				RIGHT_ANSWER=1
				;;
			n)
				echo "Then you can't install it. Contact the system manager."
				exit 1
				;;
			*)
				;;
		esac
	done
fi

# softlink .zshrc
ln -sf $ROOT/tmux.conf ~/.tmux.conf

