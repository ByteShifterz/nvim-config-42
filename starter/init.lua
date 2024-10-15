vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
	},

	{ import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
	require "mappings"
end)

vim.api.nvim_set_keymap('n', '<F2>', ':MasonInstallAll<CR>', { noremap = true, silent = true })
require('lazy.view.config').keys.close = '<Esc>'

function NorminetteQuickfixTelescope()
	    vim.cmd("!python3 ~/.config/nvim/parse.py > /tmp/quickfix_list.lua")
    vim.cmd("cfile /tmp/quickfix_list.lua")
    require('telescope.builtin').quickfix()
end


function NorminetteQuickfixDirect()
    vim.cmd("silent! !python3 ~/.config/nvim/parse.py > /tmp/quickfix_list.lua")
    vim.cmd("cfile /tmp/quickfix_list.lua")
    vim.cmd("vert copen")
    vim.cmd("vertical resize 50")
end

vim.api.nvim_set_keymap('n', '<leader>q', ':lua NorminetteQuickfixTelescope()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Q', ':lua NorminetteQuickfixDirect()<CR>', { noremap = true, silent = true })
