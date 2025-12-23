return {
  "ton/vim-bufsurf",
  event = "VeryLazy",
  config = function()
    -- Set up keybindings for buf-surf navigation
    vim.keymap.set("n", "]b", "<Plug>(buf-surf-forward)", { desc = "Buffer surf forward" })
    vim.keymap.set("n", "[b", "<Plug>(buf-surf-back)", { desc = "Buffer surf back" })
  end,
}
