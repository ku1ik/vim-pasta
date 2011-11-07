" pasta.vim - Pasting with indentation adjusted to paste destination"
" Author:     Marcin Kulik <http://ku1ik.com/>
" Version:    0.1

if exists("g:loaded_pasta") || &cp || v:version < 700
  finish
endif
let g:loaded_pasta = 1

function! s:normal_pasta(p, o)
  if (getregtype() ==# "V")
    exe "normal! " . a:o . "\<space>\<bs>\<esc>\"" . v:register . "]pk\"_dd"
  else
    exe "normal! \"" . v:register . a:p
  endif
endfunction

function! s:visual_pasta() range
  exe "normal! gv\"_c\<space>\<bs>\<esc>\"" . v:register . "]pk\"_dd"
endfunction

nnoremap <silent> P :call <SID>normal_pasta('P', 'O')<CR>
nnoremap <silent> p :call <SID>normal_pasta('p', 'o')<CR>

vnoremap <silent> P :call <SID>visual_pasta()<CR>
vnoremap <silent> p :call <SID>visual_pasta()<CR>

" vim:set sw=2 sts=2:
