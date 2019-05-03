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

Plugin 'VundleVim/Vundle.vim'             " let Vundle manage Vundle, required
Plugin 'Valloric/YouCompleteMe'           " semantic auto-completor
Plugin 'scrooloose/nerdtree'              " file explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'      " git plugin for file explorer
Plugin 'vim-airline/vim-airline'          " AirLine
Plugin 'vim-airline/vim-airline-themes'   " AirLine Themes
Plugin 'tomasr/molokai'                   " colorscheme
Plugin 'ErichDonGubler/vim-sublime-monokai' " colorscheme
Plugin 'altercation/vim-colors-solarized' " colorscheme
Plugin 'tpope/vim-fugitive'               " git wrapper
Plugin 'luochen1990/rainbow'              " use different colors to indicate different layers of parens, brackets, etc.
Plugin 'godlygeek/tabular'                " text alignment
Plugin 'terryma/vim-multiple-cursors'     " search and edit multiple matches at once
Plugin 'Raimondi/delimitMate'             " insert mode auto-completion for quotes, parens, brackets, etc.
Plugin 'majutsushi/tagbar'                " class/function outline viewer
Plugin 'airblade/vim-gitgutter'           " shows git diff in the left of the window
Plugin 'scrooloose/nerdcommenter'         " inserts comment more easily
Plugin 'plasticboy/vim-markdown'          " syntax highlighting for Markdown
Plugin 'tpope/vim-liquid'                 " liquid runtime files with Jekyll enhancements
" haven't found good keymaps
Plugin 'SirVer/ultisnips'                 " UltiSnips engine
Plugin 'honza/vim-snippets'               " snippets for various languages

