# My Configuration Files

This repo stores my configuration files for Vim, Tmux and Zsh.

## Vim

### Plugins

#### Installed by the Shell script, no auto-maintainance

- Vundle (managed by itself after installation)
- Taglist 4.6 (Up to 4.5 in Github, lack of maintainance)
- Some vimscript files of mine

#### Installed and maintained by Vundle

- YouCompleteMe (Need further compilation, read its [website][1])
- GNU ARM assembly syntax highlighting
- NERDTree
- nerdtree-git-plugin
- winmanager 2.35 (Need to be patched to solve its incompatibility with NERDTree)
- bufexplorer
- AirLine
- AirLine Themes
- Molokai (ColorTheme, only for GUI)
- fugitive.vim
- rainbow parentheses
- Tabular

### Dependency

####Vim 7.4 or above

All tested on Vim 7.4 on Ubuntu.

####Git

Some important Vim plugins depend on the functionalities provided by Git. Install it first (using Ubuntu's way as an example):

	$ sudo apt-get install git


####Ctags

Taglist needs the support from Ctags, which is an excellent tool any way. Install it manually:

	$ sudo apt-get install exuberant-ctags


###Installation (Experimental)

First, clone this repo (change the following `YOUR_DIR` to certain directory, of course):

	$ git clone https://github.com/Ricky-Gong/my-vim-files.git YOUR_DIR/
	$ cd YOUR_DIR/


And then run the config.sh script:

	$ sh ./config.sh


That's it!

##Tmux

This repo stores my tmux.conf file.

##Zsh

This repo stores my zshrc file.

[1]:http://valloric.github.io/YouCompleteMe/#full-installation-guide
