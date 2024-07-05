-- ---------------------------------------------------------
-- lazy.nvim のインストールスクリプト
-- ---------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ---------------------------------------------------------
-- プラグインの導入
-- ---------------------------------------------------------
require("lazy").setup({
  -- カラースキーマ
  {
    'navarasu/onedark.nvim',
    config = function()
      require("plugins.onedark")
    end
  },
  -- カラースキーマをリアルタイムプレビュー
  {
    'vim-scripts/ScrollColors',
  },
  -- ステータスラインの拡張
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require "plugins.lualine"  end
  },
  -- ファイルツリー
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function() require "plugins.nvim-tree"  end
  },
  -- ファジーファインダー
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    }
  },
  -- ターミナルの表示切替を容易にする
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function() require 'plugins.toggleterm'  end
  },
  -- コードハイライト
  {
    'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate'
  },
  {
    'hrsh7th/nvim-cmp',
    config = function() require 'plugins.nvim-cmp' end,
  },
  -- LSP
  {
    'neovim/nvim-lspconfig',
    config = function() require 'plugins.nvim-lspconfig'  end
  },
  {
    'williamboman/mason.nvim',
    config = function() require 'plugins.mason' end,
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    }
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    }
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    }
  },
  {
     'lewis6991/gitsigns.nvim',
     config = function() require 'plugins.gitsigns' end,
  },
  {
     'kdheepak/lazygit.nvim',
     cmd = {
       "LazyGit",
       "LazyGitConfig",
       "LazyGitCurrentFile",
       "LazyGitFilter",
       "LazyGitFilterCurrentFile",
     },
     keys = {
       { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
     }
  },
  {
     "shellRaining/hlchunk.nvim",
     event = { "BufReadPre", "BufNewFile" },
     config = function()
       require("hlchunk").setup({
         chunk = { enable = true }
       })
     end
    },
    {
      'j-hui/fidget.nvim',
      tag = 'legacy',
      config = function() require 'plugins.fidget' end,
      requires = 'neovim/nvim-lspconfig',
  }
})
