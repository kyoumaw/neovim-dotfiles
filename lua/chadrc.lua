-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "jabuti",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

-- Term
M.term = {
  float = {
    row = 0.05,     -- отступ сверху
    col = 0.125,     -- отступ слева
    width = 0.75,   -- 80% ширины экрана
    height = 0.75, -- 75% высоты
    border = "single",
  },
}

return M
