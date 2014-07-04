" vim: set filetype=vim foldmethod=marker:
scriptencoding utf-8
set nocompatible

" Bundle management {{{1
    filetype off

    let s:vimDir=expand('<sfile>:p:h')
    let &g:runtimepath=printf('%s,%s,%s/bundle/vundle', &g:runtimepath, s:vimDir, s:vimDir)
    call vundle#rc(s:vimDir.'/bundle')


    Bundle 'gmarik/vundle'

    " Color schemes {{{2
    Bundle 'tomasr/molokai'
    Bundle 'github-theme'
    Bundle 'sjl/badwolf'


    " Libs {{{2
    Bundle 'tlib'
    Bundle 'L9'


    " Tools {{{2
    Bundle 'tpope/vim-git'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-markdown'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-abolish'
    Bundle 'tpope/vim-dispatch'
    Bundle 'tpope/vim-eunuch'
    Bundle 'nelstrom/vim-markdown-folding'
    Bundle 'elzr/vim-json'
    Bundle 'hirochachacha/AnsiEsc.vim'
    Bundle 'othree/eregex.vim'
    "Bundle 'mivok/vimtodo'
    "Bundle 'vhdirk/vim-cmake'
    "Bundle 'scrooloose/syntastic'
    Bundle 'valgrind.vim'
    Bundle 'cmdline-completion'
    Bundle 'thinca/vim-localrc'
    "Bundle 'Valloric/YouCompleteMe'
    Bundle 'sjl/gundo.vim'
    Bundle 'sjl/splice.vim'
    Bundle 'sjl/tslime.vim'
    Bundle 'mhinz/vim-signify'
    Bundle 'Mark--Karkat'
    Bundle 'kana/vim-operator-user'
    Bundle 'kana/vim-operator-replace'
    Bundle 'kana/vim-textobj-user'
    Bundle 'SyntaxRange'
    Bundle 'matchit.zip'
    Bundle 'maxbrunsfeld/vim-yankstack'

    " az/iz:
    "Bundle 'kana/vim-textobj-fold'
    " ai/ii:
    Bundle 'kana/vim-textobj-indent'
    " af/if:
    Bundle 'kana/vim-textobj-function'
    " ac/ic:
    Bundle 'glts/vim-textobj-comment'
    " av/iv:
    "Bundle 'Julian/vim-textobj-variable-segment'

    filetype plugin indent on

" Temp Dir {{{1
    let s:tempDir=s:vimDir.'/tmp'
    if isdirectory(s:tempDir)
        if &backupdir =~# '^\.,'
            let &backupdir=s:tempDir.'/backup//,'.&backupdir
        endif
        if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
            let &undodir=s:tempDir.'/undo//,'.&undodir
        endif
    endif
    if exists('+undofile')
        set undofile
    endif

