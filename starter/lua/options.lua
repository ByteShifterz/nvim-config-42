require "nvchad.options"

local o = vim.opt

o.number = true
o.relativenumber = true
o.expandtab = false    -- Ne pas remplacer les tabs par des espaces
o.tabstop = 4          -- Taille d'une tab (4 espaces, tu peux changer)
o.shiftwidth = 4       -- Taille pour l'indentation
o.softtabstop = 4      -- Pour que Neovim gère bien les tabs quand tu édites
o.colorcolumn = "80"   -- Highlight la colonne 80
