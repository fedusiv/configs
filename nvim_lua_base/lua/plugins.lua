-- Auto installation of packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

--local packer_bootstrap = ensure_packer()

-- Running update of plugins, when they need to be updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Place for plugin installation and configuration
return require('packer').startup(function(use)
	-- Syntax highlighting, plugin is supported by neovim? itself
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		auto_install = true,
		highlight = {
			enable = true,
		},
		
	}

	-- LSP, language server protocol.
	use 'neovim/nvim-lspconfig'

	-- Autocomplete
	use {
		'ms-jpq/coq_nvim',
		branch = 'coq'
	}
    -- LSP diagnostics
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
        require("trouble").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
        end
    }

    -- Outline, shows info about functions, methods, etc
    use 'simrat39/symbols-outline.nvim'

	-- Finder, searcher, fuzzy-finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
		-- requires https://github.com/BurntSushi/ripgrep#installation for live grep
	}

	-- File explorer
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
 		},
 		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	
	-- Icons
	use {
		'kyazdani42/nvim-web-devicons',
		default = true,
	}
	use {
		'yamatsum/nvim-nonicons',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	-- Statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Tabline
	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

    --Indent lines and symbols
    use "lukas-reineke/indent-blankline.nvim"

	-- Colorschemes
    use 'rmehri01/onenord.nvim'
    use 'marko-cerovac/material.nvim'
	use {
		'shaunsingh/moonlight.nvim',
		moonlight_italic_comments = false,
		moonlight_italic_keywords = false,
		moonlight_italic_functions = false,
		moonlight_italic_variables = false,
	}
    use "lewpoly/sherbet.nvim"

	

	-- This is part of packer autoinstall on machine.
	--if packer_bootstrap then
	---	require('packer').sync()
	--end
    --:PackerInstall to install Packer
    --:PackerUpdate

end)
