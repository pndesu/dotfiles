return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua        = { "stylua" },
        python     = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        html       = { "prettier" },
        css        = { "prettier" },
        json       = { "prettier" },
        markdown   = { "prettier" },
        gradle     = { "npm-groovy-lint" },
        c_sharp    = { "csharpier" },
        xml        = { "xmllint" },
        xaml       = { "xmllint" },
        axaml      = { "xmllint" },
        -- add more as needed
      },
    })
  end,
  formatters = {
    flake8 = {
      args = { "--ignore=W293,E501" }
    },
    xmllint = {
      args = { "--format", "--recover", "--output", "--" }
    }
  },
  vim.keymap.set({ "n", "v" }, "<leader>g", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
  end, { desc = "Format buffer / range" })
}
