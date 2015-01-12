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
        Bundle 'reedes/vim-colors-pencil'
        Bundle 'freeo/vim-kalisi'
        Bundle 'w0ng/vim-hybrid'

    " Libs {{{2
        Bundle 'tlib'
        Bundle 'L9'
        Bundle 'tpope/vim-repeat'
        Bundle 'kana/vim-textobj-user'

    " Text objects {{{2
        " ai/ii:
        Bundle 'kana/vim-textobj-indent'
        " af/if, ac/ic for Python:
        Bundle 'bps/vim-textobj-python'
        " af/if:
        Bundle 'kana/vim-textobj-function'

    " Integrations {{{2
        " Git:
        Bundle 'tpope/vim-git'
        Bundle 'tpope/vim-fugitive'
        " Markdown:
        Bundle 'tpope/vim-markdown'
        Bundle 'nelstrom/vim-markdown-folding'
        " JSON:
        Bundle 'elzr/vim-json'
        " Tup:
        Bundle 'tup.vim', {'pinned': 1}
        " Ack:
        Bundle 'mileszs/ack.vim'
        " C:
        Bundle 'justinmk/vim-syntax-extra'

    " Tools {{{2
        " Surround movements/selections with quotes or similar:
        Bundle 'tpope/vim-surround'
        " Powerful substitution tools:
        Bundle 'tpope/vim-abolish'
        " Background task runner:
        Bundle 'tpope/vim-dispatch'
        " Utillity commands for file handling:
        Bundle 'tpope/vim-eunuch'
        " Perl regex for vim:
        Bundle 'othree/eregex.vim'
        " Check files for syntax errors:
        Bundle 'scrooloose/syntastic'
        " Ctrl-n/p completion in the command line:
        Bundle 'cmdline-completion'
        " Run directory specific .local.vimrc files:
        Bundle 'thinca/vim-localrc'
        " Zoom font in GVIM:
        Bundle 'thinca/vim-fontzoom'
        " Interface to the undo tree:
        Bundle 'mbbill/undotree'
        " Three way merges with vim:
        Bundle 'sjl/splice.vim'
        " Send code to a terminal:
        Bundle 'sjl/tslime.vim'
        " Mark modified lines of VCS controlled files:
        Bundle 'mhinz/vim-signify'
        " Mark words:
        Bundle 'Mark--Karkat'
        " Inject syntax definitions to range:
        Bundle 'SyntaxRange'
        " Highlight word misusages:
        Bundle 'reedes/vim-wordy'
        " Distraction free editing:
        Bundle 'junegunn/limelight.vim'
        Bundle 'junegunn/goyo.vim'
        " Unified interface to documentation sources:
        Bundle 'thinca/vim-ref'
        Bundle 'vim-ref-dictcc', {'pinned': 1}
        " Fixes word movement:
        Bundle 'ap/vim-you-keep-using-that-word'
        " Shows tips at startup:
        Bundle 'glts/vim-cottidie'
        " Detect project build system:
        Bundle 'johnsyweb/vim-makeshift'
        " Move over camel and snake case word parts:
        Bundle 'camelcasemotion'
        " Text objects for comma separated arguments (aa/ia,aA/iA):
        Bundle 'b4winckler/vim-angry'
        " Automatically close braces:
        Bundle 'Townk/vim-autoclose'
        " Enhances completion handling:
        Bundle 'ervandew/supertab'
        " I and A for linewise visual selections:
        Bundle 'kana/vim-niceblock'
        " Sane cursor movement in wrapped lines:
        Bundle 'vim-display-cursor', {'pinned': 1}


    runtime macros/matchit.vim

    filetype plugin indent on

" Completion {{{1
    set complete-=i
    set completeopt=menu,preview,longest
    nnoremap <c-space> <c-n>

    set ignorecase
    set infercase

    " Remove '=' and ':' and add ' ' to the path matching variable.
    set isfname-==
    set isfname-=:
    set isfname-='
    set isfname-=32

    let g:ycm_filepath_completion_use_working_dir=1
    " ^- since we sync the workdir ourselves
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_autoclose_preview_window_after_insertion=1
    nnoremap <leader>yc :YcmForceCompileAndDiagnostics<CR>
    nnoremap <C-y><c> :YcmForceCompileAndDiagnostics<CR>
    nnoremap <leader>yd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <C-y><d> :YcmCompleter GoToDefinitionElseDeclaration<CR>

    " SuperTab {{{2
        let g:SuperTabLongestEnhanced = 1
        let g:SuperTabLongestHighlight = 1

