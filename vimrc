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

" Color scheme
colorscheme elflord

" Mappings
"imap ii <esc>
map <C-I> <C-A>
map <C-D> <C-X>
map <F9> <ESC>:!setxkbmap dvorak<Return>
map <F8> <ESC>gg
map <F10> <ESC>:!setxkbmap us<Return>
map <F11> <Esc>:set paste<Return>
map <F12> <Esc>:set nopaste<Return>
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>

" File detection
au BufRead,BufNewFile *.py set filetype=python"
au BufRead,BufNewFile *.tex set filetype=tex"
au BufRead,BufNewFile *.Domain set filetype=Domain"

" Save foldingstates
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

" LaTeX-suite settings
filetype plugin on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

syntax enable
