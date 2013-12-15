" Vim color file
" Maintainer:	Camilla Berglund <elmindreda@elmindreda.org>
" Last Change:	2005 Oct 05

set bg=light
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "elmindreda"

hi Normal	guifg=#000000  guibg=#d7d7d7  ctermfg=black  ctermbg=white
hi ErrorMsg	guifg=#ffffff  guibg=#ff0000  ctermfg=white  ctermbg=red
hi Visual	guifg=#505050  guibg=#ffffff  gui=reverse  ctermfg=lightgrey  ctermbg=darkblue
hi VisualNOS	guifg=#8080ff  guibg=fg  gui=reverse,underline  ctermfg=lightblue  ctermbg=fg  cterm=reverse,underline
hi Todo		guifg=#000000  guibg=#ffff00  ctermfg=black  ctermbg=yellow
hi Search	guifg=#90fff0  guibg=#2050d0  ctermfg=white  ctermbg=darkblue  cterm=underline  term=underline
hi IncSearch	guifg=#505050  guibg=white  ctermfg=darkblue	ctermbg=gray

hi SpecialKey	guifg=black  ctermfg=black
hi Directory	guifg=black  ctermfg=black
hi Title	guifg=fg gui=none  ctermfg=fg  cterm=none
hi WarningMsg	guifg=red    ctermfg=red
hi WildMenu	guifg=yellow guibg=black ctermfg=yellow ctermbg=black cterm=none term=none
hi ModeMsg	guifg=black  ctermfg=lightblue
hi MoreMsg	ctermfg=darkgreen	ctermfg=darkgreen
hi Question	guifg=red gui=none ctermfg=green cterm=none
hi NonText	guifg=black		ctermfg=darkblue

" Splitter colors
hi StatusLine	guifg=black guibg=white gui=none ctermfg=black ctermbg=white term=none cterm=none
hi StatusLineNC	guifg=black guibg=gray  gui=none ctermfg=black ctermbg=gray term=none cterm=none
hi VertSplit	guifg=white guibg=darkgray gui=none ctermfg=black ctermbg=darkgray term=none cterm=none

hi Folded	guifg=#808080 guibg=#000040 ctermfg=darkgrey ctermbg=black cterm=none term=none
hi FoldColumn	guifg=#808080 guibg=#000040 ctermfg=darkgrey ctermbg=black cterm=none term=none
hi LineNr	guifg=#ffffff		    ctermfg=white cterm=none

" Diff colors
hi DiffAdd	guibg=darkblue  ctermbg=darkblue  term=none  cterm=none
hi DiffChange	guibg=darkmagenta  ctermbg=magenta  cterm=none
hi DiffDelete	ctermfg=blue  ctermbg=cyan  gui=none  guifg=Blue  guibg=DarkCyan
hi DiffText	cterm=none  ctermbg=red  gui=none  guibg=Red

" Cursor colors
hi Cursor	guifg=#ffffff guibg=#000000 ctermfg=white ctermbg=black
hi lCursor	guifg=#ffffff guibg=#000000 ctermfg=white ctermbg=black

" Code colors
hi Comment	guifg=#909090  ctermfg=grey
hi Constant	ctermfg=blue  guifg=#0000ff  cterm=none  gui=none
hi Special	ctermfg=white  guifg=#0000ff  cterm=none  gui=none
hi Identifier	ctermfg=fg  guifg=fg  cterm=none
hi Statement	ctermfg=white  cterm=none  guifg=#0000ff  gui=none
hi PreProc	ctermfg=white  guifg=#0000ff  cterm=none  gui=none
hi Type		ctermfg=white  guifg=#0000ff  cterm=none  gui=none
hi Underlined	cterm=underline  term=underline
hi Ignore	guifg=bg  ctermfg=bg
hi Operator	guifg=#0000ff  ctermfg=blue  gui=none

hi link String		Constant
hi link Character	Constant
hi link Number		Constant
hi link Boolean		Constant
hi link Float		Number
hi link Function	Identifier
hi link Conditional	Statement
hi link Repeat		Statement
hi link Label		Statement
hi link Operator	Statement
hi link Keyword		Statement
hi link Exception	Statement
hi link Include		PreProc
hi link Define		PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef		Type
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment	Special
hi link Debug		Special

