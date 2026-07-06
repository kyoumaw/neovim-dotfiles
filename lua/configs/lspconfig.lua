require("nvchad.configs.lspconfig").defaults()

local servers = {
  "cssls", "css_variables", "cssmodules_ls", "emmet_language_server",
  "eslint", "html", "intelephense", "jsonls", "laravel_ls",
  "lua_ls", "postgres_lsp", "prismals", "pylsp", "superhtml",
  "tailwindcss", "ts_ls",
}

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
