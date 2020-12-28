"vim plug install
"sh -c 'curl -fLo '${XDG_DATA_HOME:-$HOME/.local/share}'/nvim/site/autoload/plug.vim --create-dirs \
 "      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
 "
call plug#begin('~/.local/share/nvim/plugged')
"
Plug 'scrooloose/nerdtree'
"general style 
Plug 'itchyny/lightline.vim'
"linting & language support
"Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"TODO check if vim-polygot is the one making weird pink 'tips'
"Plug 'sheerun/vim-polyglot' "installs basically every needed vim dev tool for every language
"git tools
Plug 'tpope/vim-fugitive' "vim git
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"documentation / project/time managment
Plug 'vimwiki/vimwiki'
Plug 'jceb/vim-orgmode'
"
Plug 'itchyny/calendar.vim'
"convenience
Plug 'lambdalisue/suda.vim'
call plug#end()


"style
syntax enable
set guifont=DejaVu\ Sans\ Mono:h8
"number stuff
set number
au TermOpen * setl nonumber
"make tabs smaller and visualise indent
set tabstop=4
set softtabstop=4 noexpandtab
set shiftwidth=4
set list listchars=tab:\|\ 
"general higlight
hi Normal guibg=Black guifg=#00cdff ctermbg=Black ctermfg=blue
hi LineNr guifg=LightBlue  ctermfg=LightBlue 
hi Statement guifg=#cc0000
hi Comment guifg=#8080ff
hi Visual guibg=Blue ctermbg=Blue
hi Whitespace guifg=grey ctermfg=grey
"cursorline
setl cursorline
au WinEnter * setl cursorline
au WinLeave * setl nocursorline
"removes annoying chars in vertical splits
setg fillchars+=vert:\ 

"linting
"let b:ale_fixers=['prettier', 'eslint']

"let b:ale_linter_aliases={
"	\"vue":["javascript","vue"],
"	\"svelte":["javascript","vue"]
"\}
"let g:ale_fix_on_save=1
"
"let g:ale_completion_tsserver_autoimport=1 "automatically import external modiles



"general style AU
"
map <space> <leader>
"map , <leader> "dont use, because its taken used by repeating searching

"maps
map <Leader>n :NERDTreeToggle<CR>
"switch windows in terminal with normal maps
"tnoremap <Esc> <C-\><C-N>
"escape but removes weird characters that show up
tnoremap <C-\><C-N> <C-H><C-H><C-H><C-H><C-H><C-\><C-N>
tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l
"netrw
filetype plugin on
let g:netrw_banner=0 "disable banner
let g:netrw_browse_split=4 "open in prior window
let g:netrw_altv=1 "open splits to the right
let g:netrw_liststyle=3 "tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize=50

"file searchs
set path+=**
set wildmenu
set wildignore+=**/node_modules/**
"general autocmd
"custom files
augroup svelte
   au!
   au BufNewFile,BufRead *.svelte setl syntax=html
   "au BufNewFile,BufRead *.svelte set backupcopy=yes
   au BufNewFile *.svelte :-1read $HOME/.local/share/nvim/templates/svelte.html
augroup end
"attempt at fixing terminal from not showing last line
let g:neoterm_autoinsert=1
"standard terminal
"set shell=zsh

"code templates
nnoremap \svelte :-1read $HOME/.local/share/nvim/templates/svelte.html<CR>4ggi
"scroll
set scrolloff=3

"vimwiki
let g:vimwiki_use_calendar=1
"coc
set cmdheight=2
set updatetime=300
set shortmess+=c
hi CocFloating ctermbg=blue guibg=blue

set hidden

""coc due to issue #649
set nobackup
set nowritebackup 
"" fix node issue
let g:coc_node_path="~/.nvm/versions/node/v15.4.0/bin/node"

"set signcolumn=yes

if has("path-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
