augroup NoBackground
    autocmd!
augroup END
set background=dark

"colorscheme gruvbox
if exists('g:GuiLoaded') " neovim
    let g:fontzoom_pattern = ':h\zs\d\+'
    set guifont=Source\ Code\ Pro:h10
    GuiTabline 0
else " gvim
    set guioptions=cip
    if has('gui_macvim')
        set fuoptions=maxvert,maxhorz,background:Normal
        set guifont=Menlo\ 10
    else
        set guifont=Monospace\ 10
    endif
end
