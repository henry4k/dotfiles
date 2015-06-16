if exists("g:loaded_syntastic_tup_tup_checker")
    finish
endif
let g:loaded_syntastic_tup_tup_checker=1

if !exists("g:syntastic_tup_exec")
    let g:syntastic_tup_exec = "tup"
endif

function! SyntaxCheckers_tup_tup_IsAvailable() dict
    return executable(expand(g:syntastic_tup_exec))
endfunction

function! SyntaxCheckers_tup_tup_GetHighlightRegex(i)
    return ''
endfunction

function! SyntaxCheckers_tup_tup_GetLocList() dict
    let makeprg = self.makeprgBuild({ 'exe': expand(g:syntastic_tup_exec),
                                    \ 'args': 'refactor' })

    let errorformat = '%Etup%.%# error: %.%#rror parsing %f line %l'
    " \ '%D*%.%# %f,' .
    "let errorformat = '%-G[%.%#]%.%#,' .
    "                \ '%E%>tup%.%# error: %m,' .
    "                \ '%C%>tup%.%# error: %m,' .
    "                \ '%Z%>tup%.%# error: %.%#rror parsing %f line %l,' .
    "                \ '%-G%.%#'

    return SyntasticMake({ 'makeprg': makeprg,
                         \ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'tup',
    \ 'name': 'tup',
    \ 'exec': 'tup'})
