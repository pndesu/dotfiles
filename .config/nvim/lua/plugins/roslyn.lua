return {
  "seblyng/roslyn.nvim",
  ft = "cs",
  opts = {
    -- your configuration comes here; leave empty for default settings
  },
  config = function()
    local roslyn = require("roslyn")

    -- Setup roslyn
    roslyn.setup({
      -- your roslyn config here
    })

    -- Keymaps (these should be functions that call the LSP methods)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {})
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

    -- Document symbols for C# files
    vim.keymap.set("n", "<leader>fm", function()
      require("fzf-lua").lsp_document_symbols({ 
        symbols = { "class", "method", "property", "field", "enum", "interface", "struct" }
      })
    end, { desc = "C# Document Symbols" })
  end
}
