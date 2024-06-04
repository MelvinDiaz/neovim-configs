local lazy = require "lazy"
return {
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function ()
      return require("plugins.configs.formatter")
    end
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "github/copilot.vim",
    lazy = false
  },
   {
     "neovim/nvim-lspconfig",
     config = function()
       require("nvchad.configs.lspconfig")
       require "configs.lspconfig"
     end,
   },
  {
   	"williamboman/mason.nvim",
   	opts = {
   		ensure_installed = {
   			"lua-language-server", "stylua",
   			"html-lsp", "css-lsp" , "prettier",
        "clangd", "rust-analyzer"
   		},
   	},
   },
  {
   	"nvim-treesitter/nvim-treesitter",
   	opts = {
   		ensure_installed = {
   			"vim", "lua", "vimdoc",
        "html", "css"
   		},
   	},
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
    },
  },
}
