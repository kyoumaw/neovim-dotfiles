local lint = require "lint"

lint.linters_by_ft = {
  php = { "phpcs", "phpstan" },
  css = { "stylelint" },
  scss = { "stylelint" },
}

-- Automatically start linters
local lint_augroup = vim.api.nvim_create_augroup("nvim_lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    require("lint").try_lint()
  end,
})
