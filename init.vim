" Init file for NeoVim
" Place it in ~/.config/nvim/init.vim

" vim-plug {{{
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}          " file explorer
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}  " git plugin for file explorer
Plug 'majutsushi/tagbar'                	     	      " class/function outline viewer

" Initialize plugin system
call plug#end()
"}}}

" Basic Settings {{{
let mapleader = "-"
let maplocalleader = "="

" edit/source my vimrc.
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" fast insert-mode escape
inoremap kj <esc>

" auto insert \v\c when searching (\c: ingore cases)
nnoremap / /\v\c
nnoremap ? ?\v\c

" show absolute & relative line number on the left
set number relativenumber
"}}}

" Coc {{{
" Remap keys for gotos
nmap <silent> <localleader>d <Plug>(coc-definition)
nmap <silent> <localleader>y <Plug>(coc-type-definition)
nmap <silent> <localleader>i <Plug>(coc-implementation)
nmap <silent> <localleader>r <Plug>(coc-references)
"}}}

" NERDTree {{{
" NERDTree Part -------------------------{{{
let g:NERDTree_title="[NERD Tree]"
let NERDTreeWinPos="right"
let NERDTreeQuitOnOpen=1
" let NERDTreeMinimalUI=1

noremap <silent> <F9> :NERDTreeToggle<cr> 
" noremap <silent> <F9> :NERDTreeFind<cr> 

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

" tagbar (using ctags) {{{
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = 2
noremap <silent> <f8> :tagbartoggle<cr> 
" }}}

" FileType-specific Settings {{{

" VimL/Vimscript {{{
augroup filetype_vim
	autocmd!
	" show line number, set fold method and disable auto line breaking
	autocmd FileType vim setlocal number foldmethod=marker textwidth=0
	" fold everything in the beginning
	autocmd FileType vim setlocal foldlevel=0
	" left-side foldcolumn's width
	autocmd FileType vim setlocal foldcolumn=2
augroup END
"}}}

" C/C++ {{{
augroup filetype_c_cpp
	autocmd!
	" show line number
	autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2 expandtab
augroup END
" }}}

" JSON {{{
augroup filetype_json
	autocmd!
	" show comment correctly under `coc_json`
	autocmd FileType json syntax match Comment +\/\/.\+$+
	autocmd FileType json setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

" }}}

"}}}
