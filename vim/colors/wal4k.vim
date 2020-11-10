" wal.vim -- Vim color scheme.
" Author:       Dylan Araps
" Webpage:      https://github.com/dylanaraps/wal
" Description:  A colorscheme that uses your terminal colors, made to work with 'wal'.

hi clear
set background=dark

if exists('syntax_on')
    syntax reset
endif

" Colorscheme name
let g:colors_name = 'wal4k'

source ~/.cache/wal/colors-wal.vim
let s:colors = [color0, color1, color2, color3, color4, color5, color6, color7, color8, color9, color10, color11, color12, color13, color14, color15]

function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if type(a:fg) == 1 " string
            let histring .= 'guifg=' . a:fg . ' ctermfg=' . a:fg . ' '
        else
            let histring .= 'guifg=' . s:colors[a:fg] . ' ctermfg=' . a:fg . ' '
        endif
    endif

    if a:0 >= 1
        if type(a:1) == 1 " string
            let histring .= 'guibg=' . a:1 . ' ctermbg=' . a:1 . ' '
        else
            let histring .= 'guibg=' . s:colors[a:1] . ' ctermbg=' . a:1 . ' '
        endif
    endif

    if a:0 >= 2
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3
        if type(a:3) == 1 " string
            let histring .= 'guisp=' . a:3 . ' '
        else
            let histring .= 'guisp=' . s:colors[a:3] . ' '
        endif
    endif

    execute histring
endfunction


" highlight groups {{{

call s:HL('Normal', 7, 'NONE')
exec 'hi Normal guibg=' . background
call s:HL('NonText', 0, 'NONE')
call s:HL('Comment', 8, 'NONE')
call s:HL('Constant', 3, 'NONE')
call s:HL('Error', 7, 1)
call s:HL('Identifier', 1, 'NONE', 'BOLD')
call s:HL('Ignore', 0, 8)
call s:HL('PreProc', 3, 'NONE')
call s:HL('Special', 6, 'NONE')
call s:HL('Statement', 1, 'NONE')
call s:HL('String', 2, 'NONE')
call s:HL('Number', 3, 'NONE')
call s:HL('Todo', 0, 2)
call s:HL('Type', 3, 'NONE')
call s:HL('Underlined', 1, 'NONE', 'underline')
call s:HL('StatusLine', 0, 7)
call s:HL('StatusLineNC', 0, 8)
call s:HL('TabLine', 8, 'NONE')
call s:HL('TabLineFill', 8, 'NONE')
call s:HL('TabLineSel', 0, 4)
call s:HL('TermCursorNC', 0, 3)
call s:HL('VertSplit', 0, 8)
call s:HL('Title', 4, 'NONE')
call s:HL('CursorLine', 0, 2)
call s:HL('LineNr', 8, 'NONE')
call s:HL('CursorLineNr', 8, 'NONE')
call s:HL('helpLeadBlank', 7, 'NONE')
call s:HL('helpNormal', 7, 'NONE')
call s:HL('Visual', 15, 0, 'reverse')
call s:HL('VisualNOS', 1, 'NONE')
call s:HL('Pmenu', 7, 8)
call s:HL('PmenuSbar', 7, 6)
call s:HL('PmenuSel', 0, 4)
call s:HL('PmenuThumb', 8, 8)
call s:HL('FoldColumn', 7, 'NONE')
call s:HL('Folded', 8, 'NONE')
call s:HL('WildMenu', 0, 2)
call s:HL('SpecialKey', 8, 'NONE')
call s:HL('DiffAdd', 2, 'NONE')
call s:HL('DiffChange', 8, 'NONE')
call s:HL('DiffDelete', 1, 'NONE')
call s:HL('DiffText', 4, 'NONE')
call s:HL('IncSearch', 0, 3)
call s:HL('Search', 0, 3)
call s:HL('Directory', 4, 'NONE')
call s:HL('MatchParen', 8, 1)
call s:HL('ColorColumn', 0, 4)
call s:HL('signColumn', 4, 'NONE')
call s:HL('ErrorMsg', 8, 'NONE')
call s:HL('ModeMsg', 2, 'NONE')
call s:HL('MoreMsg', 2, 'NONE')
call s:HL('Question', 4, 'NONE')
call s:HL('WarningMsg', 0, 1)
call s:HL('Cursor', 8, 'NONE')
call s:HL('Structure', 5, 'NONE')
call s:HL('CursorColumn', 7, 8)
call s:HL('ModeMsg', 7, 'NONE')
call s:HL('SpellBad', 1, 'NONE', 'underline')
call s:HL('SpellCap', 4, 'NONE', 'underline')
call s:HL('SpellLocal', 5, 'NONE', 'underline')
call s:HL('SpellRare', 6, 'NONE', 'underline')
call s:HL('Boolean', 5, 'NONE')
call s:HL('Character', 1, 'NONE')
call s:HL('Conditional', 5, 'NONE')
call s:HL('Define', 5, 'NONE')
call s:HL('Delimiter', 5, 'NONE')
call s:HL('Float', 5, 'NONE')
call s:HL('Include', 4, 'NONE')
call s:HL('Keyword', 5, 'NONE')
call s:HL('Label', 3, 'NONE')
call s:HL('Operator', 7, 'NONE')
call s:HL('Repeat', 3, 'NONE')
call s:HL('SpecialChar', 5, 'NONE')
call s:HL('Tag', 3, 'NONE')
call s:HL('Typedef', 3, 'NONE')
call s:HL('vimUserCommand', 1, 'NONE', 'BOLD')
    hi link vimMap vimUserCommand
    hi link vimLet vimUserCommand
    hi link vimCommand vimUserCommand
    hi link vimFTCmd vimUserCommand
    hi link vimAutoCmd vimUserCommand
    hi link vimNotFunc vimUserCommand
