#! /bin/bash

ROOT=$(cd `dirname $0`; pwd) # must be absolute path
VIMDIR=~/.vim

# detect if git has been installed, complain and quit if no.
if [ -z `which git` ]
then
	echo 'These Vim configurations depend on git.'
	echo 'But no git detected on runtime path (directories specified by $PATH).'
	echo 'Please install it into the system.'
	echo 'Quit.'
	exit
fi

# detect if Vundle has been installed, skip this step if yes.
if [ ! -w $VIMDIR/bundle/Vundle.vim/.git ]
then
	echo 'No Vundle installed.'
	echo 'Installing Vundle ...'
	git clone https://github.com/VundleVim/Vundle.vim.git $VIMDIR/bundle/Vundle.vim
fi

# detect if there's .vimrc existing, back up if yes.
if [ -f ~/.vimrc ]
then
	echo '.vimrc file exists. Backing it up.'
	mv --backup=numbered ~/.vimrc ~/.vimrc.backup
fi
# create symlinks.
ln -s $ROOT/vimrc		~/.vimrc

ln -sf $ROOT/grep-operator.vim	$VIMDIR/plugin/grep-operator.vim
ln -sf $ROOT/toggle.vim		$VIMDIR/plugin/toggle.vim


