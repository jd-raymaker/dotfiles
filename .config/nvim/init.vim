" Autoinstall vim-plug
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
	!curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/.local/share/nvim/site/plugged')

	Plug 'itchyny/lightline.vim'
	Plug 'cocopon/iceberg.vim'
	Plug 'andweeb/presence.nvim'
	Plug 'dense-analysis/ale'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'OmniSharp/omnisharp-vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

call plug#end()

" Set colorscheme
colorscheme iceberg

" General settings
set showmatch
set relativenumber
set cursorline

" Change leader key
let mapleader = "\<Space>"

" Change copy / paste keys
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>Y "*y
noremap <Leader>P "*p

