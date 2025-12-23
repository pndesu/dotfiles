local opts = { noremap = true, silent = true }

-- Normal mode
vim.keymap.set('n', '<A-Up>',   ':m-2<CR>', opts)  -- move line up
vim.keymap.set('n', '<A-Down>', ':m+<CR>',  opts)  -- move line down

-- Visual mode (whole selected block)
vim.keymap.set('v', '<A-Up>',   ":m '<-2<CR>gv=gv", opts)
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", opts)
