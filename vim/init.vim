" vim: set filetype=vim foldmethod=marker:
scriptencoding utf-8
set nocompatible

" Plugin management {{{1
    filetype off

    " let s:vimDir=substitute(expand('<sfile>:p:h'), '^'.expand('~'), '~', '')
    "               ^- Replace home directory with ~
    let s:vimDir=expand('<sfile>:p:h')
    let &g:runtimepath=printf('%s,%s', &g:runtimepath, s:vimDir)
    call plug#begin(s:vimDir.'/plugins')

    command! -nargs=* LocalPlug
        \ execute printf("Plug '%s/plugins/%s'", s:vimDir, <args>)

    " Color schemes {{{2
        Plug 'sjl/badwolf'
        Plug 'freeo/vim-kalisi'
        Plug 'tomasr/molokai'
        Plug 'fmoralesc/molokayo'
        Plug 'Reewr/vim-monokai-phoenix'
        Plug 'mkarmona/materialbox'
        Plug 'morhetz/gruvbox'
        Plug 'nlknguyen/papercolor-theme'
        Plug 'chriskempson/base16-vim'
        Plug 'ajh17/spacegray.vim'
        Plug 'keitanakamura/neodark.vim'
        Plug 'jacoborus/tender.vim'
        Plug 'notpratheek/vim-luna'
        Plug 'tyrannicaltoucan/vim-deep-space'
        Plug 'sindresorhus/focus'
        Plug 'rakr/vim-one'
        Plug 'cseelus/vim-colors-lucid'
        Plug 'ayu-theme/ayu-vim'
        Plug 'whatyouhide/vim-gotham'

    " Libs {{{2
        Plug 'vim-scripts/tlib'
        Plug 'vim-scripts/L9'
        Plug 'tpope/vim-repeat'
        Plug 'kana/vim-textobj-user'

    " Text objects {{{2
        " ai/ii:
        Plug 'kana/vim-textobj-indent'
        " af/if, ac/ic for Python:
        Plug 'bps/vim-textobj-python'
        " af/if:
        Plug 'kana/vim-textobj-function'
        " Various text objects ((,{,[,<,,):
        " See: https://github.com/wellle/targets.vim/blob/master/cheatsheet.md
        Plug 'wellle/targets.vim'
        " Text objects for comma separated arguments (aa/ia,aA/iA):
        Plug 'b4winckler/vim-angry'

    " Integrations {{{2
        " Git:
        Plug 'tpope/vim-git'
        Plug 'tpope/vim-fugitive'
        " Markdown:
        Plug 'tpope/vim-markdown'
        "Plug 'plasticboy/vim-markdown'
        " JSON:
        Plug 'elzr/vim-json'
        " Tup:
        LocalPlug 'tup.vim'
        " Ack:
        Plug 'mileszs/ack.vim'
        " C:
        Plug 'NLKNguyen/c-syntax.vim'
        " GLSL:
        Plug 'tikhomirov/vim-glsl'
        " Lua:
        Plug 'tbastos/vim-lua'
        " Javascript:
        Plug 'jelera/vim-javascript-syntax'
        " Ansible:
        Plug 'pearofducks/ansible-vim'
        " Nix:
        Plug 'lnl7/vim-nix'
        " TOML:
        Plug 'cespare/vim-toml'
        " Powershell:
        Plug 'pprovost/vim-ps1'

    " Completion {{{2
        " Automatically close braces:
        "Plug 'Townk/vim-autoclose'
        " Same for words:
        Plug 'tpope/vim-endwise'
        " Better searchpath integration for non-C languages:
        Plug 'tpope/vim-apathy'
        " Enhances completion handling:
        Plug 'ervandew/supertab'
        " Ctrl-n/p completion in the command line:
        Plug 'vim-scripts/cmdline-completion'
        "Plug 'roxma/nvim-completion-manager'

    " Tools {{{2
        " Surround movements/selections with quotes or similar:
        Plug 'tpope/vim-surround'
        " Powerful substitution tools:
        Plug 'tpope/vim-abolish'
        " Background task runner:
        Plug 'tpope/vim-dispatch'
        " Utility commands for file handling:
        Plug 'tpope/vim-eunuch'
        " Temporary fix while eunuchs SudoWrite is broken in Neovim:
        Plug 'lambdalisue/suda.vim'
        " Check files for syntax errors:
        "Plug 'scrooloose/syntastic'
        Plug 'w0rp/ale'
        " Run directory specific .local.vimrc files:
        Plug 'thinca/vim-localrc'
        " Interface to the undo tree:
        Plug 'mbbill/undotree'
        " Three way merges with vim:
        Plug 'sjl/splice.vim'
        " Mark modified lines of VCS controlled files:
        Plug 'mhinz/vim-signify'
        " Mark words:
        Plug 'vim-scripts/Mark--Karkat'
        " Inject syntax definitions to range:
        Plug 'vim-scripts/SyntaxRange'
        " Highlight word misusages:
        Plug 'reedes/vim-wordy'
        " Distraction free editing:
        Plug 'henry4k/limelight.vim'
        Plug 'junegunn/goyo.vim'
        " Unified interface to documentation sources:
        Plug 'thinca/vim-ref'
        LocalPlug 'vim-ref-dictcc'
        " Fixes word movement:
        Plug 'ap/vim-you-keep-using-that-word'
        " Detect project build system:
        Plug 'johnsyweb/vim-makeshift'
        " Move over camel and snake case word parts:
        Plug 'vim-scripts/camelcasemotion'
        " I and A for linewise visual selections:
        Plug 'kana/vim-niceblock'
        " Sane cursor movement in wrapped lines:
        LocalPlug 'vim-display-cursor'
        " Allows opening files at a specific line:
        Plug 'bogado/file-line'
        " Edit file regions:
        Plug 'chrisbra/NrrwRgn'
        " EditorConfig support:
        Plug 'editorconfig/editorconfig-vim'
        " Enhances the netrw plugin:
        Plug 'tpope/vim-vinegar'
        " More diff algorithms:
        Plug 'chrisbra/vim-diff-enhanced'
        " Preview colors in text:
        Plug 'ap/vim-css-color'
        " Color picker:
        Plug 'KabbAmine/vCoolor.vim'
        " Semantic highlighting:
        Plug 'jaxbot/semantic-highlight.vim'
        " Tipps:
        Plug 'glts/vim-cottidie'
        " Show syntax highlighting attributes of character under cursor:
        Plug 'vim-scripts/SyntaxAttr.vim'
        " Show exact differences instead of lines:
        "Plug 'rickhowe/diffchar.vim'
        if has('nvim')
            " original author: aurieh
            Plug 'henry4k/discord.nvim', { 'do': ':UpdateRemotePlugins'}
        endif
        " Colorscheme Scroller/Chooser/Browser:
        Plug 'vim-scripts/ScrollColors'
        " Fancy status bar:
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'

    call plug#end()

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

    " YouCompleteMe {{{2
        let g:ycm_filepath_completion_use_working_dir=1
        " ^- since we sync the workdir ourselves
        let g:ycm_autoclose_preview_window_after_completion=1
        let g:ycm_autoclose_preview_window_after_insertion=1
        nnoremap <leader>yc :YcmForceCompileAndDiagnostics<CR>
        nnoremap <C-y><c> :YcmForceCompileAndDiagnostics<CR>
        nnoremap <leader>yd :YcmCompleter GoToDefinitionElseDeclaration<CR>

    " SuperTab {{{2
        let g:SuperTabLongestEnhanced = 1

    " German Mode (tm) {{{2
        function! SetGermanMode( options )
            for mapping in [ ['ae', 'ä'],
                           \ ['Ae', 'Ä'],
                           \ ['oe', 'ö'],
                           \ ['Oe', 'Ö'],
                           \ ['ue', 'ü'],
                           \ ['Ue', 'Ü'],
                           \ ['SS', 'ß'] ]
                exec 'inoremap '.a:options.' '.mapping[0].' '.mapping[1]
            endfor
        endfunction
        command! -nargs=* EnableGermanMode call SetGermanMode('<args>')

