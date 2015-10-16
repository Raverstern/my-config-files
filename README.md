# My Vim Files
This repo stores my Vim configuration files. Storing Vim files this way can easily synchronize my Vim environment into new machines.

For installing easily, I write the following guidance.

## Things will be installed
- Vundle
- YouCompleteMe
- GNU ARM assembly syntax files
- Taglist 4.6
- Some other my own vimscript files 

## Dependency
###Vim 7.4 or above
All tested on Vim 7.4 on Ubuntu.

###Git
Some important Vim plugins depend on the functionalities provided by Git. Please install it first (using Ubuntu's way as an example):
```
$ sudo apt-get install git
```

###Ctags
Taglist needs the support from Ctags, which is an excellent tool any way. Please install it by yourself:
```
$ sudo apt-get install exuberant-ctags
```

##Installation
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

