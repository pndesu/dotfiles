return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    version = 'v0.*',

    opts = {
      keymap = {
        preset = 'default',
        ['<Tab>'] = {'select_and_accept', 'fallback'},
        ['<CR>'] = {'accept', 'fallback'}
      },

      appearance = {
        nerd_font_variant = 'mono'
      },

      completion = {documentation = {auto_show = true}},
      signature = { enabled = true }
    },
  },
}
