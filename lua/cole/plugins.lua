local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use({'nvim-treesitter/nvim-treesitter', {run="TSUpdate"}
    -- run = function()
    --     require("nvim-treesitter.install").update({with_sync = true})
    -- end,
  })
  use 'tpope/vim-commentary'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
  use 'nvim-tree/nvim-web-devicons' -- optional, for file icons
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
  use 'leoluz/nvim-dap-go'
  use { 'julianolf/nvim-dap-lldb', requires = {'mfussenegger/nvim-dap'}}
  use 'mfussenegger/nvim-lint'
  -- use {
  --   'nvim-tree/nvim-tree.lua',
  --   requires = {
  --       'nvim-tree/nvim-web-devicons', -- optional, for file icons
  --   },
  --   tag = 'nightly' -- optional, updated every week. (see issue #1193)
-- }
  -- use {'shaunsingh/oxocarbon.nvim', branch = 'fennel'}
  use 'ellisonleao/gruvbox.nvim'
  use {'nvim-lualine/lualine.nvim',requires = { 'kyazdani42/nvim-web-devicons', opt = true }
} -- use 'bluz71/vim-nightfly-guicolors'
  -- use 'shaunsingh/oxocarbon.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