call s:HL('vimNotation', 4, 'NONE')
call s:HL('vimMapModKey', 4, 'NONE')
call s:HL('vimBracket', 7, 'NONE')
call s:HL('vimCommentString', 8, 'NONE')
call s:HL('htmlLink', 1, 'NONE', 'underline')
call s:HL('htmlBold', 3, 'NONE', 'BOLD')
call s:HL('htmlItalic', 5, 'NONE')
call s:HL('htmlEndTag', 7, 'NONE')
call s:HL('htmlTag', 7, 'NONE')
call s:HL('htmlTagName', 1, 'NONE', 'BOLD')
call s:HL('htmlH1', 7, 'NONE')
    hi link htmlH2 htmlH1
    hi link htmlH3 htmlH1
    hi link htmlH4 htmlH1
    hi link htmlH5 htmlH1
    hi link htmlH6 htmlH1
call s:HL('cssMultiColumnAttr', 2, 'NONE')
    hi link cssFontAttr cssMultiColumnAttr
    hi link cssFlexibleBoxAttr cssMultiColumnAttr
call s:HL('cssBraces', 7, 'NONE')
    hi link cssAttrComma cssBraces
call s:HL('cssValueLength', 7, 'NONE')
call s:HL('cssUnitDecorators', 7, 'NONE')
call s:HL('cssValueNumber', 7, 'NONE')
    hi link cssValueLength cssValueNumber
call s:HL('cssNoise', 8, 'NONE')
call s:HL('cssTagName', 1, 'NONE')
call s:HL('cssFunctionName', 4, 'NONE')
call s:HL('scssSelectorChar', 7, 'NONE')
call s:HL('scssAttribute', 7, 'NONE')
    hi link scssDefinition cssNoise
call s:HL('sassidChar', 1, 'NONE')
call s:HL('sassClassChar', 5, 'NONE')
call s:HL('sassInclude', 5, 'NONE')
call s:HL('sassMixing', 5, 'NONE')
call s:HL('sassMixinName', 4, 'NONE')
call s:HL('javaScript', 7, 'NONE')
call s:HL('javaScriptBraces', 7, 'NONE')
call s:HL('javaScriptNumber', 5, 'NONE')
call s:HL('markdownH1', 7, 'NONE')
    hi link markdownH2 markdownH1
    hi link markdownH3 markdownH1
    hi link markdownH4 markdownH1
    hi link markdownH5 markdownH1
    hi link markdownH6 markdownH1
call s:HL('markdownAutomaticLink', 2, 'NONE', 'underline')
    hi link markdownUrl markdownAutomaticLink
call s:HL('markdownError', 7, 'NONE')
call s:HL('markdownCode', 3, 'NONE')
call s:HL('markdownCodeBlock', 3, 'NONE')
call s:HL('markdownCodeDelimiter', 5, 'NONE')
hi markdownItalic gui=Italic cterm=Italic
hi markdownBold gui=Bold cterm=Bold
call s:HL('xdefaultsValue', 7, 'NONE')
call s:HL('rubyInclude', 4, 'NONE')
call s:HL('rubyDefine', 5, 'NONE')
call s:HL('rubyFunction', 4, 'NONE')
call s:HL('rubyStringDelimiter', 2, 'NONE')
call s:HL('rubyInteger', 3, 'NONE')
call s:HL('rubyAttribute', 4, 'NONE')
call s:HL('rubyConstant', 3, 'NONE')
call s:HL('rubyInterpolation', 2, 'NONE')
call s:HL('rubyInterpolationDelimiter', 3, 'NONE')
call s:HL('rubyRegexp', 6, 'NONE')
call s:HL('rubySymbol', 2, 'NONE')
call s:HL('rubyTodo', 8, 'NONE')
call s:HL('rubyRegexpAnchor', 7, 'NONE')
    hi link rubyRegexpQuantifier rubyRegexpAnchor
call s:HL('pythonOperator', 5, 'NONE')
call s:HL('pythonFunction', 4, 'NONE')
call s:HL('pythonRepeat', 5, 'NONE')
call s:HL('pythonStatement', 1, 'NONE', 'Bold')
call s:HL('pythonBuiltIn', 4, 'NONE')
call s:HL('phpMemberSelector', 7, 'NONE')
call s:HL('phpComparison', 7, 'NONE')
call s:HL('phpParent', 7, 'NONE')
call s:HL('cOperator', 6, 'NONE')
call s:HL('cPreCondit', 5, 'NONE')
call s:HL('SignifySignAdd', 2, 'NONE')
call s:HL('SignifySignChange', 4, 'NONE')
call s:HL('SignifySignDelete', 1, 'NONE')
call s:HL('NERDTreeDirSlash', 4, 'NONE')
call s:HL('NERDTreeExecFile', 7, 'NONE')
call s:HL('ALEErrorSign', 1, 'NONE')
call s:HL('ALEWarningSign', 3, 'NONE')
call s:HL('ALEError', 1, 'NONE')
call s:HL('ALEWarning', 3, 'NONE')

" }}}

" Plugin options {{{

let g:limelight_conceal_guifg = s:colors[8]
let g:limelight_conceal_ctermfg = 8

" }}}
