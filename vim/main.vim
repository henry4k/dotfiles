" vim: set filetype=vim foldmethod=marker:
scriptencoding utf-8
set nocompatible

" Bundle management {{{1
    filetype off

    let s:vimDir=expand('<sfile>:p:h')
    let &g:runtimepath=printf('%s,%s,%s/bundle/vundle,%/manpageview', &g:runtimepath, s:vimDir, s:vimDir)
    call vundle#rc(s:vimDir.'/bundle')


    Bundle 'gmarik/vundle'

    " Color schemes {{{2
    "Bundle 'Zenburn'
    Bundle 'molokai'
    "Bundle 'moria'
    "Bundle 'tesla'
    "Bundle 'Wombat'
    "Bundle 'rdark'
    "Bundle 'peaksea'
    "Bundle 'wgibbs/vim-irblack'
    "Bundle 'shinzui/vim-idleFingers'
    "Bundle 'rainux/vim-desert-warm-256'
    "Bundle 'Lokaltog/vim-distinguished'
    "Bundle 'nanotech/jellybeans.vim'
    "Bundle 'tetragrammaton'
    "Bundle 'Guardian'
    "Bundle 'Distinguished'
    Bundle 'github-theme'
    "Bundle 'zeis/vim-kolor'
    "Bundle 'morhetz/gruvbox'
    Bundle 'sjl/badwolf'
    "Bundle 'halbtuerke/madeofcode.vim'


    " Libs {{{2
    Bundle 'tlib'
    Bundle 'L9'


    " Tools {{{2
    Bundle 'The-NERD-tree'
    "Bundle 'Lokaltog/vim-powerline'
    "Bundle 'Lokaltog/powerline'
    "Bundle 'Lokaltog/vim-easymotion'
    "Bundle 'ervandew/supertab'
    Bundle 'tpope/vim-git'
    Bundle 'tpope/vim-fugitive'
    Bundle 'majutsushi/tagbar'
    "Bundle 'mivok/vimtodo'
    Bundle 'vhdirk/vim-cmake'
    "Bundle 'scrooloose/syntastic'
    "Bundle 'chrisbra/csv.vim'
    "Bundle 'Ack'
    "Bundle 'hlissner/vim-multiedit'
    Bundle 'terryma/vim-multiple-cursors'
    "Bundle 'hexman.vim'
    Bundle 'valgrind.vim'
    Bundle 'cmdline-completion'
    Bundle 'thinca/vim-localrc'
    "Bundle 'scrooloose/syntastic'
    "Bundle 'Valloric/YouCompleteMe'
    "Bundle 'Tabular'
    Bundle 'sjl/gundo.vim'
    Bundle 'sjl/splice.vim'
    Bundle 'sjl/tslime.vim'
    Bundle 'mhinz/vim-signify'
    Bundle 'kana/vim-textobj-user'

    " az/iz:
    "Bundle 'kana/vim-textobj-fold'
    " ai/ii:
    Bundle 'kana/vim-textobj-indent'
    " af/if:
    Bundle 'kana/vim-textobj-function'
    " ac/ic:
    Bundle 'glts/vim-textobj-comment'
    " av/iv:
    Bundle 'Julian/vim-textobj-variable-segment'
    " aS/iS:
    "Bundle 'saihoooooooo/vim-textobj-space'
    " ih:
    "Bundle 'killphi/vim-textobj-signify-hunk'
    " a,/i,:
    "Bundle 'sgur/vim-textobj-parameter'

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
    nnoremap <c-space> <c-p>

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
    let g:maplocalleader='.'
    map <C-t><up>    :tabr<cr>
    map <C-t><down>  :tabl<cr>
    map <C-t><left>  :tabp<cr>
    map <C-t><right> :tabn<cr>
    map <C-t><t>     :tabn<cr>

    " Tagbar {{{2
        nnoremap <silent> <C-I> :TagbarToggle<CR>
        nnoremap <C-U> :TagbarTogglePause<CR>

    " Nerd Tree {{{2
        nnoremap <silent> <C-O> :NERDTreeToggle<CR>

    " Signify {{{2
        nmap <leader>gh <plug>(signify-next-hunk)
        nmap <leader>gH <plug>(signify-prev-hunk)

" Clipboard {{{1
    if has('unnamedplus')
        set clipboard=unnamedplus,autoselect
    else
        set clipboard=unnamed,autoselect
    endif

    " tslime {{{2
        let g:tslime_ensure_trailing_newlines = 1

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
    set wildmode=longest,list:full
    set winminheight=0
    set noequalalways
    set showmatch
    set title
    set laststatus=2
    set list
    set listchars=tab:>-,trail:-,extends:>,nbsp:-,precedes:<
    set display+=lastline

    syntax on
    if has('gui_running')
        set guioptions=cip
        set guicursor+=a:blinkon0
        set cursorline
        colorscheme badwolf4k
        "highlight clear DiffDelete
        "highlight DiffDelete guibg=#2c2424 ctermbg=52
        "highlight DiffAdd    guibg=#272b18 ctermbg=22
        "highlight DiffCahnge guibg=#2b241b ctermbg=94
        if has('gui_macvim')
            set fuoptions=maxvert,maxhorz,background:Normal
        endif
    else
        colorscheme ubaryd
    endif

    " C syntax {{{2
        let g:c_space_errors=1
        let g:c_curly_error=1
        let g:c_comment_strings=1
        let g:c_ansi_constants=1
        let g:c_gnu=1

    " Colorscheme {{{2
        let g:molokai_original=1
        let g:kolor_underlined=1
        let g:kolor_alternative_matchparen=1
        let g:badwolf_darkgutter=1
        let g:badwolf_tabline=0 " darker background

    " Tagbar {{{2
        let g:tagbar_width=30
        let g:tagbar_left=1
        let g:tagbar_sort=0
        let g:tagbar_autoshowtag=1

    " Nerd Tree {{{2
        " Set working directory to file tree root
        let g:NERDTreeChDirMode=2
        let g:NERDTreeWinPos='right'

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
    let g:xml_syntax_folding=1
    set foldmethod=syntax
    set foldenable

" Search and replace {{{1
    set incsearch
    noremap <silent> <nowait> <C-H> :set hlsearch!<CR>

" System {{{1
    " set autochdir
    autocmd BufEnter * silent! lcd %:p:h
    "command lcdf :lcd %:p:h<CR>

    cmap w!! w !sudo tee % >/dev/null

    set autoread
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
    set shell=bash


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
" c-t [<^v>]
" c-w [<^v>]
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
"   (w)ord
"   (W)ORD
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
" % => aktuelle datei
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
" Ctrl-n - (n)ext completion (für Wortvervollständigung)
" Ctrl-p - (p)revious completion
