require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Remove the Tab and Shift-Tab binds
local cmp = require "cmp"

local custom_mappings = {
  ["<Tab>"] = function(fallback)
    fallback()
  end,
  ["<S-Tab>"] = function(fallback)
    fallback()
  end,
}

cmp.setup({
  mapping = cmp.mapping.preset.insert(custom_mappings),
})


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
