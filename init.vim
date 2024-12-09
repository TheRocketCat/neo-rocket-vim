"vim plug install
"sh -c 'curl -fLo '${XDG_DATA_HOME:-$HOME/.local/share}'/nvim/site/autoload/plug.vim --create-dirs \
"      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"
call plug#begin('~/.local/share/nvim/plugged')
"
Plug 'scrooloose/nerdtree'
"general style 
Plug 'itchyny/lightline.vim'
Plug 'Mofiqul/dracula.nvim'
"linting & language support
"Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'josa42/coc-go' , {'do': 'yarn install --forzen-lockfile'}
"Plug 'puremourning/vimspector'

"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sbdchd/neoformat'

"TODO check if vim-polygot is the one making weird pink 'tips'
"Plug 'sheerun/vim-polyglot' "installs basically every needed vim dev tool for every language
"git tools
Plug 'tpope/vim-fugitive' "vim git
"Plug 'jreybert/vimagit'
"file searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"documentation / project/time managment
"Plug 'vimwiki/vimwiki'
"Plug 'jceb/vim-orgmode'
" Productivity tools
Plug 'github/copilot.vim'
"
"Plug 'itchyny/calendar.vim'
call plug#end()

" Load all settings
so $HOME/.config/nvim/gitgutter.vim
so $HOME/.config/nvim/spector.vim
so $HOME/.config/nvim/style.vim
so $HOME/.config/nvim/coc.vim

" language specific settings
so $HOME/.config/nvim/go.vim


" PATH
"let $PATH .= ':/usr/bin/node'
let $PATH .= ':/home/a/go/bin'
let $PATH .= ':/usr/local/go/bin'

" KEY MAPS / BINDINGS
"map , <leader> "dont use, because its taken used by repeating searching
map <space> <leader>
map <C-n> :NERDTreeToggle<CR>
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
set path+='/home/a/go/bin'


set wildmenu
set wildignore+=**/node_modules/**
"general autocmd

" TEMPLATES and SYNTAX
"svetle
augroup svelte
   au!
   au BufNewFile,BufRead *.svelte setl syntax=html
   "au BufNewFile,BufRead *.svelte set backupcopy=yes
   au BufNewFile *.svelte :-1read $HOME/.local/share/nvim/templates/svelte.html
augroup end

" vue
au BufNewFile *.vue 0r $HOME/.config/nvim/templates/setup-standard.vue

" templ
augroup templ
   au!
   au BufNewFile,BufRead .*.templ setl syntax=html
   au BufNewFile,BufRead *.templ setl syntax=html
augroup end

"attempt at fixing terminal from not showing last line
let g:neoterm_autoinsert=1

"standard terminal
"set shell=zsh


"scroll
set scrolloff=3
