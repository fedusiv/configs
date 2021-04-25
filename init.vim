set nocompatible
filetype off

call plug#begin()
" nordic color scheme
Plug 'tjdevries/colorbuddy.nvim'
Plug 'maaslalani/nordbuddy'
" Search in files, requires engine to search. Use ag sudo apt-get install silversearcher-ag
Plug 'dyng/ctrlsf.vim'
" Tabs
Plug 'romgrk/barbar.nvim'
" File explorer
Plug 'kyazdani42/nvim-tree.lua'
" Search files 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set mouse=a
set termguicolors
nnoremap <SPACE <Nop>
let mapleader=" "

colorscheme nordbuddy

" allow to use clipboard
set clipboard=unnamedplus
" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
" Copy to clipboard
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
vnoremap  <leader>y  "+y

" split navigation
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

" CtrlSF setup
nnoremap <silent> <C-F> :CtrlSFToggle<CR>
nmap <leader>ff <Plug>CtrlSFPrompt
nmap <leader>f <Plug>CtrlSFCwordPath<CR>
vmap <leader>f <Plug>CtrlSFVwordExec
vmap <leader>ff <Plug>CtrlSFVwordPath

" Tabs
let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = v:false
" Move to previous/next
nnoremap <silent>    <leader>q :BufferPrevious<CR>
nnoremap <silent>    <leader>w :BufferNext<CR>
" Re-order to previous/next
nnoremap     <leader>mq :BufferMovePrevious<CR>
nnoremap     <leader>mw :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <leader>1 :BufferGoto 1<CR>
nnoremap <silent>    <leader>2 :BufferGoto 2<CR>
nnoremap <silent>    <leader>3 :BufferGoto 3<CR>
nnoremap <silent>    <leader>4 :BufferGoto 4<CR>
nnoremap <silent>    <leader>5 :BufferGoto 5<CR>
nnoremap <silent>    <leader>6 :BufferGoto 6<CR>
nnoremap <silent>    <leader>7 :BufferGoto 7<CR>
nnoremap <silent>    <leader>8 :BufferGoto 8<CR>
nnoremap <silent>    <leader>9 :BufferLast<CR>
" Close buffer (close tab)
nnoremap <silent>    <leader>e :BufferClose<CR>

" File explorer
" Do not display icons
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ }
nnoremap <leader>h :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" fzf
" Search in current buffer
nnoremap <leader>l :BLines<CR>
" Search in all loaded Buffers
nnoremap <leader>ll :Lines<CR>
" Search for file 
nnoremap <leader>sl :Files<CR>