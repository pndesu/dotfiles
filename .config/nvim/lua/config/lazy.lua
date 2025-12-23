-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup leader keys before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load configuration modules
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Setup lazy.nvim
require("lazy").setup("plugins", {
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true },
})

vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
    prefix = "●",
    suffix = " ",
    -- keep only ERROR-level messages
    format = function(d)
      if d.severity == vim.diagnostic.severity.ERROR then
        return string.format(" %s (%s)", d.message, d.source or "diag")
      end
      return nil                 -- anything else is suppressed
    end,
  },
  -- (optional) still show warnings in the sign column / quickfix
  signs = true,
  underline = false,
  update_in_insert = true,  -- Show diagnostics in insert mode
})

-- Set colorscheme
vim.cmd[[colorscheme tokyonight]]
