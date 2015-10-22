#! /bin/bash

PWD=$(pwd)
ROOT=$(cd `dirname $0`; pwd) # must be absolute path
VIMDIR='~/.vim'

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

# run the "PluginInstall" command
vim +PluginInstall! +qall

# installing Taglist 4.6
TAGLIST_46='http://www.vim.org/scripts/download_script.php?src_id=19574'
wget -O $VIMDIR/taglist_46.zip $TAGLIST_46
unzip $VIMDIR/taglist_46.zip
# generate help tags
cd $VIMDIR/doc
vim "+helptags ." +qall

# patch the old and buggy WindowsManager
cd $VIMDIR/bundle/winmanager/plugin
patch -p0 < $ROOT/winmanager.patch

# return to the original place
cd $PWD
