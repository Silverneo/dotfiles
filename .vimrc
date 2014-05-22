colorscheme desert
set background=dark
set nocompatible
set backspace=indent,eol,start
set lbr nu et ts=4 sw=4 ai si sc bs=2 wb nobk vb so=1 ru ls=2 ww=b,s,h,l,<,>,[,]
set com=sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-,n:\:
set nojs vi=""
set mps+=<:>
set clipboard=autoselect,exclude:.*
ia teh the
ia hte the
syn on

set showtabline=0 " Close tab bar, bufferline there
set wildmenu " Enable completion options in status bar

filetype off " required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-bufferline'

Plugin 'bling/vim-airline'

Plugin 'scrooloose/nerdtree'

Plugin 'Lokaltog/vim-easymotion'

Plugin 'flazz/vim-colorschemes'
call vundle#end()
filetype plugin indent on

let g:bufferline_echo = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enbled = 1
