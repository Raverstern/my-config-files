" My vimrc file.
"
" Maintainer:	Ricky Gong <ricky.gong@foxmail.com>
" Last change:	2015 Oct 14
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc

" ==============================================================================
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
" NERD Tree File Explorer
Plugin 'scrooloose/nerdtree'
" nerdtree-git-plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'
" WinManager
Plugin 'winmanager--Fox'
" BufExplorer
Plugin 'bufexplorer.zip'
" AirLine
Plugin 'vim-airline/vim-airline'
" AirLine Themes
Plugin 'vim-airline/vim-airline-themes'
" Molokai (Only for GUI)
Plugin 'tomasr/molokai'
" fugitive.vim
Plugin 'tpope/vim-fugitive'
" rainbow parentheses
Plugin 'luochen1990/rainbow'
" Tabular
Plugin 'godlygeek/tabular'

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
" ==============================================================================
" Basic Settings {{{
if exists('$TMUX')
	set term=screen-256color
endif

" if has("gui_running")
" 	colorscheme molokai
" else
" 	colorscheme evening
" endif
colorscheme molokai

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

" always show relative line number of the left
set relativenumber
"}}}
" ==============================================================================
" Taglist (using ctags) {{{
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
noremap <silent> <F9> :TlistToggle<cr> 
" }}}
" ==============================================================================
" Config AirLine {{{
set laststatus=2
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
" }}}
" ==============================================================================
" Config WinManager & NERDTree {{{
" WinManager Part ------------------------------{{{
let g:winManagerWindowLayout="NERDTree|TagList,BufExplorer"
let g:winManagerWidth=35
let g:persistentBehaviour=0
nnoremap <leader>wm :WMToggle<CR>
" }}}

" NERDTree Part -------------------------{{{
let g:NERDTree_title="[NERD Tree]"

function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction

function! NERDTree_IsValid()  
    return 1  
endfunction
" }}}

" nerdtree git plugin -------------------------{{{
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" }}}
" }}}
" ==============================================================================
" YouCompleteMe {{{
let g:ycm_warning_symbol = '>*'
" Example: let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']
let g:ycm_extra_conf_globlist = ['~/programming/opencv/*']
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <localleader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <localleader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <localleader>gt :YcmCompleter GoTo<CR>
nnoremap <F4> :YcmDiags<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
" }}}
" ==============================================================================
" Rainbow Parentheses {{{
let g:rainbow_active = 1
" }}}
" ==============================================================================
" force me to change habit {{{
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
" ==============================================================================
" Personal information {{{
" e-mail address
iabbrev @@ ricky.gong@foxmail.com
" copyright declaration
iabbrev ccopy Copyright 2015 Ricky Gong, all rights reserved.
" signature
iabbrev ssig ----- <cr>Ricky Gong<cr>Sun Yat-sen University<cr>ricky.gong@foxmail.com
" }}}
" ==============================================================================
" FileType-specific Settings {{{

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
	" 4 spaces for showing, auto-indenting and expanding a tab
	" http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
	autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
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
	" disable <tab> in YouCompleteMe, since <tab> is frequently used in assembly programming
	autocmd FileType arm let g:ycm_key_list_select_completion = ['<Down>']
	autocmd FileType arm let g:ycm_key_list_previous_completion = ['<Up>']
augroup END
" }}}

" Shell Scripts file settings ----------------------------------------------------{{{
augroup filetype_shell_script
	autocmd!
	autocmd FileType sh setlocal number
augroup END
" }}}

" }}}
" ==============================================================================
