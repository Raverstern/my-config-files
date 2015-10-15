" Please read [:help map-operator]. There provides a prototype, which is similar to this one.
" And please read [:help visualmode()], to see the return value of this function.
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>
" for convenient jumping between grepped results.
nnoremap 8 :cprevious<cr>
nnoremap 9 :cnext<cr>

function! s:GrepOperator(type)
	" save the original content of unnamed register
	" the coming yanking(y) will ruin it, which may cause surprises
	let saved_unnamed_register = @@
	
	if a:type ==# 'v'
		execute "normal! `<v`>y"
	elseif a:type ==# 'char'
		execute "normal! `[v`]y"
	else
		return
	endif

	silent execute "grep! -R " . shellescape(@@) . " ."
	copen

	" reload the content
	let @@ = saved_unnamed_register
endfunction
