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
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ericcurtin/CurtineIncSw.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'tenfyzhong/vim-gencode-cpp'
Plugin 'vim-airline/vim-airline'
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'
Plugin 'mhinz/vim-startify'
Plugin 'puremourning/vimspector'
call vundle#end()            " required
filetype plugin indent on    " required

set background=dark
let mapleader = " "

colorscheme gruvbox
"autocmd vimenter * ++nested colorscheme gruvbox
" autocmd VimEnter * NERDTree	dislplay nerdtree in the start of vim
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>h :NERDTreeToggle<CR>
nnoremap <silent> <leader>pv :NERDTreeFind<CR>
let NERDTreeMapOpenInTab='<TAB>'
let g:ycm_goto_buffer_command = 'same-buffer'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <silent> <leader>d :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>id :YcmCompleter GoToInclude<CR>
nnoremap <silent> <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <silent> <leader>gi :YcmCompleter GoToImplementation<CR>
let NERDTreeIgnore=['\.o$', '\~$']

" copy and paste
noremap <leader>y "+y
noremap <leader>p "+p

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

" Switch between source and header file
map <F5> :w<CR>:call CurtineIncSw()<CR>
" Tab pages
noremap <C-l> :tabn<CR>
noremap <C-j> :tabp<CR>
map <silent> <leader>1 :tabm 1
map <silent> <leader>2 :tabm 2
map <silent> <leader>3 :tabm 3
map <silent> <leader>4 :tabm 4
map <silent> <leader>5 :tabm 5
map <silent> <leader>6 :tabm 6
map <silent> <leader>7 :tabm 7
map <silent> <leader>8 :tabm 8
map <silent> <leader>9 :tabm 9

" Linter setup
"let g:airline#extensions#ale#enabled = 1
let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }
    "C++ CLASS GENERATOR: OPENING 2 NEW FILES

" Generate class file for c++
function! Class(ClassName)
    "==================  editing source file =================================
    execute "vsp %:h/" . a:ClassName . ".cpp"
    "At this stage the autocomands for this filetype are done.
    "   example: inserting the header, and the ifndef... Then:
    :execute "normal! a#include \"" . a:ClassName . ".hpp\"\<cr>\<cr>"
    :execute "normal! a" . a:ClassName . "::" . a:ClassName ."(void)\<cr>{\<cr>"
    :execute "normal! a\<tab>return ;\<cr>"
    :execute "normal! a}\<cr>\<cr>"
    :execute "normal! a" . a:ClassName . "::~" . a:ClassName ."(void)\<cr>{\<cr>"
    :execute "normal! a\<tab>return ;\<cr>"
    :execute "normal! a}"
    :execute "wq"
    "Comment this line if you dont want to save files straight away.
    ":execute 'write'

    "==================  editing header file =================================
    execute "vsp %:h/" . a:ClassName . ".hpp"
    "At this stage the autocomands for this filetype are done.
    "   example: inserting the header, and the ifndef... Then:
    :execute "normal! a" . "class " . a:ClassName ."\<cr>{\<cr>"
    :execute "normal! a\<tab>public:\<cr>"
    :execute "normal! a\<tab>\<tab>" . a:ClassName . "(void);\<cr>"
    :execute "normal! a\<tab>\<tab>~" . a:ClassName . "(void);\<cr>\<cr>"
    :execute "normal! a\<tab>protected:\<cr>\<cr>"
    :execute "normal! a\<tab>private:\<cr>\<cr>"
    :execute "normal! a};"
    :execute "normal! ka\<tab>\<tab>"
    "Comment out this line if you dont want to start in insert mode
    :startinsert!
    "Comment this line if you dont want to save files straight away.
    :execute 'write'
endfunction

" Debuger
nnoremap <leader><F6> :call vimspector#Launch()<cr>
nnoremap <leader><F5> :call vimspector#Continue()<cr>
nnoremap <leader><F4> :call vimspector#Stop()<cr>
nnoremap <leader><F3> :call vimspector#Restart()<cr>
nnoremap <leader><F2> :call vimspector#Pause()<cr>
nnoremap <leader><F9> :call vimspector#ToggleBreakpoint()<cr>
nnoremap <leader><F8> :call vimspector#StepOver()<cr>
nnoremap <leader><F7> :call vimspector#StepInto()<cr>
