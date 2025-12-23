vim.api.nvim_create_autocmd({"BufEnter", "BufRead", "BufNewFile"}, {
  pattern = "*",
  callback = function()
    vim.schedule(function()
      vim.cmd('TSBufEnable highlight')
    end)
  end
})

