require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "clangd" }
local nvlsp = require "nvchad.configs.lspconfig"

-- Customize clangd command to specify C language mode
local clangd_cmd = {
  "clangd",
  "--header-insertion=never", -- Prevents automatic header insertion
  "--compile-commands-dir=.", -- Adjust as needed for your project
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  if lsp == "clangd" then
    lspconfig.clangd.setup {
      cmd = clangd_cmd,
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  else
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end
end