"Plugin 'lifepillar/vim-solarized8'        " colorscheme
"Plugin 'ARM9/arm-syntax-vim'             " GNU ARM assembly syntax highlighting
"Plugin 'Yggdroot/indentLine'             " indicate indentation (works well for 'shiftwidth'>=4, but doesn't look good for 2)
"Plugin 'tmhedberg/matchit'               " extend functionality of '%' key to cycle between HTML tags and if-else keywords (yet doesn't work for C/C++ at least)
"Plugin 'jiangmiao/auto-pairs'            " more powerful auto-completion for quotes, parens, brackets, etc.
"Plugin 'octol/vim-cpp-enhanced-highlight'" additional syntax highlighting for C++ (including C++11/14/17)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help {{{

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

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"}}}

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}


" Basic Settings {{{
if exists('$TMUX')
	set term=screen-256color
endif

if has("gui_running")
	set guifont=Hack\ 10
	set guioptions-=T
	set guioptions-=r
endif
set background=dark
colorscheme sublimemonokai

let mapleader = "-"
let maplocalleader = "="

set fileencodings=utf-8,gb18030,gb2312,gbk,latin1


" edit/source my vimrc.
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" fast insert-mode escape
inoremap kj <esc>

" switch among buffers
if has("gui_running")
	nnoremap <c-tab> :bnext<cr>
	nnoremap <c-s-tab> :bNext<cr>
	" nnoremap <c-w> :bdelete<cr>
endif

" fast help
"nnoremap <leader>h :help

" move the current line downward/upward.
"noremap <leader>- ddp
"noremap <leader>_ kddpk

" uppercase the current word.
"inoremap <leader><c-u> <esc>viwUi
"nnoremap <leader><c-u> viwU

"" learnt from Jason Turner
"" video: https://www.youtube.com/watch?v=EJtqHLvAIZE&t=8s
"" vimrc: https://gist.github.com/lefticus/9310227/e0a7a531979e9b77620c7e6678bcca7926c8cc08
" highlight search result WHILE typing
set incsearch
" highlight cursor line
"hi CursorLine cterm=standout ctermbg=none ctermfg=none gui=standout guibg=NONE guifg=NONE
set cursorline
" show tab and trailing spaces
set lcs=trail:·,tab:»-
set list

" change working directory to the file being edited
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>


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

" use virutla edit for blocks in visual mode
set virtualedit=block

set tabstop=2 shiftwidth=2 expandtab number
"}}}


" YouCompleteMe {{{

" disable YCM if VIM's version < 7.4.143
if !has("patch-7.4.143")
	let g:loaded_youcompleteme=1
endif

let g:ycm_warning_symbol = '>*'
let g:ycm_confirm_extra_conf = 1
let g:ycm_extra_conf_globlist = ['./*'] " whitelisted, no confirmation
"let g:ycm_extra_conf_globlist = ['~/programming/opencv/*','~/Documents/LectureWS16/*']
let g:ycm_autoclose_preview_window_after_insertion = 1

" collaborate with UltiSnips (https://gist.github.com/lencioni/dff45cd3d1f0e5e23fe6)
"let g:ycm_key_list_select_completion = ['<C-j>', '<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" More configs are in <Cpp Filetype-specific Settings>
" }}}


" UltiSnips {{{
" collaborate with YCM (https://gist.github.com/lencioni/dff45cd3d1f0e5e23fe6)
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-tab>'
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" default one (<c-tab>) doesn't work
let g:UltiSnipsListSnippets="<c-space>"

let g:UltiSnipsEditSplit = "vertical"
" }}}


" Tagbar (using ctags) {{{
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = 2
noremap <silent> <F8> :TagbarToggle<cr> 
" }}}


" NERDTree {{{
" NERDTree Part -------------------------{{{
let g:NERDTree_title="[NERD Tree]"
let NERDTreeWinPos="right"
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1

noremap <silent> <F9> :NERDTreeToggle<cr> 
" noremap <silent> <F9> :NERDTreeFind<cr> 

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


" AirLine {{{

set laststatus=2
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_right_sep = '«'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = '㏑'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" choose a theme (if not follow the vim colorscheme):
" https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme='dark' " 'sol'

" displays all buffers when only one tab opened
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline#extensions#tabline#right_sep = ''
"let g:airline#extensions#tabline#right_alt_sep = ''

" set bg of 'solarized' airline theme, if not follow vim's setting
"let g:airline_solarized_bg='dark'
" }}}


" Rainbow Parentheses {{{
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['darkblue', 'darkyellow', 'darkcyan', 'darkmagenta'],
\}
" }}}


" Tabularize {{{
nmap <leader>a= :Tabularize /=\zs<CR>
vmap <leader>a= :Tabularize /=\zs<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>
" }}}


" delimitMate {{{
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
" }}}


" NERD commenter {{{
let NERDSpaceDelims = 1
let NERDTrimTrailingWhitespace = 1
" }}}


" VIM Markdown {{{
let g:vim_markdown_folding_disabled = 1
" }}}


" FileType-specific Settings {{{

" C/C++ file settings -----------------------------------------------{{{
augroup filetype_c_cpp
	autocmd!
	" comment out the current line (replaced by NERDCommenter)
	"autocmd FileType c,cpp nnoremap <buffer> <localleader>c I//<esc>
	" supplement semicolon at the end of current line
	autocmd FileType c,cpp nnoremap <buffer> <localleader>; :execute "normal! mqA;\e`q"<cr>
	" show line number
	autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2 expandtab number
	" from Ycm
	autocmd FileType c,cpp nnoremap <localleader>k :YcmCompleter GoToDeclaration<CR>
	autocmd FileType c,cpp nnoremap <localleader>d :YcmCompleter GoToDefinition<CR>
	autocmd FileType c,cpp nnoremap <localleader>g :YcmCompleter GoTo<CR>
	autocmd FileType c,cpp nnoremap <localleader>t :YcmCompleter GetType<CR>
	autocmd FileType c,cpp nnoremap <localleader>f :YcmCompleter FixIt<CR>
	autocmd FileType c,cpp nnoremap <F4> :YcmDiags<CR>
	autocmd FileType c,cpp nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
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
	" 4 spaces for showing, auto-indenting and expanding a tab
	" http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
	autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab number
	" from Ycm
	autocmd FileType python nnoremap <localleader>k :YcmCompleter GoToDeclaration<CR>
	autocmd FileType python nnoremap <localleader>d :YcmCompleter GoToDefinition<CR>
augroup END
" }}}

" Java file settings -----------------------------------------------{{{
augroup filetype_java
	autocmd!
	" 4 spaces for showing, auto-indenting and expanding a tab
	" http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
	autocmd FileType java setlocal tabstop=4 shiftwidth=4 expandtab number
augroup END
" }}}

" Matlab file settings -----------------------------------------------{{{
augroup filetype_matlab
	autocmd!
	autocmd FileType matlab nnoremap <buffer> <localleader>c I%<esc>
	autocmd FileType matlab setlocal number
	" 4 spaces for showing, auto-indenting and expanding a tab
	" http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
	autocmd FileType matlab setlocal tabstop=4 shiftwidth=4 expandtab
augroup END
" }}}

" Markdown file settings -----------------------------------------------{{{
augroup filetype_markdown
	autocmd!
	"autocmd BufNewFile,BufRead *.md set filetype=markdown
	" inside header
	autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^\\(=\\\|-\\)\\{2,}$\r:nohlsearch\rkvg_"<cr>
	" around header
	autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^\\(=\\\|-\\)\\{2,}$\r:nohlsearch\rg_vk0"<cr>
	autocmd FileType markdown setlocal number
	" move on virtual lines instead of logical lines, for easier navigation in case of having many wrapper long lines
	" refers to: http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
	autocmd FileType markdown noremap <buffer> k gk
	autocmd FileType markdown noremap <buffer> j gj
	autocmd FileType markdown noremap <buffer> 0 g0
	autocmd FileType markdown noremap <buffer> $ g$
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
	autocmd FileType sh setlocal tabstop=2 shiftwidth=2 expandtab number
augroup END
" }}}

" Html/CSS settings ----------------------------------------------------{{{
augroup filetype_html_css
	autocmd!
	autocmd FileType html,css setlocal tabstop=2 shiftwidth=2 expandtab number
augroup END
" }}}

" Cmake file settings -----------------------------------------------{{{
augroup filetype_cmake
	autocmd!
	autocmd FileType cmake nnoremap <buffer> <localleader>c I#<esc>
	" 4 spaces for showing, auto-indenting and expanding a tab
	" http://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
	autocmd FileType cmake setlocal tabstop=4 shiftwidth=4 expandtab number
augroup END
" }}}

" }}}


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


" Personal information {{{
" e-mail address
"iabbrev @@ ricky.gong@foxmail.com
" copyright declaration
"iabbrev ccopy Copyright 2015 Ruiqi Gong, all rights reserved.
" signature
"iabbrev ssig ----- <cr>Ruiqi Gong<cr>Sun Yat-sen University<cr>ricky.gong@foxmail.com
" }}}


" Taglist (deprecated) {{{
" let Tlist_Ctags_Cmd = '/usr/bin/ctags'
" let Tlist_Show_One_File = 1
" let Tlist_Exit_OnlyWindow = 1
" noremap <silent> <F8> :TlistToggle<cr> 
" }}}
