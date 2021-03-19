set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'morhetz/gruvbox'
Plugin 'preservim/nerdtree'
Plugin 'voronkovich/ctrlp-nerdtree.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set background=dark
let mapleader = " "
autocmd vimenter * ++nested colorscheme gruvbox
autocmd VimEnter * NERDTree
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>h :NERDTreeToggle<CR>
nnoremap <silent> <leader>pv :NERDTreeFind<CR>
nnoremap <silent> <leader>d :YcmCompleter GoTo<CR>

" copy and paste
map <leader>y "*y
map <leader>p "*p

" left
map <C-Left> <C-w>h 
map <C-Down> <C-w>j
map <C-Up> <C-w>k 
" right
map <C-Right> <C-w>l

set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_nerdtree_show_hidden = 1
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>

set smartindent
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
filetype plugin indent on
autocmd FileType * set noexpandtab

" Show all trailing and dots
:set listchars=eol:⏎,tab:->,trail:·,extends:>,precedes:<
:set list
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
