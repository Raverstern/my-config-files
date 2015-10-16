" Toggle left-side fold column --------------------------{{{
nnoremap <leader>f :call <SID>FoldColumnToggle()<cr>

function! s:FoldColumnToggle()
	if &foldcolumn
		setlocal foldcolumn=0
	else
		setlocal foldcolumn=4
	endif
endfunction
" }}}

" Toggle Quickfix Window ----------------------------------------{{{
nnoremap <leader>q :call <SID>QuickfixToggle()<cr>

let s:quickfix_is_open = 0

function! s:QuickfixToggle()
	if s:quickfix_is_open
		cclose
		let s:quickfix_is_open = 0
		execute s:quickfix_return_to_window . "wincmd w"
	else
		let s:quickfix_return_to_window = winnr()
		copen
		let s:quickfix_is_open = 1
	endif
endfunction
" }}}

" Toggle Line Number ----------------------------------------{{{
nnoremap <leader>n :call <SID>LineNumberToggle()<cr>

function! s:LineNumberStyleDetect()
	let l:num = &number
	let l:rnum = &relativenumber

	if l:num == 0 && l:rnum == 0
		let b:number_type = 0
	elseif l:num == 1 && l:rnum == 0
		let b:number_type = 1
	else 
		let b:number_type = 2
	endif

endfunction

function! s:LineNumberToggle()
	if !exists("b:number_type")
		let b:number_type = 0
		call s:LineNumberStyleDetect()
	endif

	if b:number_type == 0
		let b:number_type = 1
		set number norelativenumber
	elseif b:number_type == 1
		let b:number_type = 2
		set number relativenumber
	else
		let b:number_type = 0
		set nonumber norelativenumber
	endif
endfunction
" }}}
