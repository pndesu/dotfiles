return {
  "windwp/nvim-ts-autotag",
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
    -- per-filetype overrides go inside "opts"
    per_filetype = {
      html = { enable_close = false },
    },
  },
}
