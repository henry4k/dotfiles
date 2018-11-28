" Extends tpopes markdown plugin:

" Add more concealed stuff:
if has('conceal') && get(g:, 'markdown_syntax_conceal', 1) == 1
    " Links:
    syn region markdownIdDeclaration matchgroup=markdownLinkDelimiter start="^ \{0,3\}!\=\[" end="\]:" oneline keepend nextgroup=markdownUrl skipwhite concealends
    syn region markdownLinkText matchgroup=markdownLinkTextDelimiter start="!\=\[\%(\_[^]]*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=markdownLink,markdownId skipwhite contains=@markdownInline,markdownLineStart concealends
    syn region markdownLink matchgroup=markdownLinkDelimiter start="(" end=")" contains=markdownUrl keepend contained conceal
    syn region markdownId matchgroup=markdownIdDelimiter start="\[" end="\]" keepend contained conceal

    " Automatic links:
    syn region markdownAutomaticLink matchgroup=markdownUrlDelimiter start="<\%(\w\+:\|[[:alnum:]_+-]\+@\)\@=" end=">" keepend oneline concealends

    " Code:
    syn region markdownCode matchgroup=markdownCodeDelimiter start="`" end="`" keepend contains=markdownLineStart concealends
    syn region markdownCode matchgroup=markdownCodeDelimiter start="`` \=" end=" \=``" keepend contains=markdownLineStart concealends
    syn region markdownCode matchgroup=markdownCodeDelimiter start="^\s*````*.*$" end="^\s*````*\ze\s*$" keepend concealends

    if !exists('main_syntax')
        let main_syntax = 'markdown'
    endif

    if main_syntax ==# 'markdown'
        let s:done_include = {}
        for s:type in g:markdown_fenced_languages
            if has_key(s:done_include, matchstr(s:type,'[^.]*'))
                continue
            endif
            exe 'syn region markdownHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\..*','','').' matchgroup=markdownCodeDelimiter start="^\s*````*\s*'.matchstr(s:type,'[^=]*').'\S\@!.*$" end="^\s*````*\ze\s*$" keepend contains=@markdownHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\.','','g').' concealends'
            let s:done_include[matchstr(s:type,'[^.]*')] = 1
        endfor
        unlet! s:type
        unlet! s:done_include
    endif
endif
