# My Configuration Files

This repo stores my configuration files for Vim, Tmux and Zsh.

## System Configuration

- Terminal: Guake (>= 3.5.1)
- Font: Ubuntu Mono Regular 11
- Palette: Solarized Dark Higher Contrast
- Login Shell: Tmux

## Vim

The followings need to be installed manually (or by the provided Shell script)

- Vundle (managed by itself after installation)
- Some vimscripts of mine
- [YouCompleteMe][1] compilation

Others will be installed and maintained automatically by Vundle.

Dependencies:

```
$ sudo apt install git exuberant-ctags
```

[1]:http://valloric.github.io/YouCompleteMe/#full-installation-guide

### Installation (Experimental)

First, clone this repo (change the following `YOUR_DIR` to certain directory, of course):

	$ git clone https://github.com/Ricky-Gong/my-vim-files.git YOUR_DIR/
	$ cd YOUR_DIR/

And then run the config.sh script:

	$ sh ./config.sh


## Tmux

Dependencies:

- Tmux Plugin Manager (TPM)
- tmux-resurrect

## Zsh

Dependencies:

- theme: bullet-train
- plugins: zsh-autosuggestions, zsh-syntax-highlighting


