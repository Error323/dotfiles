call pathogen#infect()
filetype off
syntax on
filetype plugin indent on

" Settings
set nu
set smartindent

"spaces for tabs
set tabstop=2
set shiftwidth=2
set expandtab "comment this line to get tabs again

"Makefiles break without real tabs, so disable it for this type of file
autocmd FileType make setlocal noexpandtab

set history=50
set ruler
set nosi
set noci
set ai
set foldmethod=marker
set hlsearch

" Tab completion stuff
set wildmode=longest,list
set pastetoggle=<F2>

" Color scheme
colorscheme elflord

" Mappings
"imap ii <esc>
map <C-I> <C-A>
map <C-D> <C-X>
nmap \l :setlocal number!<CR>
nmap \o :set paste!<CR>
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>

" Clang format functions
map <C-K> :pyf /usr/share/vim/addons/syntax/clang-format-3.5.py<CR>
imap <C-K> <ESC>:pyf /usr/share/vim/addons/syntax/clang-format-3.5.py<CR>i

" File detection
au BufRead,BufNewFile *.py set filetype=python"
au BufRead,BufNewFile *.tex set filetype=tex"
au BufRead,BufNewFile *.Domain set filetype=Domain"
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino
au BufRead,BufNewFile *.cuh set filetype=cuda

" Save foldingstates
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

" LaTeX-suite settings
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

syntax enable
