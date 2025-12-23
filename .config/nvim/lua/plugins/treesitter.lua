return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { 
        "c", "c_sharp", "lua", "vim", "vimdoc", "query", "elixir", "heex", 
        "javascript", "html", "css", "python", "bash", "json", "yaml"
      },
      sync_install = false,
      highlight = { 
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      auto_install = true,
    })
  end
}
