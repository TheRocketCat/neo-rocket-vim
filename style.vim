" ALL VIM STYLE SETTINGS

syntax enable

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
hi CursorLine guibg=darkblue
au WinEnter * setl cursorline
au WinLeave * setl nocursorline
