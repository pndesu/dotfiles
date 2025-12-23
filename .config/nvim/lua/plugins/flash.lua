return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    modes = {
      search = {
        enabled = true,
      },
      -- char = {
      --   jump_labels = true,
      -- },
    },
  },
  config = function()
    local flash = require("flash")
    
    -- Custom case-insensitive flash jump
    _G.flash_jump_case_insensitive = function()
      local gi = vim.go.ignorecase
      local gs = vim.go.smartcase
      vim.go.ignorecase = true
      vim.go.smartcase = false
      flash.jump()
      vim.go.ignorecase = gi
      vim.go.smartcase = gs
    end
  end,

  -- stylua: ignore
  keys = {
    -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "s", mode = { "n", "x", "o" }, function() _G.flash_jump_case_insensitive() end, desc = "Flash (Case Insensitive)" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
