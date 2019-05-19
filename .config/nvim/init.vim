call plug#begin('$HOME/.local/share/plugged')

	Plug 'itchyny/lightline.vim'
	Plug 'cocopon/iceberg.vim'

call plug#end()

" Set colorscheme
colorscheme iceberg

" General settings
set showmatch
set number

" Keybinds
let mapleader = "\<Space>"
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>Y "*y
noremap <Leader>P "*p
