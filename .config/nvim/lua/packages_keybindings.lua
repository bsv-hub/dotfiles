vim.api.nvim_set_keymap('n', '<F1>', '<cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F3>', "<cmd>Telescope live_grep<cr>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F4>', '<cmd>Telescope commands<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bb', '<cmd>Telescope buffers show_all_buffers=true<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>Telescope git_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>aa', '<cmd>Telescope live_grep<CR>', { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope file_browser", { noremap = true })
