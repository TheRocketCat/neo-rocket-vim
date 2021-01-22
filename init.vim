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
Plug 'neoclide/coc-tsserver' , {'do': 'yarn install --forzen-lockfile'}
Plug 'josa42/coc-go' , {'do': 'yarn install --forzen-lockfile'}

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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


" PATH
let $PATH .= ':/home/RocketCat/.nvm/versions/node/v15.4.0/bin'



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

"escape terminal
tnoremap <esc> <C-\><C-N>
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



" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

""coc due to issue #649
set nobackup
set nowritebackup 
"" fix node issue
let g:coc_node_path="/home/RocketCat/.nvm/versions/node/v15.4.0/bin/node"


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
hi CocFloating ctermbg=blue guibg=blue

if has("path-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
