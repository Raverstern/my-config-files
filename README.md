# My Vim Files
This repo stores my Vim configuration files. Storing Vim files by this way can easily synchronize my Vim environment into new machines.

For installing easily, I write the following guidance.

## Things will be installed
- Vundle
- YouCompleteMe
- GNU ARM assembly syntax files
- Taglist 4.6
- NERDTree
- winmanager.vim
- Buffer Explorer
- AirLine
- Molokai (Theme, only for GUI)
- Some vimscript files of mine

## Dependency
###Vim 7.4 or above
All tested on Vim 7.4 on Ubuntu.

###Git
Some important Vim plugins depend on the functionalities provided by Git. Install it first (using Ubuntu's way as an example):
```
$ sudo apt-get install git
```

###Ctags
*Taglist* needs the support from *Ctags*, which is an excellent tool any way. Install it manually:
```
$ sudo apt-get install exuberant-ctags
```

##Installation (Experimental)
First, clone this repo (change the following *YOUR_DIR* to certain directory, of course):
```
$ git clone https://github.com/Ricky-Gong/my-vim-files.git YOUR_DIR/
$ cd YOUR_DIR/
```

And then run the `config` script:
```
$ sh ./config.sh
```

That's it!

