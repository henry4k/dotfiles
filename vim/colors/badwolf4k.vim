runtime colors/badwolf.vim
let colors_name = "badwolf4k"

" Palette {{{
let s:bwc = {}
let s:bwc.darklime   = ['272b18', 22]
let s:bwc.darkdress  = ['2c2424', 52]
let s:bwc.darkorange = ['2b241b', 94]
" }}}

" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:bwc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:bwc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:bwc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}

" Diffs {{{
hi clear DiffDelete
hi clear DiffChange
call s:HL('DiffDelete', '', 'darkdress')
call s:HL('DiffAdd',    '', 'darklime')
call s:HL('DiffChange', '', 'darkorange')
call s:HL('DiffText',   '', 'darkorange')
" }}}
