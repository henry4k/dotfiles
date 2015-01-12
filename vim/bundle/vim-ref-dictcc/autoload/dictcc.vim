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

let s:script_file = '/Users/hki/dotfiles/vim/bundle/vim-ref-dictcc/plugin/dictcc.py'
function! s:source.get_body(query)
    return ref#system(s:script_file.'  '.a:query).stdout
endfunction

function! s:source.opened(query)
  call s:syntax(a:query)
endfunction

function! s:syntax(type)
  if a:type ==# 'list'
    syntax clear
    return
  elseif exists('b:current_syntax') && b:current_syntax ==# 'ref-dictcc'
    return
  endif

  syntax clear

  syntax match refDictForeignWord '\v^[^-]+'
  syntax match refDictNativeWord  '\v[^-]+$'
  syntax match refDictSeparator '\v-+'

  highlight default link refDictForeignWord Normal
  highlight default link refDictNativeWord Normal
  highlight default link refDictSeparator NonText

  let b:current_syntax = 'ref-dictcc'
endfunction

function! dictcc#define()
  return s:source
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
