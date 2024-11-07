require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map('t', '<ESC>', [[<C-\><C-n>]], { noremap = true, silent = true })
map('n', '<leader><Tab>', '<C-w>w')
map('n', '<leader><S-Tab>', '<C-w>W')
map('i', '<C-ESC>', '<ESC>i<Right>', { noremap = true, silent = true })

-- Remove the Tab and Shift-Tab binds
local cmp = require "cmp"
local custom_mappings = {
	["<Tab>"] = cmp.mapping(function(fallback)
		if require("luasnip").expand_or_jumpable() then
			require("luasnip").expand_or_jump()
		else
			fallback()
		end
	end, { "i", "s" }),
	["<S-Tab>"] = function(fallback)
		fallback()
	end,
}
cmp.setup({
	mapping = cmp.mapping.preset.insert(custom_mappings),
})
