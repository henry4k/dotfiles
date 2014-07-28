" A ref source for dict.cc
" Version: 0.1
" Author : henry4k <henrykielmann@gmail.com>
" License: Creative Commons Attribution 2.1 License TODO

let s:save_cpo = &cpo
set cpo&vim

let s:source = {'name': 'dictcc'}

function! s:source.available()
  return 1
endfunction

function! s:source.get_body(query)
    return ref#system('echo wurst brot').stdout
endfunction

function! s:source.opened(query)
  call s:syntax(a:query)
endfunction

function! s:syntax(query)
  syntax clear
endfunction

function! dictcc#define()
  return s:source
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
