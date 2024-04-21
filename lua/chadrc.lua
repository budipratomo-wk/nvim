-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "ashes",
  statusline = {
    theme = "minimal",
  },
  term = {
    float = {
      relative = "editor",
      row = 0.1,
      col = 0.1,
      width = 0.7,
      height = 0.7,
      border = "single",
    },

  },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}


return M
