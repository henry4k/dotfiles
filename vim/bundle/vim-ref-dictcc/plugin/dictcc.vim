" vim-ref source for the dict.cc online dictionary.
" Version: 0.1

if exists('g:loaded_ref_dictcc')
  finish
endif
let g:loaded_ref_dictcc = 1

let s:save_cpo = &cpo
set cpo&vim


call ref#register(dictcc#define())


let &cpo = s:save_cpo
unlet s:save_cpo