" Completion {{{1
    set complete-=i
    set completeopt=menu,preview,longest
    nnoremap <c-space> <c-n>

    " Remove '=' and ':' and add ' ' to the path matching variable.
    set isfname-==
    set isfname-=:
    set isfname-=32

    let g:ycm_filepath_completion_use_working_dir=1
    " ^- since we sync the workdir ourselves
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_autoclose_preview_window_after_insertion=1
    nnoremap <leader>yc :YcmForceCompileAndDiagnostics<CR>
    nnoremap <C-y><c> :YcmForceCompileAndDiagnostics<CR>
    nnoremap <leader>yd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <C-y><d> :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Mouse and Handling {{{1
    set mouse=a
    set mousemodel=popup_setpos
    let g:mapleader=','
    let g:maplocalleader=','

    " Cause I accidently hit these all the time
    noremap <f1> <NOP>
    noremap <S-up> <NOP>
    noremap <S-down> <NOP>
    noremap <S-left> <NOP>
    noremap <S-right> <NOP>

    " Moving between tabs
    map <C-t><up>    :tabr<cr>
    map <C-t><down>  :tabl<cr>
    map <C-t><left>  :tabp<cr>
    map <C-t><right> :tabn<cr>
    map <C-t><t>     :tabn<cr>

    " Signify {{{2
        nmap <leader>gh <plug>(signify-next-hunk)
        nmap <leader>gH <plug>(signify-prev-hunk)

    " Surround {{{2
        let g:surround_indent = 1
        " Block comments
        let g:surround_{char2nr("/")} = "/*\r*/"

     " Gundo {{{2
        nnoremap <leader>u :GundoToggle<cr>

     " Dispatch {{{2
        function! RunProve( args )
            exec "Dispatch prove ".g:proveargs. a:args
        endfunction
        command! -nargs=* Prove call RunProve("<args>")

     " operator-replace {{{2
        map x <Plug>(operator-replace)
        " Because x makes a great mnemonic for eXchange.
        " And deleting single letters can also accomplished by typing dl.

     " yankstack {{{2
        let g:yankstack_map_keys = 0
        nmap <C-n> <Plug>yankstack_substitute_newer_paste
        nmap <C-p> <Plug>yankstack_substitute_older_paste

" Clipboard {{{1
    if has('unnamedplus')
        set clipboard=unnamedplus,autoselect
    else
        set clipboard=unnamed,autoselect
    endif

    " tslime {{{2
        let g:tslime_ensure_trailing_newlines = 2

" Indent {{{1
    set tabstop=4
    set shiftwidth=4
    set shiftround
    set expandtab
    set autoindent
    set smartindent
    set cindent
    set cinwords=if,else,while,do,for,foreach,switch,class,struct,union,enum,interface,function
    "autocmd filetype python set expandtab

" Interface {{{1
    set ruler
    set showcmd
    set number
    set nowrap
    set linebreak
    set scrolloff=3
    set wildmenu
    set wildignore+=*.o,*.swp,*.bak,*.pyc
    set wildmode=longest,list,full
    set winminheight=0
    set noequalalways
    set showmatch
    set title
    set laststatus=2
    set list
    set display+=lastline
    set cursorline " See augroup CSFix
    set noerrorbells
    set synmaxcol=500
    set listchars=tab:>-,trail:-,extends:>,nbsp:-,precedes:<
    set showbreak=>\ 
    set fillchars=vert:│

    " Show colorcolumn only in insert mode.
    autocmd InsertEnter * :set colorcolumn=78
    autocmd InsertLeave * :set colorcolumn=0

    augroup CSFix
        autocmd ColorScheme * highlight clear CursorLine
        autocmd ColorScheme * highlight Normal ctermbg=none
        autocmd ColorScheme * highlight LineNr ctermbg=none
        autocmd ColorScheme * highlight Folded ctermbg=none
        autocmd ColorScheme * highlight NonText ctermbg=none
        autocmd ColorScheme * highlight SpecialKey ctermbg=none
        autocmd ColorScheme * highlight VertSplit ctermbg=none
        autocmd ColorScheme * highlight SignColumn ctermbg=none
        "autocmd ColorScheme * highlight clear CursorLineNR cterm=bold
    augroup END

    syntax on
    if has('gui_running')
        set guioptions=cip
        set guicursor+=a:blinkon0
        colorscheme badwolf4k
        "highlight clear DiffDelete
        "highlight DiffDelete guibg=#2c2424 ctermbg=52
        "highlight DiffAdd    guibg=#272b18 ctermbg=22
        "highlight DiffCahnge guibg=#2b241b ctermbg=94
        if has('gui_macvim')
            set fuoptions=maxvert,maxhorz,background:Normal
        endif
    else
        colorscheme badwolf4k
    endif

    " C syntax {{{2
        let g:c_space_errors=1
        let g:c_curly_error=1
        let g:c_comment_strings=1
        let g:c_ansi_constants=1
        let g:c_gnu=1

    " Colorscheme {{{2
        let g:molokai_original=1
        let g:rehash256=1 " better molokai terminal colors
        let g:kolor_underlined=1
        let g:kolor_alternative_matchparen=1
        let g:badwolf_darkgutter=1
        let g:badwolf_tabline=0 " darker background

    " Signify {{{2
        let g:signify_vcs_list = ['git']
        let g:signify_sign_overwrite = 1
        let g:signify_sign_change = '~'
        let g:signify_difftool = '/usr/bin/diff'
        highlight link SignifySignAdd    diffAdded
        highlight link SignifySignChange diffSubname
        highlight link SignifySignDelete diffRemoved
        "if has('gui_running')
            "let g:signify_line_highlight = 1
        "endif

" Spell Check {{{1
    let &spellfile=printf('%s/spell.en.utf-8.add', s:vimDir)
    hi clear SpellBad
    hi SpellBad cterm=underline gui=undercurl
    map <F7> :setlocal spelllang=en,de spell! spell?<CR>
    inoremap <F7> <C-\><C-O>:setlocal spelllang=en,de spell! spell?<CR>

" Folding {{{1
    let g:xml_syntax_folding = 1
    set foldmethod=syntax
    set foldenable

    " markdown-folding:
        let g:markdown_fold_style = 'nested'

" Search and replace {{{1
    set incsearch
    noremap <silent> <nowait> <C-H> :set hlsearch!<CR>:Mark<CR>
    noremap <silent> <leader><space> :nohlsearch<cr>:MarkClear<cr>

" System {{{1
    " set autochdir
    autocmd BufEnter * silent! lcd %:p:h
    "command lcdf :lcd %:p:h<CR>

    set autoread
    autocmd CursorHold * checktime
    " ^- autoread files every time the CursorHold event is fired.
    " This should happen every 4 seconds.

    set formatoptions=tcroqnj
    set cpo+=J " A sentence has to end with two spaces after punctuation.
    set nrformats-=octal
    set modeline
    set endofline
    set history=1000
    set undolevels=1000
    set encoding=utf-8
    set timeoutlen=1000
    set ttimeout
    set ttimeoutlen=0
    set backspace=indent,eol,start
    set ttyfast
    set shortmess+=I " hide :intro
    set nobackup
    set noswapfile
    set nostartofline
    set sessionoptions-=options
    set shell=bash
    set makeprg=tup " Since I use tup way more often, than make
    set tags+=tag;/ " upward search till filesystem root for 'tags' files
    set path+=/usr/local/include,/opt/local/include
    let $PAGER='' " use vim to read man pages

" Filetypes {{{1
augroup filetype_settings
    autocmd!

    autocmd BufNewFile,BufRead *.fs,*.vs,*.glsl,*frag,*.vert
        \   setfiletype glsl

    autocmd BufNewFile,BufRead *.less
        \   setfiletype css

    autocmd BufNewFile,BufRead *.nut
        \   setfiletype squirrel

    autocmd BufNewFile,BufRead Tupfile,*.tup
        \   setfiletype tup

    autocmd FileType vim
        \   setlocal foldmethod=marker

    autocmd FileType sh,bash,zsh
        \   setlocal foldmethod=marker

    autocmd FileType man
        \   setlocal foldmethod=indent

    autocmd FileType markdown
        \   let g:surround_{char2nr("*")} = "*\r*"
        \ | let g:surround_{char2nr("_")} = "_\r_"
        \ | setlocal formatoptions+=w

    autocmd FileType xml
        \   setlocal equalprg=xmllint\ --format\ - " <- libxml2-utils
      " \   setlocal equalprg=xml_pp " <- XML::Twig (Perl)

    autocmd FileType json
        \   setlocal equalprg=json_pp

augroup END

" Tipps {{{1
"
"  :args *.c
"  :tab all
"
"  :args *.c | tab all
"
" CTRL-V (block selection)
" => d
" => I<text>ESC
" ^- And you still need sublime?
"
" CTRL-A
" CTRL-X
" Increment/Decrement numbers!
"
" :vimgrep <pattern> <file patterns>
"
" c-t [<^v>] <- Tab wechseln
" c-w [<^v>] <- Fenster wechseln
"
" <>= bzw == um Code automatisch zu formatieren
" :only[!] um alle anderen fenster zu schliessen
"
" http://www.cs.swarthmore.edu/help/vim/reformatting.html
"
" m<a-z> - set mark
" '<a-z> - jump to mark
" a-z is local
" A-Z is global
"
" d$ - Löscht bis Zeilenende.
" dw - Löscht Wort.
" d/) - Löscht bis zum Klammerende.
"
" % um zwischen (){}[]<> Paaren zu springen.
" Da es eine Bewegung ist, kann es auch mit c/d/y/etc benutzt werden.
" Praktisch um Funktionsaufrufe zu extrahieren.
"
" :cn um zum nächsten fehler zu springen (bzw zum nächsten eintrag in der quick-list)
"
"
" { + }
" [ + ]
"
" <\bla\> - whole word search
"
" text-objects! use 'em! >:)
" V/v a/i <object>
"  a -> komplettes objekt wählen
"  i -> inhalt (inneres) wählen
" Text-Objekte:
"   (w)ord separated by punctuation and whitespace
"   (W)ord separated by whitespace
"   (s)entence
"   (p)aragraph
"   []
"   ()
"   {}
"   ''
"   ""
"   <>
"   (t)ag (xml tags)
"   l/x (single character)
"
" im Command Mode: % => aktuelle datei
"
" (c)hange Operator ist wie eine kombinierte d und i operation
"
"
" \c in regex patterns to enable ignore-case
"
" J um Zeilen zusammenzufassen. Z.B. um aus 'Foo\n{' 'Foo {' zu machen
"
" H - Cursor oben im Bildschirm plazieren.
" M - Cursor mittig plazieren.
" L - Cursor unten plazieren.
"
" zt(op)    - Aktuelle Zeile nach Oben.
" zz(enter) - Aktuelle Zeile in die Mitte.
" zb(ottom) - Aktuelle Zeile ans Ende.
"
" [[ - Vorherige Funktion
" ]] - Nächste Funktion
"
" Ctrl-n - (n)ext completion (für Wortvervollständigung)
" Ctrl-p - (p)revious completion
"
" gf => goto file z.B. #include <fo|o.h>
" gF => goto file line z.B.  Syntax error at f|oo.h:42
" <C-W>f goto file in new window
" <C-W>gf goto file in new tab
"
" cr[cm_uU] <- Schreibweise eines Wortes ändern.
" c = camelCase
" m = MixedCase
" _ = snake_case
" usw.
" Benötigt abolish.vim
