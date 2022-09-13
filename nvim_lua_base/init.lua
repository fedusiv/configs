-- Advised by nvim-tree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')


-- Setting map leader
vim.g.mapleader = ' '

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

-- Key remapping
local function map(m, k ,v)
	vim.keymap.set(m,k,v, {silent=true})
end

map('n', 'vv', '<c-v>') -- Enter visual block mode
map('n', '<S-l>', '$') -- Move cursor to the end of line
map('n', '<S-h>', '^') -- Move cursor to the start of line
map('n', '<A-j>', ':m .+1<CR>==') -- Move whole line down
map('n', '<A-k>', ':m-2<CR>==') -- Move whole line up above

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
map('n', '<A-1>', ':BufferGoto 1<cr>')
map('n', '<A-2>', ':BufferGoto 2<cr>')
map('n', '<A-3>', ':BufferGoto 3<cr>')
map('n', '<A-4>', ':BufferGoto 4<cr>')
map('n', '<A-5>', ':BufferGoto 5<cr>')
map('n', '<A-6>', ':BufferGoto 6<cr>')
map('n', '<A-7>', ':BufferGoto 7<cr>')
map('n', '<A-8>', ':BufferGoto 8<cr>')
map('n', '<A-9>', ':BufferGoto 9<cr>')
map('n', '<A-0>', ':BufferLast<cr>')
map('n', '<A-e>', ':BufferNext<cr>')
map('n', '<A-w>', ':BufferPrevious<cr>')
map('n', '<A-q>', ':BufferClose<cr>')