" Mouse and Handling {{{1
    set mouse=a
    set mousemodel=popup_setpos
    let g:mapleader=','
    let g:maplocalleader=','
    nnoremap <Space> :
    nnoremap ; :

    " A cheap exchange operator
    nnoremap x Pld

    " Use shift to avoid implicit yanks
    nnoremap D "_d
    nnoremap C "_c
    nnoremap X Pl"_d

    " Paste formatted by default
    "nnoremap p ]p
    "nnoremap P ]P

    " In command mode %% will insert the basename with a trailing dot.
    " I.e. 'foobar.cpp' becomes 'foobar.'
    cnoremap %% <C-R>=expand('%:r').'.'<CR>

    " Cause I accidently hit these all the time
    map <f1> <NOP>
    imap <f1> <NOP>
    map <S-up> <NOP>
    map <S-down> <NOP>
    map <S-left> <NOP>
    map <S-right> <NOP>

    " CamelCaseMotion {{{2
        " Move over camel case or snake case elements
        map W <Plug>CamelCaseMotion_w
        map B <Plug>CamelCaseMotion_b
        map E <Plug>CamelCaseMotion_e
        sunmap W
        sunmap B
        sunmap E

        omap iW <Plug>CamelCaseMotion_iw
        xmap iW <Plug>CamelCaseMotion_iw
        omap iB <Plug>CamelCaseMotion_ib
        xmap iB <Plug>CamelCaseMotion_ib
        omap iE <Plug>CamelCaseMotion_ie
        xmap iE <Plug>CamelCaseMotion_ie

    " Signify {{{2
        nmap <leader>gh <plug>(signify-next-hunk)
        nmap <leader>gH <plug>(signify-prev-hunk)

    " Surround {{{2
        let g:surround_indent = 1
        " Block comments
        let g:surround_{char2nr("/")} = "/*\r*/"

    " Undotree {{{2
       let g:undotree_SetFocusWhenToggle = 1
       nnoremap <leader>u :UndotreeToggle<CR>

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

    " Goyo {{{2
        nmap <Leader><Space> :Goyo<CR>

    " vim-ref {{{2
        let g:ref_cache_dir = printf('%s/tmp/ref_cache', s:vimDir)
        let g:ref_pydoc_cmd = 'python3 -m pydoc'
        autocmd FileType ref call s:initialize_ref_viewer()
        function! s:initialize_ref_viewer()
            nmap <buffer> b <Plug>(ref-back)
            nmap <buffer> f <Plug>(ref-forward)
            nnoremap <buffer> q <C-w>c
            setlocal nonumber
            setlocal nolist
        endfunction
        command! -nargs=1 Dcc call ref#open('dictcc', 'DE EN '.expand('<args>'))
        nnoremap <leader>dcc :call ref#open('dictcc', 'DE EN '.expand('<cword>'))<CR>

    " Scratch buffer {{{2
        function! CreateScratchBuffer( new_buffer_cmd, filetype )
            let filetype = a:filetype
            if filetype == ''
                let filetype = &filetype
            endif
            exec a:new_buffer_cmd
            exec 'setlocal filetype='.filetype
        endfunction
        command! -nargs=* -complete=filetype Scratch  call CreateScratchBuffer('new',  <q-args>)
        command! -nargs=* -complete=filetype VScratch call CreateScratchBuffer('vnew', <q-args>)

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
    set wildignore+=*.o,*.swp,*.bak,*.pyc,*.t
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
    set novisualbell " Disables beeping or screen flashing
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
        "highlight DiffChange guibg=#2b241b ctermbg=94
        if has('gui_macvim')
            set fuoptions=maxvert,maxhorz,background:Normal
            set guifont=Menlo\ 10
        else
            set guifont=Monospace\ 10
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

    " NetRW {{{2
        let g:netrw_banner = 0
        let g:netrw_hide = 1
        let g:netrw_list_hide = '^\.'
        let g:netrw_liststyle = 3

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

    " Undotree {{{2
        let g:undotree_TreeNodeShape = 'o'
        let g:undotree_WindowLayout = 2

    " Goyo {{{2
        function! GoyoBefore()
            Limelight
        endfunction

        function! GoyoAfter()
            Limelight!
        endfunction

        let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]

    " Pencil {{{2
        let g:pencil_terminal_italics = 1

