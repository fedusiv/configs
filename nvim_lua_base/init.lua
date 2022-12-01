-- Advised by nvim-tree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')


-- Setting map leader
vim.g.mapleader = ' '
-- Using only one copy/paste register and make it alligned with clipboard
vim.cmd('set clipboard=unnamed')
vim.cmd('set clipboard=unnamedplus')

-- Hightlight number line
vim.cmd('set number')
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
--vim.cmd("hi CursorLineNr guifg=#e3dd71")

vim.g.material_style = "deep ocean"
vim.cmd('colorscheme material')

-- Mouse support
vim.opt.mouse = 'a'

-- Do not highlight previous results of search
vim.opt.hlsearch = false

-- Additional space before numbers.
vim.wo.signcolumn = "yes"

vim.cmd('set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab')
vim.o.scrolloff = 7

-- Key remapping
local function map(m, k ,v)
    vim.keymap.set(m,k,v, {silent=true})
end
map('n', 'vv', '<c-v>') -- Enter visual block mode
map('n', '<S-l>', '$') -- Move cursor to the end of line
map('n', '<S-h>', '^') -- Move cursor to the start of line
map('n', '<A-j>', ':m .+1<CR>==') -- Move whole line down
map('n', '<A-k>', ':m-2<CR>==') -- Move whole line up above
map('i', 'jj', '<Esc>') -- Escape from insert mode


-- Telescope control
map('n', '<leader>fe', ':Telescope find_files<cr>')
map('n', '<leader>fg', ':Telescope live_grep<cr>')
map('n', '<leader>fb', ':Telescope buffers<cr>')

-- Load lsp server configs
-- Keymapping is also provided there 
require('my_lsp_conf')

require'nvim-web-devicons'.setup {
    default = true
}

-- File explorer (Tree settings)
require("nvim-tree").setup{
    update_focused_file = {
        update_root = true,
    }
}
map('n', '<leader>te', ':NvimTreeFindFileToggle<cr>')

-- Status line
require'lualine'.setup()

-- Buffer manipulation
require'bufferline'.setup()
map('n', '<leader>1', ':BufferGoto 1<cr>')
map('n', '<leader>2', ':BufferGoto 2<cr>')
map('n', '<leader>3', ':BufferGoto 3<cr>')
map('n', '<leader>4', ':BufferGoto 4<cr>')
map('n', '<leader>5', ':BufferGoto 5<cr>')
map('n', '<leader>6', ':BufferGoto 6<cr>')
map('n', '<leader>7', ':BufferGoto 7<cr>')
map('n', '<leader>8', ':BufferGoto 8<cr>')
map('n', '<leader>9', ':BufferGoto 9<cr>')
map('n', '<leader>0', ':BufferLast<cr>')
map('n', '<leader>e', ':BufferNext<cr>')
map('n', '<leader>w', ':BufferPrevious<cr>')
map('n', '<leader>q', ':BufferClose<cr>')

--Indentlines and spaces
function toggle_indent()
    vim.opt.list = not(vim.opt.list:get())
end
map('n', '<leader>i', ':lua toggle_indent()<cr>')
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
require'indent_blankline'.setup{
    show_end_of_line = true,
    space_char_blankline = " "
}
