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

filetype off " required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-bufferline'

Plugin 'bling/vim-airline'

Plugin 'scrooloose/nerdtree'

Plugin 'Lokaltog/vim-easymotion'

Plugin 'flazz/vim-colorschemes'

Plugin 'Shougo/neocomplete.vim'

Plugin 'scrooloose/nerdcommenter'

Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype on

colorscheme Tomorrow-Night-Bright
"colorscheme hemisu

let g:bufferline_echo = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enbled = 1

"neocomplete settings
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 0
let g:neocomplete#enable_auto_close_preview = 0
let g:neocomplete#max_list = 20

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

"<CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>": "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>": "\<TAB>"
" <C-h>, <BS>: close popup and delete backward char
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" NERDTree settings
map <F3> :NERDTreeToggle<CR>


" Go to last file(s) if invoked without arguments.
" From Vim Wiki Tip 613
au VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

au VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"

" EasyMotion
nmap <Space> <Plug>(easymotion-s)
