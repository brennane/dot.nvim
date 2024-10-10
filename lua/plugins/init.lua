local cmp = require "cmp"

local plugins = {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- install without yarn or npm
  -- https://github.com/iamcco/markdown-preview.nvim
  -- Browser Markdown Handler
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  -- 
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp" , "prettier",
        "rust-analyzer", "pyright"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
      -- require "custom.configs.lspconfig"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    'saecki/crates.nvim',
    -- ft = {"toml"},
    event = { "BufRead Cargo.toml" },
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = {{ name = "crates" }}
      })
      crates.show()
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- vim.g.copilot_no_tab_map = true
      -- vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = "A-Tab"
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    lazy = true,
    event = "BufReadPost",
    dependencies = {
        -- { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
        { "github/copilot.vim" },
        { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = false, -- Enable debugging
      -- See Configuration section for rest
    },
  },


  --{
  --  "hrsh7th/nvim-cmp",
  --  opts = function()
  --    local M = require "plugins.configs.cmp"
  --    M.completion.completeopt = "menu,menuone,noselect"
  --    M.mapping["<CR>"] = cmp.mapping.confirm {
  --      behavior = cmp.ConfirmBehavior.Insert,
  --      select = false,
  --    }
  --    table.insert(M.sources, {name = "crates"})
  --    return M
  --  end,
  --},
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --            "html", "css"
  -- 		},
  -- 	},
  -- },
}

return plugins
