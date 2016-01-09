""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 My .vimrc file
"                              Copyright@silverneo
"                          Feel free to copy and modify!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin indent on
set background=dark
set backspace=indent,eol,start
syntax on

set hidden
set number
set ruler
set showtabline=0                   " Close tab bar, bufferline there
set laststatus=2
set colorcolumn=80                  "line length highlight
set cursorline
set scrolloff=8
set linebreak
set wildmenu                        " Enable completion options in status bar
set autoindent smartindent
set expandtab ts=4
set shiftwidth=4
set nobackup nowritebackup noswapfile
set vb t_vb=
set whichwrap+=h,l,<,>,[,]          " See Vim Tip 137
set nojs vi=""
set mps+=<:>
set clipboard=autoselect,exclude:.*
set com=sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-,n:\:

"ia teh the
"ia hte the

" Markdown settings
au BufRead,BufNewFile *.md set filetype=markdown

" Ocaml settings
au BufRead,BufNewFile *.ml,*.mli compiler ocaml

" Web Dev settings
au BufRead,BufNewFile *.html,*.js,*.jsx,*.css setlocal expandtab shiftwidth=2 tabstop=2

"""""""""""""""""""""""""""" Vundle Plugin Manager""""""""""""""""""""""""""""""
filetype off " required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-bufferline'

Plugin 'bling/vim-airline'

Plugin 'scrooloose/nerdtree'

Plugin 'Lokaltog/vim-easymotion'

Plugin 'flazz/vim-colorschemes'

Plugin 'scrooloose/nerdcommenter'

Plugin 'tpope/vim-fugitive'

Plugin 'pangloss/vim-javascript'
call vundle#end()
filetype on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" try catch colorscheme setting
" http://stackoverflow.com/a/5702498
try
    colorscheme Monokai
    "colorscheme hemisu
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

let g:bufferline_echo = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enbled = 1

" NERDTree settings
map <F3> :NERDTreeToggle<CR>

" EasyMotion
nmap <Space> <Plug>(easymotion-s)

" key mapping to stop search highlight
nmap <silent> <F2>      :nohlsearch<CR>
imap <silent> <F2> <C-O>:nohlsearch<CR>

"  key mapping for quick substitution
nmap <Leader>s :%s//g<Left><Left>
xmap <Leader>s :s//g<Left><Left>
nmap <Leader>c :%s///gn<Left><Left><Left><Left>
xmap <Leader>c :s///gn<Left><Left><Left><Left>
" Web Dev
" http://stackoverflow.com/a/19351416
let g:html_indent_inctags = "html,body,head,tbody"

" Go to last file(s) if invoked without arguments.
" From Vim Wiki Tip 613
"au VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
"    \ call mkdir($HOME . "/.vim") |
"    \ endif |
"    \ execute "mksession! " . $HOME . "/.vim/Session.vim"
"
"au VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
"    \ execute "source " . $HOME . "/.vim/Session.vim"
