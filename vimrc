" My vimrc file.
"
" Maintainer:	Ricky Gong <ricky.gong@foxmail.com>
" Last change:	2015 Oct 14
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
    
" Vundle Config ----------------------------------------------{{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
" GNU ARM assembly syntax highlighting
Plugin 'ARM9/arm-syntax-vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" Based on an example. -------------------------------------------{{{

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
	  autocmd!

	  " For all text files set 'textwidth' to 78 characters.
	  autocmd FileType text setlocal textwidth=78

	  " When editing a file, always jump to the last known cursor position.
	  " Don't do it when the position is invalid or when inside an event handler
	  " (happens when dropping a file on gvim).
	  " Also don't do it when the mark is in the first line, that is the default
	  " position when opening a file.
	  autocmd BufReadPost *
	    \ if line("'\"") > 1 && line("'\"") <= line("$") |
	    \   exe "normal! g`\"" |
	    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
" }}}

" Taglist (using ctags) ----------------------------{{{
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1 
noremap <silent> <F9> :TlistToggle<cr> 
" }}}

" Basic Settings ------------------------------------{{{
let mapleader = "-"
let maplocalleader = "\\"

" edit/source my vimrc.
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" fast insert-mode escape
inoremap kj <esc>

" fast help
nnoremap <leader>h :help 

" move the current line downward/upward.
noremap <leader>- ddp
noremap <leader>_ kddpk

" uppercase the current word.
inoremap <leader><c-u> <esc>viwUi
nnoremap <leader><c-u> viwU

" put into double/single quotes --------------------------{{{
" put the current word into double/single quotes.
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" put the visually selected part into double/single quotes.
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>ll
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`>ll
" }}}

" open the previous buffer in a split
nnoremap <leader>pb :execute "rightbelow split " . bufname("#")<cr>

" highlight tailing whitespace as Error ------------------------------------{{{
nnoremap <leader>w :execute "normal! gg:match Error " . '/\v\s+$/' . "\r"<cr>
" clear the highlight
nnoremap <leader>W :match<cr>
" }}}

" auto insert \v when searching -------------{{{
nnoremap / /\v
nnoremap ? ?\v
" }}}

" super h/l: move to the beginning/end of the current line ----{{{
nnoremap H ^
nnoremap L $
" }}}

" inside/around the next/last paranthese --------------------{{{
" inside the next paranthese
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in) :<c-u>normal! f(vi(<cr>
" inside the last paranthese
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap il) :<c-u>normal! F)vi(<cr>
" around the next paranthese
onoremap an( :<c-u>normal! f(va(<cr>
onoremap an) :<c-u>normal! f(va(<cr>
" around the last paranthese
onoremap al( :<c-u>normal! F)va(<cr>
onoremap al) :<c-u>normal! F)va(<cr>
" }}}

"}}}

" force me to change habit ----------------------------------{{{
"inoremap <esc> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" }}}

" Personal information -------------------------------------------{{{
" e-mail address
iabbrev @@ ricky.gong@foxmail.com
" copyright declaration
iabbrev ccopy Copyright 2015 Ricky Gong, all rights reserved.
" signature
iabbrev ssig ----- <cr>Ricky Gong<cr>SMIE, Sun Yat-sen University<cr>ricky.gong@foxmail.com
" }}}

" FileType-specific Settings -------------------------------------------{{{

" C file settings -----------------------------------------------{{{
augroup filetype_c
	autocmd!
	" comment out the current line
	autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
	" supplement semicolon at the end of current line
	autocmd FileType c nnoremap <buffer> <localleader>; :execute "normal! mqA;\e`q"<cr>
	" show line number
	autocmd FileType c setlocal number
augroup END
" }}}

" Cpp file settings -----------------------------------------------{{{
augroup filetype_cpp
	autocmd!
	autocmd FileType cpp nnoremap <buffer> <localleader>c I//<esc>
	autocmd FileType cpp nnoremap <buffer> <localleader>; :execute "normal! mqA;\e`q"<cr>
	autocmd FileType cpp setlocal number
augroup END
" }}}

" Vimscript file settings -----------------------------------------------{{{
augroup filetype_vim
	autocmd!
	" comment out the current line
	autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
	" show line number, set fold method and disable auto line breaking
	autocmd FileType vim setlocal number foldmethod=marker textwidth=0
	" fold everything in the beginning
	autocmd FileType vim setlocal foldlevel=0
	" left-side foldcolumn's width
	autocmd FileType vim setlocal foldcolumn=4
augroup END
" }}}

" Python file settings -----------------------------------------------{{{
augroup filetype_python
	autocmd!
	autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
	autocmd FileType python setlocal number
augroup END
" }}}

" Markdown file settings -----------------------------------------------{{{
augroup filetype_markdown
	autocmd!
	autocmd BufNewFile,BufRead *.md set filetype=markdown
	" inside header
	autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^\\(=\\\|-\\)\\{2,}$\r:nohlsearch\rkvg_"<cr>
	" around header
	autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^\\(=\\\|-\\)\\{2,}$\r:nohlsearch\rg_vk0"<cr>
	autocmd FileType markdown setlocal number
augroup END
" }}}

" GNU ARM assembly file settings -----------------------------------------------{{{
augroup filetype_gnu_arm
	autocmd!
	autocmd BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7
	autocmd FileType arm setlocal number
augroup END
" }}}

" }}}

