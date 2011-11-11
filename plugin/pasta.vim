" pasta.vim - Pasting with indentation adjusted to paste destination"
" Author:     Marcin Kulik <http://ku1ik.com/>
" Version:    0.1

if exists("g:loaded_pasta") || &cp || v:version < 700
  finish
endif
let g:loaded_pasta = 1

function! s:NormalPasta(p, o)
  if (getregtype() ==# "V")
    exe "normal! " . a:o . "\<space>\<bs>\<esc>" . v:count1 . '"' . v:register . ']pk"_dd'
  else
    exe "normal! " . v:count1 . '"' . v:register . a:p
  endif
endfunction

function! s:VisualPasta()
  if (visualmode() ==# "V")
    if (getregtype() ==# "V")
      exe "normal! gv\"_c\<space>\<bs>\<esc>" . v:count1 . '"' . v:register . ']pk"_dd'
    else
      exe "normal! gv\"_c\<space>\<bs>\<esc>" . v:count1 . '"' . v:register . ']p'
    endif
  else
    " workaround strange Vim behavior (""p is no-op in visual mode)
    let reg = v:register == '"' ? '' : '"' . v:register

    exe "normal! gv" . v:count1 . reg . "p"
  endif
endfunction

nnoremap <silent> <Plug>BeforePasta :<C-U>call <SID>NormalPasta('P', 'O')<CR>
nnoremap <silent> <Plug>AfterPasta :<C-U>call <SID>NormalPasta('p', 'o')<CR>
xnoremap <silent> <Plug>VisualPasta :<C-U>call <SID>VisualPasta()<CR>

if maparg('p') ==# ''
  nmap p <Plug>AfterPasta
  xmap p <Plug>VisualPasta
endif

if maparg('P') ==# ''
  nmap P <Plug>BeforePasta
  xmap P <Plug>VisualPasta
endif

" vim:set sw=2 sts=2:
