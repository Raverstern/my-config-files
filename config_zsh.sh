#! /bin/bash

ROOT=$(cd `dirname $0`; pwd) # path of the repo; must be absolute

# if Zsh has not been installed,
if [ -z "$(zsh --version > /dev/null)" ]
then
	echo "Zsh should be installed first."
	RIGHT_ANSWER=0
	until [ $RIGHT_ANSWER -eq 1 ]
	do
		echo "Do you have root or sudo privilige? [y/n]"
		read YN
		case "$YN" in
			y)
				sudo apt-get install zsh
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

# if Oh-My-Zsh has not been installed, install it.
if [ ! -d ~/.oh-my-zsh ]
then
	# copied from Oh-My-Zsh website
	sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

# softlink .zshrc
ln -sf $ROOT/zshrc ~/.zshrc

