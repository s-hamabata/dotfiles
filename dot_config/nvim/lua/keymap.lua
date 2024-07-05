-- ---------------------------------------------------------
-- キーマップ設定
-- ---------------------------------------------------------
-- <leader> キーをカンマに設定
vim.g.mapleader = ','

-- VSCodeと同じように、Ctrl+Bでサイドバー(ファイルツリー)をトグル
vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', {silent=true})

-- VSCodeと同じように、Ctrl+Pでファイル検索
vim.api.nvim_set_keymap('n', '<C-p>', "<cmd>lua require('telescope.builtin').git_files()<cr>",  { noremap = true, silent = true })

-- カンマ + fq でGrep
vim.api.nvim_set_keymap('n', '<leader>fq', "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true, silent = true })
