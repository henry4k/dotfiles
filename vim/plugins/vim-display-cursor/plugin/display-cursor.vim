" Use display lines for cursor movement by default.
" See:  http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping

if exists('g:loaded_display_cursor')
  finish
endif
let g:loaded_display_cursor = 1

let s:save_cpo = &cpo
set cpo&vim


" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
  if &wrap && g:DisplayCursor || ( exists('b:DisplayCursor') && b:DisplayCursor )
    return 'g' . a:movement
  else
    return a:movement
  endif
endfunction

onoremap <silent> <expr> j ScreenMovement('j')
onoremap <silent> <expr> k ScreenMovement('k')
onoremap <silent> <expr> <up> ScreenMovement('<up>')
onoremap <silent> <expr> <down> ScreenMovement('<down>')
onoremap <silent> <expr> 0 ScreenMovement('0')
onoremap <silent> <expr> ^ ScreenMovement('^')
onoremap <silent> <expr> $ ScreenMovement('$')

nnoremap <silent> <expr> j ScreenMovement('j')
nnoremap <silent> <expr> k ScreenMovement('k')
nnoremap <silent> <expr> <up> ScreenMovement('<up>')
nnoremap <silent> <expr> <down> ScreenMovement('<down>')
nnoremap <silent> <expr> 0 ScreenMovement('0')
nnoremap <silent> <expr> ^ ScreenMovement('^')
nnoremap <silent> <expr> $ ScreenMovement('$')

vnoremap <silent> <expr> j ScreenMovement('j')
vnoremap <silent> <expr> k ScreenMovement('k')
vnoremap <silent> <expr> <up> ScreenMovement('<up>')
vnoremap <silent> <expr> <down> ScreenMovement('<down>')
vnoremap <silent> <expr> 0 ScreenMovement('0')
vnoremap <silent> <expr> ^ ScreenMovement('^')
vnoremap <silent> <expr> $ ScreenMovement('$')

let g:DisplayCursor = 0
let b:DisplayCursor = 0

function! ToggleDisplayCursor()
    if exists('g:DisplayCursor') && g:DisplayCursor
        let g:DisplayCursor = 0
    else
        let g:DisplayCursor = 1
    end
endfunction
command! -nargs=0 ToggleDisplayCursor call ToggleDisplayCursor()

function! ToggleDisplayCursorForBuffer()
    if exists('b:DisplayCursor') && b:DisplayCursor
        let b:DisplayCursor = 0
    else
        let b:DisplayCursor = 1
    end
endfunction
command! -nargs=0 ToggleDisplayCursorForBuffer call ToggleDisplayCursorForBuffer()


let &cpo = s:save_cpo
unlet s:save_cpo
