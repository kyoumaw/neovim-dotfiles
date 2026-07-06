return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- already present via telescope
    event = "BufReadPost", -- highlight comments as soon as a file opens
    opts = {},
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev todo comment" },
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos (Telescope)" },
      { "<leader>tq", "<cmd>TodoQuickFix<cr>", desc = "Todos to quickfix" },
    },
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = function()
      local conf = require "nvchad.configs.telescope"
      conf.extensions_list = { "themes", "terms", "fzf" }
      conf.extensions = conf.extensions or {}
      conf.extensions.fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
      return conf
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)
      -- current NvChad no longer auto-loads extensions_list, so do it here
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- Auto close & rename HTML/JSX/Blade tags
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html", "xml", "javascript", "javascriptreact", "typescript",
      "typescriptreact", "vue", "svelte", "php", "blade", "markdown",
    },
    opts = {},
  },

  -- Auto-install the LSP / formatter / linter toolchain (reproducibility)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    event = "VeryLazy",
    opts = {
      run_on_start = true,
      ensure_installed = {
        -- LSP
        "lua-language-server", "css-lsp", "css-variables-language-server",
        "cssmodules-language-server", "emmet-language-server", "eslint-lsp",
        "html-lsp", "intelephense", "json-lsp", "laravel-ls",
        "postgres-language-server", "prisma-language-server",
        "python-lsp-server", "superhtml", "tailwindcss-language-server",
        "typescript-language-server",
        -- formatters
        "prettier", "pretty-php", "stylua",
        -- linters
        "phpcs", "phpstan", "stylelint",
      },
    },
  },

  -- Extra treesitter parsers for the frontend + PHP/Laravel stack
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "html", "css", "scss", "javascript", "typescript", "tsx",
        "json", "yaml", "php", "php_only", "phpdoc", "blade",
        "prisma", "sql", "markdown", "markdown_inline",
      })
      return opts
    end,
  },
}
