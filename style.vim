" ALL VIM STYLE SETTINGS

syntax enable

"general higlight
hi Normal guibg=Black guifg=#00cdff ctermbg=Black ctermfg=blue
hi LineNr guifg=LightBlue  ctermfg=LightBlue 
hi Statement guifg=#cc0000
hi Comment guifg=#8080ff
hi Visual guibg=Blue ctermbg=Blue
hi Whitespace guifg=grey ctermfg=grey
hi Pmenu ctermbg=10 guibg=blue


" general coloring
hi SignColumn guibg=black ctermbg=black

" numberline
set relativenumber
au TermOpen * setl nonumber " remove numbers on commandlines

" tabs
set tabstop=4
set softtabstop=4 noexpandtab
set shiftwidth=4
set list listchars=tab:\|\  " select symbol for tab


" have a line where cursor is
setl cursorline
hi CursorLine guibg=darkblue ctermbg=lightgrey
au WinEnter * setl cursorline
au WinLeave * setl nocursorline

"style
set guifont=DejaVu\ Sans\ Mono:h8
"number stuff
"make tabs smaller and visualise indent
"general higlight
hi Normal guibg=Black guifg=#00cdff ctermbg=Black ctermfg=blue
hi LineNr guifg=LightBlue  ctermfg=LightBlue 
hi Statement guifg=#cc0000 ctermfg=red
hi Comment guifg=#8080ff ctermfg=lightblue
hi Visual guibg=Blue ctermbg=Blue guifg=White ctermfg=White
hi Whitespace guifg=grey ctermfg=grey
hi Pmenu ctermbg=10 guibg=blue

"set guifont=DejaVu\ Sans\ Mono:h8
"number stuff
"make tabs smaller and visualise indent

"removes annoying chars in vertical splits
setg fillchars+=vert:\ 
