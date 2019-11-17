local keymap = vim.api.nvim_set_keymap
local noremapOpts = { noremap = true }

-- keymap('n', '<F4>', ':', {})
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})
-- keymap('n', '<Leader>w', ':write<CR>', {noremap = true})
keymap('n', '<c-j>', '<c-w>j', noremapOpts)
keymap('n', '<c-h>', '<c-w>h', noremapOpts)
keymap('n', '<c-k>', '<c-w>k', noremapOpts)
keymap('n', '<c-l>', '<c-w>l', noremapOpts)