" Spell Check {{{1
    set dictionary+=/usr/share/dict/words
    let &thesaurus=printf('%s/dictionaries/mthesaur.txt', s:vimDir)
    let &spellfile=printf('%s/tmp/spell.en.utf-8.add', s:vimDir)

    hi clear SpellBad
    hi SpellBad cterm=underline gui=undercurl
    map <F7> :setlocal spelllang=en,de spell! spell?<CR>
    inoremap <F7> <C-\><C-O>:setlocal spelllang=en,de spell! spell?<CR>

    " Syntastic {{{2
        "let g:syntastic_text_checkers = ['language_check']
        let g:syntastic_text_language_check_args = '-m en-GB -l de-DE'
        " TODO: OCLint?
        " TODO: pyflake/pep8?

" Folding {{{1
    let g:xml_syntax_folding = 1
    let g:javaScript_fold = 1
    let g:sh_fold_enabled = 1
    let g:vimsyn_folding = 'af'
    set foldmethod=syntax
    set foldlevelstart=99
    set foldenable

    " markdown-folding {{{2
        let g:markdown_fold_style = 'nested'

" Search and replace {{{1
    set incsearch
    noremap <silent> <nowait> <C-H> :set hlsearch!<CR>:Mark<CR>
    " noremap <silent> <leader><space> :nohlsearch<cr>:MarkClear<cr>
    set grepprg=grep\ -nrI\ --exclude-dir=.git\ --exclude-dir=.hg\ --exclude-dir=.svn\ $*\ /dev/null

    " Ack {{{2
        cnoremap A<Space> Ack<Space>
        let g:ackprg = "ag"
        let g:ackhighlight = 1
        let g:ackpreview = 1
        let g:ack_use_dispatch = 1

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

    let &backupdir=s:vimDir.'/tmp/backup'
    let &undodir=s:vimDir.'/tmp/undo'
    set undofile

    " Easy Tags {{{2
        "let g:easytags_async = 1
        let g:easytags_file = printf('%s/tmp/tags', s:vimDir)

    " Cottidie {{{2
        autocmd VimEnter * CottidieTip
        let g:cottidie_no_default_tips = 1
        let g:cottidie_tips_files = [ printf('%s/tips', s:vimDir) ]

    " Makeshift {{{2
        let g:makeshift_systems = { 'Tupfile.ini': 'tup' }

" Filetypes {{{1
augroup filetype_settings
    autocmd!

    autocmd BufNewFile,BufRead *.less
        \   setfiletype css

    autocmd BufNewFile,BufRead *.nut
        \   setfiletype squirrel

    autocmd BufNewFile,BufRead *.rockspec
        \   setfiletype lua

    autocmd FileType vim
        \   setlocal foldmethod=marker
        \ | let b:AutoClosePairs = AutoClose#DefaultPairsModified('', '"')

    autocmd FileType sh,bash,zsh
        \   setlocal iskeyword+=-
        \ | setlocal foldmethod=marker

    autocmd FileType man
        \   setlocal foldmethod=indent

    autocmd FileType config,dosini
        \   setlocal iskeyword+=-

    autocmd FileType css,scss
        \   setlocal iskeyword+=-

    autocmd FileType markdown
        \   setlocal iskeyword+=-
        \ | let b:AutoClosePairs = AutoClose#DefaultPairsModified('', '`')
        \ | let g:surround_{char2nr("*")} = "*\r*"
        \ | let g:surround_{char2nr("_")} = "_\r_"
        \ | call SyntaxRange#Include('```c', '```', 'c', 'markdownCodeBlock')
        \ | call SyntaxRange#Include('```cpp', '```', 'cpp', 'markdownCodeBlock')
        \ | call SyntaxRange#Include('```lua', '```', 'lua', 'markdownCodeBlock')
        \ | call SyntaxRange#Include('```python', '```', 'python', 'markdownCodeBlock')
        \ | setlocal formatoptions+=w

    autocmd FileType xml,html
        \   setlocal iskeyword+=-
        \ | setlocal equalprg=xmllint\ --format\ - " <- libxml2-utils
      " \ | setlocal equalprg=xml_pp " <- XML::Twig (Perl)

    autocmd FileType json
        \   setlocal iskeyword+=-
        \ | setlocal equalprg=json_pp

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
"
" Mit ** kann bei Pfadnamen rekursiv geglobbt werden.
" Z.B. :e **/mai<Tab> => foo/bar/main.cpp
"
" [( springt vom Cursor zum Anfang des ()-Blocks
" ]) springt von Cursor zum Ende des ()-Blocks
" ]p und ]P zum automatischen Einrücken vom gepastetem Text.
