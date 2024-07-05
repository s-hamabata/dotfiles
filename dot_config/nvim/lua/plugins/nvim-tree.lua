require('nvim-tree').setup({
  sort_by = 'case_sensitive',
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    -- 隠しファイルを表示
    dotfiles = false,
  },
})

-- neovim起動時にnvim-treeを立ち上げる
-- 使わないのでコメントアウト
-- require("nvim-tree.api").tree.toggle(false, true)
