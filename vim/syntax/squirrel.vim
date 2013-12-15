" Vim syntax file
" Language:	Squirrel
" Maintainer:	Henry Kielmann <henrykielmann@gmail.com>
" Last Change:	2013-01-21
" File Types:   .nut
" Version:      1.0

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" A bunch of useful C keywords
syn keyword	sqStatement	break continue return new delete this base
syn keyword	sqLabel		case default
syn keyword	sqConditional	if else switch
syn keyword	sqRepeat	for foreach while do

syn keyword	sqTodo		contained TODO FIXME XXX

" cCommentGroup allows adding matches for special things in comments
syn cluster	sqCommentGroup	contains=sqTodo

" String and Character constants
" Highlight special characters (those which have a backslash) differently
syn match	sqSpecial	display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn match	sqSpecial	display contained "\\\(u\x\{4}\|U\x\{8}\)"

syn region	sqString	start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=sqSpecial,@Spell
" cCppString: same as cString, but ends at end of line
syn region	sqCppString	start=+L\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=sqSpecial,@Spell


syn match	sqCharacter	"L\='[^\\]'"
syn match	sqCharacter	"L'[^']*'" contains=sqSpecial

syn match	sqSpecialCharacter "L\='\\['\"?\\abfnrtv]'"

syn match	sqSpecialCharacter display "L\='\\\o\{1,3}'"
syn match	sqSpecialCharacter display "'\\x\x\{1,2}'"
syn match	sqSpecialCharacter display "L'\\x\x\+'"



syntax region	sqBlock		start="{" end="}" transparent fold


"catch errors caused by wrong parenthesis and brackets
" also accept <% for {, %> for }, <: for [ and :> for ] (C99)
" But avoid matching <::.
syn cluster	sqParenGroup	contains=sqIncluded,sqSpecial,sqCommentSkip,sqCommentString,sqComment2String,@sqCommentGroup,sqUserCont,sqOctalZero,sqFormat,sqNumber,sqFloat,sqOctal,sqNumbersCom
syn region	sqParen		transparent start='(' end=')' contains=ALLBUT,@sqParenGroup,sqCppParen,sqCppString,@Spell
" cCppParen: same as cParen but ends at end-of-line; used in cDefine
syn region	sqCppParen	transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@sqParenGroup,sqParen,sqString,@Spell


"integer number, or floating point number without a dot and with "f".
syn case ignore
syn match	sqNumbers	display transparent "\<\d\|\.\d" contains=sqNumber,sqFloat,sqOctal
" Same, but without octal error (for comments)
syn match	sqNumbersCom	display contained transparent "\<\d\|\.\d" contains=sqNumber,sqFloat,sqOctal
syn match	sqNumber	display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
"hex number
syn match	sqNumber	display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match	sqOctal		display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=sqOctalZero
syn match	sqOctalZero	display contained "\<0"
syn match	sqFloat		display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match	sqFloat		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	sqFloat		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	sqFloat		display contained "\d\+e[-+]\=\d\+[fl]\=\>"

"hexadecimal floating point number, optional leading digits, with dot, with exponent
syn match	sqFloat		display contained "0x\x*\.\x\+p[-+]\=\d\+[fl]\=\>"


syn case match


" Comments
syn region	sqCommentL	start="//" skip="\\$" end="$" keepend contains=@sqCommentGroup,sqSpaceError,@Spell
syn region	sqComment	matchgroup=sqCommentStart start="/\*" end="\*/" contains=@sqCommentGroup,@Spell fold extend

syn keyword	sqOperator	typeof instanceof in


syn keyword	sqStructure	class enum local
syn keyword	sqStorageClass	static const

syn keyword	sqConstant	null true false

syn keyword	sqException	try catch throw


let b:c_minlines = 15
exec "syn sync ccomment cComment minlines=" . b:c_minlines


" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link sqFormat		sqSpecial
hi def link sqCppString		sqString
hi def link sqCommentL		sqComment
hi def link sqCommentStart	sqComment
hi def link sqLabel		Label
hi def link sqConditional	Conditional
hi def link sqRepeat		Repeat
hi def link sqCharacter		Character
hi def link sqSpecialCharacter	sqSpecial
hi def link sqNumber		Number
hi def link sqOctal		Number
hi def link sqOctalZero		PreProc
hi def link sqFloat		Float
hi def link sqOperator		Operator
hi def link sqStructure		Structure
hi def link sqStorageClass	StorageClass
hi def link sqInclude		Include
hi def link sqIncluded		sqString
hi def link sqError		Error
hi def link sqStatement		Statement
hi def link sqConstant		Constant
hi def link sqCommentString	sqString
hi def link sqComment2String	sqString
hi def link sqCommentSkip	sqComment
hi def link sqString		String
hi def link sqComment		Comment
hi def link sqSpecial		SpecialChar
hi def link sqTodo		Todo

let b:current_syntax = "sq"