" Mouse and Handling {{{1
    set mouse=a
    set mousemodel=popup_setpos
    let g:mapleader=','
    let g:maplocalleader=','
    nnoremap <Space> :
    nnoremap ; :
    nnoremap q :quit<CR>

    " { and } skip over closed folds
    nnoremap <expr> } foldclosed(search('^$', 'Wn')) == -1 ? "}" : "}j}"
    nnoremap <expr> { foldclosed(search('^$', 'Wnb')) == -1 ? "{" : "{k{"

    " [S]plit line (sister to [J]oin lines)
    " cc still substitutes the line like S would
    nnoremap S i<CR><Esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>

    " Sensible redo
    nnoremap U <C-R>

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

    " In command mode %$ will insert the directory with a trailing directory
    " separator. I.e. 'aaa/bbb' becomes 'aaa/'.
    cnoremap %$ <C-R>=expand('%:h').'/'<CR>

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

        omap ih <plug>(signify-motion-inner-pending)
        xmap ih <plug>(signify-motion-inner-visual)
        omap ah <plug>(signify-motion-outer-pending)
        xmap ah <plug>(signify-motion-outer-visual)

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

        function! DictccLookup( query ) range
            if a:query != ''
                call ref#open('dictcc', 'DE EN "'.a:query.'"')
            else
                call ref#open('dictcc', 'DE EN "'.getreg('*').'"')
            endif
        endfunction
        command! -range -nargs=? Dcc call DictccLookup(expand('<args>'))
        nnoremap <silent> <leader>dcc :call DictccLookup(expand('<cword>'))<CR>

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

    " Toggle background {{{2
        function! ToggleBackground()
            if &g:background ==? 'dark'
                set background=light
            else
                set background=dark
            endif
        endfunction
        command! -nargs=0 ToggleBackground call ToggleBackground()
        nnoremap <silent> <leader>b :call ToggleBackground()<CR>

    " Code sanitizer {{{2
        function! Sanitize()
            retab
            %substitute/\v\s+$//e
            mark z
            normal gg=Gg'z<CR>
            delmarks z
            echomsg 'Sanitized '.expand('%')
        endfunction
        command! Sanitize call Sanitize()

    " Vinegar/netrw {{{2
        nmap - <Plug>VinegarUp
        nmap _ <Plug>VinegarSplitUp

    " vCoolor {{{2
        "let g:vcoolor_disable_mappings = 1

    " Toggle clutter {{{2
        "nnoremap <silent> <leader>s :SyntasticToggleMode<CR>:bufdo :SignifyToggle<CR>
        "TODO

" Clipboard {{{1
    if has('unnamedplus')
        set clipboard=unnamedplus
    else
        set clipboard=unnamed
    endif

    " tslime {{{2
        let g:tslime_ensure_trailing_newlines = 2

" Indent {{{1
    set tabstop=4
    set shiftwidth=0 " 0 means: use tabstop instead
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
    set noerrorbells
    set visualbell " Use visual bell instead of beep
    set t_vb= " Disables beeping or screen flashing
    set synmaxcol=500
    set listchars=tab:>-,trail:-,extends:>,nbsp:-,precedes:<
    set showbreak=↪\ 
    set fillchars=vert:│,fold:\ ",eob:\ 
    set guicursor+=a:blinkon9999 " blinkon0 does not disable blinking at all, but any other value does - super weird
    set termguicolors
    set conceallevel=2

    " Preserve equal sized split views in diff mode:
    autocmd VimResized * if &diff | wincmd = | endif

    " Show colorcolumn only in insert mode.
    function! UpdateColorColumn()
        if &textwidth == 0
            set colorcolumn=78
        else
            exec "setlocal colorcolumn=".(&textwidth+1)
        endif
    endfunction
    autocmd InsertEnter * :call UpdateColorColumn()
    autocmd InsertLeave * :set colorcolumn=0

    " remove background colors in terminals
    if !has('gui_running')
        augroup NoBackground
            autocmd!
            autocmd ColorScheme *
                \   highlight Normal     ctermbg=none guibg=none
                \ | highlight LineNr     ctermbg=none guibg=none
                \ | highlight Folded     ctermbg=none guibg=none
                \ | highlight NonText    ctermbg=none guibg=none
                \ | highlight SpecialKey ctermbg=none guibg=none
                \ | highlight VertSplit  ctermbg=none guibg=none
                \ | highlight SignColumn ctermbg=none guibg=none
        augroup END
    endif

    autocmd ColorScheme *
        \ highlight EndOfBuffer ctermfg=none guifg=bg

    syntax on
    colorscheme badwolf4k

    " Statusline {{{2
        set statusline=
        set statusline+=%f\  " filename
        set statusline+=%m   " modified flag
        set statusline+=%r   " readonly flag
        set statusline+=%=   " left/right separator
        set statusline+=%a\  " position in argument list
        set statusline+=%-8.(%l:%c%)\  " line:column with padding
        set statusline+=%P   " position in file as percent

        " When using airline {{{3
        "let g:airline_detect_modified = 0
        let g:airline_detect_paste = 0
        let g:airline_detect_crypt = 0
        let g:airline_detect_spell = 0
        let g:airline_powerline_fonts = 1
        let g:airline_skip_empty_sections = 1
        function! AirlineInit()
            let g:airline_section_a = airline#section#create_left(['mode'])
            let g:airline_section_b = airline#section#create_left(['file'])
            let g:airline_section_c = airline#section#create_left(['readonly'])
            let g:airline_section_x = airline#section#create_right(['%a'])
            let g:airline_section_y = airline#section#create_right(['%P'])
            let g:airline_section_z = airline#section#create_right(['%l:%c'])
        endfunction
        autocmd User AirlineAfterInit call AirlineInit()
        let g:airline#extensions#disable_rtp_load = 1 " disable autoloading
        let g:airline_extensions = [] "'neomake', 'ale', 'languageclient']
        "let g:airline#extensions#tabline#show_splits = 0

    " C syntax {{{2
        let g:c_space_errors=1
        let g:c_curly_error=1
        let g:c_comment_strings=1
        let g:c_ansi_constants=1
        let g:c_gnu=1

    " SQL syntax {{{2
        let g:sql_type_default = 'mysql'

    " Colorscheme {{{2
        let g:molokai_original=1
        let g:rehash256=1 " better molokai terminal colors
        "let g:base16colorspace=256
        let g:kolor_underlined=1
        let g:kolor_alternative_matchparen=1
        let g:badwolf_darkgutter=1
        let g:badwolf_tabline=0 " darker background
        let g:gruvbox_italic=1 " always enable italic font
        let g:gruvbox_sign_column='bg0'
        "let g:gruvbox_improved_warnings=1
        let g:deepspace_italics = 1
        let g:neodark#background = '#202020'
        let g:neodark#use_256color = 1
        let g:neodark#terminal_transparent = 1
        "let g:neodark#solid_vertsplit = 1
        " one:
        let g:one_allow_italics = 1
        function! SetupOneColorScheme()
            " display folds as comments:
            highlight! link Folded Comment
            highlight clear Folded

            " more modest colors:
            if &background ==# 'dark'
                let l:syntax_cursor = '2c323c'
                let l:visual_grey  = '3e4452'
            else
                let l:syntax_cursor = 'f0f0f0'
                let l:visual_grey  = 'd0d0d0'
            endif
            highlight clear StatusLine
            highlight clear StatusLineNC
            highlight clear TabLineFill
            call one#highlight('StatusLine', '', l:visual_grey, '')
            call one#highlight('StatusLineNC', '', l:syntax_cursor, '')
            call one#highlight('TabLineFill', '', l:syntax_cursor, '')
        endfunction
        augroup OneColorScheme
            autocmd!
            autocmd ColorScheme one call SetupOneColorScheme()
        augroup END

    " Signify {{{2
        let g:signify_vcs_list = ['git']
        let g:signify_sign_change = '~'
        let g:signify_sign_show_count = 0
        "let g:signify_disable_by_default = 1
        "if has('gui_running')
            "let g:signify_line_highlight = 1
        "endif

    " Markdown {{{2
        let g:markdown_syntax_conceal = 1
        let g:markdown_fenced_languages = [
            \ 'c', "c++=cpp", 'bash=sh', 'ini=dosini', 'json', 'xml', 'html',
            \ 'diff', 'java', 'javascript', 'lua' ]
        "let g:vim_markdown_toc_autofit = 1
        "let g:vim_markdown_follow_anchor = 1
        "let g:vim_markdown_no_extensions_in_markdown = 1

    " Undotree {{{2
        let g:undotree_TreeNodeShape = 'o'
        let g:undotree_WindowLayout = 2

    " Limelight {{{2
        "let g:limelight_conceal_ctermfg = 'DarkGray'
        "let g:limelight_conceal_guifg   = 'DarkGray'
        let g:limelight_default_coefficient = 0

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

    " Semantic Highlighting {{{2
        let g:semanticGUIColors = ['#FF9999', '#FFFF99', '#99FF99', '#99FFFF', '#9999FF', '#FF99FF', '#FFA399', '#F4FF99', '#99FFA3', '#99F4FF', '#A399FF', '#FF99F4', '#FFAD99', '#EAFF99', '#99FFAD', '#99EAFF', '#AD99FF', '#FF99EA', '#FFB799', '#E0FF99', '#99FFB7', '#99E0FF', '#B799FF', '#FF99E0', '#FFC199', '#D6FF99', '#99FFC1', '#99D6FF', '#C199FF', '#FF99D6', '#FFCC99', '#CCFF99', '#99FFCC', '#99CCFF', '#CC99FF', '#FF99CC', '#FFD699', '#C1FF99', '#99FFD6', '#99C1FF', '#D699FF', '#FF99C1', '#FFE099', '#B7FF99', '#99FFE0', '#99B7FF', '#E099FF', '#FF99B7', '#FFEA99', '#ADFF99', '#99FFEA', '#99ADFF', '#EA99FF', '#FF99AD', '#FFF499', '#A3FF99', '#99FFF4', '#99A3FF', '#F499FF', '#FF99A3']
        let g:semanticBlacklistOverride = { 'lua': ['and', 'break', 'do', 'else', 'elseif', 'end', 'false', 'for', 'function', 'goto', 'if', 'in', 'local', 'nil', 'not', 'or', 'repeat', 'return', 'then', 'true', 'until', 'while'] }

" Spell Check {{{1
    set dictionary+=/usr/share/dict/words
    let &thesaurus=printf('%s/dictionaries/mthesaur.txt', s:vimDir)
    let &spellfile=printf('%s/tmp/spell.en.utf-8.add', s:vimDir)

    map <F7> :setlocal spelllang=en,de spell! spell?<CR>
    inoremap <F7> <C-\><C-O>:setlocal spelllang=en,de spell! spell?<CR>

    " Cause most defaults look stupid:
    augroup OverrideSpellHighlighting
        autocmd!
        "autocmd ColorScheme *
        "    \   highlight link SpellBad Error
        "    \ | highlight link SpellCap Todo
        autocmd ColorScheme *
            \   highlight SpellBad gui=underline cterm=underline
            \ | highlight SpellCap gui=underline cterm=underline
    augroup END

    " Syntastic {{{2
        let g:syntastic_check_on_open = 1
        let g:syntastic_text_checkers = ['language_check']
        let g:syntastic_text_language_check_args = '-m de-DE -l de-DE -d WHITESPACE_RULE'
        let g:syntastic_lua_checkers = ['luac', 'luacheck']
        let g:syntastic_lua_luacheck_args = '--std max --allow-defined-top'
        " TODO: OCLint?
        " TODO: pyflake/pep8?

    " ALE {{{2
        let g:ale_completion_enabled = 1
        let g:ale_sign_column_always = 1
        "let g:ale_echo_delay = 100
        "let g:ale_virtualtext_delay = 100
        let g:ale_lint_on_text_changed = 'normal'
        let g:ale_lint_on_insert_leave = 1
        if has('nvim-0.3.2')
            let g:ale_echo_cursor = 0
            let g:ale_virtualtext_cursor = 1 " requires nvim >= 0.3.2
            let g:ale_virtualtext_prefix = '| '
            highlight! link ALEVirtualTextError Comment
            highlight! link ALEVirtualTextWarning Comment
            " MoreMsg
            " Question
            " Title
        endif
        "let g:ale_lint_delay = 2000
        "let g:ale_cursor_detail = 1
        "let g:ale_completion_delay = 2000
        "let g:ale_completion_max_suggestions = 20
        let g:ale_command_wrapper = 'nice -n5' " raise niceness
        "let g:ale_sign_error = '‼'
        "let g:ale_sign_warning = '!'
        "let g:ale_sign_info = 'ℹ'
        let g:ale_sign_error = '✗'
        "let g:ale_sign_error = '✘'
        "let g:ale_sign_warning = '♦'
        let g:ale_sign_warning = '•'
        let g:ale_sign_info = '·'

        let g:ale_lua_luacheck_options = '--std max --allow-defined-top'

" Folding {{{1
    let g:xml_syntax_folding = 1
    let g:javaScript_fold = 1
    let g:sh_fold_enabled = 1
    let g:vimsyn_folding = 'af'
    set foldmethod=syntax
    set foldlevelstart=99
    set foldenable

    " markdown-folding {{{2
        let g:markdown_folding = 1 " for tpope/vim-markdown
        let g:markdown_fold_style = 'nested' " for plasticboy/vim-markdown

    " Source: https://coderwall.com/p/usd_cw/a-pretty-vim-foldtext-function
    function! FoldText()
        "let l:lpadding = &fdc
        "redir => l:signs
        "execute 'silent sign place buffer='.bufnr('%')
        "redir End
        "let l:lpadding += l:signs =~ 'id=' ? 2 : 0

        "if exists("+relativenumber")
        "    if (&number)
        "        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
        "    elseif (&relativenumber)
        "        let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
        "    endif
        "else
        "    if (&number)
        "        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
        "    endif
        "endif

        " expand tabs
        let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
        let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

        "let l:info = ' (' . (v:foldend - v:foldstart) . ')'
        "let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
        "let l:width = winwidth(0) - l:lpadding - l:infolen

        let l:separator = ' … '
        let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
        let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
        let l:text = l:start . ' … ' . l:end

        return l:text
        ". repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
    endfunction
    set foldtext=FoldText()

" Search and replace {{{1
    set incsearch
    set hlsearch
    noremap <silent> <leader>h :set hlsearch!<CR>:Mark<CR>
    " noremap <silent> <leader>h :nohlsearch<cr>:MarkClear<cr>

    if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor
    else
        set grepprg=grep\ -nrI\ --exclude-dir=.git\ --exclude-dir=.hg\ --exclude-dir=.svn\ $*\ /dev/null
    endif

    " Ack {{{2
        cnoremap A<Space> Ack<Space>
        let g:ackhighlight = 1
        let g:ackpreview = 1
        let g:ack_use_dispatch = 1
        if executable('ag')
            let g:ackprg = 'ag'
        endif

" System {{{1

    " set autochdir
    " let g:netrw_keepdir=0 " <- like autochdir, but for directory browsing
    "autocmd BufEnter * silent! lcd %:p:h
    command Cdf :cd %:h

    set autoread
    augroup AutoReload
        autocmd!
        autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() != 'c' | checktime | endif
        autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
    augroup END
    " See https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044

    " ^- autoread files every time the CursorHold event is fired.
    " This should happen every <updatetime> seconds.

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
    set nowritebackup
    set noswapfile
    set nostartofline
    set sessionoptions-=options
    set sessionoptions+=localoptions,tabpages
    set diffopt+=vertical
    set shell=bash
    set tags+=tag;/ " upward search till filesystem root for 'tags' files
    set path+=/usr/local/include,/opt/local/include
    let $PAGER='' " use vim to read man pages

    let &backupdir=s:vimDir.'/tmp/backup'
    let &undodir=s:vimDir.'/tmp/undo'
    set undofile

    " GutenTags {{{2
        let g:gutentags_cache_dir = printf('%s/tmp/tags', s:vimDir)

    " Cottidie {{{2
        autocmd VimEnter * CottidieTip
        let g:cottidie_no_default_tips = 1
        let g:cottidie_tips_files = [ printf('%s/tips', s:vimDir) ]

    " Makeshift {{{2
        let g:makeshift_systems = { 'Tupfile.ini': 'tup',
                                  \ 'build/Makefile': 'make -C build',
                                  \ 'build/build.ninja': 'ninja -C build',
                                  \ 'package.json': 'npm run build'}
        let g:makeshift_find_bundled = 0

    " EditorConfig {{{2
        let g:EditorConfig_max_line_indicator = "none"
        " ^- As we handle this ourselves anyway.

    " Netrw {{{2
        if executable('xdg-open') == 1
            let g:netrw_browsex_viewer = 'xdg-open'
        endif

" Filetypes {{{1
augroup filetype_settings
    autocmd!

    autocmd BufNewFile,BufRead *.less
        \   setfiletype css

    autocmd BufNewFile,BufRead *.nut
        \   setfiletype squirrel

    autocmd BufNewFile,BufRead *.rockspec
        \   setfiletype lua

    autocmd FileType lua
        \   setlocal errorformat=%.%#[string\ \"%f\"]:%l:\ %m
        \ | call css_color#init('css', 'extended', 'luaComment,luaCommentLong,luaString,luaStringLong')

    autocmd FileType vim
        \   setlocal foldmethod=marker

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
        \ | let g:surround_{char2nr("*")} = "*\r*"
        \ | let g:surround_{char2nr("_")} = "_\r_"
        \ | let g:surround_{char2nr("`")} = "`\r`"
        \ | nnoremap <buffer> <LocalLeader>= yypVr=
        \ | nnoremap <buffer> <LocalLeader>- yypVr-

    autocmd FileType xml
        \   setlocal iskeyword+=-
        \ | setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null " <- libxml2-utils
      " \ | setlocal equalprg=xml_pp " <- XML::Twig (Perl)

    autocmd FileType html
        \   setlocal iskeyword+=-
        \ | setlocal equalprg=xmllint\ --format\ --recover\ --html\ --htmlout\ -\ 2>/dev/null " <- libxml2-utils
        "\ | setlocal equalprg=tidy\ 2>/dev/null

    autocmd FileType json
        \   setlocal iskeyword+=-
        \ | setlocal equalprg=json_pp

    autocmd FileType meson
        \   let b:endwise_addition = '\=submatch(0)=="if" ? "endif" : "endforeach"'
        \ | let b:endwise_words = 'if,foreach'
        \ | let b:endwise_syngroups = 'mesonConditional,mesonRepeat'

augroup END
