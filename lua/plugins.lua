local fn = vim.fn

-- Install packer plugin if it's not installed.
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Failed to import packer.")
  return
end

-- Initialize packer with display settings which uses popup window style.
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install plugins
return packer.startup(function(use)
  use({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/plenary.nvim" }) -- Async library for lua using libuv.

  -- Visulal effects
  use({ "EdenEast/nightfox.nvim" }) -- Color scheme
  use({ -- For statusline
    "nvim-lualine/lualine.nvim",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
    }
  })
  use({ "nvim-tree/nvim-web-devicons" }) -- Represent file icons
  use({ "akinsho/bufferline.nvim" }) -- Customize tab lin

  -- LSP(Language Server Protocol)
  use({ "neovim/nvim-lspconfig" }) -- LSP core
  use({ "williamboman/nvim-lsp-installer" }) -- Language Server installer
  use({ "jose-elias-alvarez/null-ls.nvim" }) -- Formatters and linters
  use({
    "glepnir/lspsaga.nvim",
    opt = true,
    branch = "main",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    }
  }) -- LSP UIs

  -- Snippets
  use({ "L3MON4D3/LuaSnip" }) -- Snippet engine
  use({ "saadparwaiz1/cmp_luasnip" }) -- Snippets manager

  -- Completion plugins
  use({ "windwp/nvim-autopairs" }) -- Support close paire of blankets etc...
  use({ "hrsh7th/nvim-cmp" }) -- Provide completion core
  use({ "hrsh7th/cmp-buffer" }) -- For buffer
  use({ "hrsh7th/cmp-path" }) -- For path
  use({ "hrsh7th/cmp-cmdline" }) -- For command line
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-nvim-lua" })
  use({ "onsails/lspkind-nvim" })

  -- Formatter
  use({ "MunifTanjim/prettier.nvim" })

  -- Telescope
  use({ "nvim-telescope/telescope.nvim" })
  use({ "nvim-telescope/telescope-file-browser.nvim" })

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })
  use({ "windwp/nvim-ts-autotag" })

  -- Git
  use({ "lewis6991/gitsigns.nvim" })
  use({ "dinhhuy258/git.nvim" })

  -- Interactive python
  use({ "michaelb/sniprun", run = "bash ./install.sh" })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
