" vim: set foldmethod=marker:
" Vim syntax file
" Language: Squirrel
" Maintainer:   Henry Kielmann <henrykielmann@gmail.com>
" Last Change:  2013-12-31
" File Types:   .nut
" Version:      1.5

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" A bunch of useful C keywords
syn case match

syn keyword sqConditional if else switch
syn keyword sqRepeat while do for foreach in
syn keyword sqBranch break continue
syn keyword sqStatement return yield resume
syn keyword sqIdentifier this base callee vargv
syn match sqIdentifier display "\V..."
syn keyword sqLabel case default
syn keyword sqStructure class enum local
syn keyword sqFunction function
syn keyword sqStorageClass static const extends
syn keyword sqNull null
syn keyword sqBoolean true false
syn keyword sqException try catch throw

" Operators {{{1
    syn keyword sqOperator typeof instanceof delete clone

"    for operator in [
"            \ "!", "!=",
"            \ "|", "||",
"            \ "=",
"            \ "==",
"            \ "?", ":",
"            \ "&", "&&",
"            \ "<", ">", "<=", "=>", "<=>",
"            \ "*", "*=",
"            \ "\/", "\/=",
"            \ "+", "+=", "++",
"            \ "-", "\-=", "\--",
"            \ "%", "\%=",
"            \ "<<", ">>", "<<<",
"            \ "<-"
"            \ ]
"        let regex = '\v(^|\W)\zs\V' . operator . '\v\ze($|\W)'
"        execute "syn match sqOperator display '" . regex . "'"
"    endfor

" Parentheses and Braces {{{1
    "syntax region sqBlock start="\[" end="\]" transparent fold
    syntax region sqBlock start="{" end="}" transparent fold
    "syntax region sqBlock start="\v<" end="\v>" transparent fold

    "catch errors caused by wrong parenthesis and brackets
    " also accept <% for {, %> for }, <: for [ and :> for ] (C99)
    " But avoid matching <::.
    syn cluster sqParenGroup contains=sqEscaped,sqCommentSkip,sqCommentString,sqComment2String,@sqCommentGroup,sqUserCont,sqOctalZero,sqFormat,sqNumber,sqFloat,sqOctal,sqNumbersCom
    syn region sqParen transparent start='(' end=')' contains=ALLBUT,@sqParenGroup,sqCppParen,sqCppString,@Spell
    " cCppParen: same as cParen but ends at end-of-line; used in cDefine
    syn region sqCppParen transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@sqParenGroup,sqParen,sqString,@Spell

" String and Character constants {{{1
    syn match sqEscaped display contained "\v\\."
    syn match sqEscaped display contained "\v\\x\x+"
    syn match sqFormat display contained "\v\%[-+ #0]?(\d+|\*)?(\.\d+)[A-Za-z%]"
    syn match sqVerbatimQuote display contained "\v\"\""

    " Strings {{{2
        syn region sqString start=+\v"+ skip=+\v\\\\|\\"+ end=+\v"|$+ contains=sqEscaped,sqFormat,@Spell
        syn region sqVerbatimString start=+\v\@"+ skip=+\v\\\\|\\"+ end=+\v"|$+ contains=sqFormat,sqVerbatimQuote,@Spell
        syn region sqVerbatimMultilineString start=+\v\@"( |$)+ skip=+\v\\\\|\\"+ end=+\v(^| )"+ contains=sqFormat,sqVerbatimQuote,@Spell

    " Characters {{{2
        syn match sqCharacter "\v'[^']*'" display contains=sqEscaped

" Numbers {{{1
    "syn match sqInteger "\v(^|\W)\zs[+-]?[1-9][0-9]*"
    syn match sqInteger "\v[+-]?[1-9][0-9]*"
    syn match sqInteger "\v0[xX][0-9A-Fa-f]+"
    syn match sqInteger "\v0[0-7]+"
    syn match sqFloat "\v[+-]?[0-9]+\.([eE][+-]?)?[0-9]+"

" Comments {{{1
    syn keyword sqCommentTodo contained TODO FIXME XXX
    syn region sqLineComment start="//" skip="\\$" end="$" keepend contains=sqTodo,@Spell
    syn region sqLineComment start="#" skip="\\$" end="$" keepend contains=sqTodo,@Spell
    syn region sqBlockComment start="/\*" end="\*/" contains=sqTodo,@Spell fold extend

    let b:c_minlines = 15
    exec "syn sync ccomment cComment minlines=" . b:c_minlines

syn match sqConstant display "\v[A-Z_]{3,}"
syn match sqInternal display "\v_[a-zA-Z][a-zA-Z_]{2,}"


" Highlighting {{{1
    hi def link sqCharacter Character

    hi def link sqFormat  SpecialChar
    hi def link sqEscaped SpecialChar

    hi def link sqString                  String
    hi def link sqVerbatimString          String
    hi def link sqVerbatimMultilineString String

    hi def link sqCommentTodo  Todo
    hi def link sqLineComment  Comment
    hi def link sqBlockComment Comment

    hi def link sqInteger  Number
    hi def link sqFloat    Float
    hi def link sqBoolean  Boolean
    hi def link sqNull     Keyword
    hi def link sqConstant Constant
    hi def link sqTypedef  Typedef

    hi def link sqConditional  Conditional
    hi def link sqBranch       Conditional
    hi def link sqRepeat       Repeat
    hi def link sqLabel        Label
    hi def link sqOperator     Operator
    hi def link sqException    Exception
    hi def link sqStatement    Statement
    hi def link sqFunction     Function
    hi def link sqIdentifier   Identifier
    hi def link sqInternal     Identifier
    hi def link sqStructure    Structure
    hi def link sqStorageClass StorageClass

    hi def link sqError Error

let b:current_syntax = "sq"
