local keymap = vim.keymap

-- Exit insert mode
keymap.set('i', 'jk', '<Esc>')

-- Insert mode deletions (macOS style)
keymap.set('i', '<M-BS>', '<C-w>', { desc = "Delete word backward" })  -- Option+Delete
keymap.set('i', '<D-BS>', '<C-u>', { desc = "Delete line" })           -- Command+Delete

-- Disable arrow keys
-- local modes = {'n', 'i', 'v'}
-- local arrows = {'<Up>', '<Down>', '<Left>', '<Right>'}
-- for _, mode in ipairs(modes) do
--   for _, arrow in ipairs(arrows) do
--     keymap.set(mode, arrow, '<Nop>')
--   end
-- end

-- Separate delete and cut
keymap.set({ 'n', 'v' }, 'd', '"_d')
keymap.set({ 'n', 'v' }, 'D', '"_D')
keymap.set({ 'n', 'v' }, 'dd', '"_dd')
keymap.set({ 'n', 'v' }, 'x', 'd')
keymap.set({ 'n', 'v' }, 'X', 'D')
keymap.set({ 'n', 'v' }, 'xx', 'dd')

-- Swap ^ and $ behavior
keymap.set('n', '$', '^', { desc = "Go to first non-blank char of line" })
keymap.set('n', '^', '$', { desc = "Go to end of line" })
keymap.set('v', '$', '^', { desc = "Select to first non-blank char of line" })
keymap.set('v', '^', '$', { desc = "Select to end of line" })

-- Neo-tree
keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = "Toggle Neo-tree" })
keymap.set('n', '<leader>o', ':Neotree focus<CR>', { desc = "Focus Neo-tree" })

-- Telescope
keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { desc = "Find files" })
keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = "Live grep" })
keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { desc = "Find buffers" })
keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', { desc = "Help tags" })
keymap.set('n', '<leader>fr', ':Telescope oldfiles<CR>', { desc = "Recent files" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move cursor by indent amount (normal mode only)
keymap.set('n', '<Tab>', '2l', { desc = "Move forward by indent amount" })
keymap.set('n', '<S-Tab>', '2h', { desc = "Move backward by indent amount" })

-- Visual mode indentation
keymap.set('v', '<Tab>', '>gv', { desc = "Indent and reselect" })
keymap.set('v', '<S-Tab>', '<gv', { desc = "Unindent and reselect" })

-- Diagnostic keybindings
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show diagnostic in floating window" })
keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = "Show all diagnostics in location list" })
-- go to errors in a file :/
keymap.set("n", "<leader>ne", vim.diagnostic.goto_next) -- next err
keymap.set("n", "<leader>pe", vim.diagnostic.goto_prev) -- previous err
keymap.set("n", "<leader>ce", function()
	local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
	if #diagnostics > 0 then
		local message = diagnostics[1].message
		vim.fn.setreg("+", message)
		print("Copied diagnostic: " .. message)
	else
		print("No diagnostic at cursor")
	end
end, { noremap = true, silent = true })

-- Debug keybindings (remove after fixing)
keymap.set('n', '<leader>ts', ':TSToggle highlight<CR>', { desc = "Toggle Tree-sitter highlight" })
keymap.set('n', '<leader>ti', ':TSInstallInfo<CR>', { desc = "Tree-sitter install info" })

keymap.set('n', 'D', '<C-d>')
keymap.set('n', 'U', '<C-u>')

keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
