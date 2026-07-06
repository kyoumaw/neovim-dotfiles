require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- CUSTOM MAPPINGS

-- Move between buffers
map("n", "L", function() require("nvchad.tabufline").next() end, { desc = "Buffer next" })
map("n", "H", function() require("nvchad.tabufline").prev() end, { desc = "Buffer prev" })

-- Quit nvim
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit all" })
