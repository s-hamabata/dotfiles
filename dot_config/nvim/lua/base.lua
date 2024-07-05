vim.cmd("autocmd!")
vim.cmd("syntax on")

-- ---------------------------------------------------------
-- エンコーディングの設定
-- ---------------------------------------------------------
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "uft-8"

-- ---------------------------------------------------------
-- 表示
-- ---------------------------------------------------------
-- 24bitカラー対応
vim.opt.termguicolors = true
vim.o.title       = true
-- 現在行をハイライト
vim.o.cursorline  = true
-- スペースや改行文字の可視化
vim.opt.list = true
-- スペースの表示文字
vim.opt.listchars:append "space:⋅"
-- 改行の表示文字
vim.opt.listchars:append "eol:↴"

-- 透過
vim.o.pumblend        = 20
vim.opt.winblend      = 20

-- 行番号を表示
vim.wo.number = true
-- キャレット位置を基準として行番号を表示
vim.wo.relativenumber = true
-- 折り返し
vim.wo.wrap = true
vim.opt.showtabline = 2

-- ---------------------------------------------------------
-- タブ・スペース、インデント周り
-- ---------------------------------------------------------
-- タブを半角スペースに展開
vim.opt.expandtab = true
-- 改行時にインデントする半角スペース数
vim.opt.shiftwidth = 4
-- タブの半角スペース数
vim.opt.tabstop = 4
-- タブの入力時に半角スペースを挿入
vim.o.smarttab      = true
-- 自動インデント
vim.opt.autoindent  = true

-- ---------------------------------------------------------
-- インデント
-- ---------------------------------------------------------
vim.opt.smartindent = true

-- ---------------------------------------------------------
-- クリップボード
-- ---------------------------------------------------------
if vim.fn.has("wsl") == 0 then
  vim.o.clipboard = "unnamed,unnamedplus"
end

-- ---------------------------------------------------------
-- nvim-treeの動作に必要
-- ---------------------------------------------------------
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ---------------------------------------------------------
-- ターミナル設定
-- ---------------------------------------------------------
vim.opt.shell = 'zsh'
