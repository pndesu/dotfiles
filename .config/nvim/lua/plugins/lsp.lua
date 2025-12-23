return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = { "lua_ls", "gopls", "ts_ls", "tailwindcss", "pylsp", "eslint", "yamlls", "docker_compose_language_service", "sqls" },
      automatic_enable = {
        exclude = {
          'jdtls'
        }
      }
    },
  },
  { 'mfussenegger/nvim-jdtls' },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", 'saghen/blink.cmp' },
    lazy = false,
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require("lspconfig")
      -- lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
      -- typescript
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      -- Js
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
      -- yaml
      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })
      -- tailwindcss
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      --csharp
      -- lspconfig.omnisharp.setup({
      --   capabilities = capabilities,
      --   cmd = { "OmniSharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
      --   root_dir = function(fname)
      --     return require('lspconfig.util').root_pattern('*.sln', '*.csproj', 'omnisharp.json', 'function.json')(fname)
      --   end,
      -- })
      -- golang
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      -- sql
      lspconfig.sqls.setup({
        capabilities = capabilities,
      })
      -- python
      lspconfig.pylsp.setup({
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                enabled = true,
                ignore = { "W293", "E501", "E023", "E203" },
                maxLineLength = 120
              },
              mccabe = {
                enabled = false
              },
              pyflakes = {
                enabled = true
              },
              autopep8 = {
                enabled = false
              }
            }
          }
        }
      })
      -- lspconfig.avalonia_ls.setup({
      --   cmd = { "avalonia-ls" },
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      --   -- Add memory/timeout settings
      --   flags = {
      --     debounce_text_changes = 150,
      --   }
      -- })
      --
      -- bash
      lspconfig.bashls.setup({ capabilities = capabilities })
      -- java (jdtls via nvim-java)
      -- lspconfig.jdtls.setup({
      --   settings = {
      --     java = {
      --       configuration = {
      --         runtimes = {
      --           {
      --             name = "JavaSE-21",
      --             path = "/opt/jdk-21",
      --             default = true,
      --           }
      --         }
      --       }
      --     }
      --   },
      --   capabilities = capabilities
      -- })
      -- lsp kepmap setting
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ reuse_win = true }) end, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      -- list all methods in a file
      -- working with go confirmed, don't know about other, keep changing as necessary
      vim.keymap.set("n", "<leader>fm", function()
        local filetype = vim.bo.filetype
        local symbols_map = {
          python = "function",
          javascript = "function",
          typescript = "function",
          java = "class",
          lua = "function",
          go = { "method", "struct", "interface" },
        }
        local symbols = symbols_map[filetype] or "function"
        require("fzf-lua").lsp_document_symbols({ symbols = symbols })
      end, {})

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'java',
        callback = function(args)
          require 'plugins.jdtls'.setup()
        end
      })
      vim.api.nvim_create_autocmd({ 'bufenter', 'bufwinenter' }, {
        pattern = { "*.axaml" },
        callback = function(event)
          vim.lsp.start {
            name = "avalonia",
            cmd = { "avalonia-ls" },
            root_dir = vim.fn.getcwd(),
          }
        end
      })
      vim.filetype.add({
        extension = {
          axaml = "xml",
        },
      })
    end,
  },
}
