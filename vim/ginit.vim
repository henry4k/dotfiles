augroup NoBackground
    autocmd!
augroup END
set background=dark
"colorscheme gruvbox
if exists('g:GuiLoaded') " neovim
    " GuiFont Monospace:h10
    GuiFont Source\ Code\ Pro:h10
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
