return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
      winopts = {
        height = 0.85,
        width = 0.90,
        preview = {
          layout = "horizontal",
        },
      },
      fzf_colors = {
        true,
        bg = "-1",
        gutter = "-1",
      },
      keymap = {
        fzf = { ["ctrl-q"] = "select-all+accept" },
      },
      files = {
        -- Use fd (same as your terminal) with proper exclude syntax
        cmd = "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git --exclude node_modules --exclude .class",
        -- Alternative: use find command
        -- cmd = "find . -type f -not -path '*/\\.git/*' -not -path '*/node_modules/*'",
      },
      grep = {
        -- For live_grep, use ripgrep with proper glob exclusions
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden --glob '!**/.git/**' --glob '!**/node_modules/**'",
      },
    })
    
    -- Keymaps
    vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>pf", fzf.git_files, { desc = "Find Git Files" })
    vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fG", function()
      fzf.live_grep({
        rg_opts = "--hidden --glob '!**/.git/**' --column --line-number --no-heading --color=always --smart-case -e",
      })
    end, { desc = "Live Grep includes hidden files (minimal exclusions)" })
    vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help Tags" })
    vim.keymap.set("n", "<leader>fs", function()
      fzf.grep({ search = vim.fn.input("Grep For > ") })
    end, { desc = "FZF grep with input" })
  end,
}
