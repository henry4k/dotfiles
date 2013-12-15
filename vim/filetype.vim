augroup filetypedetect
  autocmd BufNewFile,BufRead *.fs,*.vs,*.glsl,*frag,*.vert setfiletype glsl330
  autocmd BufNewFile,BufRead *.nut setfiletype squirrel
  autocmd BufNewFile,BufRead Tupfile,*.tup setfiletype tup
augroup END
