set number relativenumber
syntax enable
set noswapfile
set scrolloff=7
set nocompatible
filetype off
set list

call plug#begin()
" Colorschemes
Plug 'tjdevries/colorbuddy.nvim'
Plug 'maaslalani/nordbuddy'
Plug 'morhetz/gruvbox'
Plug 'nightsense/carbonized'
Plug 'ajmwagar/vim-deus'
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'junegunn/seoul256.vim'
Plug 'marko-cerovac/material.nvim'

" Search in files, requires engine to search. Use ag sudo apt-get install silversearcher-ag
Plug 'dyng/ctrlsf.vim'
" Tabs
Plug 'romgrk/barbar.nvim'
" File explorer
Plug 'kyazdani42/nvim-tree.lua'
" Search files 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" coc nvim. Do not forget to install nodejs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Auto-pairs
Plug 'jiangmiao/auto-pairs'
" Indent lines
Plug 'Yggdroot/indentLine'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
Plug 'marko-cerovac/material.nvim'
set mouse=a
set termguicolors
nnoremap <SPACE <Nop>
let mapleader=" "

set background=dark
colorscheme material
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
let bufferline.animation = v:true
let bufferline.closable = v:true
let bufferline.icon_close_tab = 'x'
let bufferline.no_name_title = v:null
" Move to previous/next
nnoremap <silent>    <leader>q :w<CR>:BufferPrevious<CR>
nnoremap <silent>    <leader>w :w<CR>:BufferNext<CR>
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
nnoremap <silent>    <leader>e :w<CR>:BufferClose<CR>

" File explorer
" Do not display icons
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ }
nnoremap <silent> <leader>h :NvimTreeToggle<CR>
nnoremap <silent> <leader>r :NvimTreeRefresh<CR>
nnoremap <silent> <leader>n :NvimTreeFindFile<CR>

" fzf
" Search in current buffer
nnoremap <leader>l :BLines<CR>
" Search in all loaded Buffers
nnoremap <leader>ll :Lines<CR>
" Search for file 
nnoremap <leader>sl :Files<CR>

" coc
" Go to definition
nmap <silent> gd <Plug>(coc-definition)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
"Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use always tab indent
set cindent expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Airline
let g:airline_theme='base16'
"let g:airline_powerline_fonts = 1
"
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = ' '

" Toggle indent lines
nnoremap <leader>ti :IndentLinesToggle<CR>
