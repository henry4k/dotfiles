" Integrated reference viewer.
" Version: 0.4.3
" Author : thinca <thinca+vim@gmail.com>
" License: Creative Commons Attribution 2.1 Japan License
"          <http://creativecommons.org/licenses/by/2.1/jp/deed.en>

if exists('g:loaded_ref_dictcc')
  finish
endif
let g:loaded_ref_dictcc = 1

let s:save_cpo = &cpo
set cpo&vim


call ref#register(dictcc#define())


let &cpo = s:save_cpo
unlet s:save_cpo
