" pasta.vim - Pasting with indentation adjusted to paste destination"
" Author:     Marcin Kulik <http://ku1ik.com/>
" Version:    0.1

if exists("g:loaded_pasta") || &cp || v:version < 700
  finish
endif
let g:loaded_pasta = 1

function! s:normal_pasta(p, o)
  if (getregtype() ==# "V")
    exe "normal! " . a:o . "\<space>\<bs>\<esc>" . v:count1 . '"' . v:register . ']pk"_dd'
  else
    exe "normal! " . v:count1 . '"' . v:register . a:p
  endif
endfunction

function! s:visual_pasta()
  if (visualmode() ==# "V")
    if (getregtype() ==# "V")
      exe "normal! gv\"_c\<space>\<bs>\<esc>" . v:count1 . '"' . v:register . ']pk"_dd'
    else
      exe "normal! gv\"_c\<space>\<bs>\<esc>" . v:count1 . '"' . v:register . ']p'
    endif
  else
    " workaround strange Vim behavior (""p is no-op in visual mode)
    if (v:register == '"')
      let reg = ''
    else
      let reg = '"' . v:register
    endif

    exe "normal! gv" . v:count1 . reg . "p"
  endif
endfunction

nnoremap <silent> P :<C-U>call <SID>normal_pasta('P', 'O')<CR>
nnoremap <silent> p :<C-U>call <SID>normal_pasta('p', 'o')<CR>

vnoremap <silent> P :<C-U>call <SID>visual_pasta()<CR>
vnoremap <silent> p :<C-U>call <SID>visual_pasta()<CR>

" vim:set sw=2 sts=2:
